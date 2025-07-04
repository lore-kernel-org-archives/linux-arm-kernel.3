Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ED4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 22:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLwiW6wNKW8Nj+FqEahSLfage+tfY/YP9vZhzDDL1Qg=; b=tRQ47TTaNYJWu7HOcgLD6H98+H
	UYH2E6XSrXEiRl2vAfyBsYz6egOyAgMfdO2quWiZYzjyIeBGNwjejnxh5zIuGifhw1dCfsNrMYXDT
	iq+2G1EE+NbSOBaluDjYHmE41K3Psy98RfCH+esTpB20tv8iv7Byzt6mbJeVoZkKsvBTCpFcl+hw9
	V89m91VkfD7HycdI4KrfywfqtBz8eRPc1dMl6lPNPuK1IhYDTbFgQfP1uS96fzlv1vg3l5VdX46/r
	w/DbpYjK0pGNEJE6SxhwHTj/MXgALKRvQ3c7nfzfGKhGGvMC5Bw6fkOgBdjwakd8b6Wl43j8WdXT4
	gzKuvILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXpDh-0000000Fd5L-2HH9;
	Fri, 04 Jul 2025 22:49:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXpBL-0000000Fcuj-0TJr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 22:47:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89F50153B;
	Fri,  4 Jul 2025 15:46:44 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72793F63F;
	Fri,  4 Jul 2025 15:46:55 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:45:28 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] arm64: dts: allwinner: a100: Add pin definitions
 for RGMII/RMII
Message-ID: <20250704234528.4936fa72@minigeek.lan>
In-Reply-To: <20250626080923.632789-3-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-3-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_154659_201207_98A0FD28 
X-CRM114-Status: GOOD (  15.39  )
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

On Thu, 26 Jun 2025 10:09:20 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi,

> The Allwinner A100/A133 supports both RGMII and RMII for its Ethernet
> MAC (EMAC) controller. Add corresponding pin definitions.

Apart from suffixing everything with "0" ("rgmii0_pins: rgmii0-pins"),
this matches exactly what I gathered from manual and tested in my own
version of this patch a few weeks ago, so with the 0 suffix attached:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index bd366389b238..1c4e71b32911 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			rgmii_pins: rgmii-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10",
> +				       "PH14", "PH15", "PH16", "PH17", "PH18";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
> +			rmii_pins: rmii-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
>  			uart0_pb_pins: uart0-pb-pins {
>  				pins = "PB9", "PB10";
>  				function = "uart0";


