%% Calculation of Mode Forms for a Cantilever Beam
% Formulas taken from Wandinger

x = 0:0.007:7;
L = 7;


KL = [1.8751 4.6941 7.8548 10.996];
store = [];
figure();
for i=1:4
    gamma_v = (cos(KL(i))+cosh(KL(i)))/(sin(KL(i)) + sinh(KL(i)));
    w = cos(KL(i)/L*x)-cosh(KL(i)/L*x) - gamma_v*(sin(KL(i)/L*x)-sinh(KL(i)/L*x));
    store(i,:) = w;
end

zeros1 = [0];
zeros2 = [0.7834];
zeros3 = [0.5035 0.8677];
zeros4 = [0.3583 0.6441 0.9055]

hold on
one = plot(x/7,store(1,:)/max(abs(store(1,:))),"b");
two= plot(x/7,store(2,:)/max(abs(store(2,:))),"r");
three = plot(zeros2,0,"ro");
four = plot(x/7,store(3,:)/max(abs(store(3,:))),"k");
five = plot(zeros3,0,"ko");
six = plot(x/7,store(4,:)/max(abs(store(4,:))),"g");
seven= plot(zeros4,0,"go");
grid on
legend("1","2","","3","","","4","","","")
title("Modenformen")
xlabel("$\frac{x}{L}$","Interpreter","latex")
ylabel("W($\frac{x}{L})$","Interpreter","latex")
eight = plot([0 1],[0 0]);
eight.HandleVisibility = "off";
hold off


