Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D95C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Exa1hT4lyAMl6ElDEjoYoBI3w7ORVJ8MGtlHgXfsTh8=; b=z1asjztgjDUPPU45l2BGyt7KUi
	mehBBYu8uOoaPnd6FJzNKecMoKVWX0MX/xuUBFZlD/z47esPBwdjiVpTeLdY1JIBPMdAiZae5L/x9
	SDj4hz4ReWix/LbEVVlEeqw3NtfCMlq2u0/0GxoGKoNLeG1kQwikzd64eVlU/paYla2XzrOUSXb8u
	rnQhtphrfD9GuYtgMpPTkw3ml97b360QK9ID7B13utbkcrM2Gsrheu0AGW9eZGChimZ94bGFCXoEx
	yw7a0MYX86vc3fU9cJbehxfyQywu+kzdf+6bihyz16v0EywAqJVtWdE3Qlryrl+SsPXiT3RXif3cL
	f7yoWYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9GM-0000000FaiC-3YD1;
	Fri, 24 Jul 2026 06:20:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9GL-0000000Fahh-09HL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:20:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1263E600AA;
	Fri, 24 Jul 2026 06:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1F01F000E9;
	Fri, 24 Jul 2026 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784873999;
	bh=Exa1hT4lyAMl6ElDEjoYoBI3w7ORVJ8MGtlHgXfsTh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g0gN0J2lXQv02MW8OwaaXQwLi/uFxKjKnuqyfDUWq29a5aaHrCSiJbOpgjTMVHf1d
	 smacrWic7PP2sT6cxGTCX9Cno4b7k3asKQDRhV6C+00+KEDP4OA27iUXrJipsgl4VP
	 UZDOy7qR0DfdFRDsHy4mY0bYDcUQ4l+wV1+Jn5Fv0Afdca/Jkv/gHdZPvDaOGUcoEI
	 HAvyCBESBvDwX2l4VNlb6E7ZI3OsjgUPIl4/oDh3n3hxFjVu2F1WWjaAM0UJ38mH8M
	 sgYcZ6lOdPVdrOMa0QRM6ypM5HDd5kLI52FVIQONTtbrUsKElBKZ4pPGhm13rMIfoE
	 03wK//TrHEBBw==
Date: Fri, 24 Jul 2026 08:19:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add
 A523 compatible
Message-ID: <20260724-outrageous-leopard-of-diversity-fe365c@quoll>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
 <20260722233604.3001063-2-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722233604.3001063-2-utilityemal77@gmail.com>
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

On Wed, Jul 22, 2026 at 07:36:01PM -0400, Justin Suess wrote:
> The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> The reset defaults match the fixed behaviour of the older IP, so the
> device works fine when driven as an A31 CIR receiver.
> 
> Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.
> 
> While at it, merge the standalone compatible entries into a single
> enum.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---

Your changelog must mention that you dropped tag and explain WHY.



Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


