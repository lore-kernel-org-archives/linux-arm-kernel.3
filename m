Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54973C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyn0/zo5abhYeN1I+2ncTS3pb7HZnYOjOXqR9vMc8Yw=; b=njk3GMTLRt1TlSYqtLUFST6U5A
	C/0sebaXp4KPWKUME9ynUlhyW4yEU/Wix+LHiFqUtZfxiTJl6/ntwRxwP2Vurkhdt5k0BRCRlTuEL
	ASiculW2LatuL7iqO22gg5fUEYVbjvoDR1Icp52U1MbY7M30Ie4N3QUZhDJ5dS9NlSwqRpBAkax2u
	IDNoCqHH6Tjq8qlw69PnkgzlXlw5UoyHcSEVG4ruytany+Sg89zvZ7MH4Aw/dT6rf0eWJhRf4Vux6
	KcE0S9A/KNNN72v6lWZN9wBfy3xQ/f2ng45trEJOuNd1JikmY2ps5DI8AdgZzXrQb6yGRP6c+sTiN
	+ioyhHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraEH-00000003q1H-2cje;
	Wed, 05 Aug 2026 11:56:13 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraEE-00000003q0g-11Im;
	Wed, 05 Aug 2026 11:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785930955; x=1786535755; i=wahrenst@gmx.net;
	bh=xyn0/zo5abhYeN1I+2ncTS3pb7HZnYOjOXqR9vMc8Yw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HXK+th6UYEjcnUJ832qfBpSYrUv4XfJEGG+eynSON5jFEU2vWOemy7E+HmMCm8nD
	 kxq1+hhvPWMXuHhUrQf+f9i1yivewvTjCvIWffRdAf+RQeQQjnej2a8hCQ5dfutMr
	 DMe8xNLKlEsE0gIBlWFFvOUfrBltOvVc2KSaEet2HgbXIYFXhYEyqcfJWNUZ/x75C
	 mShdVxcgnD95XTTPLVARcGbzIJ2yzVf7HgTsLMDcn1AHOKVEesA17zq/h9s+JJ+7g
	 RGr7SJy/9IoJWA7P7XGeecI57vmYzkLZoWWAZQyjsk8UKCfLfVBJDXpKj2s4SEKmq
	 pbmLJ7/T4C/RmDotAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1wXKaH1l2g-00M6vp; Wed, 05
 Aug 2026 13:55:55 +0200
Message-ID: <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>
Date: Wed, 5 Aug 2026 13:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
 <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AD+EXz3HZ8+XNZvklB2NKOnFtYokSZgB8Ajz3xo1c52Pex6J14j
 VqQDmZg8ypL5t7QSyE0ZjfYDjmD0527ED0glvlcoZlgbsQxjC1Xa2FPexC3lDGYbfOmKFo1
 pK5Xna1HmtLPpKcgO7dj9XUIqkdmb9MgZ/mTllqb5Tro0uVcmba/F8axEjXoYB4cd4w2mJB
 x7hoVPyuK10thUEpy7r1w==
UI-OutboundReport: notjunk:1;M01:P0:j3QViNrZ+mo=;FKpbzLxuQrtPEC2jrJihu0lSZuU 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 TUUvoqIrlErTLE07o/MOY4kYp2G94RrcBgc8o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_045610_598395_34AFB784 
X-CRM114-Status: GOOD (  11.36  )
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

Hi Gregor,

drop Eric and add Peter.

Am 05.08.26 um 09:27 schrieb Gregor Herburger:
> On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
>> Hi Gregor,
>>
>> sorry for my late reply.
>>
>> Am 04.08.26 um 15:13 schrieb Gregor Herburger:
>>> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
>>> and in a c Stepping. There are two separate dts files. The
>>> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts f=
or
>>> the d Stepping. The d stepping does not set its own compatible/model
>>> string but uses "raspberrypi,5-model-b".
>> In case the SoC and not the board has a D stepping, why do just change =
the
>> board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> You mean changing both compatible strings? Like this:
> 	compatible =3D "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
I just want to mention that your explanation doesn't match to your=20
changes. The first compatible represent the whole board (RPi 5) and the=20
second one represent only the SoC (BCM2712). Since the SoC is different=20
according your explanation, i would expect the SoC compatible needs to=20
be changed. And in case the SoC changes, also the board won't be=20
compatible anymore, correct?

Usually we try to avoid to model different SoC steppings in the device=20
tree, because this introduce a lot of redundancy. But it seems that the=20
differences are signifcant here.

In case this suggestion break something, this needs further explanation=20
in the patch.

Best regards

