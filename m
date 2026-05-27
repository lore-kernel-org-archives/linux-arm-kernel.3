Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C98CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fwiisoH+O10cDKs9SXUnzu9+RWmKRkE9L4Uzj4ctHI=; b=W8IPr5m1wC7aLd0X9zYAtxopUs
	pe/0ZGMz9ogEjBxE+1eUsG3b+4s9hi1eNLj5KwQG7Z/sU3meJLAS3jd4RaGHdL7JXCht6DQo36dNQ
	hpcxxuzUN7Iu9yBTIIUDDfrW1p+DxbO+NIePYnE7f+RrZ1ZODhsay27j7hZm2aA2TI+hL4vLVKYLk
	XE/7EB++9gepT1IslPfMtzjhVEgOFwxtwoJzi8jDYR4olF5Upxaj4oeOOfWSnJYy6WED5e4qyncoj
	9imcKXIs1EPd7nTyIQF5k9dUT7Ai/eNx/luxMLxwarkF8Jtx8Yf97mRTZKPtHWFiNJubffk5LvnQZ
	On9GDBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9tD-00000003Z7O-3Euu;
	Wed, 27 May 2026 08:45:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9tC-00000003Z7I-188b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:45:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7960E60215;
	Wed, 27 May 2026 08:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546901F00ADE;
	Wed, 27 May 2026 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871520;
	bh=4fwiisoH+O10cDKs9SXUnzu9+RWmKRkE9L4Uzj4ctHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HQOC9cFuUcgCMXNBo6VkwORPXpnIugUKP/csgboHOPNzfgseAadNARfktDGu04yVj
	 DYV2JlKt5GvM3gS5zbgt0O2Xo+UAcgDgsrQLtG9MUWQSo+S6yzmhrCuzD0N44HWq89
	 fdcJaHjeFGnnzZChGdZxBjy0Umt0KZ56DJUN9coeOVUag+xs/pSXi0DP4/4G/1qqod
	 DiA0jN2ZepWFKzBDhTBIWRezNqSorYSnjSiQMs246enKuPcIW0s4uUoVQfRZWiVSzd
	 Z9SIADgHxI18lB64dN++7w9iWu0xtTG1GHO0ky6122YxD6ZG+ZeV5UbvpUcI+XrVUM
	 tRj/44c1eMJXw==
Date: Wed, 27 May 2026 10:45:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, 
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: perf: marvell: Extend CN10K DDR PMU
 binding for CN20K
Message-ID: <20260527-wise-cobra-of-feminism-2720a6@quoll>
References: <20260526164330.23878-1-gakula@marvell.com>
 <20260526164330.23878-2-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526164330.23878-2-gakula@marvell.com>
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

On Tue, May 26, 2026 at 10:13:29PM +0530, Geetha sowjanya wrote:
> Marvell CN20K SoCs integrate a DDR Performance Monitoring Unit (PMU)
> associated with the DDR controller. The block provides hardware counters
> to monitor DDR traffic and performance events and is accessed via a
> dedicated MMIO region.
> 
> The CN20K DDR PMU is functionally equivalent to the CN10K DDR PMU, with
> minor register offset differences.
> 
> Changes in v6:
> - dt-bindings: Document CN20K in the existing marvell-cn10k-ddr.yaml;
>   add maintainer, description, compatible enum entry, and a CN20K example
>   with unit-address aligned to reg.

Changelog is not part of commit msg, but changelog area, so after ---.

> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
>  .../bindings/perf/marvell-cn10k-ddr.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml b/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
> index a18dd0a8c43a..79fae9fdb6f1 100644
> --- a/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
> +++ b/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
> @@ -4,16 +4,22 @@
>  $id: http://devicetree.org/schemas/perf/marvell-cn10k-ddr.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Marvell CN10K DDR performance monitor
> +title: Marvell CN10K / CN20K DDR performance monitor
> +
> +description:
> +  Performance Monitoring Unit (PMU) for the DDR controller on Marvell
> +  CN10K and CN20K SoCs. The block is accessed via a dedicated MMIO region.
>  
>  maintainers:
>    - Bharat Bhushan <bbhushan2@marvell.com>
> +  - Geetha sowjanya <gakula@marvell.com>
>  
>  properties:
>    compatible:
>      items:
>        - enum:
>            - marvell,cn10k-ddr-pmu
> +          - marvell,cn20k-ddr-pmu
>  
>    reg:
>      maxItems: 1
> @@ -35,3 +41,13 @@ examples:
>              reg = <0x87e1 0xc0000000 0x0 0x10000>;
>          };
>      };
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pmu@c20000000000 {
> +            compatible = "marvell,cn20k-ddr-pmu";
> +            reg = <0xc200 0x00000000 0x0 0x100000>;

No need for a new example.

Best regards,
Krzysztof


