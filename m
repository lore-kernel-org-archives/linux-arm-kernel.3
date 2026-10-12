Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E39CC6B02
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N14pcaI8uCBCbhFTbz7e4hnbVvBNCCVccm2OMr/cMs0=; b=aBwM65jpG/n/oTHdRUA4TEGtwa
	CLlG6iEjmWLw2A8BXI2kzNWV/lU7ND1ZmQ7BKAmjc7fCCYYmZeX3VUj/Binv9wyymDZGoSQxP+i60
	uqtLc08JLqic/a8X+HO+Rf5btkm8CX1e1E5UkotumEkquYVNKJjH0aC/I0BtyLGxaDbUphohDAgu1
	lx6HlRe3Jj8NWvUUybv5o3ii4RIhhQXbmJeMCSHBNSl7YA1aUK5HMrFFK0bb/TWKnBIWc5TnsVAZX
	NUGGskP7gX6ks70/JCgXuk1wZ8vKiyIyXCAoP2H1G1v0JnNEjxwbOXYM4AaUwoZSk54OpL0xDMu9g
	R3rfm9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLHD-0000000BKVH-1WWO;
	Mon, 12 Oct 2026 19:01:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLH9-0000000BKSY-0BY9;
	Mon, 12 Oct 2026 19:01:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 784126025F;
	Mon, 12 Oct 2026 19:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260641F0089B;
	Mon, 12 Oct 2026 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831690;
	bh=N14pcaI8uCBCbhFTbz7e4hnbVvBNCCVccm2OMr/cMs0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Gw2W5zPk0uXvrXNEEDmv7p/zEM3ieV/5bfoaMHWmPpMOHZXo2iPaMZ3JtAAbxSmPx
	 +EMo7aBx41bWuJ8+gDPWfsOeP8DAKH0/46b6N8eQnGi95s5tDpcPPE54cVx+qTo+Rw
	 /7tnaP54M3Ra2lguoahOXFFA4Weli5UAYg5rOEyLhG9L1Y95EIxKDam50Dm+qd9WEw
	 Ydz0mIiw4qXrGEsjM7uGr6VDT381rq3SeEVlbcZCNjnT7GeAcIAD8Kt0zzXPWSkZ0o
	 D97UpaAmSzMPGiSSZAKPwjPsXGsi4oXOWLUPletUR4iprgyUHHARUiB5eTyOzjGXbm
	 XmRMulQlGD1Hg==
Subject: Re: [PATCH net-next v11 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 david.wu@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 19:01:28 +0000
Message-ID: <179183168873.434549.8116321142686860038@kernel.org>
In-Reply-To: <20261008175225.3375274-4-coiaprant@gmail.com>
References: <20261008175225.3375274-4-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The system-suspend path does not keep PD_PIPE powered, so the
  commit message's claim is false.
- [Medium] xpcs_rk_create() lets the supplier unbind while it is still
  using the supplier's data (time-of-check/time-of-use).
- [Low] Concern: xpcs_rk_create() is exported but nothing in the tree
  calls it.
- [Low] Concern: PCS_XPCS_ROCKCHIP uses `select PM_GENERIC_DOMAINS if PM`
  and has no `depends on PM`, so with CONFIG_PM=n the driver can build…
- [Low] Concern: "rockchip,rk3568-xpcs" and its required properties have
  no DT binding.

--

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This adds a platform glue driver for the Synopsys XPCS on RK3568. The
driver exposes the APB3-mapped XPCS registers as a virtual MDIO bus for
the generic pcs-xpcs core. It also moves pcs-xpcs-plat.o into its own
module behind PCS_XPCS_PLATFORM, and marks the XPCS as part of the wakeup
path during system suspend so that PD_PIPE stays powered for MAC WoL.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..698a43b753341
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c

[ ... ]

> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
> +{

[ ... ]

> +	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	if (READ_ONCE(pdev->dev.links.status) != DL_DEV_DRIVER_BOUND) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	pxpcs = platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs = xpcs_create_mdiodev(pxpcs->bus, port);

[Severity: Medium]
Can the XPCS be unbound while xpcs_rk_create() is still using pxpcs and
pxpcs->bus?

The check above reads the supplier's own links.status. It does not look
at the state of the link that device_link_add() returned. Supplier unbind
is blocked only for links in DL_STATE_CONSUMER_PROBE or DL_STATE_ACTIVE:

drivers/base/core.c:device_links_busy() {
    ...
		if (link->status == DL_STATE_CONSUMER_PROBE
		    || link->status == DL_STATE_ACTIVE) {
			ret = true;
    ...
}

Suppose the XPCS has no driver when device_link_add() runs from the GMAC
probe. device_link_init_status() then starts the link in
DL_STATE_DORMANT. If the XPCS finishes probing before the READ_ONCE()
check, device_links_driver_bound() moves the link to DL_STATE_AVAILABLE.

In that case the DL_DEV_DRIVER_BOUND check passes, but an AVAILABLE link
does not make device_links_busy() return true. A sysfs unbind of the XPCS
can then run devres_release_all() and free pxpcs and the devm mii_bus
while xpcs_rk_create() is still using them in platform_get_drvdata(),
pxpcs->bus, xpcs_create_mdiodev() and pxpcs->eee_mult_fact. This window
stays open until the GMAC probe completes.

The comment above says a small window remains. Is this AVAILABLE case the
window it means? Would checking that the returned link is in
DL_STATE_CONSUMER_PROBE, instead of checking pdev->dev.links.status,
close it?

> +	if (IS_ERR(xpcs)) {
> +		put_device(&pdev->dev);
> +		return xpcs;
> +	}
> +
> +	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
> +	put_device(&pdev->dev);
> +	return xpcs;
> +}
> +EXPORT_SYMBOL_GPL(xpcs_rk_create);

[Severity: Low]
This isn't a bug, but nothing in the tree calls xpcs_rk_create() at this
point in the series.

The user arrives later in "net: stmmac: dwmac-rk: add SGMII support for
RK3568". There, rk_pcs_init() calls xpcs_rk_create(priv->device,
pcs_node, bsp_priv->id) and DWMAC_ROCKCHIP selects PCS_XPCS_ROCKCHIP, so
this is resolved by the end of the series.

[ ... ]

> +static int xpcs_rk_system_suspend(struct device *dev)
> +{
> +	/*
> +	 * Keep the PD_PIPE power domain on during system suspend.
> +	 *
> +	 * PD_PIPE is shared with SATA/PCIe and would be powered down by
> +	 * genpd once all its consumers are suspended, killing the SerDes
> +	 * and breaking MAC WoL.  Mark the XPCS as part of the wakeup path
> +	 * so genpd keeps the domain on.  Unconditional because the XPCS
> +	 * core has no callback to convey the MAC WoL state.
> +	 */
> +	device_set_wakeup_path(dev);
> +	return 0;
> +}
> +
> +static int xpcs_rk_system_resume(struct device *dev)
> +{
> +	return 0;
> +}

[Severity: High]
Does device_set_wakeup_path() actually keep PD_PIPE powered here?

The commit message says genpd leaves the domain on "because the Rockchip
power domain driver sets GENPD_FLAG_ACTIVE_WAKEUP on PD_PIPE". However,
PD_PIPE is declared with wakeup set to false:

drivers/pmdomain/rockchip/pm-domains.c:
	[RK3568_PD_PIPE]	= DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, false),

The flag is only added when active_wakeup is set:

drivers/pmdomain/rockchip/pm-domains.c:rockchip_pm_add_one_domain() {
    ...
	if (pd_info->active_wakeup)
		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
    ...
}

genpd_finish_suspend() skips the power-off only when both conditions are
true:

drivers/pmdomain/core.c:genpd_finish_suspend() {
    ...
	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
	    !device_out_band_wakeup(dev))
		return 0;
    ...
}

For PD_PIPE the XPCS is therefore counted in suspended_count. Once the
SerDes, SATA, PCIe and XPCS consumers have all suspended,
genpd_sync_power_off() turns the domain off. dev_pm_genpd_rpm_always_on()
only covers runtime PM, not this system sleep path. Nothing else in the
series changes drivers/pmdomain/.

If the domain does turn off, won't MAC WoL stop working? Won't the SerDes
and XPCS also come back at their reset defaults? xpcs_rk_system_resume()
is empty, so after resume nothing repeats phy_init()/phy_power_on() or
restores any XPCS state.

Would this need GENPD_FLAG_ACTIVE_WAKEUP set on PD_PIPE in the pmdomain
driver (or some other way to keep the domain on), plus a real resume
path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261008175225.3375274-1-coiaprant%40gmail.com

