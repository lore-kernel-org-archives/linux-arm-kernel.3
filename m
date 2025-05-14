Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BDC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3QT4BphJvQW+6QEX8hy6zBGAnegnS8iTWfqQnfzwBQ=; b=QXfr9Ww90z5aCtd1qTrSdww1/x
	955e5d4N+YIpYyBKgJe0/UUS8DTJNL1oMik70Ysjgt1dJ3PbD0XGR1mRZIYX60q130O8eHYA4tyAM
	om/sXnnOfq+4z2BJ16r1WKdUHM5Ew/FKFvYW4aZ6HbdqnFym+elgw3gInKtIzFBiRDPVQikg+5pBi
	8P59z7vd5iXS97Z5rEBFFHU1KUIR1NaLc5Nk18iVmSKMyuP2x+0CBBtHXjjml1l429ClBPmL/Ehgi
	Ga+Y40S7lqBq1u1JSthlpGC2eIF68hcjh2t+4JaYytcbeBNJu0v7IfrBWdmDxdnoIK9/gzQeLUW4B
	NiYwCaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBp-0000000FuNq-2JvA;
	Wed, 14 May 2025 17:46:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEji-0000000FhxQ-03DM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B617A44E60;
	Wed, 14 May 2025 16:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD5BC4CEED;
	Wed, 14 May 2025 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239217;
	bh=Phg8+ypjVqBp7Sk/MuFz+VsF0MAkDYbthSArEEDQB9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDCZOFY9FgzewU3rnwJkCExFndVN4XW5nLv1ALwzbNn1W4kuDa9XhScwfub6JkOF/
	 qRiv9t3uRmy3NmCFP3CmfnJlk8CTfF6lB1/diZOWwKn/gkOI2GJ9oWnOKmp6aN6IXE
	 MGc14EsV9wBQ4S7sET8xEInr10adLCyHIEjWopQILKNmwn8IEp/lYbpZt4rrbyxoed
	 8Uoh21ZJjgkWnIJg3l56jwEsScTp4aBuOPlusisiBya6nHman7K4PDJApJO8mpj252
	 HmEDOeoqfSq5lvrQpcNulBaCAUvIh/5yO9Q5e4i8MsoHzdt+1tsLw8RBlf4QTLRCvO
	 TWrNSLy3u3aRw==
Date: Wed, 14 May 2025 11:13:35 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: tegra-hsp: Bump number of
 shared interrupts
Message-ID: <20250514161335.GA2456913-robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-3-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_091338_079205_5787C7D2 
X-CRM114-Status: GOOD (  14.80  )
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

On Tue, May 06, 2025 at 03:31:09PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> It turns out that some instances of the HSP block on Tegra264 can have
> up to 16 shared interrupts, so bump the maximum number of allowed
> interrupts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> index 2d14fc948999..df6784a7c96a 100644
> --- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> @@ -76,7 +76,7 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 9
> +    maxItems: 17
>  
>    interrupt-names:
>      oneOf:
> @@ -84,6 +84,25 @@ properties:
>        - items:
>            - const: doorbell
>  
> +      - items:
> +          - const: doorbell
> +          - pattern: "^shared[1]?[0-9]$"

shared1?[0-9] works

Though really it should be: "^shared([0-9]|1[0-5])$"

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +
>        - items:
>            - const: doorbell
>            - pattern: "^shared[0-7]$"
> -- 
> 2.49.0
> 

