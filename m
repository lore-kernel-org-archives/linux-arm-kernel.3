Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02D5C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW6n2whwAnfcyRSHzFtmAav/mfRX7I5cVOpyJ0tCWSg=; b=TffCnho2Un4kN0Yw8eEaXuu211
	t8uZoGaRN/Mw/0ElEJOU+7sKXdPezYfYSBLhrxBSysB+0YSRVeRaz8Mc6ids8LoKORwHiNBgueogd
	XiVSKA+sZn8FCdnnDF6hfEIKDx7UhSSB/NhuwZ32KP3a1uys3cKSP1ODtoj5wqIlqx1KrkiPv7de+
	TYLKZykQrRbjEpxtYibfkDC+XOzE5zUYnioyDSMEN2w93skUb+B9i0V6DkIokdyQe6sVGFN5Ca0io
	sEeC3l7VU4wtJCerLbaXENbdS++hZB8ojCHUCt25tnlM+Uk8wWFUPUMWEg+847zqemzYVxZ+CuHJU
	WBbDNRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hOl-00000002vBC-3Aeg;
	Mon, 21 Sep 2026 17:01:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hOk-00000002vAv-1WLo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:01:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F454412A4;
	Mon, 21 Sep 2026 17:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C1D1F000FF;
	Mon, 21 Sep 2026 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790010106;
	bh=zW6n2whwAnfcyRSHzFtmAav/mfRX7I5cVOpyJ0tCWSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iIpvpqeskhjo4JuOBW6ln5mxz4k3JeSD/fwn6cKOWUz29LsV4ZE5LBMywJu0u4GUa
	 /gYsekj/WrUSUjvBfsbKdrHgPqcRav2chDbezOmA0jvkJ6RP9zissyj4Cw9Zz/jplb
	 OFaKYmBcasebsZJ1wvzTlrVvqdDMTEUzVSRcSI6gY7JsqyMQWDKOFYKeykh936TTZD
	 CC0vlQXXX7E+BC8k434M19YXBNydkO6e9W0tpecluHXy7h4ZbJBAaNt3h9DCYk2vle
	 TokAvKGEwqdw7yW4aM0U5i9q63pCKli8fm6O1u9blXHjtmVH0wA12yjwSTAKk1KR5S
	 y9e+FPGk6lDgg==
Date: Mon, 21 Sep 2026 12:01:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Hector Martin <marcan@marcan.st>, linux-watchdog@vger.kernel.org,
	Radu Rendec <radu@rendec.net>, asahi@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: interrupt-controller: apple,aic2:
 Add t8140 compatible
Message-ID: <179001010368.896395.13199235602357097060.robh@kernel.org>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
 <20260911-apple-a18-pro-initial-devicetrees-v2-4-08d06cf011d4@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-4-08d06cf011d4@cyberchaos.dev>
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


On Fri, 11 Sep 2026 18:58:41 +0200, Yureka Lilian wrote:
> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
> the M1-M4 SoCs.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


