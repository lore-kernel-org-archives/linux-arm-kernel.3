Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSBm3DzLoDyPUfaUlnC/tWvqlUUMiAa7Pm+xFEp4io0=; b=CocNXvWwjblzbSGm/7LgUwBswO
	Db8qX50ZTzoZxtxproMaIgDulpKWum770vHv68/KfBHEHnyYBhggGJz3e3eaCc5fInAT88u9PGSh+
	eW7109ngWKY0yn1Cd33rISatvG75Ii/sPmzXbMzxbMGJ8xV5k4XxWQgUSqz0YyY2+hsW86dpntMSe
	CJw5UW2Y82FmvVZaUNSMjIxdyY3LJ2diqPpvdegMkg0hai/tqGzWhvasQtHOyAwFh8Mcpb03dJnts
	ZVxGpBn85W4yVR1wJSI0Tf6YVLf6bpJ7yTV+yUbKy3yBySfDQx40fpi47C1LF6xg9UxnZi2nyNlJb
	Zt11xaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmJNR-0000000BoQJ-2Inc;
	Sun, 23 Feb 2025 21:19:05 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmJLy-0000000BoFx-0Wkp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 21:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740345441; x=1740950241; i=wahrenst@gmx.net;
	bh=iSBm3DzLoDyPUfaUlnC/tWvqlUUMiAa7Pm+xFEp4io0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bJ6kfztyjFaeNif49epFZ3vEXI45AqiY0/cW58fnEmmVH+E4gbYwMQ+MixE7VpwL
	 3Gg0BWFEyfYad8fkyqce4+gUgmvtABr4uARoSCtraRgpOIs3mqqi0HDyD7HQc0e8A
	 cphawjeE/8WFxyVrzrYZQmXrk63MnvyOawxaRtPCFyehQMbxgYxUKgqPkIVtdq275
	 bxtEVMpv4zcmrerVYq8i2+HobIbuLZLT3Z8JAGKoMal4QffmW3pp9DFju8uAsXZEW
	 QQvBTbpembI61xASqSNg8RD7Gab+c0gGkmC5lHXty0veuN1C3TAT+MfM27xnRtNv4
	 NY/5e7nEiYSUims5mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1thLXf1glG-0023lV; Sun, 23
 Feb 2025 22:17:21 +0100
Message-ID: <1706e1e2-f7fc-4dfc-8189-732ed6c72a2a@gmx.net>
Date: Sun, 23 Feb 2025 22:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: bcm2711: PL011 UARTs are actually r1p5
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Andrea della Porta <andrea.porta@suse.com>
References: <20250223125614.3592-1-wahrenst@gmx.net>
 <20250223125614.3592-2-wahrenst@gmx.net>
 <fb23aeaf-4e24-484c-a0ee-56781892fdda@gmail.com>
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
In-Reply-To: <fb23aeaf-4e24-484c-a0ee-56781892fdda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yj+EYP6aKED/Bu7wDRndll2JSeQ2wRkpPQSrhiIPgH9yosqiW2u
 pX2IGZD2l8Ur8gTZJLcIVYjVy33+LJZIm7vUWx5pd2zqhNjff3wwUAobjoOnD6URDLNehIy
 ESuMS1L7sx8sLcEdDRwi0J2rCAWw+HLPF84NfDe58hdviSlMQLoKd6ihjERJuwYK5xJTaPo
 IlpDc2i44QZa+cuJxDzpQ==
UI-OutboundReport: notjunk:1;M01:P0:zUv2yK7VM0M=;YvslNM9qth1z/pbNqC3mjzObKZh
 9OQsB773iIgkScfns0ie4vIzSzHHK+eLLqjuHE5vTpBw53eI8c/HGxnyIf8SFK8iYWfshz2oN
 feI3q7/Hfet2OSaC4VeAlyEvg7fMT2UuWSvrx7gHPrnAKhEydPP0V/K+2uA486rAqdAi1a7sS
 TlJG5VAfaZxwdhKS7AC7EMIGFYMaQJ4fQWJFQmVEP8COjC+yJJk68zVQfPWqC7s707a2SR3Gl
 sJNDcrcxZ0Xi31dUJiJGRAdxRMhF7toOTYhZdG4WAzNi41wJY7fXUMFIABVR6tsdpBOKonL5Z
 jcL8o7kDkW8C1tQ+dRwICX905+x8jmmIwZXKiPjAXYeTScT+C/nEfZE8txZo/1rT+ItS5vfTe
 37/s1ldIIAfu2OLG0Tp+fKNGm07otxWrnF4AWL9uNR9nry0APu6X8r4EbQkG0XWu6htkUGtUd
 dl+cZeq0PJTgz6HylH41yBcDlybnJAetRAVGfRuCxAhKKURZ4ghWQS5uK+WO20jcwGQLEJ33a
 LoblI5+tjlE/sAJqxdXvkKhwKQlPAE8xNVL2RCAjw4F1YjRUs8PBLu0IWv7dmzWTjZWRDXo0L
 4vEct8DY7TWeufwJIa+Lw0Vtpa3jwsEAmmE/VhMMrVyqY323I1hSeeGVY3wIhlo1klckbyeeE
 TvvwgwOg9/BjuB3yFifQNqCwi07elosslGltDWS2cxJocCISi54MThdvNtJHm7sByF2DJnw24
 17fIB463/j6Cq2+lUSin0CpRcaeVhwO07RKJ+dBE0FJLi/3K/tpOpIPnqeIkviW61ZRusqJ08
 R2ejtmhjrLTRFvsf19X1JuBjcBxNYyTZsWB+h2/IGiizbBBsuKrMz+Q/sUXxta/NhbPyNH13f
 M/wnub3SDXneZdVCAZiveU75HNo5Ly99AXZyv/aVAUYZfl4vEDYu6FSJTHoZOrRpET6YnJkhh
 BjFq/Ru4dbFuFWxvtE6JxWcUn4tVZ6wnP7c9SpKO5Zi/mAvR8ke8sJIavjsLOpAUPXhdLds7F
 Q+NLcFtIFOUMhEuoiH5a+m4B5BHQFFuKtUXYiNo1aKo9EOr6bCk3IMZQY+unY/vrF2BnkbDBJ
 K4dWhg91HdKBGTKO2j1euTrry3DDn1s7cxNp7m9lvBMe3uhDSGGUnk10Z6fjE5XtJhDZhFeRL
 /fa/C1/oydVKONRx9v2dI8PUEwW9SKYGCilyYoNVRd8+cIMRaWgcFtHv6TSRBDKuUU0+hmVhs
 u9CX2O35tKvwobQ6kvQ2K+vEHM6McoRHjGGni85ivyTb50SlPkZae627jCIN3a5etWzaz2MKN
 ZLNUsbN4mwONk7smrRv5dlgO+ObKg+SJ4gBo1YrTb+QsDY0UnU8wMa29XFv0VdBDeQSYkibib
 9AjI06b39R+7f9GMj/Eese8FKxLoA656qhIfgRbvypRU1ZB1B2R8w2Y4iQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_131734_463628_768E107D 
X-CRM114-Status: GOOD (  10.73  )
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

Am 23.02.25 um 17:58 schrieb Florian Fainelli:
>
>
> On 23/02/2025 04:56, Stefan Wahren wrote:
>> From: Phil Elwell <phil@raspberrypi.com>
>>
>> The ARM PL011 UART instances in BCM2711 are r1p5 spec, which means they
>> have 32-entry FIFOs. The correct periphid value for this is 0x00341011.
>> Thanks to N Buchwitz for pointing this out.
>
> Should not that require warrant a Reported-by here?
I tried to find the original discussion, but i couldn't find it. Also I
don't know if this person wants their mail address published.
>
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>
> Some people might consider this to be a bug fix, mind adding a Fixes tag=
?
tbh, i'm not aware of any (real) negative impact, but yes i'm fine to
add it.
>
> Thanks!


