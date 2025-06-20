Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2567C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5JVhXHUX0giXi/RvCgmmaFUyHVyvUhMe20cMxu2wk4=; b=XtgMpokGG0kQSWXlKHCpKY7CgA
	9WcZVXN8AKXVurKWy7DcaAAugfBgopz97v1pgtx5oH+9EzSsciEk6wjXor4TMWrCX3VdhLwlmID4A
	QaH9nPRNlKRKJz+ckAP7bAOsZWbtVu0YUt5LEC0QfK0IGemLkutb1VsxMVfq3OVTKCtODza01Sr/V
	V7mrahORsePc/dMX7NCg1q052njATKcOHFjCvFIiSAnN77oWrNi1a3itVbHt+d5oTScUvdG9NY88/
	ivv2ZCV4XMuV6B6wPc0whrp61mB7N5Mpi2h0MnHIYBTB6/6RTszLadaqxUxy5BM6pCLsm7HALGT9m
	RLAb29Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScJy-0000000Fnz1-3jA4;
	Fri, 20 Jun 2025 14:02:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScCv-0000000Fmw5-2L5m
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 13:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+5JVhXHUX0giXi/RvCgmmaFUyHVyvUhMe20cMxu2wk4=; b=QBfaVcNVvzyB1T2lD99qQKAVDS
	lE2oT7kTWe9PUMG8/vaqpjPu65Qjk0Lk16R+Kw3kRvERqnbZxz7ME8A9IAsxEBnGC+feo6u9HJfVq
	pRhKyGZXAHxzW/6x5Mhz0KHbmHR3TJY7WqDdjiG8f8p7yTEJjUVEACQ/culb6Lnac4yRWmUD3z7DO
	VpE/43Z+NJcQ2+6NphrXBIO9clofOgu0em9HAH290PX1GyHTTbB9+KAPjNtYtb0iQA/aEKsHJSySm
	7Ze9WjrJGWmenEhBL2iU4dyt6X8to9YAZn/o6NGoofBSBFXARowdhHVLE9t9LzOuJlRD38HMBJoqe
	C4YYsWXQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScCs-00000004l7R-3wA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:55:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F341A16F2;
	Fri, 20 Jun 2025 06:54:41 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB47E3F58B;
	Fri, 20 Jun 2025 06:54:59 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:54:57 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to
 correct location
Message-ID: <20250620145448.5e48d9b0@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-4-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-4-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_145503_328668_78F7C06C 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, 20 Jun 2025 01:30:05 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Nodes are supposed to be sorted by address, or if no addresses
> apply, by node name. The rgmii0 pins are out of order, possibly
> due to multiple patches adding pin mux settings conflicting.
> 
> Move the rgmii0 pins to the correct location.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 458d7ecedacd..30613a0b1124 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -126,16 +126,6 @@ pio: pinctrl@2000000 {
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  
> -			rgmii0_pins: rgmii0-pins {
> -				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> -				       "PH5", "PH6", "PH7", "PH9", "PH10",
> -				       "PH14", "PH15", "PH16", "PH17", "PH18";
> -				allwinner,pinmux = <5>;
> -				function = "emac0";
> -				drive-strength = <40>;
> -				bias-disable;
> -			};
> -
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
>  				allwinner,pinmux = <2>;
> @@ -163,6 +153,16 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			rgmii0_pins: rgmii0-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10",
> +				       "PH14", "PH15", "PH16", "PH17", "PH18";
> +				allwinner,pinmux = <5>;
> +				function = "emac0";
> +				drive-strength = <40>;
> +				bias-disable;
> +			};
> +
>  			uart0_pb_pins: uart0-pb-pins {
>  				pins = "PB9", "PB10";
>  				allwinner,pinmux = <2>;


