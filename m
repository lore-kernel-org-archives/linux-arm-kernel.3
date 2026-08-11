Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9C2C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iDdgE/owU51lZlIN0HYazq6pMIvFsHvbr4vWfd/kbw=; b=Q5RZAdykxVPaDD9Pt0asauJybu
	8Fwc0TOj/2rWbKVNZEELXzfmAzsCWwj4NHka8NvYP6rOGG65EPHf8G9NXGTfZ2CoOTkrC8j7Zio0d
	xvVeGEhofuCUBbF+1jAw+bqrGINm42zXWFf7fTwA7JGYAaYoqMugL6otU4UpIehk1glkAR1CpBxxr
	P6B/YLFtCIdchbAsX7qpk9/CVC/+oc0qgNY2INzdIZoZLWFQtpDpBwc+elKE4+9NN7gvJolXhHM3z
	dy5pWPsyR8XJF2dPW4Xfa/leuYK2Aa8jE2wbkokPAv5yvTitEZvlXlBLQypOigQHHo+LTQXxCnT40
	07j+hZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmvf-0000000E8na-0ztV;
	Tue, 11 Aug 2026 13:54:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmvd-0000000E8ml-3mrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:54:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6F114141C;
	Tue, 11 Aug 2026 13:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AE11F000E9;
	Tue, 11 Aug 2026 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456445;
	bh=4iDdgE/owU51lZlIN0HYazq6pMIvFsHvbr4vWfd/kbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+/02pTldSr8TyJQf+JRpYO4qxJy70slL1XMJAcUjV6qwEo48GNBLelNXNlQn7Z5s
	 qokChyQ4EbeOB51/Yn0k6ibNNcglRj0FKNBDoH3nCcBQb8LE+X/17iYyWgAZvcotNu
	 izyU1TUwNuYOFj/Hp01D7KYqWZFzkBTW/oNWqY661GdEHoH0Dktb9jiT2fGpGgLhhR
	 W65ZnPF2IWFJ7/V4T7dBau4M4V0mnwgq4kebr2EHSo4nF+hXnS9ASTmm83ccMsyH6h
	 9CzEO3Ilo3cNttuhOzVEsngvW0EU6Fo0FQ7mZ2H2ZKKhgwj4gJebe2k1DZ8DSjRXMv
	 h/xwLWnw15Fzg==
Date: Tue, 11 Aug 2026 08:54:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-gpio@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>, Sven Peter <sven@kernel.org>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Linus Walleij <linusw@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Janne Grunau <j@jannau.net>,
	linux-i2c@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8132
 compatible
Message-ID: <178645644426.2075921.17129631857001345476.robh@kernel.org>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
 <20260801-apple-m4-initial-devicetrees-v2-7-5cb07cc275da@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-7-5cb07cc275da@cyberchaos.dev>
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


On Sat, 01 Aug 2026 23:40:37 +0200, Yureka Lilian wrote:
> The PWM controller on the Apple silicon t8132 (M4) SoC is compatible
> with t8103. Add "apple,t8132-fpwm" as SoC specific compatible under
> "apple,s5l-fpwm".
> 
> Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


