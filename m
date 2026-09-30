Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589A7CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr3MnKORYjw0k60zOQ7zLIpbcvMSgn1uQ9GeSEwtzWw=; b=AwY8yxHazWn9unOH0FJU7Fjbvb
	gniC3xlg0oNpKJaYNru5IE7gc/4S/XltZUM8kXvxCmLybrEGHxyZL+IIYfJEszXTcv+qge3BFBGrR
	ai+SQhHj0tUBMrpIHAVTXyGcuJ/lEek6IFVe4B1zTWJfcP7+ZQMc1wgzJpZZPVxj4r7scYGGMFQrG
	vDS22DdTGXbbKEna220AROIyQdz+rN07T6PkLUy3cZ8eIFfXWJ78dh0DtOMkKZ3jQE8Zcc6z3VXXd
	wuUL0SgqhUl+c84ObgS2WMFRfuy/0oxJ3WBLMO4RwasHtY/CzEeWWstplL2qY5Wftba0buTVjKRHN
	QeBGpG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrCO-00000005fUN-0W9g;
	Wed, 30 Sep 2026 10:06:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrCD-00000005fM5-2h0X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:05:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11CDB43D21;
	Wed, 30 Sep 2026 10:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3F91F00899;
	Wed, 30 Sep 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762752;
	bh=Wr3MnKORYjw0k60zOQ7zLIpbcvMSgn1uQ9GeSEwtzWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O5z20A5wSlEu+8/1fQdXDXKdPHRJKjo9ebIR6wIsBiREict0d69W/zZ6/ecIgH022
	 ZoqdIuSFfVDb3Bf/0HXE0ZZreAo0lQ5YNtGn2iaBCmStKz5pkUM9OfhTWgZHuChfBQ
	 RSdQdq475q3KSVFrk2ebrHOYXgjgmMUSp5A5jCgrBTexrZ4XRVKeaxFMgTS+1HwHHH
	 1BxNQl6uRqOucuF4Uo/Sjm8WDQCjIB2nJibjZsxeHHJMXm/SMB9EHYD5yxY3f2hzZ8
	 /H1MsL0Fn0yRIzGq+5oriX5NGkXSfM21FPj5W0DIgEp+zsgvJNXZr7h2C4b4svu1og
	 5G8Tneolekd4g==
Date: Wed, 30 Sep 2026 12:05:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: apple,pinctrl: Add t8140
 compatible
Message-ID: <20260930-warping-vivacious-dragonfly-fddfbc@quoll>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
 <20260926-apple-pinctrl-t8140-v2-1-620bd11cd2a1@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-1-620bd11cd2a1@cyberchaos.dev>
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

On Sat, Sep 26, 2026 at 04:51:45PM +0200, Yureka Lilian wrote:
> The pinctrl_ap GPIO controller on the MacBook Neo crashes upon reading
> REG_GPIOx for certain pins. These pins, which are also listed in Apple's
> device tree, are described by the gpio-reserved-ranges property.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


