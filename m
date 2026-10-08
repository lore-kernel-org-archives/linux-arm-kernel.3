Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7FACA6014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9+Ef6Q6JTFr94bJHiwnUUDG+UwXDm8MEIg8h6D+/uI=; b=o0xLxp1puA5SbxPSCG3hAA0UYW
	7eAw1fxQFQW3K3KxzRTdrcmWQQSKYRXIJmfi4jFpwzpRlkujmQkj/vHQNsQpFuM/chtzVhp0mUghA
	YknsrPfa1A9/5mUw5bwAEon423qxFvsR0OcnPQHnUBxnHlIDv0CmygdwL1uEAOI6GovLWj6mp3n9X
	+Xlq/XvX9NYN3LVZl5ttwvToh9V6AB4kwvCAn6xhHNUV+oYJgcqx3WuTPiVWyfl8RTMRsrdmoTDvc
	yIPdEA3PV68QImuvRAfqcYFaw6sdofYHIK7CUudZchk+jwesoZiSbii9x0XYs4+4cHDGRy3hF15hs
	f16/HYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr3F-00000004hPB-4Bvf;
	Thu, 08 Oct 2026 16:33:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr3A-00000004hLJ-1ZPH;
	Thu, 08 Oct 2026 16:32:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2326943CF6;
	Thu,  8 Oct 2026 16:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0371F1F000FF;
	Thu,  8 Oct 2026 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791477176;
	bh=h9+Ef6Q6JTFr94bJHiwnUUDG+UwXDm8MEIg8h6D+/uI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MU9lsv4uPt4NxzHEdirAJpSdabWb496cs2+YeVOAhGAanLH60UP096o9/qBPAOJbz
	 shGFgZQJns+6/9O0uftnPka3NhUwcarc8pgDSd5aSeUP2csmNad5d7AwD7qzWJerTV
	 w/jc6Pc/rirRJmTK6NLCECm0cr3IeVmHV5pTFRUkef4bZNuNW+oM2pjWwhMT65KkWg
	 OqqpLqVx6m4GR8SIPw19mbTkP9uru3GpnaCm5P//Ru28e9Klgtn3k5n1kglHzU/i7D
	 uNF7LhpWwwuXHy689+4YF5rx1pHEa7CnuqzbOxgRgJn0C1tBoc7/Uezhv8/d4wLkOS
	 +XEnSLKbmUiKw==
Subject: Re: [PATCH net-next v10 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, maxime.chevallier@bootlin.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, david.wu@rock-chips.com,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 16:32:54 +0000
Message-ID: <179147717456.434549.11670636132488819014@kernel.org>
In-Reply-To: <20261005223011.1124347-4-coiaprant@gmail.com>
References: <20261005223011.1124347-4-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The system-suspend design described in the commit message and in
  the comment in xpcs_rk_system_suspend() does not work.
- [Medium] xpcs_rk_create() (drivers/net/pcs/pcs-xpcs-rk.c:537-560)
  decides it is safe to use the supplier's devm-managed drvdata by doing…
- [Medium] xpcs_rk_mdio_write_remapping() (drivers/net/pcs/pcs-xpcs-
  rk.c:141-147) sends writes to DW_VR_MII_AN_CTRL,…
- [Low] Baseline decision: false positive at the end of the series.

--

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This adds a platform glue driver for the Synopsys DesignWare XPCS in
RK3568. The driver exposes the XPCS through a virtual MDIO bus that maps
accesses onto APB3 registers, with each port remapped to its own MMD. It
also moves pcs-xpcs-plat.o into a new PCS_XPCS_PLATFORM module, exports
xpcs_rk_create() for MAC drivers, and marks the XPCS as part of the
wakeup path during system suspend to keep PD_PIPE powered for MAC WoL.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..35ee980a759e5
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> @@ -0,0 +1,619 @@

[ ... ]

> +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> +{
> +	switch (dev) {
> +	case MDIO_MMD_PMAPMD:
> +		return ROCKCHIP_MMD_PMAPMD;
> +	case MDIO_MMD_VEND2:
> +		break;
> +	default:
> +		return -ENXIO;
> +	}
> +
> +	/*
> +	 * These registers physically live only in MII (the management port).
> +	 * Ports 1-3 expose read-only mirrors of these bits, so writes must
> +	 * always target MII; the read path remaps per address and the
> +	 * hardware redirects to the port's mirror.
> +	 */
> +	switch (reg) {
> +	case DW_VR_MII_AN_CTRL:
> +	case DW_VR_MII_AN_INTR_STS:
> +	case DW_VR_MII_EEE_MCTRL0:
> +	case DW_VR_MII_EEE_MCTRL1:
> +	case DW_VR_MII_DIG_CTRL2:
> +		return ROCKCHIP_MMD_MII;

[Severity: Medium]

Suppose two GMACs are routed to different ports, for example GMAC0 on
mii@0 and GMAC1 on mii@1. The commit message says this is supported.
Do these registers then become shared state between two independent
dw_xpcs instances?

Writes from port 1 go to port 0's MMD 7. GMAC1's xpcs would then
program port 0's AN_CTRL and EEE_MCTRL0/1 and clear port 0's
AN_INTR_STS. One example is in xpcs_get_state_c37_sgmii():

    ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);

Another is in xpcs_config_eee():

    ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL0, mask,

Could this change GMAC0's PCS mode or LPI settings, or clear its
AN-complete latch, without GMAC0's phylink instance knowing?

No lock spans more than one dw_xpcs instance. Split read-then-write
sequences on these registers can therefore race between the two
phylink instances. An example is the AN_INTR_STS read followed by a
write in xpcs_get_state_c37_1000basex().

There is a separate question if the per-port registers are not exact
mirrors of MII0. In that case reads come from port N's register while
writes go to MII0. Could port N's CL37_ANCMPLT_INTR latch then never be
cleared? If so, every xpcs_get_state_c37_sgmii() poll with the link down
would see an_complete and set BMCR_ANRESTART again.

> +	default:
> +		break;
> +	}

[ ... ]

> +	/*
> +	 * Establish the device link before reading the supplier's drvdata.
> +	 * device_link_add() does not fail on a supplier that is unbinding:
> +	 * it creates the link in DL_STATE_SUPPLIER_UNBIND. Whether the link
> +	 * actually protects the drvdata depends on the supplier's state at
> +	 * creation time.
> +	 *
> +	 * Check link->supplier->links.status right after creation. If the
> +	 * supplier was DL_DEV_DRIVER_BOUND, the link is in
> +	 * DL_STATE_CONSUMER_PROBE and device_links_unbind_consumers() will
> +	 * wait for this probe to finish before unbinding the supplier, so
> +	 * the drvdata stays valid for the rest of the function. Any other
> +	 * state means the supplier is not usable yet; defer and retry.
> +	 *
> +	 * The link is released automatically when the consumer device is
> +	 * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), so no explicit
> +	 * device_link_remove() is needed on the failure paths.
> +	 */
> +	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> +	if (!link) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	if (READ_ONCE(link->supplier->links.status) != DL_DEV_DRIVER_BOUND) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}

[Severity: Medium]

Does a bound supplier here guarantee that the link itself is in
DL_STATE_CONSUMER_PROBE?

device_link_init_status() creates the link as DL_STATE_DORMANT when the
supplier has no driver yet. fw_devlink doesn't parse pcs-handle, so the
GMAC can probe while the XPCS probe is still deferred on the combphy,
clocks or power domain:

CPU0 (GMAC probe)                 CPU1 (XPCS probe)
xpcs_rk_create()
  device_link_add()
    link is DL_STATE_DORMANT
                                  xpcs_rk_probe() completes
                                  device_links_driver_bound()
                                    link -> DL_STATE_AVAILABLE
                                    links.status -> DL_DEV_DRIVER_BOUND
  READ_ONCE(...links.status) passes
  pxpcs = platform_get_drvdata(pdev)
  xpcs_create_mdiodev(pxpcs->bus, ...)

Now suppose the XPCS is unbound through sysfs or rmmod.
device_links_unbind_consumers() waits only for CONSUMER_PROBE links:

    if (status == DL_STATE_CONSUMER_PROBE) {
        device_links_write_unlock();
        wait_for_device_probe();
        goto start;
    }
    WRITE_ONCE(link->status, DL_STATE_SUPPLIER_UNBIND);

For an AVAILABLE link it just continues, and devres frees pxpcs and the
mii_bus. Can CPU0 then dereference pxpcs->bus and pxpcs->eee_mult_fact
after they have been freed?

Even without an unbind, the GMAC probe would finish with this link
still in DL_STATE_AVAILABLE. Wouldn't device_links_driver_bound() for
the consumer then hit this check?

    WARN_ON(link->status != DL_STATE_CONSUMER_PROBE);

Also, the comment says the link is released when the consumer device is
destroyed. With DL_FLAG_AUTOREMOVE_CONSUMER, isn't it actually dropped
when the consumer's driver unbinds or its probe fails?

> +
> +	pxpcs = platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs = xpcs_create_mdiodev(pxpcs->bus, (int)port);

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

[Severity: High]

Does device_set_wakeup_path() actually keep PD_PIPE powered here? The
commit message says:

  genpd then leaves the domain powered, because the Rockchip power
  domain driver sets GENPD_FLAG_ACTIVE_WAKEUP on PD_PIPE

In drivers/pmdomain/rockchip/pm-domains.c, though, PD_PIPE is declared
with active_wakeup set to false:

    [RK3568_PD_PIPE] = DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, false),

rockchip_pm_add_one_domain() sets the flag only when that field is
true:

    pd->genpd.flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_NO_STAY_ON;
    if (pd_info->active_wakeup)
        pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;

genpd_finish_suspend() skips the power-off only when both conditions
hold:

    if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
        !device_out_band_wakeup(dev))
        return 0;

So the XPCS is counted in suspended_count and genpd_sync_power_off()
runs. That function compares suspended_count with device_count and
checks sd_count. It does not look at the rpm_always_on that probe set
with dev_pm_genpd_rpm_always_on(dev, true).

Once the other PD_PIPE consumers have suspended, would the domain be
powered off during system suspend? That would leave SGMII WoL without
a working PCS.

If PD_PIPE does lose power, the XPCS register state is lost too.
xpcs_rk_system_resume() below is an empty stub and does not redo the
SerDes or XPCS bring-up. Does anything restore that state on resume?

Two things are not confirmed here: whether phylink fully reprograms the
XPCS on resume, and whether the combphy really sits in PD_PIPE. The
rk356x combphy DT nodes have no power-domains property.

> +
> +static int xpcs_rk_system_resume(struct device *dev)
> +{
> +	return 0;
> +}

[ ... ]

> diff --git a/include/linux/pcs/pcs-xpcs-rk.h b/include/linux/pcs/pcs-xpcs-rk.h
> new file mode 100644
> index 0000000000000..28723d5bd75cc
> --- /dev/null
> +++ b/include/linux/pcs/pcs-xpcs-rk.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_PCS_XPCS_ROCKCHIP_H
> +#define __LINUX_PCS_XPCS_ROCKCHIP_H
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/pcs/pcs-xpcs.h>
> +
> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *np);

[Severity: Low]

This isn't a bug once the whole series is applied. In this patch on its
own, though, xpcs_rk_create() has no caller, and the prototype has no
stub for CONFIG_PCS_XPCS_ROCKCHIP=n.

The later commit "net: stmmac: dwmac-rk: add SGMII support for RK3568"
handles both points:

- It adds rk_pcs_init(), which calls xpcs_rk_create().
- It wires rk_pcs_init() up through plat_dat->pcs_init, so
  stmmac_pcs_setup() never falls back to xpcs_create_fwnode() for this
  PCS.
- It makes DWMAC_ROCKCHIP select PCS_XPCS_ROCKCHIP, so the missing stub
  can't cause a link failure for that user.

Is a stub still wanted for future users that don't select the symbol?

> +
> +#endif /* __LINUX_PCS_XPCS_ROCKCHIP_H */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261005223011.1124347-1-coiaprant%40gmail.com

