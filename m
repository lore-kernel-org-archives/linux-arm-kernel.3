Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B50C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a88oaMPdFcI/yDDJp6S+ycZVQY3NXBbhhuZ7cepLWEA=; b=yE83/gnAsVsvveNhcKMmjNdcSJ
	GIHOx51580KBlVcriCMumbluTctyVJyZ7Lau/bWhRvdXRqvB0Z5wlYbBzR2julxIEsJPHQb7oWIwf
	IVf+IdLD7gTH7d9Dqr5b1UstXyACvjDksRjjY1sRsozEFmT3kMEHZVX0856qoS92AagFl0DS4UkC7
	G0Lg5Kkp3bVP38zaPOMOa6mWRA75BisvejgvbxL1E3KfM4iGzAGSWI0tGtx5bof2sLl/c57CzIrkO
	zLs3ljOg+rf7Xa+bK4nN5Fe0BF2jqeE+ZFwmV/gVujXBlnSVTghcNj3pVHRUUfcMElNLZysdPY3PP
	QHbPxdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26ik-0000000HJrg-1Ibj;
	Thu, 03 Sep 2026 12:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26ij-0000000HJrX-08Cm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:39:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5957841A00;
	Thu,  3 Sep 2026 12:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EEA1F000E9;
	Thu,  3 Sep 2026 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788439148;
	bh=a88oaMPdFcI/yDDJp6S+ycZVQY3NXBbhhuZ7cepLWEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gd0fP+FrBOuDWBABAR4QXGuGsaiDFdjsG7oo5klw7sjSz0ah3CcBVR0vQquw5oOnO
	 TLF6g1KF4tF3LAS/VvmO9H0zjWiepY1Ga/5ihZkMoxJrMkSsfRzK8omzEcRRX8jICo
	 ojR7HDtOcR8dVtM3sEXYaIWTXFJCP12/fTzoFfPiHNGYhSbESVlLL83ot0ax3MYXoA
	 /mSdVhXNpUTSTOgJjusohKDl1zTffFzoXzJ+u2AAPvx5B+OaQJ4MhCprUDy22o0TLw
	 Ne3tE0F2Ba7Iqc2TtlittI8MU+madugrNVIcv9+Ari7Wn9DaKhK7Fxnua6xz7kya0Q
	 yPEVTS7/es/uw==
Date: Thu, 3 Sep 2026 14:39:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leng Honglin <lenghonglin@axera-tech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Zhicheng <shizhicheng@axera-tech.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, hlleng233@gmail.com
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Axera
Message-ID: <20260903-impossible-normal-termite-b7f9b8@quoll>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
 <20260901-ax650-v1-v2-1-993bea305476@axera-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-ax650-v1-v2-1-993bea305476@axera-tech.com>
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

On Tue, Sep 01, 2026 at 05:19:28PM +0800, Leng Honglin wrote:
> Add the Axera Semiconductor vendor prefix for devicetree bindings.
> 
> For more information, visit the official Axera Semiconductor website:
> Chinese site: https://www.axera-tech.com/
> English site: https://www.axera-tech.com/en
> 
> Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7..1dbafe682724 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -219,6 +219,8 @@ patternProperties:
>      description: Shanghai Awinic Technology Co., Ltd.
>    "^axentia,.*":
>      description: Axentia Technologies AB
> +  "^axera,.*":

So how did you implement own comment?

Best regards,
Krzysztof


