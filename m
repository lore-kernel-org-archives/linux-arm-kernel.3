Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAF6C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5nUPqOgBUcCps4UUa85WPqHhpCKC3YB8Bzpg7kK8Q4=; b=r9V9UqyEWZm+Xfkz6yGEo0eoHn
	PHLx+xSJ5qVFYPwGLETsFVcNZ4irhypzJp5G5SEaBKIdtgVUVXag5UZ3fuKmh6JxrQABfyfS885EH
	vBL/GifRxV136st/3fF152mu70F8Gg/15YQZ4ah+YPP5wQTfbNQC1Ei9IuuoFwNbvrmEAKHpc/Pp7
	7zVyQsv2u5k4gMaD+eaLHNQbFefsIlk8FTZTn4M2yQ+DIBbimMiUeFL38V32XjcmJy+c6jNt4rNkY
	E8/Z6nvwZBnQmi7Ox+UXXX/19Jw5MVHXz9UAusUSHutE9ksygCX5HFKObs0Rio3QplieHriJX0rL/
	t59PkzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKGV-00000009c7s-0WNx;
	Thu, 30 Jul 2026 06:29:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKGT-00000009c7X-1qAk;
	Thu, 30 Jul 2026 06:29:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9AE540B30;
	Thu, 30 Jul 2026 06:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA01F00A3D;
	Thu, 30 Jul 2026 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785392948;
	bh=e5nUPqOgBUcCps4UUa85WPqHhpCKC3YB8Bzpg7kK8Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=geLT90Tv+Y24wq1uH6GOtIrTXp+SnxrMMStS7FBAJzrKAf3j0BaJUxVX2s97hRgK8
	 lhkgwMpPXhtHBu2iDSJ2QX8OMEDiMuX8tEgddscmKaXa8ZQ7L9nv+2Xk6PjUMjKHAa
	 Mx8g8D8siScKIicdab4rJL/qbzmtjPLpLiLX93ZKXHX6oe6hSmDgn6luotXTmTczHA
	 nl/e9fRnmG/t5KGt4j/gHQ7Hzqdmw2S9rkEsUcuJfXhMuMW4h0AqALe1PQBSqzBIp8
	 4nAQ1eBDzVlbadOfua1kskcV8oLSif5xuX3vnWOOCjMiHNYtlLFI+tQzbF8EqVqlFU
	 X8Qw1sqq7MsRw==
Date: Thu, 30 Jul 2026 08:29:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: amlogic: document Orbbec Zora
 P1 board compatible
Message-ID: <20260730-gainful-helpful-kiwi-90beaa@quoll>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
 <20260729175134.92909-3-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729175134.92909-3-robazzalberto@gmail.com>
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

On Wed, Jul 29, 2026 at 07:51:33PM +0200, Alberto Robazza wrote:
> Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
> which is based on the Amlogic A311D (Meson G12B) SoC
> 
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


