Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKsbeaL/EYCCjslIHscKdnfqt9TnC3LQo/o4fxsqdJg=; b=jQKIY4s2wWWV+fP0XefG1B1cQI
	ZtWVv8956R9fe+ANTDcCJrhZ1rqCbicwHWYFZ5ftwvNrLdbQxBJ+0c/sRr1OCZh/nRhjqqMeK88zs
	yuD98TVRFuWdqBdFFAI1e3x4BSind+5mMZxDKN+t7JvBSCSHMKvqHHdCKWoX8htGOAFLgQKjT1Wuk
	qxfeN5FWghI1QNEiZYhRpGQwWpr2YJMDfs1VwAWPsKQbib3a9Z9TsoLWYTFJcblOULsABRUzBFaVz
	fdJun1KgCwcuZoarepPWK9wXv/biSUkscl7c2glGytARsoAfUQQRy16ZLN9QCVXFS+azVbJK7KI2d
	BnIHZhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNkj-0000000GdCt-0cYL;
	Wed, 08 Jul 2026 08:35:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNkh-0000000GdCX-0OV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:35:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE07D4182E;
	Wed,  8 Jul 2026 08:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42561F000E9;
	Wed,  8 Jul 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499730;
	bh=OKsbeaL/EYCCjslIHscKdnfqt9TnC3LQo/o4fxsqdJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SwYQ5wlGAgqRjGWeZC+QJ2+/Lf4qkCA9L/NkByYOA6tyKvNukd/wH4AblpspyMfa6
	 ohztbXxM5V7q1DJid4+qC00xO6YK91jiFwvru0NG7+owxsPXFlZmTKVLWoFtyoF4Zg
	 6CfORrAihXEK6Sd7LW+TOwg2XyXc1h9NpUedmnXP/s/0AIKl+VNWphsts/mz6EGpf/
	 RIhZnn0pYAPqg3HrVwtETrjMeDkjY6ju+/kPYMQ4XKmzjnjUX7uvLKD8Jk1oPQ3IEa
	 jcfraojWbW8yc8K5bEFnrq/KOpSaIp/A3jZXvgul/W57DyWfK6JjOppgkLKwGztv7C
	 1/4ijKu+4HqXA==
Date: Wed, 8 Jul 2026 10:35:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8132 compatible
Message-ID: <20260708-hospitable-impressive-ibis-3db61a@quoll>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-2-e5655ee56523@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-2-e5655ee56523@cyberchaos.dev>
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

On Sun, Jul 05, 2026 at 03:17:21PM +0200, Yureka Lilian wrote:
> The Apple t8132 (M4) SoC uses an AIC3 as interrupt controller, same as
> the M3 predecessor.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


