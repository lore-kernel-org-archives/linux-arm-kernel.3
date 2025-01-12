Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554DEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dhTXKaqK6t8LBWqwmZRt3DR4x2EToM+pcutkF8mX6s=; b=CGkZfKmbC1Igez1HqM/fceEuI8
	XFzbahIEW01FtVyWU/jsM70kYTSR/yMr2SPHF3Q0A843rK82pv+1zxoYbf+muivQMufojBw4rv34S
	VmLzNoBgedJ0GFiko2IIlf9hCZ6ekLmK0JM/cDbd99QvpHjLls6qVEoU0d/bUyoWlgdpjxUdot7ev
	JkkOCTv3mWfVujDzR9FH9EnslFHYM/nha0gFC19q1ats3s3b6YiWYj4ru0MKJDVBVnnaXBggM47Zz
	uQr5vypuu8KGgyIsTqspXhjQIJLMgwAZ6+TBI2OlzsO7PQV54h3c8xiRlabdmM2CLB+FmcFRseNXO
	kngTdBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWthA-00000002N8W-2XB0;
	Sun, 12 Jan 2025 08:51:44 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtft-00000002N10-3IV9;
	Sun, 12 Jan 2025 08:50:27 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1736671823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dhTXKaqK6t8LBWqwmZRt3DR4x2EToM+pcutkF8mX6s=;
	b=CkisH2asLJuwPUw3e5b07/MikVDKpoCq0TXc2SSTUp2lZcboDvXltAiYHf5MLAH/HhdJSW
	oXFRk9gyXRNYIE7vBYd94TUoh9cLxIzpz4zILZcg7bM7GoN400xgNYe9zG5WLubqrRhPKu
	tH8U389BqgLhyvROA9YzmwBLIt8/wpRNaz8bBIxTQq2RHMSlyZVK9ad8uCzssWrapZqRf+
	5d4NDTberFHMoSH6G2eYwPvKl40mAtjMt5qqduXR9Z2qOmyEQpHf/zTXiff2knlQX7nyKp
	l5aC+FQ9h9o3nuh9PE3gq6DaEu5IZOR2pgC6ey2rcdVcU0uz33fkMs5ME6bv+A==
Date: Sun, 12 Jan 2025 09:50:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Junhao Xie <bigfoot@classfun.cn>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas
 Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki
 <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] Add support for Ariaboard Photonicat RK3568
In-Reply-To: <20250112073344.1976411-1-bigfoot@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
Message-ID: <c520a0d829bbe26b9802f57f94f3957c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_005026_144107_E87A1289 
X-CRM114-Status: GOOD (  16.66  )
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

Hello Junhao,

On 2025-01-12 08:33, Junhao Xie wrote:
> Add dts for Ariaboard Photonicat RK3568.
> 
> This series bring support for:
> * Debug UART
> * SDIO QCA9377 WiFi and Bluetooth
> * M.2 E-Key PCIe WiFi and Bluetooth
> * M.2 B-Key USB Modem WWAN
> * Ethernet WAN Port
> * MicroSD Card slot
> * eMMC
> * HDMI Output
> * Mali GPU
> * USB Type-A
> 
> Changed from v1:
> - move some general nodes (firmware, ramoops, reboot-mode) to 
> rk356x.dtsi

This entry from the changelog caught my attention, so I tried
to find out what exactly happened back then.  Though, after going
through the mailing list archive, I still don't see where the
as-described change took place, so perhaps this changelog entry
needs adjusting.

> - gmac1 change to phy-mode rgmii-id
> - corrected some regulator to be closer to schematics
> - rename rk3568-ariaboard-photonicat.dts to rk3568-photonicat.dts
> https://lore.kernel.org/lkml/20240904111456.87089-1-bigfoot@classfun.cn/
> 
> Changed from v2:
> - remove unused headers
> - corrected some regulator to be closer to schematics
> - remove usb_host1_ohci, usb_host1_ehci, usb2phy1_host that have no 
> connection
> https://lore.kernel.org/lkml/20240906045706.1004813-1-bigfoot@classfun.cn/
> 
> Changed from v3:
> - corrected some regulator to be closer to schematics
> - changed to using clk32k_out1 in xin32k
> https://lore.kernel.org/lkml/20240911122809.1789778-2-bigfoot@classfun.cn/
> 
> Changed from v4:
> - corrected some regulator to be closer to schematics
> - corrected some label to match node name
> - use resets props in phy node instead deprecated snps,reset-gpio
> https://lore.kernel.org/lkml/20240914145549.879936-1-bigfoot@classfun.cn/
> 
> Changed from v5:
> - resort regulator nodes
> - remove dr_mode from usb_host1_xhci
> https://lore.kernel.org/lkml/20241108031847.700606-1-bigfoot@classfun.cn/
> 
> Junhao Xie (3):
>   dt-bindings: vendor-prefixes: Add prefix for Ariaboard
>   dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
>   arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3568-photonicat.dts   | 599 ++++++++++++++++++
>  4 files changed, 607 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

