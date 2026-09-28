Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6BEC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAk6ig5RLZAUAqcboNXsyjMddluuJwtpXS3c+6S3p8g=; b=Z1BZ3spnXjyOKuwkbOGFXnHd6A
	0wUNe8XIa2WmA/S2dOrkjaWgIrW2RFqC1VZsi2EWkYZTmHJXI9sq3yZQRLFxGZ/+4vs/th4REorMM
	6fx/1H0QABLfA/BegpFUDUGyNkwvHx1VgTmUmQk9jI7IG7kRpCloAY0RaTcYZfxZ9nkNwm9SiwQPd
	XdOXLAFKhGGmFeq3EObK6dtACqeyEZpoxP3owXI53GG7wjK8vTII/P2UJ8hds5+ixgseuKO3VTpjp
	7LIefHNXf4YdmpGrNBxAi7Jpg2ISbo8y0DotQ59zakBO7BpCNKhhHYdDVKAiK6SVuNeE8itVWvZHa
	+5SOY/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB90U-00000000OO7-0HKs;
	Mon, 28 Sep 2026 10:54:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB90S-00000000ONo-2Wk0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:54:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B237960052;
	Mon, 28 Sep 2026 10:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2281F000FF;
	Mon, 28 Sep 2026 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790592887;
	bh=ZAk6ig5RLZAUAqcboNXsyjMddluuJwtpXS3c+6S3p8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxCVS+CjcyinQ0dQAmH/v7SKMAxFwqsky4vwkUD99gstV4sujX2B8rpOn89V3MmIn
	 2h0vMdL/tRkWX78WMDqZuUY8dOBgEaurJPSFddV4ZBTPSubTL0f32yyn1UrsC6Gwnz
	 9magB0KLojV3ThRpVE1SPViG5RAAZ3JbFCZa79zd8lByV1iPI4aqW1ntHHfKxCG2T/
	 nMitGupwKr2pFkWeMiW4rOloFRfUB56n17U5ugYbyghbBlygNCfM7HlCqvVWKXhKj8
	 7rOvi2+QWMOlnFxnT1V12Xy3ukXRMp62ZzAQvRpgAjeyZUAZ6ySwcFgoKOeTTqoMmj
	 1fHFSsV65d7Rw==
Date: Mon, 28 Sep 2026 12:54:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Message-ID: <20260928-nocturnal-robust-bird-a42797@quoll>
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-10-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923201701.43391-10-pmazzini@gmail.com>
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

On Wed, Sep 23, 2026 at 09:17:00PM +0100, Pablo Mazzini wrote:
> A 6" e-book reader built around the Allwinner B288.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


