Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F9E10F9976
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCPiR8Ps2d/reWbKoivi16RRIbpJ36i8DpfpQH8LCqA=; b=VeXiLHqn3ZFGrg0OOo4pI70oNc
	IHtVw4i0ildr9B7R9jJ5M2UNBdeTpSpw54ElfmPxKD/ow/sxOtCZWNRtChF0NchLoGBAXJM02DPSN
	0T31furtNhmYiRS1py8LouRRXute82FvrtOwm2P2vucn8SakXpMVzGoKGo2pkNapXpmJzaJGHHy+v
	T5jZylAK2/e0RpAHYyR8yxOTLjkAry8yshE7xti6aRlPNk/OChvyvpPpTx+T8mlnbOy6AyGsseCTS
	Uv5MVBSLC/J6z5c68BISDzZql+YGnxIj620T+3Mf7imIJBKKLjdEkDtRhFczIgIE1UiGAU+MVbL6S
	5QssyYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZ8K-00000009M2S-1APg;
	Wed, 08 Apr 2026 20:04:16 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZ8H-00000009M23-1l6m;
	Wed, 08 Apr 2026 20:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1775678629; x=1776283429; i=wahrenst@gmx.net;
	bh=uCPiR8Ps2d/reWbKoivi16RRIbpJ36i8DpfpQH8LCqA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sq8tG9wpAt3Vw+g2Ql5F7pe1et3lmV/ue8mfuORs41qdAh45xO7lO7TQn77SAvOV
	 A0PGABra6Dp+UqWMIsOvaPo15CkRBwc86ohCtAhbBP16zXHKeLIuq58U9sDq7Oac1
	 qI6rFaiKp1LueLQmjXR2dErEfuNP1ciGE3x0erovYC+7DCs2s765u/pe2HCJ5QoSi
	 aQJchdspH5eqPTYf7EjvI8tjYfhD3PvaTlFYEmmiQ0fvwMcYVvOPfPCRsk+ggPmZA
	 CGpDvoGJ43T9UtX8tELfF3My0jvxaLtv4hidIXcuwO1X4NEGqvnJqKxUl3eGY3srH
	 Oh5Y8+io5Uupcc1iCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1vT1Ni3TyA-016eUy; Wed, 08
 Apr 2026 22:03:48 +0200
Message-ID: <90f54202-6eb6-4c44-b029-a4e0dafad861@gmx.net>
Date: Wed, 8 Apr 2026 22:03:47 +0200
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
In-Reply-To: <adaw1rr3WlDjvyQp@gregor-framework>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qgXpdc11r+Up/a1GC8dpPxGtT4m5mIMp6E/wqQqGyMF3ygLDAwQ
 cEdzPZR/msCf7Lhjn9WftpQ4+WlmHW2bH6ReYl2eTedU5E6jLJR5GdZbmGvEoUeOx1FLlmg
 RXVPBCtq6jCGohe+Gbw6GanwnqAU8ogazKgYpx0f7sIdMqVsb2JkFGzDPw8AjJoy0GFIqhE
 92OMbs+F2tGH28S2gJ+3A==
UI-OutboundReport: notjunk:1;M01:P0:sIMOOk0wTOw=;7mFUP8QYS+67CyBGMlaA9kMPxFI 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 J/gAV3QcjCgE3TLu/xDdG1KShmV7uA2QA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_130413_743614_60BB46EA 
X-CRM114-Status: GOOD (  12.42  )
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

Am 08.04.26 um 21:47 schrieb Gregor Herburger:
> Hi Stefan,
>
> thanks for the review.
>> Is there any reason, why we cannot register this driver in
>> rpi_firmware_probe() like hwmon and clk driver?
>>
>> I like to avoid the complete dt-binding from patch 1.
> The private OTP registers are not available on all Raspberries. Afaik
> only on 4 and 5. So I think these registers must be described through
> the device tree. Therefore the bindings are needed.
This binding doesn't represent some kind of hardware, it's just some=20
firmware interface. A proper DT binding would describe the MMIO address=20
range for OTP access.
If you need some distinction between the Raspberry Pi generations there=20
are firmware tags to do this.

Regards


