Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75756606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WKL9ETSP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVIKNVwp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DgrzhI5ozcui7/OQPr/YkjF7zwGD8GT5DcaYCKz+rys=; b=WKL9ETSPInIcSUtn0122q48afW
	pLERvAXP4/EQWvgXXa1QvQvLWxBy3WiG+W1TxbPZ8d3G3whET7oq2Mi6IJv0vzSyuPL/8HnJaZn8K
	MK03SgmiBmFZDHmR+akJAONrgZ8vkJkEEgIzxuG0kJKmPXQ+T5ie9ydXVPB2vOEjhruc/KzYBpJLs
	XWEOY7EqSFp1eRWmGx1wZCStn3DK+EVEKDAzUZ/NYoo6Z3CaUNpC+kIDxIx9bu2cm6AtR99tAOwdW
	uxiuE1yN9J5vaPY4HNlAl3TfO+wKj/CEevfP5g4S62NPv+RqTOB/1Ix2Rgk4mR54p9g0LZplc1KPH
	L0e2w+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3mU-000000074wr-2Xne;
	Wed, 28 Oct 2026 13:33:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3mU-000000074wd-0Cbw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:33:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9062141E89;
	Wed, 28 Oct 2026 13:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6A51F01825;
	Wed, 28 Oct 2026 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194409;
	bh=DgrzhI5ozcui7/OQPr/YkjF7zwGD8GT5DcaYCKz+rys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dVIKNVwpbUZijYgvZIMATDuv3dz1Tc3kLrMwDRXnpssSlSbR+EgOc9GtqCgLUGc54
	 5JlP0wq4vsdx/ysgxLQH0c34txlISjup7FyReIq0jaF3nWGthRoHIiZc3Se2PEseP0
	 46nmmuo2LhWyASTez0Uoj91fj4IYuYFn5KeEWwFrocGZ4nbgEgIswXNZpBqHDVziE+
	 Zs1AP0cSYGD+XeYteHUmvcVio7KRc8GL0QyWOqrGsYXUydt2/BGcoWZ0lwAQruTcPD
	 w0EqutbLEWJ8xeEGdIYqYCtD/+w54iMM3E2GeK7I3vyO7MYTLcLiYvQ8zSAeYeENuI
	 FFhnEwRc1JwSg==
Date: Wed, 28 Oct 2026 14:33:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: i2c: apple,i2c: Add t8142 compatible
Message-ID: <20261028-zircon-caribou-of-experiment-777f60@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-8-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-8-1356181bc50d@cyberchaos.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:03:28AM +0100, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T8142 (M5) SoC is compatible with
> t8103. Add "apple,t8142-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


