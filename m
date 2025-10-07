Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA621CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DziWPGL5BCnrXGXlnLfK6L+lOv9RgOdC/X+zoXjgv1Y=; b=Mk5Bfho0pbuP7C9V4vra2K++it
	vxitta2IQTMS8FvCBeYet+kQP8awOgeuz84bwQRyAvdPufzXmAIKKmWnbmjIZtyouA3zQ2BiAweHm
	mT/K0d8+LqZ3Yvq8RUNgNwUFxHMgtt6rgpG5XhzVOS5iHI3ylTOPtNzrjR0qIzcYwnPGnW8vNSJpR
	lc7FegVv0v7feOFamxMnSosPR+jgW2CmWWkoEl1+06Hl9Szc3pdz+eyyNVrgnpC+bGPphkpZPgIMB
	dObaYy9sbwAMTba0IbHpukQTL5NjT7xcAGCiuQXdhGEWyd2tVIF7RIdqgqzE/uJ2s6f+mT9cLfggo
	GKiAIQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v698S-00000002EBu-3mDW;
	Tue, 07 Oct 2025 14:57:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v698Q-00000002EAi-1iCU;
	Tue, 07 Oct 2025 14:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=DziWPGL5BCnrXGXlnLfK6L+lOv9RgOdC/X+zoXjgv1Y=; b=2a
	CWQWXq5F5H/isDImCeFmCXqqNSZQy0pPiAie+UizenttXDfEZphJ6/AjqiP5y9aybnQAstXk40jN6
	roZnrOuqIbIiBDQdDyWLyHubInBwLNhZxJwIDxFzO1FU0Ahzg1lJM8fM7Friedv+USP0WzDIHsOKs
	8N0XHuMRHcntHhI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6988-00ANQz-D4; Tue, 07 Oct 2025 16:57:32 +0200
Date: Tue, 7 Oct 2025 16:57:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jjm2473 <jjm2473@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch>
 <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_075750_447415_411B0BAC 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, Oct 07, 2025 at 10:32:26PM +0800, jjm2473 wrote:
> Andrew Lunn <andrew@lunn.ch> 于2025年10月6日周一 23:51写道：
> >
> > > +&gmac0 {
> > > +     phy-mode = "rgmii";
> >
> > Did i really miss this patch series in its earlier version, or did you
> > ignore me?
> >
> > https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
> >
> > > +     tx_delay = <0x3c>;
> > > +     rx_delay = <0x2f>;
> >
> > Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> > us the schematics which clearly show extra long clock lines.
> >
> > > +/* Micro SD card slot is not mounted */
> > > +&sdmmc0 {
> > > +     max-frequency = <150000000>;
> > > +     no-sdio;
> > > +     no-mmc;
> > > +     bus-width = <4>;
> > > +     cap-mmc-highspeed;
> > > +     cap-sd-highspeed;
> > > +     disable-wp;
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> > > +     vmmc-supply = <&vcc3v3_sd>;
> > > +     vqmmc-supply = <&vccio_sd>;
> > > +     status = "disabled";
> > > +};
> > > +
> > > +/* Wifi module is not mounted */
> > > +&sdmmc2 {
> >
> > What do you mean by "not mounted"?
> >
> > Often you would say "not populated", to indicate the PCB has all the
> > tracks in place, but the chip has simply not been soldered in place.
> >
> > Or is there a connector here, and nothing plugged into the connector?
> >
> >    Andrew
> 
> Andrew:
>  Hello! I ran `./scripts/get_maintainer.pl
> patches-v4/v4-0003-arm64-dts-rockchip-add-LinkEase-EasePi-R1.patch`
> to get maintainer list, and got:
> ```
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS,commit_signer:3/41=7%)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)
> Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC
> support,commit_signer:43/41=100%,authored:4/41=10%,added_lines:12/117=10%,commit_signer:5/6=83%)
> Quentin Schulz <quentin.schulz@cherry.de>
> (commit_signer:10/41=24%,authored:8/41=20%,added_lines:63/117=54%)
> Dragan Simic <dsimic@manjaro.org> (commit_signer:5/41=12%,commit_signer:1/6=17%)
> FUKAUMI Naoki <naoki@radxa.com>
> (commit_signer:3/41=7%,authored:3/41=7%,removed_lines:1/1=100%)
> Peter Robinson <pbrobinson@gmail.com>
> (added_lines:9/117=8%,commit_signer:1/6=17%,authored:1/6=17%)
> Alexey Charkov <alchark@gmail.com> (added_lines:6/117=5%)
> Diederik de Haas <didi.debian@cknow.org>
> (commit_signer:4/6=67%,authored:3/6=50%)
> Liangbin Lian <jjm2473@gmail.com> (commit_signer:1/6=17%,authored:1/6=17%)
> Johan Jonker <jbx6244@gmail.com> (authored:1/6=17%)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support)
> linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
> linux-kernel@vger.kernel.org (open list)
> ```
> your email address is not listed above.

What i eventually found is that you posted v3 separately, and then
threaded v4 to v2, which makes no sense.

Please always start a new thread for each patchset.

> > What do you mean by "not mounted"?
> >
> > Often you would say "not populated", to indicate the PCB has all the
> > tracks in place, but the chip has simply not been soldered in place.
> >
> > Or is there a connector here, and nothing plugged into the connector?
> 
> The chip/slot has not been soldered. So here should be "not
> populated", forgive my poor English.

Thanks for the clarification. I'm not sure it is worth adding these DT
properties. When a new board is produced which does populate these
devices, you are going to need a new .dts file. So you can put the
properties into that new file.

> 
> > Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> > us the schematics which clearly show extra long clock lines.
> 
> In fact, the RTL8211F's RXDLY and TXDLY signals are both pulled low,
> just like the Banana Pi BPI-R2 Pro, so the configuration is also referenced:
> https://elixir.bootlin.com/linux/v6.15/source/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts#L237

Pull low makes no difference to the 2ns RGMII delays.

> The tx_delay and rx_delay values were obtained using Rockchip's
> automatic scanning tool:
> https://github.com/istoreos/istoreos/blob/54746dfdb5bd34d1f281cf41d1d1620d0c3ee686/target/linux/rockchip/files/drivers/net/ethernet/stmicro/stmmac/dwmac-rk-tool.c
> https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> https://github.com/axlrose/rkdocs/blob/main/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf

Vendors get things wrong, including this. 'rgmii' means the PCB adds
the 2ns delay. Nearly every Rockchip board follows Rockchip broken
vendor recommendations, and then i come along, point out how it is
wrong, and ask for it to be fixed, before being merged to Mainline.

	Andrew

