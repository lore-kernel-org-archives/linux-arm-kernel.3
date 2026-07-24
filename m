Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D139C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVePKTwmG/uGjReu3xLyTw+dzVY3ouI5ECuA8DRmP0c=; b=lMYFBEx3dzIwIl+06DKl9pR2gc
	OQ3I8RhiNXDjG93/8NMOPf2wV3UTtt5mO+5aEseRZSjW+m8101nS4TkD3EC8bKvNIkYg5wwmqcNq4
	ig0a5q76t+XNQGMu/D41V7tD856U7X420v7LurWNpTYFkolKy9cE2B0N84HeyYgrjDxyvhG544115
	SKLeBEhk6/VKAQQrbV1JSWxDnfH6aCJ38R09iV+WCzEzDEfnvow5wduQTdrjGn+u2QMxhpkYwNWqW
	AIetW9aRsJzbgwiSCj2IgL9IWoapw9h5E2woYXjrCNkFUmUVSE3WDkM93LnnTCYTNSBSuAGZve8w8
	TJWLtdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBQb-0000000Fpbi-1bO7;
	Fri, 24 Jul 2026 08:38:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBQa-0000000Fpbc-2fYp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:38:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8D5E600AA;
	Fri, 24 Jul 2026 08:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFE81F000E9;
	Fri, 24 Jul 2026 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882323;
	bh=uVePKTwmG/uGjReu3xLyTw+dzVY3ouI5ECuA8DRmP0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gY/+jLHsqKvcL4uPdwUutWf9iBATCxcgKiFSFolbYz3840vjoORZtVwzL6CaIjvvq
	 PXPneYEEnT0LT+sDtIuAqtFgZtbcl/6OF3qa4W4uK0Pmkcb070e78ilgg2LVLLLyGT
	 CksZ9exNK+kVnuV60ZfBHygyKD6hZ1FOfcjYjgs6Kh4cRm+mVYNkn9qSGC0vvg+n/P
	 XRsxd6N3il3XTmYUL/44rKC8ZrEf18kjGoZ0/b1RRy/OgPM6bgWzPeUU1+fld7x/Gm
	 FTiDP2iGmTdDBmbm0mVQGypZ8wzGMTrHa1T6IhMTHXCOlpZ7br7eYzd0QViCfCktjA
	 0TGiDDITMC9Ew==
Date: Fri, 24 Jul 2026 10:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
Message-ID: <20260724-hissing-fascinating-terrier-6b754f@quoll>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
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

On Thu, Jul 23, 2026 at 04:29:47PM +0100, Alexey Klimov wrote:
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 3881f573ec08..9a8d92aae9a8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
>  			};
>  		};
>  	};
> +
> +	apm_sram: sram@2039000 {

Looks oddly placed, suggesting this is not part of SoC, but all MMIO
nodes must be part of the SoC if this is SoC. Compatible says this is
SoC.

Best regards,
Krzysztof


