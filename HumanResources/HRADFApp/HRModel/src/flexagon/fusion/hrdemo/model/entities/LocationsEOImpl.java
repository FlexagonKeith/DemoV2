package flexagon.fusion.hrdemo.model.entities;

import oracle.jbo.Key;
import oracle.jbo.RowIterator;
import oracle.jbo.server.AttributeDefImpl;
import oracle.jbo.server.EntityDefImpl;
import oracle.jbo.server.EntityImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Sat Sep 20 17:26:02 CDT 2014
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class LocationsEOImpl
  extends EntityImpl
{
  /**
   * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
   */
  public enum AttributesEnum
  {
    LocationId,
    StreetAddress,
    PostalCode,
    City,
    StateProvince,
    CountryId,
    Departments,
    Countries;
    private static AttributesEnum[] vals = null;
    private static final int firstIndex = 0;

    public int index()
    {
      return AttributesEnum.firstIndex() + ordinal();
    }

    public static final int firstIndex()
    {
      return firstIndex;
    }

    public static int count()
    {
      return AttributesEnum.firstIndex() + AttributesEnum.staticValues().length;
    }

    public static final AttributesEnum[] staticValues()
    {
      if (vals == null)
      {
        vals = AttributesEnum.values();
      }
      return vals;
    }
  }


  public static final int LOCATIONID = AttributesEnum.LocationId.index();
  public static final int STREETADDRESS = AttributesEnum.StreetAddress.index();
  public static final int POSTALCODE = AttributesEnum.PostalCode.index();
  public static final int CITY = AttributesEnum.City.index();
  public static final int STATEPROVINCE = AttributesEnum.StateProvince.index();
  public static final int COUNTRYID = AttributesEnum.CountryId.index();
  public static final int DEPARTMENTS = AttributesEnum.Departments.index();
  public static final int COUNTRIES = AttributesEnum.Countries.index();

  /**
   * This is the default constructor (do not remove).
   */
  public LocationsEOImpl()
  {
  }

  /**
   * @return the definition object for this instance class.
   */
  public static synchronized EntityDefImpl getDefinitionObject()
  {
    return EntityDefImpl.findDefObject("flexagon.fusion.hrdemo.model.entities.LocationsEO");
  }


  /**
   * Gets the attribute value for LocationId, using the alias name LocationId.
   * @return the value of LocationId
   */
  public Integer getLocationId()
  {
    return (Integer) getAttributeInternal(LOCATIONID);
  }

  /**
   * Sets <code>value</code> as the attribute value for LocationId.
   * @param value value to set the LocationId
   */
  public void setLocationId(Integer value)
  {
    setAttributeInternal(LOCATIONID, value);
  }

  /**
   * Gets the attribute value for StreetAddress, using the alias name StreetAddress.
   * @return the value of StreetAddress
   */
  public String getStreetAddress()
  {
    return (String) getAttributeInternal(STREETADDRESS);
  }

  /**
   * Sets <code>value</code> as the attribute value for StreetAddress.
   * @param value value to set the StreetAddress
   */
  public void setStreetAddress(String value)
  {
    setAttributeInternal(STREETADDRESS, value);
  }

  /**
   * Gets the attribute value for PostalCode, using the alias name PostalCode.
   * @return the value of PostalCode
   */
  public String getPostalCode()
  {
    return (String) getAttributeInternal(POSTALCODE);
  }

  /**
   * Sets <code>value</code> as the attribute value for PostalCode.
   * @param value value to set the PostalCode
   */
  public void setPostalCode(String value)
  {
    setAttributeInternal(POSTALCODE, value);
  }

  /**
   * Gets the attribute value for City, using the alias name City.
   * @return the value of City
   */
  public String getCity()
  {
    return (String) getAttributeInternal(CITY);
  }

  /**
   * Sets <code>value</code> as the attribute value for City.
   * @param value value to set the City
   */
  public void setCity(String value)
  {
    setAttributeInternal(CITY, value);
  }

  /**
   * Gets the attribute value for StateProvince, using the alias name StateProvince.
   * @return the value of StateProvince
   */
  public String getStateProvince()
  {
    return (String) getAttributeInternal(STATEPROVINCE);
  }

  /**
   * Sets <code>value</code> as the attribute value for StateProvince.
   * @param value value to set the StateProvince
   */
  public void setStateProvince(String value)
  {
    setAttributeInternal(STATEPROVINCE, value);
  }

  /**
   * Gets the attribute value for CountryId, using the alias name CountryId.
   * @return the value of CountryId
   */
  public String getCountryId()
  {
    return (String) getAttributeInternal(COUNTRYID);
  }

  /**
   * Sets <code>value</code> as the attribute value for CountryId.
   * @param value value to set the CountryId
   */
  public void setCountryId(String value)
  {
    setAttributeInternal(COUNTRYID, value);
  }

  /**
   * @return the associated entity oracle.jbo.RowIterator.
   */
  public RowIterator getDepartments()
  {
    return (RowIterator) getAttributeInternal(DEPARTMENTS);
  }

  /**
   * @return the associated entity CountriesEOImpl.
   */
  public CountriesEOImpl getCountries()
  {
    return (CountriesEOImpl) getAttributeInternal(COUNTRIES);
  }

  /**
   * Sets <code>value</code> as the associated entity CountriesEOImpl.
   */
  public void setCountries(CountriesEOImpl value)
  {
    setAttributeInternal(COUNTRIES, value);
  }

  /**
   * @param locationId key constituent

   * @return a Key object based on given key constituents.
   */
  public static Key createPrimaryKey(Integer locationId)
  {
    return new Key(new Object[] { locationId });
  }


}

