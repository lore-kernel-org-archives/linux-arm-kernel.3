Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A06ECCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 06:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PANH83LO9KrofHVTq/98fVVjN62lrjOODBRAe7r1vek=; b=FBlsb8BF564EJpqPxmSFBaEIUs
	YottQeDuuky0DtSjkIZB/dzlEXjiIHIs7ZjUOqTgvYdEFXBZvWOGS7HOxZjRj+FwVFonLme465per
	+lQVcV0eZR8NvSnbpA+IF/LL5coIzeAWSWY+9AVj46IqA/6Qzgk+xQIL37f47xhLqOC6KFrNjZcRJ
	dWysHfDVQY+LH5gtFSCsxOeZqNIvxOYWLSWu+983KWTQbiLDP8ODMxH3sOGncD6fCBOeeiFftp1MN
	J0QJakd6LiXQsYaiIQHCRLLY8a7cWs5A82tDWsvDYafIvFYz9YD45nb0M+diiEkyORCSU5Qo+xSZl
	2ZFFA9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHy5k-00000004UZL-24Ej;
	Sat, 17 Oct 2026 06:40:28 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHy5h-00000004UYi-3qs6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 06:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=PANH83LO9KrofHVTq/98fVVjN62lrjOODBRAe7r1vek=; t=1792219225; x=1793428825; 
	b=r6bjTEuT7oyr/qJ38GyhqfDG9BJAGcTFZIWbcq8cQlhnuSDymVNHXfjDPiB7HPjpjDqMIDhZBt8
	/mLKZ7ZNkOZXMTwwUbEnhQgaCb6c7HjYQNC+wkmLAhtCsYkhjLUF7/jMuRCYPdbg+axspaJ3VHtWc
	eFUx4O0uh+UeyCQHfEw70mr2JkchiQlHalD9ZWPd2ZtjLmH4UVfIzCfkjhSXhJCqVuigy1Q1mh4sH
	9yiwdIQiKBwf26TFHNSXgbZaQ8dZK3+hosMO5ESbUyAMozOcZriaQHA6MfM98/oSJOsNt3M3qpkTp
	NcJd9IoCZJ214LHz6jKNXc3mD8/ILk4lnmKg==;
Date: Sat, 17 Oct 2026 08:39:57 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Christopher Obbard
 <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Linus Walleij <linusw@kernel.org>, Rouven
 Czerwinski <rouven.czerwinski@linaro.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
Message-ID: <20261017083957.7c2696f5@kemnade.info>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
	<20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_234025_968310_11BD70D9 
X-CRM114-Status: GOOD (  16.20  )
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

On Fri, 16 Oct 2026 16:41:21 +0200
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> USB node was not working correctly with DMA enabled as the supporting
> code had been updated without updating this SoC's device tree. Bring the
> device tree more up to date so that it works with DMA enabled.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index 7f3ef3a00ab8..5be9efc60785 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>  		};
>  
>  		/* NOTE: USB needs a transceiver driver for phys to work */
> -		usb: usb_otg_hs@47401000 {
> -			compatible = "ti,am33xx-usb";
> -			reg = <0x47401000 0x400000>;
> -			ranges;
> +		usb: target-module@47400000 {
> +			compatible = "ti,sysc-omap4", "ti,sysc";
> +			ti,hwmods = "usb_otg_hs";

Why do we still need this? It is depcrecated.

Regards,
Andreas

