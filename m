Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719B8C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLuk2iJcxA3riTTDQBpgkGpSWa/TkrAiphpb7ujl2Rw=; b=YoWf3m5UxyCjUt+Rf2qnLp2mov
	XYIJHtICYn+OfHLeTUzieDAKR8WeSEBI6/n/TnHL9WqLFBfV0+vk+Z9ChkCrTTVg+EY+X78v51WLe
	qBFKWltXAF9VWjLLO4cIQr/fn4mTeCBfaXtd22pTixG3EqhZP8YEKQTCPLIX/R370DugfKVF2Kdqr
	ZXbrOmax6HNVvWy7P4xfYFmRCNumCj4/K9bZNACyr9BUmVpU2rnUzYtoHBvK84C7FSuE1y2IXM9nt
	NpP24eh2s96Q8BL82dJrxoEqABqKYJdbS2QaeynIPYKpyhgudtxckERjyoqX5k9XscA/PbIkORNmA
	dCEWnhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBOS-0000000FpVC-0UDw;
	Fri, 24 Jul 2026 08:36:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBOQ-0000000FpV6-2MCc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AA7043A52;
	Fri, 24 Jul 2026 08:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30301F00A3A;
	Fri, 24 Jul 2026 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882190;
	bh=KLuk2iJcxA3riTTDQBpgkGpSWa/TkrAiphpb7ujl2Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DZ5YylzFuI34TQWBrqG9S/l6buNmHuiwq92q3vNhtTVrgzY5F9k1b5KBjBz6HEFyu
	 aqXaip6JUTHGd3pOptfZ7qO1zJN+3QhPRKgWwS0JLJmm+C2pPq7itbEqrndduwRV06
	 i+n0yfdQI1gRz32qXCzprJ+5ALoxu/fbBxg8SDJLFNcLyielM2j/x7xS1AagB0gCdh
	 CgO+tkUcbse0EkFOs1jIF5TVO2ySoggHC4wgYPcVEFJ6TMy2dftX+L1u1vo9EfYqtw
	 bIj+IPccYRz3oKcsgIiV4r9Eu22RdqFCqjsQ7cDV+cOXFd1N386xVzKyil3sRRNqB3
	 QkPAyZ6CCtjAQ==
Date: Fri, 24 Jul 2026 10:36:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pwm: add Axiado AX3000 PWM driver
Message-ID: <20260724-comical-chubby-dragon-9c73ff@quoll>
References: <20260723-axiado-ax3000-pwm-v2-0-22002f0b281d@axiado.com>
 <20260723-axiado-ax3000-pwm-v2-2-22002f0b281d@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-axiado-ax3000-pwm-v2-2-22002f0b281d@axiado.com>
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

On Thu, Jul 23, 2026 at 02:32:19AM -0700, Petar Stepanovic wrote:
> +	chip->ops = &axiado_pwm_ops;
> +	chip->atomic = true;
> +
> +	ret = devm_pwmchip_add(dev, chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id axiado_pwm_match[] = {
> +	{ .compatible = "axiado,ax3000-pwm" },
> +	{ .compatible = "axiado,ax3005-pwm" },

This suggests deviecs are fully compatible, so drop the second entry and
express compatibility (see writing bindings, example schema, DTS101
talk/slides).

Best regards,
Krzysztof


