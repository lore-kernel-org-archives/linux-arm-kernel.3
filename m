Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BEDD29DE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU7qH//lkIIPOm3hIL5pTBY7h36/3Zgg7ieWlukkNE0=; b=b/l16XOf3vnhsqRNDgHEzDvVwY
	Zc6Yp0fNh5mENNGLsuAAmlJO2EudiowzpCR3lNkuWcie1paW969VyXeeJ97tR7DARCNpQ1QZ42Q+c
	85XNhE1alhsESD+akh02JC016/4Cuy3jvIKUATnAoZhP7nFOcuQKZ+HgtYKDnRgIFacjnBFjDpkR7
	/p/eFpm4GMeZktlOXx0YdgnSc1j4Q4KKrb2Qn+2w2tFJoczuKrCGXA4nmNceTecYYw9AiFXN2jnBo
	ddS78sWna/JeMZEDxFibRU6Q32jLNf9uEwfJyEnAacNvDj5aaruy8IuiG7GysNT/pmLoOJTN7aNpp
	3TmgiR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyl-00000006lbb-1yKI;
	Tue, 13 Jan 2026 08:42:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyk-00000006lbK-2M5a
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Jan 2026 08:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pU7qH//lkIIPOm3hIL5pTBY7h36/3Zgg7ieWlukkNE0=; b=XrL++i9xq2fk4Mts8QhYWyrJB2
	CG4/EXOptpokTOxe1+TrmRlZjjGWVceNoeTQsK5Z527W6EtKKcqx3XteA9EuOoRi7DeKbSGq5Fnuh
	i1Yyu7KrmT/yebRKMqi1YauSyxIBjwzh63WbUJYM2iw9CqZXTfDUNlvBEipk7ik/ab84tPVYp+2BV
	LBviWhzE5gj2SODyBQlrQecPKt47bDLGhBpfoIubCFtQKEzDm+n4M9Fg6cyk90yw+7hpvlE5Pm50U
	05+uViJmy//1z+HrZQ9+t0y/13OhHYkjqgo0/1IJ1fjELyCSIu4Ig5Os9tz2H3DVyfzLqFVX6PW6T
	0PdzmqBA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyh-00000002Lx7-1xEV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:42:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7395D4E4209F;
	Tue, 13 Jan 2026 08:42:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3871B60732;
	Tue, 13 Jan 2026 08:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22D80103C8A64;
	Tue, 13 Jan 2026 09:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768293724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pU7qH//lkIIPOm3hIL5pTBY7h36/3Zgg7ieWlukkNE0=;
	b=D4bCiz1sH77ktIaCzuq9ouXD6Bb+9rcZLbksqXn5C5ZShIDVgPNKcycB5YHLz1ljAdTywQ
	yizWUJ2Ong5/FkCDGAY2FwIRFtw57d1tgtKzXkbBUejiYBk6x84Jl+81nnJroZsIteoCc/
	HtNh0V8qXoeW6/JwFvMcybq32S+Y7BMLJlOKfQdC1+mkuUlvaOe/efPeSi9+HT3O36e085
	KVGIxEQfMxo6pGC1Nw8Ly7EpKh/QRV7ImiupwpK4xZBTi8R/8yxfH232Y0gsjoWLEh6Ogb
	vzHUA7bwXJpaICbUmsXzlCR0TknanG2tPNKrXGK9+0AHTIjUZPh3oP8iXHnX9g==
Message-ID: <d077abbb-6a4b-4349-88be-0d90e23eb570@bootlin.com>
Date: Tue, 13 Jan 2026 09:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Joao Schim <joao@schimsalabim.eu>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <20251217082504.80226-3-richard.genoud@bootlin.com>
 <en7wscywn3xpw7cxvc2ngwrmjfciglzxgaje5qc5ngiehrjufh@jbvgp2neyzzx>
 <9c55d591-a280-4ed7-91b1-0c867cfff658@bootlin.com>
 <mu3ciykmtxoaa24mdw7mofpdapbii23qrubw6uzptszok43tta@tq3rguupehwe>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <mu3ciykmtxoaa24mdw7mofpdapbii23qrubw6uzptszok43tta@tq3rguupehwe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_084215_602345_E6788D57 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Uwe,
>>>> +	for (unsigned int i = 0; i < data->npwm; i++) {
>>>
>>> Huh, AFAIK we're not using declarations in for loops in the kernel.
>>
>> Actually, I've read somewhere (in LWN I guess) that Linus seems ok with that,
>> but I'll remove it if you prefer.
> 
> If you find your source again, I'd be interested.
I took me some time, but I finally found it (thanks to Hervé):
https://lore.kernel.org/all/CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com/


> 
> Best regards
> Uwe

Regards,
Richard

