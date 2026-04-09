Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D818F31E24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONauJM1Yd/vKNj61pJXPIhtd0ymL0BD8xctZMXZiYXQ=; b=bxeYL1RHYHSF1FYFC03iqzykPA
	N+FTIQ7NN4dXSIOp1BWIAYbmQ+Fua1l/vCTSvf7JlaJTXWmkRe+qWjJk1ROhpmazb67mCflx8UZJ9
	nksUawgNjOTdtBP3peJLIn9FXgDY3SswHuHMRgBQOCZFaOwte5TzcBoxLXBOn6LrrEhTYH/oWPPAK
	mzvNSSHBdogwAaS6krlXXZeZEVnffzR1H/xxpAr0fLSF8f8Qtz80fbJ0LKbzTlQ4GQ69xIdg4+rMU
	ujbA84r9xDoL+2vZE5hjKRhSeHYCj6KeQqDenMvjqEZ3Fqsr1DOyqNcaHHE0FRPt1Og191J7RXKjV
	Iwbk2ENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArCD-0000000Amy4-0cze;
	Thu, 09 Apr 2026 15:21:29 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArCA-0000000Amw8-1vPJ;
	Thu, 09 Apr 2026 15:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1775748062; x=1776352862; i=wahrenst@gmx.net;
	bh=ONauJM1Yd/vKNj61pJXPIhtd0ymL0BD8xctZMXZiYXQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ny6E0Qo93KByTudvSuy7r55aKQcrF+SFcZZDtU8yIimUtKJtIf48LRJo1fp0a0pq
	 HKXsKViytdho1xjk87Roqr/Dat6QzNT97tlUbJl5SRlSk9e1mG9VDq4nL+wa7Q1ZD
	 7rR9MVWsOEmKnt+cOzeBC8VctYQfR4s8MCrJqiuj1xtSVVZorRhg/2aNrKWhEFks6
	 La+QDEVbapWaDw23tW9qHwAOvNGAj67+MbYiyb+dH74D7upT4jePomfFFMwMxVe10
	 g4c+o1oUlbyWm3Z8pUG/NWuB3mhT1hVdkdGT6xUkExhPs6uvTj5jvW0pdXR8VBmMY
	 B+8gKUgDCB7HAVgtsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1vYnLA1jf0-00dtFq; Thu, 09
 Apr 2026 17:21:02 +0200
Message-ID: <fc2c08d8-fb7f-4da0-ad68-dd54aad82af9@gmx.net>
Date: Thu, 9 Apr 2026 17:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
 <251100fe-db96-4d83-899a-cd764582d698@gmx.net>
 <adaw1rr3WlDjvyQp@gregor-framework>
 <90f54202-6eb6-4c44-b029-a4e0dafad861@gmx.net>
 <addd5ZpuUdKBV7Bn@gregor-framework>
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
In-Reply-To: <addd5ZpuUdKBV7Bn@gregor-framework>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eTts/rUQX2gbou8JORJUMhwp/e0SHiss7/4etati2pdcb1fxNW9
 LS3WoBSFohPsEv8BCuR/I0TXDOaHYo+LAWdGGqJaPOzjJjQFD4tRsU8MXuDaiGBZSAviCCn
 Fjx3OyM8WgfkIVCivn2wwkkLaFfWw/k1GN9fqVn16YkOTn9oLyrmzBsryjX9jSNAZUIc/ft
 U4Ye9pmSbAW33pt/wbYHA==
UI-OutboundReport: notjunk:1;M01:P0:PiePEnsXQAU=;6MnBMZNWj82NZTfaZH5S0rPD5Fx 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 B4yVM4lwcXKyNwvnazhn/vyYfLPgmmbAg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_082126_776233_08C9E3B0 
X-CRM114-Status: GOOD (  19.57  )
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

Am 09.04.26 um 10:05 schrieb Gregor Herburger:
> On Wed, Apr 08, 2026 at 10:03:47PM +0200, Stefan Wahren wrote:
>> Am 08.04.26 um 21:47 schrieb Gregor Herburger:
>>> Hi Stefan,
>>>
>>> thanks for the review.
>>>> Is there any reason, why we cannot register this driver in
>>>> rpi_firmware_probe() like hwmon and clk driver?
>>>>
>>>> I like to avoid the complete dt-binding from patch 1.
>>> The private OTP registers are not available on all Raspberries. Afaik
>>> only on 4 and 5. So I think these registers must be described through
>>> the device tree. Therefore the bindings are needed.
>> This binding doesn't represent some kind of hardware, it's just some
>> firmware interface. A proper DT binding would describe the MMIO address
>> range for OTP access.
> I think it does represent real hardware. Although it is hidden through t=
he
> firmware. Not all hardware must be MMIO addresses.
>
> The only driver that does not have a DT node is the hwmon driver. All
> other drivers (clock, gpio, touchscreeen, reset, pwm) do have a DT
> binding. Looking at the comment in rpi_register_clk_driver this
> seems to be some legacy behaviour for older DTs for the clock driver.
There is a long history of different approaches how to implement the=20
VideoCore firmware interface for the Raspberry Pi and not all of them=20
are good from today's perspective.

One big problem with DT binding is that the kernel must be compatible=20
with all mainline DTS versions. This sounds trivial, but it's not. Since=
=20
we cannot assume that kernel & DTB are updated at the same time. So we=20
need to keep these bad solutions from the past.
>> If you need some distinction between the Raspberry Pi generations there=
 are
>> firmware tags to do this.
> So what is your suggestion? What tags do you mean?
Your driver already use firmware tags to access the OTPs via firmware.=20
You can ask the Raspberry Pi guys, how to do the distinction in a=20
efficient/maintainable way.

My suggestion would be to look at=20
https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface#ge=
t-board-model

and

https://github.com/u-boot/u-boot/blob/master/board/raspberrypi/rpi/rpi.c#L=
95

The compatible "raspberrypi,bcm2712-firmware" approach is more straight=20
forward, but requires a newer DTB. See above.

Best regards

