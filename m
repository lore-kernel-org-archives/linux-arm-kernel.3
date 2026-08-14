Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766CFC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hdl9rrAdXNWCw5d2q0AKYUQBWJKl/0rkGZZe7p4rSzQ=; b=ErXpQsXTogjVb14lee/i6wj+sH
	rbVVRGeYhbV4i7P1SmL/+dJ9UrQakRjsQxN4GwSdYnrL1vjy1jwopUDX7QHdvIFIMvkxzwSiVJzhV
	6/mAYFie/JgjI2GnH995nZjFnVUi95EjiRN5R0aMLNI3YfNNtY4QOCfpf1JO6tWFbirl21SR2abOz
	U+y7dmW1Hx+nkJBB39K69RabBYK1ka6uaT7U6k6dIXAWT43OQZZl4lOqc+qSZq967H2cAklfTvkN+
	H6nqXi9TSsC3Qzgdyjdxv4xfUw27q2pZyXxPhJ+mzsG7cBUU1NS2xf6CpWohlpWV1jJdbsmJXJEKY
	EEQdWL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumIS-000000028xK-13WE;
	Fri, 14 Aug 2026 07:25:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumIR-000000028x8-0VUz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:25:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9F5F43BF8;
	Fri, 14 Aug 2026 07:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A561F000E9;
	Fri, 14 Aug 2026 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692342;
	bh=Hdl9rrAdXNWCw5d2q0AKYUQBWJKl/0rkGZZe7p4rSzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhwsSZJxnx9ISsXprAZbl28KzDibDsmlOm/c0FD19Ul7XyJwEvcxiVg66nsJkXkgP
	 dt1yleTWqE4S0AFtkCAM5ZCGMfDrGbMgOAsP9GegEB5BDmLwlhlZde301oztBkcdwg
	 lz5Bj84YX72rXnmqWrV2fl4XEnbZZuwPWtGmcAH9coJ0nnL/ejI91SwxRe1gl1bfgV
	 sTTZepONsp91rNQVJ0cJmF400Z+PlMSsQDYZ3nrr1/XEMPVkUxjeDC1bvCEuIJKUwx
	 e0KWBrCb+aDS+Q07IpwUeVsZ6/PrPYXq2INRHHqBaJt5wI7z7wPh6mriAg9isPurNu
	 kjb5XL1gx0RUQ==
Date: Fri, 14 Aug 2026 09:25:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and
 VF61 on Iris
Message-ID: <20260814-slick-brilliant-termite-72c754@quoll>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
 <20260813161101.2274327-4-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813161101.2274327-4-mehmet.fide@gmail.com>
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

On Thu, Aug 13, 2026 at 06:11:00PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The Iris is a small off-the-shelf carrier board for the Colibri
> family. Extend the evaluation board entries with the compatibles for
> a Colibri VF50 or VF61 sitting on it.
> 
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


