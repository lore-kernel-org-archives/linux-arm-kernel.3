Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F89C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 00:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwf30iuTuv5VLbNpYFck9XFeHn/Dpbwh6FqWUkooBEQ=; b=S7g/fl2qHprif3R7NQUhYV2aTP
	eCy2qTXedwLMWuBn1cmXUL+EO6U6fyOFlYdjBK4z2bVFdPP1/rXZql/90IFFtppx8gBBmNSn83OTH
	SJYpT09MeT0fwiY6QL/2UhVPWuQ5NXBIt9COEM2ZmIprhcwRzbA+vzKd4yz0zrf2/oAXi56mfyErs
	++PTXGtoAOTOVGs8yE2xUgcKQqxU37LxBGzbrgXbgZB2AMwAobyxgx6OzBYeXWNnkEsDQmGSPEYrc
	1S47no/T+3qYwaZe2sDgQNRYR9G5cLa/cAlZ+J5lFZvEcE/DiXtU4BeZafrR05nBqUMgvwHEUrwqS
	ojS9FaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Rmj-00000000ctS-3Kn4;
	Mon, 21 Sep 2026 00:21:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Rmi-00000000ctJ-2voA;
	Mon, 21 Sep 2026 00:21:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2998601F0;
	Mon, 21 Sep 2026 00:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930A61F000FF;
	Mon, 21 Sep 2026 00:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789950087;
	bh=nwf30iuTuv5VLbNpYFck9XFeHn/Dpbwh6FqWUkooBEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C8gbed0tVCs/tkqu9+wuToN+7202xAx+QM2NyRJy4p+ixQ7rb65LcnrkJi3eCvtwp
	 sU++JbEMgY4pKUqYUt33Bwk/KQMRiLVL+FKpF/bfqM1Hnrslio7QbqfBmrcUIGRuFm
	 ozbjwLTMQA3xE6HKonFzaunnRJEuVJJLvBm5mU04oI49QArf8NgtehLTK33xA/Pu/R
	 6kLvfQo/KlZz2knNZaArriNJFb5ypf8RjDyvUe9CUFr3euljeV6QOTnyJBY7NWosqH
	 ZJV5z5dRTlJIBWdnfpqhkQiVDWt5ZCU0I3vo7fYq+ou1fvOo5scEE1wVqLnRmUSMEJ
	 XSQmLvSnBLejQ==
Date: Mon, 21 Sep 2026 01:21:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Zhiyong Tao
 <zhiyong.tao@mediatek.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iio: adc: mediatek,mt2701-auxadc: add
 mt6572
Message-ID: <20260921012121.048cef83@jic23-hlaptop>
In-Reply-To: <20260918-boisterous-slim-dolphin-03d5ea@quoll>
References: <20260916-6572-dt-auxadc-v1-1-e8190d614c33@protonmail.com>
	<20260918-boisterous-slim-dolphin-03d5ea@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 18 Sep 2026 11:50:20 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, Sep 16, 2026 at 02:42:35PM +0300, Roman Vivchar wrote:
> > Add a compatible string for the mt6572 AUXADC, that is compatible with
> > mt8173 IP.
> > 
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml | 1 +
> >  1 file changed, 1 insertion(+)  
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Applied.

Thanks

Jonathan

> 
> Best regards,
> Krzysztof
> 


