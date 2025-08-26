Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D3BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCWXLw8pvfS3Xa5Pt2zxUceDinzYZ/GlbPCKLUQ/QBA=; b=Fhe7qTzmlLKSNBohdvhtKRb++x
	6Jht+GREsS19otVEmk4Vq8mHQqmjVf2eb7PLxEqLr7TflR64o8GBwlsfbhTCeMYGKkySk7USZZvAF
	Ff5i7QdS/kb1G3CmMFq8N3pjaPKuawUO5RyMUVSzwfvlmCDlB4m2/nE3lAs9gzvtRD7STE/rfv/rZ
	kU13XbmNe4SMoYJRXDEjZyiFtVAiXDsx4bowvJDlbxvYaNivMs/aMRAx2lKN2T/heCfuhLZnZHHyW
	aLx+dBypplLTCaYX1peQcWPSemCHSwqQffTR5Msx3ggLOkjGU/IfymCAMAFWixbnXK7tYK86DA9W9
	xDn1f8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur2aa-0000000DIZC-3Hj0;
	Tue, 26 Aug 2025 22:56:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur2Xu-0000000DIOd-1zLb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 22:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E41AE60228;
	Tue, 26 Aug 2025 22:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB2DC4CEF1;
	Tue, 26 Aug 2025 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756248821;
	bh=HFz4lWMhublzt2u+So74Nn/ex2HhHH9QGaDvdeT52C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzqEImEd/wn+wMr3RXHc4YnqD9MqtoakG5cFDI0b3cq7YAWYOcroywG9cJ5lMJhRU
	 y332TOx71EFetZf1Xr/4sbGaZMXzWTXn5FvMGNo5gX3VGEcO2/z95LVTGIMAPcTr78
	 pxXmD46WtOt5dmV44Tb7O4yr6DS/gHN/+3tefkBbE/asejRq6A23bWJXgVCNYX/2Fr
	 zfBuaxF5TvPSVgZbCXSUxPb3ulXvE6ssc65KmDhv6O/oRW3YJWsV9UipTsk4T5O/RZ
	 KL2Bgj9zA8PeBG/Bsggw+YlCAKjqh6ELavtp2mDGy3+77DEijThMTvX3npVKgKqjjx
	 Va0Yg6/lBmGhg==
Date: Tue, 26 Aug 2025 17:53:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
Message-ID: <175624882021.642528.5469480421650316999.robh@kernel.org>
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
 <20250823-apple-dt-sync-6-17-v2-4-6dc0daeb4786@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-4-6dc0daeb4786@jannau.net>
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


On Sat, 23 Aug 2025 11:49:47 +0200, Janne Grunau wrote:
> This adds the "apple,j415" (MacBook Air (15-inch, M2, 2023) to the
> apple,t8112 platform.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


