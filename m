Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D09CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfHjmALeSuAk8b8lLGyqi6fhpxEvnN4bOx0UqElVopI=; b=toV0obkh4C83CLf9VtIsHVgN+e
	Zv9yFbjGXBpzpdaegXN8Kp463nqdyV+060POD2zic1V+E1Hhh1mi/Rqkx4HVQvCRdHyjB8etOrw1Q
	vFdKZjFFfgYU0cJkKglcHkoMt7joBwAcMCB01PAW0L8WurQQWiiUv4jNOGyU5N8T+SRTu/0xOoHtZ
	uu9+HbbvMkAaaoRBEjchx66dxhsZfBIBEHb2NvPLCFcTdSiGpJBl/C5yH3HJ5JulT7dD8RpvoU2lD
	DGRj9vbLIWCLnYmnYyc3rbad/WM+QESNEvvGuytXDB3dRSLMG/nobIVR8uBC3cBQSQNC1isTTEiyj
	casPNf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXa3U-00000008tb2-3nLK;
	Thu, 11 Jun 2026 07:42:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXa3T-00000008tas-2ReT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:42:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A53A60052;
	Thu, 11 Jun 2026 07:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267111F00893;
	Thu, 11 Jun 2026 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781163742;
	bh=GfHjmALeSuAk8b8lLGyqi6fhpxEvnN4bOx0UqElVopI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCp2cWJiqRWgpB/BNvv79HOpoVV4VIpHSU6U7tGRxtVlSVxeckYlbOag//8OLoChE
	 3q8Fqlx4Jr9E5wtUgb7aChD49Uz9Rsq7xxyKfJcZyogIyMjJ04w7zJsA0kJBIewTZl
	 pU2lrXflp414X/EzBFAp9skrggETc2wzK7Ttx94XQBi5H+e9lZERPELsQH4kPqsurZ
	 CkakpoFvSGdg8J5e08ep3IpQqW6KcUewwJlwZ05ipwk9o/7u59XgQNg41LNaINc74i
	 COvSRxZHjiEW+OwWyh9uEpBoxBvV6ms1zGv/cr7mXSTOM0+RtSNt+Ew/lDCJP9n8kW
	 AK62cURfu4lcA==
Date: Thu, 11 Jun 2026 09:42:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Message-ID: <20260611-numbat-of-unmistakable-excitement-f6cfed@quoll>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
 <20260610075645.3581145-4-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610075645.3581145-4-joakim.zhang@cixtech.com>
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

On Wed, Jun 10, 2026 at 03:56:43PM +0800, joakim.zhang@cixtech.com wrote:
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss.h.
> +
> +  clocks:
> +    items:
> +      - description: I2S parent clock for sampling rates multiple of 8kHz.
> +      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
> +      - description: clock feeding most devices in audss (NOC, DSP, SRAM, HDA, DMAC, I2S, and Mailbox).
> +      - description: clock feeding for HDA, Timer and Watchdog, which is a delicated 48MHz clock.
> +
> +  clock-names:
> +    items:
> +      - const: x8k
> +      - const: x11k
> +      - const: sys
> +      - const: 48m
> +
> +  resets:
> +    maxItems: 1
> +    description: Audio subsystem NoC (or bus) reset line.
> +
> +  power-domains:
> +    maxItems: 1
> +    description: Audio subsystem power domain.

Same comments as last time, but let's keep discussion in previous patch.

> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +  - resets
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +
> +    clock-controller {
> +        compatible = "cix,sky1-audss-clock";
> +        power-domains = <&smc_devpd 0>;
> +        #clock-cells = <1>;
> +        clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK2>,
> +                 <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
> +        clock-names = "x8k", "x11k", "sys", "48m";
> +        resets = <&s5_syscon 31>;
> +    };
> diff --git a/include/dt-bindings/clock/cix,sky1-audss.h b/include/dt-bindings/clock/cix,sky1-audss.h
> new file mode 100644
> index 000000000000..033046407dee
> --- /dev/null
> +++ b/include/dt-bindings/clock/cix,sky1-audss.h

Filename must match the compatible.

Best regards,
Krzysztof


