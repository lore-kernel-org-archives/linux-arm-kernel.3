Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE28CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVOqRzffast9w9OGjVmheV2KxIHSIR/vZj+ti3r59fY=; b=tPilxZD8exf6uHki/cXkN/2Dti
	FnlIUKVT7RPhi00Y7FWTco/LXzc2NMzTybMhBhzEqP3PiG6GsiDjhka6pTYVySprazxgnqHA0d6MN
	i+aGnGTMnxWC4Cm+UGgF0k1spkobEDHRqdsHmU2xX3QYI0ASILqCETUbb4p50aUoB7UiSbKZKZila
	4IDiPSeOQbrgdPdoz/gTD8B5Xs6P65IXxC/1JFW/Tygxu5lxvOMkI3L2euc/RYrKIRJnruZVr+2vD
	FQlp5LicIW2hYOJ2cIjZjGItxQMHnQYVbzFU3RtJEEGidzrh1Kq6zISnXJcfFtTp6vyF7xNTKhfud
	1LWLOaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CId-0000000H1Pg-00Jk;
	Thu, 02 Apr 2026 07:17:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CIW-0000000H1OV-3YbQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F7A261855;
	Thu,  2 Apr 2026 07:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDC4C2BC9E;
	Thu,  2 Apr 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775114219;
	bh=ixF/iBiKqn/ro1PZ25psrjw6uL54La6KQJ7NHVOELj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oW0ED8jluRS77KrOPN7CxwTQzYYqPYmVADP+myLmA6K89/ktGQQuN5D4hmMQwcSvt
	 fjIKeQBiMoYSheUCPFFgKJP3/YsvcNGFlP5ll7xJvEUC8sqKaA33BUky+QtZV+arB8
	 JhMU3sdVsw7Q3NlcAzafDXFdVvPxKD3inIv3zPe3BorHcq3n+0Uylou28Gdz5z5/CJ
	 BFWYXsGvx2zhXXckNUyQiAL7YV5vsILJTYhcJMTHjgEEoepe47Mj4MsPITBQxU5EUQ
	 2ia7IOCl0Lgb3yvVvFL1+EiMlbg2S9m7wvzzehHjMSw9Rrt93CAGmkn1tTZ8LEDUws
	 0yM2tvUxSdZUA==
Date: Thu, 2 Apr 2026 09:16:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, 
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: perf: marvell: Document CN20K DDR PMU
Message-ID: <20260402-invaluable-delicate-clam-7fd6c5@quoll>
References: <20260401081640.23740-1-gakula@marvell.com>
 <20260401081640.23740-2-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401081640.23740-2-gakula@marvell.com>
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

On Wed, Apr 01, 2026 at 01:46:39PM +0530, Geetha sowjanya wrote:
> Add a devicetree binding for the Marvell CN20K DDR performance
> monitor block, including the marvell,cn20k-ddr-pmu compatible
> string and the required MMIO reg region.

You just repeated the diff. No need, we can read the diff, but what we
cannot read is the hardware you are here describing.

> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
>  .../bindings/perf/marvell-cn20k-ddr.yaml      | 39 +++++++++++++++++++

So you did not test v1. You did not test v2.

Did you finally test this one before sending?

>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml b/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
> new file mode 100644
> index 000000000000..fa757017d66e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/marvell-cn20k-ddr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell CN20K DDR performance monitor
> +
> +description:
> +  Performance Monitoring Unit (PMU) for the DDR controller
> +  in Marvell CN20K SoCs.
> +
> +maintainers:
> +  - Geetha sowjanya <gakula@marvell.com>
> +
> +properties:
> +  compatible:
> +    const: marvell,cn20k-ddr-pmu

There is no such thing as marvell,cn20k in upstream. What's that?

Best regards,
Krzysztof


