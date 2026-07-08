Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA19AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq8lNJL29C5GdLYz//CXSgXQ+vc7ZGanEWtw6vg0Ep4=; b=1qHPi4KyHo87GeRsnN6I4VClw0
	hZ/VaV6TcU8RnQmsc18/uEK+DJbdaf2bqH7ze1qxm+OZ/5BcFagKd380ubBB3DT7vMMbZiiMSG4TL
	04DWnMkRg0Nr+F3lQSPkztR86vk9ToOgbiyugmzPp0cAgnITzOFLydW6PzRSTix1KmNz9wE36MkG5
	9PgG/g/xomlZ8U5X7a3CFAhK/hpfYxWtGTkRKkNxKGlBFgpsvayzO/EAFu8dVn+OzrcbSuV6l7/Ei
	ijqrN2+PfemLU0mGlERzpbXy2q5t4IUFhroi86WIrkiRI+orWHrn4vGlSVv2kZQU8Xl7HQo8mAyHN
	k4zK61JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNnU-0000000Ge0y-3y7W;
	Wed, 08 Jul 2026 08:38:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNnT-0000000Ge0Z-3xuy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:38:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DD1360008;
	Wed,  8 Jul 2026 08:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E21F000E9;
	Wed,  8 Jul 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499902;
	bh=Cq8lNJL29C5GdLYz//CXSgXQ+vc7ZGanEWtw6vg0Ep4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KBSpgNuoOJMPkcRZuN8/ioT/PjByYiKAC0lmwLnBbpx536Szv1wEKbdkGByNM+xqM
	 sDBH2eughwXOd6Puvl5nH8IvLWo2FmLR/yaTybIQHJhviynLQg7+5WTPa2YEwkkWLt
	 fc0oXk1fpbY1SwTcXgTAeQvKYsxBNkOsHz8RxOt6jZOXgmWn6h1+apOSz1tMF2KnKu
	 eXux2RhL1acYS+Keak/Pai/IoDCWklCrdQsstFARS1vLTKL3wyFrrhEgNt3Hyx2s2x
	 RNAAsU1F6gHBw+KCcO93naTT4d9uYWm8ojfNvs9Wq6C/egtLTwtfZXhE571xcsUWNN
	 HHTxv/pPiGHfg==
Date: Wed, 8 Jul 2026 10:38:18 +0200
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
Subject: Re: [PATCH 05/10] dt-bindings: power: apple,pmgr-pwrstate: Add t8132
 compatible
Message-ID: <20260708-auburn-raven-of-ecstasy-2ef404@quoll>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-5-e5655ee56523@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-5-e5655ee56523@cyberchaos.dev>
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

On Sun, Jul 05, 2026 at 03:17:24PM +0200, Yureka Lilian wrote:
> The device power state management of the PMGR blocks on Apple's t8132
> SoC (M4) is compatible with the existing driver.

"... with t8103."

Drop driver references.

> Add "apple,t8132-pmgr-pwrstate" as SoC specific compatible under the
> existing "apple,t8103-pmgr-pwrstate" used by the driver.

And drop this. Driver references are discouraged, unless you actually do
something relevanto implemented ABI.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


