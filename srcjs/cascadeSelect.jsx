//import "primereact/resources/themes/bootstrap4-dark-purple/theme.css";
import "primereact/resources/primereact.css"; // core css
import "primeflex/primeflex.css"; // css utility
import "./css/styles.css";
import { reactShinyInput } from "reactR";
import { CascadeSelect } from "primereact/cascadeselect";

const App = (props) => {
  const [selection, setSelection] = React.useState(props.value);
  const data = props.data;

  const handleChange = (e) => {
    setSelection(e.value);
    props.setShinyValue(e.value);
    console.log(e);
  };

  const optionTemplate = (option) => {
    let todoCounter = 1;
    return (
      <div
        className="flex align-items-center gap-2"
        style={{ fontSize: "1.5rem" }}
      >
        {props.optionGroupChildren.map((child) => {
          const element = option[child];
          return (
            element && (
              <i
                key={todoCounter++}
                className={option.icon.icon}
                style={{ 
                  color: option.icon.color, 
                  fontSize: option.icon.size,
                  transform: `scale(${option.icon.scale})`
                }}
              />
            )
          );
        })}

        {option[props.optionLabel] && (
          <i
            className={option.icon.icon}
            style={{ 
              color: option.icon.color, 
              fontSize: option.icon.size, 
              transform: `scale(${option.icon.scale})`
            }}
          />
        )}
        <span style={{ fontSize: "1.5rem" }}>{option[props.optionLabel]}</span>
        <span style={{ fontSize: "1.5rem" }}>
          {option[props.optionGroupLabel]}
        </span>
      </div>
    );
  };

  return (
    <div className="card flex justify-content-center">
      <CascadeSelect
        value={selection}
        onChange={handleChange}
        placeholder={props.placeholder}
        options={data}
        optionLabel={props.optionLabel}
        optionGroupLabel={props.optionGroupLabel}
        optionGroupChildren={props.optionGroupChildren}
        className="w-fit md:w-14rem text-2xl w-10"
        breakpoint="767px"
        itemTemplate={optionTemplate}
      />
    </div>
  );
};

const CascadeSelectInput = ({ configuration, value, setValue }) => {
  return (
    <App
      value={value}
      placeholder={configuration.placeholder}
      data={configuration.data}
      optionLabel={configuration.optionLabel}
      optionGroupLabel={configuration.optionGroupLabel}
      optionGroupChildren={configuration.optionGroupChildren}
      setShinyValue={setValue}
    />
  );
};

reactShinyInput(
  ".cascadeSelect",
  "cascadeSelect.cascadeSelect",
  CascadeSelectInput
);
