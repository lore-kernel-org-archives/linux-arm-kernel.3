Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E9C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuwBCNbQhQoeK47sIaZgyMbGKs971fOOek/O6mzWfJ0=; b=iQvzz+FqTCK8Gl2w3rgwIOdVYL
	P+5linN+xxRh5JCEOuqyTwTJqI80RTb/RnXDLBK/9q+fgm+CB9wTLsh7q+HcHFpFkfjSxoAnV3zOk
	vT//499/HI1rhBUprONi6fYO5i9szpHjudq+UpcishDLWT/9nEg71C5wltJTL3fuWhGvKYbj8zjss
	yc1cpcssaf3Gy7wRZPIKQAMG6AD8lULFolyJRxbBG7ggzE7cf/h1okq3EbqxpEHMOWqfLF0DYanMS
	H2v7Fm/P+FcyesXTlXAegaYa209pYumeMIexh30jB2/d0r/G5GXmMbPOUfuRNhHmW/yy9i9Cpo8GS
	fPIS6tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBbT-0000000Fsil-4B9S;
	Fri, 24 Jul 2026 08:49:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBbS-0000000Fsid-3sv3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:49:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F48E40614;
	Fri, 24 Jul 2026 08:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592BE1F000E9;
	Fri, 24 Jul 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882998;
	bh=TuwBCNbQhQoeK47sIaZgyMbGKs971fOOek/O6mzWfJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8wQxjKWLLDbmpZFzcV6hY311fIyeDPqtjucw8RCKFX1d6a6vZUIOdsX7PrdN4UXi
	 I/PD+rYjTjanjMLjuoPsNMMtJ0Fnxbu6qOxN3Uj2ha6c0tm2rTLpChzjMbHZ6WMqM1
	 6LyGkCNMuV1wm6i6v1nITXYWlfv5xD6qAbi0oPzZxXjTrqC8Cx9FcPd+dBQc3Ht8ev
	 2C6n4RqXj19TF+61WQTTwy4Wv8VCpIAy8jgLJHqCdnf8mUHddxtfRN6TyVlrKbkwrJ
	 zEqeTIOWYIP1bQiR9ud5+sRvgr8OJ7UEfioUuj4OdOszbZ1jrO6csixlvgr9rNcMdw
	 YnHBP9P6VEz9Q==
Date: Fri, 24 Jul 2026 10:49:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Message-ID: <20260724-spiritual-qualified-crayfish-b65efd@quoll>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>
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

On Thu, Jul 23, 2026 at 04:29:46PM +0100, Alexey Klimov wrote:
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
> 
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


