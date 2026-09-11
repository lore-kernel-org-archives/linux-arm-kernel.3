Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB2C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdZP/6HNOuGBfq2kgLhrIqIEX1HgQSuvTX9uOX9/bCI=; b=eAbbG6bv6AmQLYzG2XAMnEaD/b
	IjGfoI2EaGKv4XdZLqo81T+hLxZGvTVrCp7KXklNy/CN2Qgo98gBEvJ/m9j40JkCT1oXAzbOGyPMO
	8aQvW7YfIhZqYyEaUJn/ioss7TZGdahcfmgkzV5DEvaP5rmodfx8Q4kUamwUWrkpv4glqhSITY21B
	EhmrJDEcHnBzsgqybWWN9sCRYIhZ9CFcn1ahA9Ha4MmC/50akHC4K3gpPXwnpxEgUj4AGBxSLvRWJ
	P1hysZ9iKn4fGsBhDil2GxBdoA05DofwMrPxA4VSekQK4VBbJaRL5N951y5micW02ay5tujIJxxF4
	BW17VWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNe-0000000GUMf-1yj5;
	Fri, 11 Sep 2026 11:25:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNX-0000000GUKK-36mO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:25:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A69060A5A;
	Fri, 11 Sep 2026 11:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789631F000FF;
	Fri, 11 Sep 2026 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125910;
	bh=RdZP/6HNOuGBfq2kgLhrIqIEX1HgQSuvTX9uOX9/bCI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SI09aKvb19Mvv4ssXbRp4wFHGaW2N671Rf1nnDOT+y2Nm2tVd7B9FxrDZ+l+uI51y
	 agZNpWtEZkl2xrM/fzbGYzqi9WLKIiQpxtXoLLPCCblFr2xgStLUVy04qClUn1a01p
	 6aHwHI/RvHSlz4BkxExeJvLLYKtBnSLXmBpX8h6mW47HGt6xtridct2fHyk5LVIS/P
	 I2Y8/IHkVU3vS8RqtqJFQXYDYS3T4cimG383r+UekX6M/SHdEV3BH9pWaa6m51BWfT
	 o0zbAoeAp7Q5WF70JDoeIvyz5H5zGuTFNcxOOnvON/iYdNK6aMFAYbwV/IzuZOHZVv
	 pdrFS8HZ0N6jg==
Subject: Re: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
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
Date: Fri, 11 Sep 2026 11:25:09 +0000
Message-ID: <178912590907.219967.12393486261427611719@kernel.org>
In-Reply-To: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 1

- [High] The rail enable sequence is placed in the PHY driver's probe
  (dp83867_probe() -> dp83867_power_on(),…
- [Medium] In dp83867_power_on() (drivers/net/phy/dp83867.c:723-748) the
  variable `count` is incremented for every return value of 0 from…
- [Low] dp83867_power_on() wraps its entire body in `#ifdef CONFIG_OF`
  (drivers/net/phy/dp83867.c:725-746) although nothing inside uses an OF…

--

net: phy: dp83867: add regulator supply management

This adds dp83867_power_on(), called from dp83867_probe(), which walks four
supply names with devm_regulator_get_enable_optional() and, if any of them
returned success, sleeps 200 ms for the datasheet post power-up
stabilisation.  A few questions about the new function below.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdb..dbeee7cad6f0c 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +#ifdef CONFIG_OF

[Severity: Low]
Is CONFIG_OF the right predicate here?  Nothing inside the guard uses an OF
API, only devm_regulator_get_enable_optional(), dev_err_probe() and
fsleep().

On CONFIG_OF=n the whole body disappears and dp83867_power_on() becomes
"return 0", so supplies that the regulator core would resolve through the
non-DT lookup path (regulator_lookup_by_name() in _regulator_get(), taken
when dev_of_node(dev) is NULL) are never enabled, and errors including
-EPROBE_DEFER are never propagated.

The rest of this file uses #if IS_ENABLED(CONFIG_OF_MDIO) for its genuinely
OF-dependent code (dp83867_of_init_io_impedance()).  Would keying this on
the regulator API instead, or dropping the guard entirely since the
!CONFIG_REGULATOR stub already makes the calls harmless, be more accurate?

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
> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (count)
> +		fsleep(200000);
> +#endif

[Severity: Medium]
Can count reliably mean "a rail was newly powered up" here?

With CONFIG_REGULATOR=n the API is a stub that can never return -ENODEV:

include/linux/regulator/consumer.h:
	static inline int devm_regulator_get_enable_optional(struct device *dev,
							     const char *id)
	{
		return 0;
	}

so all four lookups "succeed", count == 4, and every DP83867 probe pays
fsleep(200000), which for usecs >= USLEEP_RANGE_UPPER_BOUND lands in
msleep(200).  DP83867_PHY in drivers/net/phy/Kconfig has no
depends on REGULATOR, so this is a valid configuration.

With CONFIG_REGULATOR=y, _devm_regulator_get_enable() in
drivers/regulator/devres.c returns the result of regulator_enable():

	ret = regulator_enable(r);
	if (!ret)
		ret = devm_add_action_or_reset(dev, &regulator_action_disable, r);

and regulator_enable() also returns 0 for a rail that is already on
(always-on/boot-on, enabled by the bootloader, or shared with another
consumer), so the 200 ms wait is taken on every probe or re-bind merely
because the rails are described in DT, with no off->on transition.

Both cases seem to disagree with the commit message:

> Absent supplies are silently skipped, so boards
> that do not describe them are unaffected.

and

> When any supply is newly enabled the driver sleeps for 200 ms before
> returning.

Should the delay instead be gated on something that actually distinguishes
an off->on transition?

> +	return 0;
> +}
> +
>  static int dp83867_probe(struct phy_device *phydev)
>  {
>  	struct dp83867_private *dp83867;
> +	int ret;
> +
> +	ret = dp83867_power_on(phydev);
> +	if (ret)
> +		return ret;

[Severity: High]
Can this call site ever power up a DP83867 whose rails are off at boot,
which is the board class the commit message describes?

phy_driver->probe() runs only after the PHY has been identified over MDIO.
For a DT node without an explicit "ethernet-phy-idXXXX.YYYY" compatible,
fwnode_mdiobus_register_phy() takes the scanning path:

drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy() {
	is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");
	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy = get_phy_device(bus, addr, is_c45);
	else
		phy = phy_device_create(bus, addr, phy_id, 0, NULL);
}

and get_phy_device() -> get_phy_c22_id() gives up on an unpowered PHY:

drivers/net/phy/phy_device.c:get_phy_c22_id() {
	/* If the phy_id is mostly Fs, there is no device there */
	if ((*phy_id & 0x1fffffff) == 0x1fffffff)
		return -ENODEV;
}

With the rails off no phy_device with the TI ID is created, so this driver
never binds and dp83867_power_on() never runs.  In the case where the driver
does bind after a scan, the rails were already on, so the enable is a no-op
and the 200 ms is dead time on every bind.  Would this power-up need to
happen before MDIO identification (MDIO bus / reset-and-power stage) to have
the intended effect?  The only configuration where the new code can power a
dark PHY appears to be a DT node carrying an explicit phy-id compatible so
the ID read is skipped, and the binding example added earlier in the series
in Documentation/devicetree/bindings/net/ti,dp83867.yaml uses the scanned
form.

There is a second consequence of using the devm form here.
devm_regulator_get_enable_optional() installs regulator_action_disable() via
devres, so unbinding the PHY driver, or a later failure in dp83867_probe(),
disables these rails while the mdio device stays registered.  Does that
leave subsequent register access (generic PHY fallback, re-scan, ethtool)
talking to a powered-off device?

>  
>  	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
>  			       GFP_KERNEL);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908-shikra_ethernet-v2-0-bbe3389d0652%40oss.qualcomm.com

