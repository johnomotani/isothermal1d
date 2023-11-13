#include <bout/physicsmodel.hxx>
#include <interpolation.hxx>

class Isothermal1D : public PhysicsModel {

  int init(bool UNUSED(restarting)) {

    u.setLocation(CELL_YLOW);

    solver->add(n, "n");
    solver->add(u, "u");

    return 0;
  }

  int rhs(BoutReal UNUSED(t)) {

    mesh->communicate(n, u);

    ddt(n) = -Vpar_Grad_par(u, n, CELL_CENTRE) - n * Div_par(u, CELL_CENTRE) + density_source;
    ddt(u) = -Vpar_Grad_par(u, u, CELL_YLOW) - T / interp_to(n, CELL_YLOW) * Grad_par(n, CELL_YLOW);

    return 0;
  }

  Field3D n;
  Field3D u;
  BoutReal T = 1.0;
  BoutReal density_source = 1.0;
};

BOUTMAIN(Isothermal1D);
