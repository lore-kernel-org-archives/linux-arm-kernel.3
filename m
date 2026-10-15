Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA115CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaUADMT+fvSfc/JEU1HgvaWYo/xvNQwoXU0RhWpTA9A=; b=tW9/qphGJ4bdirgYjD1PLi+HuE
	colj89+dNkWAhySbr4Q0nx5+lBXZM35hRT2D4gDo+QcGwi1q1EX21584OR/kTTkCj+dYXBF+vdQmO
	lgpz01zVOE39I5n/RhFQl05g06cY5tOU57pLwYXXPicGzgnuYzqtgcAuERD1SE4WnYcOfiTx24vYX
	d5A1kP8KuD8ivGhyS2BvOYrcOvrTLlOqQmXwDAS2Jq89pELiLjih0gXfsfMA+SeyOznL1EdUewWfZ
	E8JWGovLoQuph0Ny3ZQjaVngjPlnnSousOeISRB8r+CSvkqy2F9Sz3C4OkBgxWNsM+jvy9GXaiIJg
	9EFwX0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxz-0000000HIdF-25z9;
	Thu, 15 Oct 2026 09:41:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxx-0000000HIca-0vPY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:41:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78B1A6022B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31B91F000C4;
	Thu, 15 Oct 2026 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057296;
	bh=XaUADMT+fvSfc/JEU1HgvaWYo/xvNQwoXU0RhWpTA9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fR/ARxwbiz8cBlSzX6lcN52NS6fi0UJ+Uoz+12c6qbscYKOmdWlO6sZq0OFgqTGwM
	 n/5UV/AwoFLoFQMqMEqWlq67vSkixR0mHA07aBOfCwx6sBW3ckxkMo8eqBLHQyGai/
	 vbmfbhBpMui764gYXy2r+80Sppz3dm0jJQ4UTzJzlIc5Vy/lOJodkq12iY8F9rC4Tr
	 uzmCelrhcFR1DAyVZyMauX+drNBrtLI46Y/3k/G1QjmKV/MVWuwmhBdIKwdzwcVKJv
	 D2p/vLqL8rgauscxN5FyQQpPEL68KXmzB69am0n3Ya5r6wBSNDPAtm6vOQavUJbVI3
	 4IZylb47FSRsw==
Date: Thu, 15 Oct 2026 11:41:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: altera: Add support for the Agilex27
 SoCDK
Message-ID: <20261015-prophetic-raven-of-gallantry-a6bec0@quoll>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
 <20261014125709.2106261-2-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014125709.2106261-2-dinguyen@kernel.org>
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

On Wed, Oct 14, 2026 at 07:57:09AM -0500, Dinh Nguyen wrote:
> diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> similarity index 67%
> rename from arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
> rename to arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> index 998f19f492b36..15d331cdeeb47 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> @@ -2,11 +2,11 @@
>  /*
>   * Copyright (C) 2026, Altera Corporation
>   */
> -#include "socfpga_agilex72.dtsi"
> +#include "socfpga_agilex27.dtsi"
>  
>  / {
> -	model = "Altera SoCFPGA Agilex72 SoCDK";
> -	compatible = "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
> +	model = "Altera SoCFPGA Agilex27 SoCDK";
> +	compatible = "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";

NAK, breaks users without a reason. Rebranding is not a reason.


Best regards,
Krzysztof


