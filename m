Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE66EC88E42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFR+HSUKYMe1MTegffKpRQhJblaCo7ANXcisz6wPPgM=; b=uGUUutDkPc404xFXfYRFMaA0nn
	z4nMquQJ3fYydpOLSoR64eFMYOpZS1g4EPVXALOgr8CbdFh7Bj9lAARYs71+Satqjr1fDD6hQXQHQ
	ntSJadndDtpzd7vuHg0E2Ir8nwDlL1j5ymvJjmeGQFCdMA/IeTZPJwbdgyXYBWVUYQez6o65zusHM
	DD+LadbYt3SJItRurSefQ9LWM51Wqbo6z6zkZw68XPSvbcyDAGt1632wCAnJ+ptq0odVtpbZaU21A
	i7isdpNzOCPI2ugiSBaB/U6aOS7Gh/dLtLxvVjmrOWV1M8s8Do4Tk7683QwlnptH+NLdCTHXuKj68
	P5pJ7txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8O-0000000CueG-2DPY;
	Wed, 09 Sep 2026 21:47:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8H-0000000CucX-49sO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC31E44021;
	Wed,  9 Sep 2026 21:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A9D1F0089B;
	Wed,  9 Sep 2026 21:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788990425;
	bh=IFR+HSUKYMe1MTegffKpRQhJblaCo7ANXcisz6wPPgM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XvF+zqZpLKAX56jNU1JQm4dx34vpjc3LVhEEuh7U5uJIMD6bQGapyCOqeIsI4Geai
	 glgxG343PhXqSyhShbXV6DvAZwqee8oPOux2zs4IbF98DYnJ6ZTO7LyIzq5Cmezaf2
	 JPbo9hysCryH0Pb7zKPIQbjZkJR216aY6pVJriLkUmxcAEJgICjOw5f+P68nthAH6D
	 7qL4cvJuCE0J/RAvO/gcl03fWMtAalXFTf/HkYNcX8dIu34jmwKHsDKfHbtnZqk98Y
	 35Y3PjOHgWl1EYJl96awQFlLMS0K1OxjZO0pKEBYeoMZeIUOQWH1TxVOG4831JSBd9
	 fJlhPnlMvFZoA==
Subject: Re: [PATCH net-next 2/9] net: phy: dp83867: add regulator supply management
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Sep 2026 21:47:03 +0000
Message-ID: <178899042391.219967.303939015092483762@kernel.org>
In-Reply-To: <20260904-shikra_ethernet-v1-2-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-2-a50765996035@oss.qualcomm.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 2 · Low: 0

- [High] The supplies are enabled from the PHY driver's ->probe callback,
  which is structurally too late for the use case the commit message…
- [Medium] dp83867_power_on() (drivers/net/phy/dp83867.c) treats a 0
  return from devm_regulator_get_enable_optional() as "this rail was…
- [Medium] dp83867_power_on() propagates every non--ENODEV error out of
  dp83867_probe(), including -EPROBE_DEFER, which…

--

net: phy: dp83867: add regulator supply management

This adds dp83867_power_on(), called from dp83867_probe(), which walks four
supply names, enables each one via devm_regulator_get_enable_optional(),
and sleeps 200 ms if any of them returned success.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdb..e03b39fd080d1 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -719,9 +720,40 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +	static const char * const supply_names[] = {
> +		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
> +	};
> +	struct device *dev = &phydev->mdio.dev;
> +	u32 count = 0;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
> +		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
> +		if (!ret)
> +			count++;
> +		else if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supply_names[i]);
> +	}

[Severity: Medium]
This propagates -EPROBE_DEFER out of dp83867_probe(), which
devm_regulator_get_enable_optional() returns when the phandle resolves but
the regulator provider has not registered yet.

Can that deferral end up with genphy bound instead?  In
phy_attach_direct(), if the MAC attaches the PHY while the dp83867 probe is
still deferred:

drivers/net/phy/phy_device.c:phy_attach_direct() {
	...
	if (!d->driver) {
		if (phydev->is_c45)
			d->driver = &genphy_c45_driver.mdiodrv.driver;
		else
			d->driver = &genphy_driver.mdiodrv.driver;

		phydev->is_genphy_driven = 1;
	}
	...
	if (phydev->is_genphy_driven) {
		err = d->driver->probe(d);
		if (err >= 0)
			err = device_bind_driver(d);
	...
}

Once genphy is bound, does the deferred retry still get a chance to bind
dp83867, or does __device_attach() return early because dev->driver is
already set?  If it is the latter, the port links with none of the
DP83867-specific setup (RGMII internal tx/rx delays, tx/rx FIFO depth, IO
impedance, clk-output-sel, rxctrl strap quirk) and nothing is logged.

Would it be worth mentioning the new probe-deferral point in the commit
message?

> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (count)
> +		fsleep(200000);
> +
> +	return 0;
> +}

[Severity: Medium]
Does count actually track "newly enabled" supplies?  The commit message says

  "Absent supplies are silently skipped, so boards that do not describe
  them are unaffected."

and

  "When any supply is newly enabled the driver sleeps for 200 ms"

but with CONFIG_REGULATOR=n the stub never returns -ENODEV:

include/linux/regulator/consumer.h {
	static inline int devm_regulator_get_enable_optional(struct device *dev,
							     const char *id)
	{
		return 0;
	}
}

so count becomes 4 on every probe, including boards that describe no
supplies at all, and fsleep(200000) takes the msleep() branch:

include/linux/delay.h:fsleep() {
	...
	else
		msleep(DIV_ROUND_UP(usecs, USEC_PER_MSEC));
}

The driver has no depends on REGULATOR and no IS_ENABLED(CONFIG_REGULATOR)
guard, so isn't this a plain 200 ms stall per DP83867 probe for all existing
users?

The CONFIG_REGULATOR=y case looks similar for an already-on rail:

drivers/regulator/devres.c:_devm_regulator_get_enable() {
	r = _devm_regulator_get(dev, id, get_type);
	if (IS_ERR(r))
		return PTR_ERR(r);

	ret = regulator_enable(r);
	...
}

regulator_enable() is reference counted and returns 0 for a rail already
enabled by the bootloader, by regulator-always-on/boot-on, or by another
consumer, so no ramp happens yet the 200 ms "post power-up stabilization"
delay is still paid.  Should the delay instead be gated on something that
reflects an actual off to on transition?

>  static int dp83867_probe(struct phy_device *phydev)
>  {
>  	struct dp83867_private *dp83867;
> +	int ret;
> +
> +	ret = dp83867_power_on(phydev);
> +	if (ret)
> +		return ret;

[Severity: High]
Can the rails ever be enabled from here on the boards this targets?  The
commit message describes boards that "use GPIO-controlled regulators for the
DP83867 power rails", but drv->probe() only runs after the PHY has already
answered MDIO ID reads during bus enumeration:

of_mdiobus_register()
  __of_mdiobus_parse_phys()
    of_mdiobus_register_phy()
      fwnode_mdiobus_register_phy()
        get_phy_device()
          get_phy_c22_id()

drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy() {
	is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");
	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy = get_phy_device(bus, addr, is_c45);
	else
		phy = phy_device_create(bus, addr, phy_id, 0, NULL);
	...
}

Unless the DT child carries an explicit ethernet-phy-idAAAA.BBBB compatible,
an unpowered DP83867 does not answer and the address is simply skipped:

drivers/net/mdio/of_mdio.c:__of_mdiobus_parse_phys() {
	...
	if (rc == -ENODEV)
		dev_err(&mdio->dev,
			"MDIO device at address %d is missing.\n",
			addr);
	...
}

There is no deferred retry for that address, so dp83867_probe() and
dp83867_power_on() never run and the GPIO regulator is never enabled.

For the case where the PHY is found (rail already on at boot, or the ID
hard-coded in DT), reset release and register writes happen before the
supplies are touched:

drivers/net/phy/phy_device.c:phy_device_register() {
	/* Deassert the reset signal */
	phy_device_reset(phydev, 0);

	/* Run all of the fixups for this PHY */
	err = phy_scan_fixups(phydev);
	...
}

drivers/net/phy/phy_device.c:phy_probe() {
	/* Deassert the reset signal */
	phy_device_reset(phydev, 0);

	if (phydev->drv->probe) {
		err = phydev->drv->probe(phydev);
	...
}

Nothing in the new code re-asserts reset or re-applies configuration after
the rails stabilise, so does the part end up programmed while unpowered and
then left at POR/strap defaults?

Grepping for regulator under drivers/net/mdio/ and in
drivers/net/phy/mdio_bus.c turns up only the mdio-sun4i controller's own
supply, so should rail control for a device that must answer MDIO during
enumeration be handled before/at bus registration, or the rails described as
regulator-always-on/boot-on in DT, rather than in the PHY driver probe?

>  
>  	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
>  			       GFP_KERNEL);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904-shikra_ethernet-v1-0-a50765996035%40oss.qualcomm.com

