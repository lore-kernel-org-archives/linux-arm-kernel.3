Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63606FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 21:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c6EKeRaeRgw2IP6/aj0vwG5gMU6SBqRhc9H6l67RiQ=; b=X+B++3AtIDvtm1HuK+p15jCWxT
	06RFFGQjpD9ZhZMxwKTAtLWH/CvnuER9PJvkdVmkikrHAVZc0z/fwiFhxxRvh7I1z0J0wfAvmOUnY
	NCgWWvdESWchyW2Tg8fZw9Lre6mGw+eWZLrtRSruOu+I4OCHJi0RsTQ78jGIcWA4DUDHjKe2VfPxA
	Gebxq57Ft1O+pD2h0VVl/IeLNhVIz/CFEJtw9SLdLWGDyUCWf+/cJy1FuGeduxPCTWourY8deheHI
	5F6i1K0N3N5HjdgvqQXjYl0sEj5WXopS01LBf++AJeV1TMcqfV3yA1C3O2oM//KLYwcQdrFSeRsPT
	I83UvZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wICa8-00000004F3i-2l2w;
	Wed, 29 Apr 2026 21:36:32 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wICa6-00000004F39-085M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 21:36:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id BF9B4130036A;
	Wed, 29 Apr 2026 17:36:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 29 Apr 2026 17:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777498586;
	 x=1777505786; bh=5c6EKeRaeRgw2IP6/aj0vwG5gMU6SBqRhc9H6l67RiQ=; b=
	Jr+R6QpkxIywS/7WcSX44vaN9mfpxh7lBC2ezZrvdvuA/yI+NBgPqA9p1STNkGxv
	+d48HacyNpKlIYgICiGd2MaHDc9qZjiR7fn+eFjIL70w+t2NjuHnAaHPu+W5YBJg
	ANsGVbscLAui2TZcyw/0j58ke/CfVlQCeQhDi4ZcbrBNt6Z9hu1LCHdKLJbIy//W
	9Wl16IcsT1sYF8P8bBxmIhuWzinkqAP0KyxuCpZY2eipNp6hADnDn89bKQlXLXPU
	+twHMtrBu3HzhxOv21mgHo069Hz4yZynJw3+ds/cBumeITKX3FxdSb/JRljN7qKL
	LrN53qX0XMZKZuAwWviCSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777498586; x=
	1777505786; bh=5c6EKeRaeRgw2IP6/aj0vwG5gMU6SBqRhc9H6l67RiQ=; b=l
	H+dIeKqoYkoZhzjlRFOgPwh6Y2FWWcE8/DB5spvkDaBfxAULdmlBIkLHMmkvMZwT
	gViu6vzN/tIYlHs2lUsOq1RZY94Lpo8XT9gxDpc8lM1EU49KKT1787DaKatfnIfu
	C8w3KTJqxEU2iZZlk86pBDCo6g3y6v3cyki8SnkAU7IQWMkpiXS37XAjhOxMHkNl
	iF8td4IVsEJ2gpictINOm+8jDDgXLno5xEX7JlFPNdIa0Y1PFdTDe6qO7r9/HsKE
	JygEHebypLDS5V2Nf3FvK2DixXjhRspCzvu6BeKxrIcMBU8Uvnj88RiMdn06lnwF
	pV8f4LNsk6g8tuO6FqGLw==
X-ME-Sender: <xms:2nnyae4igw8uVEMMztjiAbf_zsCdn6yhDMpsb1lqcNZA7PPowcjEuA>
    <xme:2nnyaSuHLt8KUulleeBoxX1S6dP-b1Gw_xoLfgASRLEQVlyK_4tx17HEAp0NdPaua
    94grnG3ddm8JJnAA229mKBXPmqyzQgMsMDH9RNU79Qj1PXshC7ztg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekheehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepsggtoh
    hushhsohhnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegs
    rgihlhhisghrvgdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrd
    hnvghtpdhrtghpthhtoheptghhuhhnkhgvvgihsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhope
    gvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprggrrhhordhkohhs
    khhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvg
    drihhnfhho
X-ME-Proxy: <xmx:2nnyaQVgbuPYwQ5PhORdbzIQH5UhjHsL72TZyvElKtkH1aaRbv438Q>
    <xmx:2nnyadxpkCobOu3ZukawY3SpbfPzxsOghsEgMP3SNhGL8Vb0cspQDQ>
    <xmx:2nnyaeibFjsc08s8EhBQwOqVh2QaA3ndmeaPDON86htoMSYXBjMHIA>
    <xmx:2nnyaQMltp_xmQ2nS6jRq7wyIVO4JwQcWZDKNPUXxJb4EIrvy47p3A>
    <xmx:2nnyaXavduEMWLUdY2sB7yCKpzJ24ICtTtce4Ut1i37Vrhc5Zf-xsmEA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EA351700065; Wed, 29 Apr 2026 17:36:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A9F4XwaMmS3c
Date: Wed, 29 Apr 2026 23:35:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Eric Dumazet" <edumazet@google.com>, "Felipe Balbi" <balbi@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, linux-wireless@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Christian Lamparter" <chunkeey@gmail.com>
Message-Id: <556b64c4-febb-4dc6-8d51-1b1c2d2c6aa6@app.fastmail.com>
In-Reply-To: <e4a7e9d8-7091-4520-a634-ff0a44eb5139@kernel.org>
References: <20260427142355.2532714-1-arnd@kernel.org>
 <20260427142355.2532714-4-arnd@kernel.org>
 <e4a7e9d8-7091-4520-a634-ff0a44eb5139@kernel.org>
Subject: Re: [PATCH v3 3/3] p54spi: convert to devicetree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_143630_282465_993F29D4 
X-CRM114-Status: GOOD (  17.31  )
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

On Wed, Apr 29, 2026, at 10:07, Krzysztof Kozlowski wrote:
> On 27/04/2026 16:23, Arnd Bergmann wrote:
>>  
>> -	ret = gpio_request(p54spi_gpio_power, "p54spi power");
>> -	if (ret < 0) {
>> -		dev_err(&priv->spi->dev, "power GPIO request failed: %d", ret);
>> +	priv->gpio_powerdown = gpiod_get(&spi->dev, "powerdown", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(priv->gpio_powerdown)) {
>> +		ret = PTR_ERR(priv->gpio_powerdown);
>> +		dev_err(&priv->spi->dev, "powerdown GPIO request failed: %d", ret);
>
> Binding said it is optional, so this cannot be a failure.
>
> Also, please use ret = dev_err_probe syntax.

Ok, fixed both.

>> @@ -686,10 +659,19 @@ static void p54spi_remove(struct spi_device *spi)
>>  	p54_free_common(priv->hw);
>>  }
>>  
>> +struct of_device_id p54spi_of_ids[] = {
>
> static const

I would have expected that to trigger a compile-time warning for a
missing declaration, not sure what happened here. Fixed now.

>> +	{ .compatible = "cnxt,3110x", },
>> +	{ .compatible = "isil,p54spi", },
>> +	{ .compatible = "st,stlc4550", },
>> +	{ .compatible = "st,stlc4560", },
>
> At least last two devices are then compatible, so this should be
> expressed in the binding with fallback and drop stlc4560 here. Maybe all
> of them are compatible.

The driver doesn't know the difference, so I assume they are
either all compatible, or the other ones don't actually work.
I've dropped everything except  "st,stlc4550" now, as that is the
one I used in the dts file. I kept the other identifiers
in the binding as:

  compatible:
    oneOf:
      - const: st,stlc4560
      - items:
          - enum:
              - cnxt,3110x
              - st,stlc4550
              - isil,p54spi
          - const: st,stlc4560

Not sure if that's the best way to express this.

       Arnd

