Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCEEC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXZQ85hl6gjXGBQyDCBhFXusiWUZ+b2GFVqnsC9NZw0=; b=FnQ3AOcHqtw/GKX5s/xNkMPtwx
	wFBEKPZ8GGGITziOVxnKtHCvAO/eKiDieBF8HN47DsZhfUZOAWtew0N5E6gxYZ8mMBB0ztNEcfa0A
	FcI/Cjs1CvNPvwNuS8iHoej+uLZ4St7r5fTbjfYJkO3uWwCnX9ojg0v3Cdyq8vAi7aUOZLWSy2/dK
	nebVbW4ufLMx0whf4Ywrp9w5gCNhmcDFouuxbiEPclEWTS5n5DEzZbJt9Y0dZtnFxnEkA/d5xTHaX
	a+uJ4DhAenS4UXapsIQMS4On0IdnRrKeidtr6TTjtrqC1OUwkejky6sd1TuO8hy5mzzx2vb9ylF2u
	47SeirDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xvu-0000000GJ6c-3SoB;
	Fri, 11 Sep 2026 09:52:34 +0000
Received: from out-48.mta0.migadu.com ([2001:41d0:1004:224b::30] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xvr-0000000GJ5I-0NPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:52:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=23/ENQ5gA857upXkBJbmjsuGG+iGltANLDGDlezshT4=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789120346; v=1; x=1789725146;
 b=Y47QMUxn0TKeXOuEheK0ycl9t9263+tQ83GEl/ItuBW7+Hyc+Qpz6IVPyLsGQYkCU6KCAiid
 gVj7eAaobAmg1BIf/3Cqy6LDdUh4cYf5lYUkdpgh/cNGRZNNhHWHr8PbWmlbGedcFVtgDcG/Qz4
 /Vjj75ZDfz5dORvuzFbMqknb4iAurd1fFuI0iXpc1JZNfVlv7WYUGFqO05h1mxSvxN4XlbvTUlF
 oD36TemK2ca0ixXx6RNDDaFU24W1G+JYQ/0yLso8vvx9DrvpLLkfpChyFjZHcetef0KdawHKcd8
 dYKERR6JsSnROndHTel9FtB0duUJNGL44M+JFIQpFKQoA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 336b87e032570366;
	Fri, 11 Sep 2026 09:52:26 +0000
X-Mizu-Trace-ID: 336b87e032570366
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 11:52:24 +0200
Message-Id: <DLCE8BRWYCBL.2UH33L4RQMAGN@cknow-tech.com>
Cc: "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v5 2/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <ricardo@pardini.net>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 <nic_swsd@realtek.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net> <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-2-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-2-c1b9e5f10cd6@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_025231_762712_3DBAF89A 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu Sep 10, 2026 at 10:07 PM CEST, Ricardo Pardini via B4 Relay wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
>
> The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs
> behind pcie2x1l0 and pcie2x1l2.
>
> Describe the fixed function nodes and attach ethernet0/ethernet1
> aliases, so that U-Boot's fdt_fixup_ethernet() can fill in the MAC
> from its ethaddr/eth1addr env. The on-NIC EEPROMs on this board are
> not pre-programmed with a unique MAC, so this gives a stable MAC
> across boots that both U-Boot and the kernel agree on.
>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> index cfdb5c13f8606..550358a756618 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> @@ -20,6 +20,8 @@ / {
>  	compatible =3D "friendlyarm,nanopc-t6", "rockchip,rk3588";
> =20
>  	aliases {
> +		ethernet0 =3D &rtl_eth0;
> +		ethernet1 =3D &rtl_eth1;
>  		mmc0 =3D &sdhci;
>  		mmc1 =3D &sdmmc;
>  	};
> @@ -644,6 +646,20 @@ &pcie2x1l0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_0_rst>;

The new pinctrl reference is ``pcie_25glan_perstb_b_pin``, so this patch ne=
eds
to be rebased.

>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x200000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x21 0x2f>;
> +
> +		rtl_eth0: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x210000 0 0 0 0>;
> +		};

Described on page 23 of the schematic titled '2.5G Ethernet B' and ``U12``
(ie RTL8125BG) is connected to LAN2 which has ``ETH2`` as label on the case=
.

> +	};
>  };
> =20
>  &pcie2x1l1 {
> @@ -660,6 +676,20 @@ &pcie2x1l2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_2_rst>;

The new pinctrl reference is ``pcie_25glan_perstb_pin``.

>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x400000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x41 0x4f>;
> +
> +		rtl_eth1: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x410000 0 0 0 0>;
> +		};

Described on page 22 of the schematic titled '2.5G Ethernet A' and ``U10``
(ie RTL8125BG) is connected to LAN1 which has ``ETH1`` as label on the case=
.

So this results in:
ETH1 -> rtl_eth1
ETH2 -> rtl_eth0

This sounds like a recipe for confusion and/or potential future mistakes.
I think using ``rtl_eth1`` and ``rtl_eth2`` would be less confusing, but
I'm fine with another construct which achieves a similar thing.

Cheers,
  Diederik

> +	};
>  };
> =20
>  &pcie30phy {



