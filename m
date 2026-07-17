Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7553AC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBHypJZk2uYdJaFmd+txdG5YONd9gTShXS4Tg+ehzk0=; b=gQschesWOh61YD1KuaanOzPaXN
	WDUAc60cZxgPCEO9uABxSohdPh5p2+sgXf13ruYVIowy749AwUatuD3W4dy1BLmvhTeEeo3KK9gPZ
	8MkQ6Q2Qamaq3nmvMeVpTchLkbiLHMLBAW9up9Vr5YMHh6ukk7pnftjzFg9gjuF3qW/6opCI+kn8l
	SZvuuPxRIbk0Szn79Jt2TQU/7U9Zrbx5b7i1tsXecetucvnr0TAWaNAruBGYQ6/r4mRgXNNV4s8vv
	K4vIsU9ITJaViU/wtIGjScWHNIDM/rc2b5P4ACeUdE1Zmgo2w3/zRlwQcVpzBG4Sza0SUprpDJLwG
	6PO2Y0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdyH-00000001dot-35N7;
	Fri, 17 Jul 2026 08:31:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdyG-00000001doI-3XqI;
	Fri, 17 Jul 2026 08:31:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE0CA60A69;
	Fri, 17 Jul 2026 08:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B271F000E9;
	Fri, 17 Jul 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277059;
	bh=XBHypJZk2uYdJaFmd+txdG5YONd9gTShXS4Tg+ehzk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hewpKFFSRbPg0iaYLiMXv58ynWaI/VpzCaiQZeIBWuWFJ82xgE73vugtEXW1/ZYKJ
	 jnFkj3v83EVPig6mG3FfIIb7DKIxuaW4Ft4MmoHLfmqFLoDYM5MAGG8AO/dY4I1YwZ
	 ZAbuXIGyAgk0Gxzj17TJtzKPhqvVhl85NEsicCfaDNCho5AD3eRUq3fOWxlgPdf6iZ
	 JOXQSKnGQxvuFOUEuk1w0eZmxx/6o7cMpSeVpC2W0Du9LVrB9tmQhm9d6TlKN8mZel
	 mYbMnIz+d76lmeYpFFEbLAzR5TKLlpnefleb+9stynneT+Sx1nf+ahztE9F5UA+VFj
	 tLGrMLwLg4RXA==
Date: Fri, 17 Jul 2026 10:30:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
Message-ID: <20260717-singing-nifty-guan-c73efe@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:09PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 GPIO controller. So far, no changes
> are known, so it can fall back to the cdns,gpio-r1p02 compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


