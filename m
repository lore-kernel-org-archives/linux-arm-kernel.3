Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730CBD5CCAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F2bodyq3WqN46I00wqbCPbZo5zj0seOtWxBAFBvNcU=; b=BH4BuEP2uqVWDeL0gR28bwiW6w
	u47BYzt2Gr1sxD420eIwYunHKGreMi4cQM9VosOXAPxWBEe+brQH2y5wBOgUZc/pzniLv9RqhDOc+
	S35nHbn1ptrADJKn4nh8n1ZonwgGyMJY/1mcC1iuQLgNwP0FstGchVSxn3yRVmZuqIiEV+ift1Dei
	U9wrQKMHlKzLko7nZQaEjWFf2tuo4DOAwkY+VzOKguiY540P4T21RUpabb3/LSnhJoYtZ6Qu/sEUA
	Wo0cN35x8Yv/Ql+lXAvhzOMhVcRW6C0atK8zF8JcokJh2+lit5Ff6rXNhKfAEq1TqMedfLXIMSidD
	+AZtOmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68iY-00000000T3G-3QZn;
	Wed, 30 Oct 2024 13:26:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68HJ-00000000On6-2s8I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E11EA5C0316;
	Wed, 30 Oct 2024 12:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FCDC4CEE5;
	Wed, 30 Oct 2024 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730293104;
	bh=fy/EhC/8o0exDek8z8nglJ/dyarxYaGCj12JxahYLIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RA+8LOEfYcDTvk69kaJ9WPB9j4Gn0OEMDR+/ituO+ibkq3Jq+zUqw22oXelG3siFc
	 Cm7SbDXYTpdhqxzNRwB4hmf9G5QyK+dOhE8/cidm74X6KYi1kTJEJG7EnPCxG9VVjj
	 SGR2Qn04t0NBr2ELbKrbrYOQHvTT42XpNdc4kXpVWdAp91g2Znxa8pjrJBLNVbzjm/
	 hZeSrYD4uHi1vPXOwPsqT3hwk2AoPUJtu/yFGaVRWIF8LvMc25MQSyWb9zkbjb6Bsy
	 sd8PrU6930icLBk7vMK+ybLhhD+iRBzSWTsc/2gFARmMyNPODjSb2aLvDjBawZoIj1
	 0l4/gAZPPBAoA==
Message-ID: <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
Date: Wed, 30 Oct 2024 14:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 ext Tony Lindgren <tony@atomide.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: "open list:TI ETHERNET SWITCH DRIVER (CPSW)"
 <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055825_865309_25F539E0 
X-CRM114-Status: GOOD (  16.77  )
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

Hi Geert,

On 29/10/2024 19:18, Geert Uytterhoeven wrote:
> Hi all,
> 
> During the last few months, booting kernels on BeagleBone Black
> sometimes fails with:
> 
>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
>      davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
> driver SMSC LAN8710/LAN8720
>      soc_device_match(cpsw_soc_devices): no match
>      cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
>      ...
>      am335x-phy-driver 47401300.usb-phy: dummy supplies not allowed
> for exclusive requests (id=vbus)
>     +cpsw-125mhz-clkctrl:0014:0: failed to disable
>      am335x-phy-driver 47401b00.usb-phy: using DT
> '/ocp/target-module@47400000/usb-phy@1b00' for 'reset' GPIO lookup
>      ...
>      cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
>     -SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
> (mii_bus:phy_addr=4a101000.mdio:00, irq=POLL)
>     -cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
> flow control off
>     -Sending DHCP requests ., OK
>     -IP-Config: Complete:
>     -[...]
>     +cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
> not found on slave 0
>     +[HANG]
> 
> Adding debug prints to smsc_phy_probe() makes the issue go away, so it
> must be timing related.
> 
> Adding specific debug prints in the failure case gives:
> 
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: phy_probe:3613:
> genphy_read_abilities() failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
> 
> and later:
> 
>     Generic PHY 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     Generic PHY 4a101000.mdio:00: phy_probe:3609:
> genphy_read_abilities failed -EIO
>     cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
> not found on slave 0
> 
> Adding debug prints to __mdiobus_read() and davinci_mdio_read() gives:
> 
>     mdio_bus 4a101000.mdio: davinci_mdio_read:444:
> readl(&data->regs->user[0].access) = 0x3a0ffff
>     mdio_bus 4a101000.mdio: __mdiobus_read:900: davinci_mdio_read failed -EIO
> 
> but this is a different (and unimportant?) early failure from
> smsc_phy_config_intr(), and that debug print actually makes the issue go
> away, too.
> 
> Ignoring the early failure reveals that phy_read(MII_BMSR) failed due
> to:
> 
>     mdio_bus 4a101000.mdio: davinci_mdio_read:446:
> readl(&data->regs->user[0].access) = 0x20ffff
> 
> Anyone with a clue?

Just wondering if the Reset is happening correctly and it has settled
before PHY access.

From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi

&davinci_mdio_sw {
        pinctrl-names = "default", "sleep";
        pinctrl-0 = <&davinci_mdio_default>;
        pinctrl-1 = <&davinci_mdio_sleep>;

        ethphy0: ethernet-phy@0 {
                reg = <0>;
                /* Support GPIO reset on revision C3 boards */
                reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
                reset-assert-us = <300>;
                reset-deassert-us = <13000>;
        };
};

Do we need to increase reset-deassert-us for some reason?

I couldn't find MII ready time after reset de-assert information form the
PHY datasheet. except the following line [1].
"For the first 16us after coming out of reset, the MII/RMII interface will run at 2.5 MHz. After this time, it will
switch to 25 MHz if auto-negotiation is enabled"

[1] 3.8.5 RESETS
https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
cheers,
-roger

