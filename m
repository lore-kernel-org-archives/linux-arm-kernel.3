Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E801CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQbelfs+f+2jFTQAUF0k77jUCrfbfY6Apnhjok5rpMI=; b=nQbz9vLmqY76kRxrH7InYtG88Z
	++tUeHJLJUe7ARz2N4zJq628X0TENWT73aTugyViRTNP7lGXzLZ6zMPheL0Md7354uW/s6mCFOElt
	Lgn4Dw5w7TRy/OOybmT0Nc23JuhpGJrTeBi2lutLErTFv/NMIi5BnAcD4Ynw1BLDiWzvnrZ0fndJD
	GIaDJihLYcq4v1FYw/zP5eBgT+sWgEcJBKWKAX661EYgv7b4rm5MPh5T8p/F7SzEeAFSp/vQbUE6P
	UIyxceTa+VFx+i2FG2zUTCs2U3T5oiDYgbQUYSDLmcrL0nMlAbgSzGh/nv0UkBQdAZXx0RO1XTE9b
	hC2An7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDo3p-0000000GT3H-1rIb;
	Tue, 28 Oct 2025 18:04:45 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDo3m-0000000GSjD-3dFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761674642; x=1762279442; i=wahrenst@gmx.net;
	bh=DQbelfs+f+2jFTQAUF0k77jUCrfbfY6Apnhjok5rpMI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KirTCH+L+b84FukCeZIQ8wh05LK6KGkYET6LBp8mI5T/jplMmV8FoPcrlSU+gRzN
	 pY3kChA1SxLfI98HA9BLZNkm42cGQXQjFBvvLtqCgdAokUV8S/HpN52No/C6T6CkQ
	 AdalQ5LyD9Yqf23OmLUNhWqebdiVA3oqLzrOe/O3GnUiU4EXX6wqHRYWFFkgLi5LW
	 NZoGUZdfQ9CEDh+Ysbncx8b6n5wiOn72gfoBISJE91BQfjAZ0fTrivzcwIJmhioP8
	 QdioM9coERldGMsMivMNzixj7MXD8cOm56dhUbvAnwhZLHXlUssEFeNojBjqcggh9
	 AQuuhMsaXzgJlGgE3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTAFh-1vht8P2pmJ-00HiJj; Tue, 28
 Oct 2025 19:04:02 +0100
Message-ID: <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
Date: Tue, 28 Oct 2025 19:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>, kernel-dev@igalia.com, kernel-list@raspberrypi.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
 <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
 <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
 <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
 <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
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
In-Reply-To: <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:goBzWz0/8YLyI5vPMsfbuBO27UAhqwo/HECH+sdJ+1QBVM0Xrb1
 5Y7w0HNYtYIRsJwcJXm1A4AanL/HP0MeZ7kUUH/iYXMPdjITG3HaEWGlpHe7X08JThWiAHj
 ZHjKeVoMX68wrJhFIDpqNGfxvJVLzOq47qp5txeAlAvfKekDrcSxYepqv/Xs8AAIcZGrgO5
 QIn3kSUYVsAIFl85dUynQ==
UI-OutboundReport: notjunk:1;M01:P0:1KHt+aOuapY=;kMGBvkcaWxFBTUoWjfnSL9o+kFU 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 q4mlZuNIzQF2Nwj1ac8wrq4fkK5eX6Depvo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_110443_182896_130049F6 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Mark,

Am 27.10.25 um 17:51 schrieb Mark Brown:
> On Mon, Oct 27, 2025 at 05:43:21PM +0100, Stefan Wahren wrote:
>> Am 27.10.25 um 13:07 schrieb Mark Brown:
>>> No.  This is happening in mainline (was originally reported against
>>> pending-fixes) so wasn't affected by all the module breakage, that was
>>> separate.
>> I think, i got confused because I was only able to reproduce this issue=
 with
>> the broken linux-next. So I was going for the wrong cause :-(
>> Do you use arm64/defconfig as kernel config?
> Yes, it's just plain defconfig.
>
>> Is there a HDMI cable connected?
> No, the boards only have ethernet, serial and power connected.
I switched to the same Raspberry Pi firmware 2023-10-17 and added U-Boot=
=20
2024.01 as second stage bootloader, but still not able to reproduce.

Looking at the LAVA output, I'm seeing this as the very first issue(s):

[=C2=A0 =C2=A013.480675] platform wifi-pwrseq: deferred probe pending:=20
pwrseq_simple: reset control not ready
[=C2=A0 =C2=A013.489095] platform bcm2835-power: deferred probe pending:=
=20
bcm2835-power: Failed to get clock v3d

Are critical drivers like clk_raspberrypi and resert_gpio listed in lsmod?

Is there anything special in the config.txt?

Regards


