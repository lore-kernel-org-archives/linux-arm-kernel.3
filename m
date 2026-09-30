Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9592CCA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHfIlpHAKIFPPGeTX2D09og3//FoLgPKp4mRy4VEQkU=; b=2rDoWqHmANp7/SpZLjJVzCd+bH
	vGpQ2ELWOMFDfyoYJZfXvx28V4RfEp2wCiDpZ/Bf0+houXLQXEYmLNM3kGTNUQYrx8/sRrYQVrsEx
	oONS6PT7B338Etm70+TcvE9VlVPCMNvpLe4uR8o0w+o/hYzSEOPF5e4LhnWRKxm8TzqkFfU3tnelM
	+dcb0Fi97nycdhRw6YEAxynSB2lXPbhNiQmQjf09URFJU4LuZCACr9dt2ANWmFQzJbA1concCs8nw
	eNcNaHCBYfPb6TD4VhUpbY1tneqjLIw+/fXOqfCvuFt3VxCYGMJ6T8EXQeAUIRKtbEV3oWSTNZVGD
	xzZyi+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrGq-00000005gT5-186O;
	Wed, 30 Sep 2026 10:10:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrGo-00000005gSu-3V1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:10:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57309408BF;
	Wed, 30 Sep 2026 10:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C2A1F000FF;
	Wed, 30 Sep 2026 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763038;
	bh=vHfIlpHAKIFPPGeTX2D09og3//FoLgPKp4mRy4VEQkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mgEkZ1SyRI8K37jdaZ0dnzHrhi0Z4YkrL7rpHe1/qvh5qnww2L/4cGvKrG3fIgaPh
	 sHq1rdElmDjtY478yz461FFYX9i8EQin91eBehPi4WpGiUML69OB1/Urk9ZNQ+C+4l
	 rYhzUqYgozRhik33xsAPMhTubLycjkvwgaHWzn6IrABHP0hCFH+iD2w7KFAMTOGjHE
	 dWmgwsTARIRVkFhBxoW3baqzV3oaM2oHOSEJMIo7yF8rv1vjAVpr1Qh+2K+s3U8acZ
	 fdfD05lIscrAE4aFgN7Plo3XddfeRgYneuncnujFREihuFURjvEEgz2fSSbIo+ReMP
	 nibLEDiMIalww==
Date: Wed, 30 Sep 2026 12:10:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Message-ID: <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-6-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151016.186493-6-pmazzini@gmail.com>
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

On Sun, Sep 27, 2026 at 04:10:10PM +0100, Pablo Mazzini wrote:
> The B288 RTC wires one alarm interrupt, not two.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 

Seems like valid and unaddressed comment from Sashiko, so dropping from
DT Patchwork.

Best regards,
Krzysztof


