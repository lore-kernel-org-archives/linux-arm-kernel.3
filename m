Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00F4C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGHkNmdIUJTnGY5kQs+2/koc4PF6LbOKExGntGGOUi0=; b=YvMdkkY3jmL4fZmRAZydhjJBLq
	zDasm8Dk61phVmRzeE5D4sfJejqLkMGoETkBj52FTGW495YJ9zS2OS0ATEBlyXcpVfyZS4ujXbxRz
	xq77QBN9/nYEHnmyYngi/0y4ksI2K+kIMhX3sZmALBslfgP1y2D88vnduScf0l7hyjLbXmrTPJc0/
	AwqPU/1t/gRdpcjopgxCcmt8Afo41GRl6ENNQswDV0wIEPc5yDtaFnyC4irggu2+ixpquYFeiO+iY
	b7vcfl5+h8GKvPY4S0EIsjFn/QCrnhD0IKEEkjWhkiOPLjTb41vForOmM7nSL3GsOPIoLqOlPLKGN
	2jtrqNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBNL-0000000FpOm-3DLQ;
	Fri, 24 Jul 2026 08:35:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBNK-0000000FpOf-0HlL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:35:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76E3F43A52;
	Fri, 24 Jul 2026 08:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFCA1F000E9;
	Fri, 24 Jul 2026 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882121;
	bh=EGHkNmdIUJTnGY5kQs+2/koc4PF6LbOKExGntGGOUi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QUzv0Qi7q6ToCuJBruaPjk22lXt1e/6GUM3Q3WX4MKykwITGIeH5N3kh6fwqB2F4g
	 tgm3IaUS0qH5ihRrIts7HGLiD6A1XCpmTeLhFHbV/b7q0T9iK4tAr8wJ589a2SVkuI
	 o1YJAfzFm8r/dJFmtxKRu1CeQG64gwc/5z417Ks+wUVtUDubIrOsB4CAqzjXajJCLv
	 zzXTTca2ghuC0HS54QM+u6j1qojeOiRrzQtT4fjjzihs45O6ptu0f3hlc0KOoQFZRF
	 6oed2e21WPd9qyko19AqZujoJVNWMZoJ6M2ffncch81lULF8zbClLTtlDS0/I8q1Ik
	 LKyn6efC3oyFw==
Date: Fri, 24 Jul 2026 10:35:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Message-ID: <20260724-fine-pretty-chipmunk-ffb3af@quoll>
References: <20260723-axiado-ax3000-pwm-v2-0-22002f0b281d@axiado.com>
 <20260723-axiado-ax3000-pwm-v2-1-22002f0b281d@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-axiado-ax3000-pwm-v2-1-22002f0b281d@axiado.com>
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

On Thu, Jul 23, 2026 at 02:32:18AM -0700, Petar Stepanovic wrote:
> The Axiado AX3000 and AX3005 SoCs include PWM controllers that can be
> used to generate configurable PWM output signals.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml | 51 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++++
>  2 files changed, 59 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


