Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626FECA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td3g3mrxc06WlDh86pjy3W/s60pLo2ohFiXwCP79lTw=; b=H9dKjRM6k/CUOnaxJTI0kjW+Cd
	vDWeCV2U490Tj4s5CoLiiiRJmhD25m2UZsHQ8nucU0FyJu38kE9TW+OiBkc1uGIasgarY/S/qIE6P
	m00hS053ef/5xpAvAlo6N4iejLOSK5tN+WedM+NpsrLOqxbogkTpTfaWA1L0MdcvhJ5s9SKhs5evD
	Zn4iUIzrtGANZUmphCtm42/6+xVijT8+xhU+xw8CvdqcTY9MBOdlkEcGWIPV0ph0IJmo9W48Ij1Q+
	NvuEHx3LFEHLbQzDSfHJ4qsksGH8LD24vpuYkdi7liEJiY52iZoE8iETDyFKQSjU71TwzjdJR1YMy
	L7oMKfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrAS-00000005eMW-0cgN;
	Wed, 30 Sep 2026 10:04:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrAE-00000005eGB-0l9C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:03:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89FF260261;
	Wed, 30 Sep 2026 10:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DA71F000FF;
	Wed, 30 Sep 2026 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762629;
	bh=td3g3mrxc06WlDh86pjy3W/s60pLo2ohFiXwCP79lTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEaDkVo65JymLBwnlB0ZoVvzsO7MKlS1CZaoSq/TzEZOC+3fDqT036Al+gNL7Zydd
	 VqUBoL6VKQXuiVE/QLOlLgJU38rHrUMg2Apm7AzAP1mNVunNLwXHi8ASw0QRuALsAQ
	 TCT5MXq/W52qtT8re2QrgnXtMotv7CSJvCK88Qja2MtL7xou/8pwSC1CDnSrW7TqBl
	 /S673P6bopkqpgR4GxIP0fnNiEoiLnLj7Gc3kvO4MV5tldPK5gO46bC+mVltLV6WnB
	 NMDt6EG+cAF2cWRoVgnWGsPznWahFc9ExEoqkEuX3+pNcO6irdjP9bRcXKKlk2J8sR
	 LRAMghu99XhOQ==
Date: Wed, 30 Sep 2026 12:03:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
Message-ID: <20260930-fascinating-armored-sunfish-ddcb59@quoll>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
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

On Sat, Sep 26, 2026 at 04:51:44PM +0200, Yureka Lilian wrote:
> This patch series has fixes for probing the pinctrl_ap GPIO controller
> on the MacBook Neo. The previous code would crash in the regmap_init on
> this device, since reading the REG_GPIOx for certain pins causes an
> SError.
> To mitigate this, we adapt the gpio-reserved-ranges property to describe
> pins which are unusable and whose REG_GPIOx should not be accessed.
> 
> Also add the new t8140 base compatible to the dt-bindings, signifying
> the different behavior of the t8140 pinctrl_ap device, and make the
> driver accept it since it now respects the gpio-reserved-ranges property.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

EDITME is here on purpose.

Best regards,
Krzysztof


