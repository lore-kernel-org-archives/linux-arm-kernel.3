Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714DD44D55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRLusN6rgDqB2bfvpgOy4+ToaGWw07Y+deIwDLRLoI0=; b=Wz7a59u6sFcUL4xonynOp2iEsV
	BbVruyCjTDZHOy893Zr/xz8uwFSRbswbJI2BBO3ZjFpaY/9UkWR1MHpZflOVjZBiOP7qnRXZPreWZ
	3KivFIueiI4sNcxFsdGPdp9UbbeAP0QyUkXMz/URLc8SNWCkvpNlk1pw11tkjYDqGHveND4qhuzpT
	PWECrLZxS5sd8uS9SoqsbT43MpqSm7d0oRHFTJM00L7HFFL2R3V/WqkSdSBSHqNwewjnkAnRv1OuK
	zPK8gW1QiecFYNmeGr7CC5ENmgqoLEp0YbQ0DTiNI5Q53/gaFKh2pgMAvy2rmPZFBsW1eQ39m0+OL
	E/XxZLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eaG-000000030Xx-1fZl;
	Wed, 06 Nov 2024 11:52:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dmP-00000002rCK-3gYv;
	Wed, 06 Nov 2024 11:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8126B5C5861;
	Wed,  6 Nov 2024 11:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B958C4CECD;
	Wed,  6 Nov 2024 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730890852;
	bh=ZC3QCMHYErbSGzgV1QmL7jUEKIIt60BFfDB2EWuwths=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUuSuoZMX5ra6tDJFX+mApy0pqlZxrP3Zzekuvj8cLxvq44zpJ8HVyneLV8nb9tcd
	 599f0HCcAK8+DQ8syHeX/ve13OcssEiszKpKnBzpfXq4om3rA8ZFxaOusDddsp61UB
	 QRpc1TMz3GH2ym4bs/eOorsMwF2o8qW7fG6Lzef5oL34qvLPcwCTlIgKmE9B5JgynG
	 LcEqyHWuomlShygX59Xu4OdjMQMh6mN+P+i82ojlKSJ13mi+IbRiO4x/9EmUB+JnDX
	 7tFVz1Lt1ZPNtm74MTOegeKD94UN/Qm3yeOtFHlSm6GgK7RPnTHQU+KvpiC91X4QL8
	 OWfnY94Tq8t5g==
Date: Wed, 6 Nov 2024 11:00:46 +0000
From: Lee Jones <lee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
Message-ID: <20241106110046.GR1807686@google.com>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org>
 <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyssJpR7xwbMzUsm@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_030053_991345_6CEA5443 
X-CRM114-Status: GOOD (  12.52  )
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

On Wed, 06 Nov 2024, Lorenzo Bianconi wrote:

> On Nov 06, Lee Jones wrote:
> > On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > > Add support for Airoha EN7581 GPIO System Controller which provide a
> > > register map for controlling the GPIO, pinctrl and PWM of the SoC via
> > > dedicated pinctrl and pwm child nodes.
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
> >       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
> > 
> > --
> > Lee Jones [李琼斯]
> > 
> 
> Hi Lee,
> 
> according to my understanding this patch has been already applied by Linus
> here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=devel&id=50dedb1eb1e6755ccab55f6140916c2d192be765

An interesting choice.  Linus?

-- 
Lee Jones [李琼斯]

