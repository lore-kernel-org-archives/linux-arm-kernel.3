Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6AAC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBtsWFuTDIg8IgjUhvZKzlGaiQ5mUGATekYrAmZco2A=; b=0/s7lUpWDeLMTU8khoFQH5569p
	BGapBCZq7f0SirM96DxvbvyOcvFjYxJi7QmnSrhcioMNZ5rCC5L83FSPOw+J3umUf42wZidZAkmq+
	24XnClRR1TzxuVBM7AyvMTuQ+l7S50hu+kl8VXnYFB4Sa3xRPhUApOTwxzPKYwFIizY4/eFT9Yoc/
	DRoWWH2RcbL8pKvQSo89r1ZzQxbruH4Th/LOQnuHVW99g2a2HXKWOMs9H3hfTe8YQuh/Ha/hJea7/
	VcuAuRdtYkgGA5ASR3T9NcW9KTKUztzhHqoGQL+fVOo8hJlim90WMmLjvF6bYDZeDbqnUy0dGkFy8
	OZ9tMZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQvk-00000000PAK-01ZS;
	Thu, 16 Jul 2026 18:35:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQvd-00000000P6Y-0bSb;
	Thu, 16 Jul 2026 18:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CBtsWFuTDIg8IgjUhvZKzlGaiQ5mUGATekYrAmZco2A=; b=bHTiI4AuiFVT/lUiAEyL+dLyiO
	m7Y/rR1V0NP3iudbLx2AwYJ8g9Y1pdeTx3FjP63JHwB57cYyXFKIHZnEZu/eY36AsmHuumzxS0os8
	PXppavuiY0OX3jfZjXFUw4uvFlIQpvDx3k2WzSvWtSnXc84CEDxnCNY82ILl2CWp1zHYvU8BvXO54
	Ag39vN59yZ56ibhHr/TrxGKxFWSi0Ie6HfVf3K80J3sWmuI+muf/RqYvHFcO0z45rV+sbo1EfuEJh
	oXMheo6QY8HHbNrvxJH+qcsNRsJSxqdv8NadWJXMJIC5E5SiYXGnopyqiU0KV5zM3VSiL21RRN5ay
	WoOBqWCg==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 20:35:21 +0200
Message-ID: <40552860.10thIPus4b@phil>
In-Reply-To: <20260716095101.2498464-1-gahing@gahingwoo.com>
References: <20260716095101.2498464-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_113525_182592_FEC9F11C 
X-CRM114-Status: GOOD (  21.51  )
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

Am Donnerstag, 16. Juli 2026, 11:50:59 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Jiaxing Hu:
> Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
> its CM5-IO carrier board.
>=20
> Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.
>=20
> The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
> reference clock (clk_mac_refout). Ungating it for RGMII needs a small
> dwmac-rk change sent separately to netdev [1]; the clock is optional so
> this DTS applies without it.
>=20
> Tested on a CM5-IO: the YT8531 is probed by the motorcomm driver and the
> link comes up at 1000 Mbit/s; RK806, HYM8563, eMMC, microSD, the USB3
> hub and the PCIe root complex all probe. dtbs_check is clean.
>=20
> Changes in v3:
> - Remove the ES8388 codec from the file header and the i2c0 block
>   comment. The node was dropped in v2 but the comments still named it
>   (sashiko-bot on v2).
> - Use gpios instead of gpio in the vcc_3v3_pcie fixed regulator, to
>   match the other regulators in the file.
> - Pick up Krzysztof's Acked-by on patch 1.
> - The other v2 review notes need no change: the always-on plus
>   off-in-suspend state on vdd_cpu_lit_s0 and vdd_gpu_s0 matches every
>   rk3576 board upstream, and the eMMC full-pwr-cycle-in-suspend with no
>   vmmc-supply is the same pattern used across rk3576. dtbs_check stays
>   clean.
>=20
> Changes in v2:
> - Type-C DP alt-mode: name the altmodes child "displayport" and make
>   svid a /bits/ 16 value; drop the undocumented svid from &usbdp_phy and
>   add the missing mode-switch.
> - Move the FUSB302 role-switch endpoint into the connector's ports; the
>   fusb302 binding does not allow a port on the device node. Rename the
>   node to usb-typec@22.
> - Drop the ES8388 node (disabled, wrong compatible) and the unreferenced
>   gmac0_rst, bt_reg_on and wifi_host_wake_irq pinctrls.
> - Rename the wifi-poweren-gpio pinctrl node, it collided with
>   gpio-consumer.yaml.
> - Describe the PHY reset at the MDIO bus level rather than with the
>   deprecated snps,reset-gpios; a per-PHY reset-gpios is applied only
>   after the ID scan, too late for a PHY that boots held in reset.
>=20
> [1] net: stmmac: dwmac-rk: enable the reference clock for output mode
>=20
> Jiaxing Hu (2):
>   dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
>   arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

As Rob said in the v2 bindings, please slow down.
Additionally that is the 2nd "v3" today?

If something is a resend ... please mark it as such, i.e.
[PATCH RESENT x/y] ... and provide an explanation what went
wrong in the cover-letter.


Thanks
Heiko



