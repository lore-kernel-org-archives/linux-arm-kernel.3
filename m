Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2176EC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3h3cJ0qP3L7iOzOK2iiDLYlkqhKo7VzA9qO5zpqwG4=; b=vBdENssmMMxfWT5eWP2Oi9QU4i
	yrV1yTq3uLLhigxnIZ/8wzo572jqMMLQPrYv1cKDlcbMX+rpAjjECON/kKJU8+Xa8RpDjNs/TwoGR
	sTbnUJmq+e4hZ03sKkZ5qJyfIh5ltIEEN6RUA4+rb37AduRGx0n4+/7wg4dR3JfyKS4sruO2oIC1F
	aqfvl8v3D/BcsWENGE+oG9OmYjNVKRZKoiKOWLG5CAM0r+GFV2Nm1y3EKBvwiY6dCQb/GSL2fKGu+
	GC3HXRRP6LODq9J1BIcHQHGrVQnJR7PsZBYA0esqByqIJoLaHi0fq2Y91DvKU1GzCED3h+S22i9Xb
	jFa86XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthNA-0000000DYut-1lxG;
	Tue, 11 Aug 2026 07:58:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthN8-0000000DYuW-4AZo;
	Tue, 11 Aug 2026 07:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F9A641186;
	Tue, 11 Aug 2026 07:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F171F000E9;
	Tue, 11 Aug 2026 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786435086;
	bh=t3h3cJ0qP3L7iOzOK2iiDLYlkqhKo7VzA9qO5zpqwG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ot72oGLGy5tCfNQQtynMP840Swd1Kypxm8BrBtYOqAg0BJ1HPogZR+ytLCLhZKlZ5
	 quTz9O5O0hpOfTCbDt/B452ltgkL/+IRfP+TDmETWZ68J3lO25DZ7SxPwcgUP+sLTV
	 19D0bVOR/FZcuvAMUNKmQj0Fl08cXFQs/VqGAcgkj6/96JNoY+wstpp/W0gKeizO9T
	 nc1pmuOIhPUvMq+EbcOosLrPFx/uU1zy9jSC9CPW0VDRS7m+EvGML6+LG+mxtGeW1x
	 eJou6h+a+wwZG64JPpRcEbmRrOJjBWTTcJVtoTHcA7Vkxij2d7IZkzfbkyQg2PbJyP
	 qzr1li1MH1wgA==
Date: Tue, 11 Aug 2026 09:58:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <20260811-celestial-discerning-scallop-beeba3@quoll>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
 <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
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

On Mon, Aug 10, 2026 at 01:46:34PM +0200, Gregor Herburger wrote:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b" through its include.
> 
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
> 
> Add a compatibles string "raspberrypi,5-model-b-d0" together with a
> "bcm2712-d0" string to allow us to distinguish between those two
> steppings.
> 
> Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


