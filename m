Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4966BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhuJm5bU8coWF+IIzOxJmec7Ug+YIsKGfOtibniuIro=; b=YyI+T2SfzjekdjWgwDmc+6o/LI
	7tb7rZcWoXS6EQxt9/Ia3SZMYHkmYt3Gg9NuO1BIDsclJJu4EXS6D3EFQ5nfZlN9gd0qoxG0THmj4
	4sCjV0ZW9G0k1PM7pJwqEj5rkbdXtYxEOyzkiCdlU9SMoJIvROrL/OxMvHy8lvHiQyn7TxT3g3GFk
	wkLNdufgI6sTNgObtVAsPCADeeGID9UdSut9eI4PGZk29RKO7fj4JbnteJZ0yovWlH784ZmTxSwEa
	Qs7A4KuTZ9W4RZI0/8US11F6YoAAgk7le6/ikOr5x2y7CQiC7df2Osv51wfSaNGn0rPhjlZLKfTE5
	A9O6iHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgeN-00000009tqr-3a0Z;
	Wed, 19 Aug 2026 13:48:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgeK-00000009tqB-2CoP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lhuJm5bU8coWF+IIzOxJmec7Ug+YIsKGfOtibniuIro=; b=lyxHHwl0o6jOPCBP+/vlesRMcX
	gJrFoI/qEtjf9ABnm0xeqWnhXU0o9ZVPgKC1blN8uMjCc78pXLUwcsoNh5C8mFvypXzdgX6kk0h3p
	9mftZnPy7mupjQOVjyRkTjCPoI47RWp5ZetpZk0NAAUW+t9l3TnvG75Xs1unKxN5wgu0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwgeB-000c9n-8D; Wed, 19 Aug 2026 15:48:03 +0200
Date: Wed, 19 Aug 2026 15:48:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Roman Riabenko <roman@riabenko.com>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX delay
Message-ID: <e9c26d2a-2426-43b7-8c68-89cc52a2c7cb@lunn.ch>
References: <20260815005316.28998-1-roman@riabenko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815005316.28998-1-roman@riabenko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_064812_565380_9754EAD7 
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

On Sat, Aug 15, 2026 at 03:53:16AM +0300, Roman Riabenko wrote:
> The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> greater than 0. If the value is not set or is 0, packet loss in the
> downlink direction is severe enough to interfere with downloads and
> disrupt software installation.
> 
> The range of acceptable values is wide. The vendor has been applying
> 200 ps in its downstream DTs since 2021. This patch matches that
> common practice.
> 
> Signed-off-by: Roman Riabenko <roman@riabenko.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> index fd3794678c33..6c8b79c257b9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> @@ -106,6 +106,7 @@ &emac {
>  	phy-handle = <&ext_rgmii_phy>;
>  	phy-supply = <&reg_dcdc1>;
>  	allwinner,tx-delay-ps = <600>;
> +	allwinner,rx-delay-ps = <200>;
>  	status = "okay";
>  };

The full node is:

&emac {
        pinctrl-names = "default";
        pinctrl-0 = <&rgmii_pins>;
        phy-mode = "rgmii";
        phy-handle = <&ext_rgmii_phy>;
        phy-supply = <&reg_dcdc1>;
        allwinner,tx-delay-ps = <600>;
        status = "okay";
};

Please take a read of:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode of "rgmii" is questionable. Does the PCB have extra long
clock lines?

600/200ps is actually very small. It should be around 2000.

	  Andrew

