#include <bout/physicsmodel.hxx>
#include <interpolation.hxx>

class Isothermal1D : public PhysicsModel {

  int init(bool UNUSED(restarting)) {

    solver->add(n, "n");
    solver->add(u, "u");

    return 0;
  }

  int rhs(BoutReal UNUSED(t)) {

    mesh->communicate(n, u);

    ddt(n) = -Vpar_Grad_par(u, n) - n * Div_par(u) + density_source;
    ddt(u) = -Vpar_Grad_par(u, u) - T / n * Grad_par(n);

    return 0;
  }

  Field3D n;
  Field3D u;
  BoutReal T = 1.0;
  BoutReal density_source = 1.0;
};

BOUTMAIN(Isothermal1D);
