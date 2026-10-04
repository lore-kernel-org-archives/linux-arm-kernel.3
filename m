Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA03CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM6fCgMzlrh3EWJKc1X+4QJ1+TyZKSQffV+aGGr36KY=; b=OGg73q+XZm1GkQGrAo4NewDQK1
	agyPknVN0iGnauiJFSjG8U2elkU6XP7P7CRBW4Q8j4i1Fa/aBVL4WmGDPxhrwtaw3XfXEgknkKQLe
	oLm+KDZ5VQY2AkNSSIzbau6yUQ5Mxrtuvz4i7TDcut8YNjQr1LIbTKfbdK9JHNE04Iyy8z5ti2Cd6
	SlCqvz+b++bVtgxUQDcuiKISEyH3WY717rmw4ksAPYaCdYjEKXrnJFtxu6XEjoEV/IeRASINV0cp8
	kklJGeC3QUeC19muYe9iEQ59EEuHg80k/oGVoZnvGXQwh7agxuuSvA3ridU7iaZKGecwaCwRB+UVk
	ekgKFqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTIa-0000000FJdj-0AAV;
	Sun, 04 Oct 2026 20:59:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTIW-0000000FJd8-0Kc6;
	Sun, 04 Oct 2026 20:59:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3DECA4E41168;
	Sun,  4 Oct 2026 20:58:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBE57604FE;
	Sun,  4 Oct 2026 20:58:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1989E1032820F;
	Sun,  4 Oct 2026 22:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791147537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jM6fCgMzlrh3EWJKc1X+4QJ1+TyZKSQffV+aGGr36KY=;
	b=FGN/etFsNicQkwc2Ng7T0X4rN7HYvMj2fTVXXMnfELUCfl4IhdTkNd7SFwlWk5F1qcN7aD
	J3DQ8UTrVIagIX/QB7I7HHFQi1goueoTBFG9aMaVIKIziZr1QH1BDapG+ln6oSCrK2bBOb
	9cjbwUA3p+uQmCKNixLCtzgzWHW7Om+LXQxSf1TmuEUvlrg+FuLGufWM6i3UG0c8EqS9YD
	ziPlqAKqS7PZXkp/y+MtKjFhZpbsCVe4Zw8Eab1OkZTW4UZdOHuv8r5ldHWmaTAffhlpv0
	QZeyESje0WfG4MTJhKqYCJnPz5rfylaQb8e4Qn+AhhHW4IfZzDCJRrnZQX+x4Q==
Message-ID: <d1ae6c21-72a9-4bc7-aaaf-9051d0f6b1b0@bootlin.com>
Date: Sun, 4 Oct 2026 22:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-7-tanure@linux.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261004144046.391444-7-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_135904_266305_BC068331 
X-CRM114-Status: GOOD (  19.31  )
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

Hi Lucas,

On 10/4/26 16:40, Lucas Tanure wrote:
> The board carries a Realtek RTL8211F gigabit PHY on the external
> management bus, connected to the MAC over RGMII.
> 
> Enable the controller, hand it the ethernet pins and point it at the
> PHY. The clock delays RGMII needs are supplied by the MAC rather than
> the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
> kernel programs.
> 
> The PHY interrupt output is wired to GPIOH_6, so describe it and let
> link changes be reported instead of polled. The PHY reset pin is driven
> by an RC network on the board, not by the SoC, so there is no reset line
> to describe.
> 
> Tested at 930Mbit/s sustained receive over a minute, with no MAC error
> counters moving in either direction.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 0fa83362b417..5d0365ddde72 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -14,6 +14,7 @@ / {
>  	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>  
>  	aliases {
> +		ethernet0 = &ethmac;
>  		serial0 = &uart_a;
>  		mmc0 = &sd_emmc_c;
>  		mmc1 = &sd_emmc_b;
> @@ -256,6 +257,33 @@ xtal: xtal-clk {
>  	};
>  };
>  
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +	pinctrl-names = "default";
> +
> +	/*
> +	 * The RGMII clock delays are added by the MAC, so the PHY is
> +	 * asked for the mode that adds none.
> +	 */
> +	phy-mode = "rgmii";

In devicetree, "rgmii" means that the delays are inserted at the hardware
level, i.e. with longer PCB traces for the clock. With the above comment,
this is therefore wrong.

As a rule of thumb, "phy-mode = rgmii" is almost always wrong.

The right behaviour here is to represent the HW as it is, that is to say
pass phy-mode = "rgmii-id"; delays are internal. In DT we don't say who
inserts the delays (MAC or PHY), that's for the drive to figure out.

If the MAC inserts the delays, then it needs to fixup the mode passed to the PHY so that
they follow this doc :

https://www.kernel.org/doc/html/v7.2/networking/phy.html#rg-mii-electrical-interface-considerations

Maxime


