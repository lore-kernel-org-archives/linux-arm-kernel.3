Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A17C5B574
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BEw1pxh+ooctkiYN6XL+q+OlqLAHSMto5NNvhSXPr0=; b=R9qo5k1sLVWXtNDHLgcPONaGJU
	95ykEPopvThfEFsl4WJCY38Vpr7HTymbpPTjj2ALqw10ZGB5WOXZjcNDYqgJDmEheyRvGGf9WRQfR
	iE8bVhGjeGZjOoJIDtrbYmZ+r1BTWGAlRhw/q0iBDg33ufcwN0I5JN/NSpy+FkS1kwxbgjpQsvPSt
	+SKgBYr3X+UqtlIgq0rX9eW+sJYXxsNcg9H+kwqLD9bhE3zxjUrmqJeThluQJN8gG77ZfaPPrL5UT
	vBkuFj4TGEwrzqiW0YYSXB4NKMbQeFclUpeVszDoNkxgcs24pCk2pQakaUKR2zkmRZYDPS6mDBRGF
	ki7NJU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthMs-0000000DYrg-0qgK;
	Tue, 11 Aug 2026 07:57:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthMr-0000000DYrO-06r1;
	Tue, 11 Aug 2026 07:57:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4803E40BF7;
	Tue, 11 Aug 2026 07:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688B41F000E9;
	Tue, 11 Aug 2026 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786435068;
	bh=5BEw1pxh+ooctkiYN6XL+q+OlqLAHSMto5NNvhSXPr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3VfMLgGmebEk6gE2mRoDB1P9jLlYfGwb0/AeZwnyOJ3Gj3PHNVgqeokUPFeFQ/wm
	 G2789dv7taB0xSwpIdIQIntB6/cH075MdL+RRFqA4ywlai+UySYdYSDCVbxiorhQ7L
	 UgdaZ0G7hhngf31GulxESWTepoD2NnEsYtsIP0l8Idm98NoU95A/x0mrpMEqry8r2B
	 Gq7MDn8yK+62Y77CPdRIxibKiDXWwIwOJNcQ+OEalkB1yF37Tc9wTzD9ZthZjgyrCx
	 5zO7nUVRvRCIbLGOo89gnnTpfZPxcNA4rt1Ha5Tr887TNoBAikw5PaCOQ3up4EF4TQ
	 cXyrodo1AbIYg==
Date: Tue, 11 Aug 2026 09:57:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
Message-ID: <20260811-savvy-chital-of-zoology-55a48e@quoll>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
 <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
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

On Mon, Aug 10, 2026 at 01:46:33PM +0200, Gregor Herburger wrote:
> The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
> Stepping and in a c Stepping. The two steppings are not compatible.
> 
> Introduce a new SoC compatible string together with a new board
> compatible string.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


