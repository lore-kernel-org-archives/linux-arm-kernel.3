Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7ECCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2yGcyySeXyADu+wbT8E4ib2wnyaEk7mMm1o0foc9rM=; b=26URUQ2m7VvoxxLYkuS7cI7P3F
	wJ8qpiDhq1vDf17+NIhlVVAa08nIDW8UTWVitFLheH+8kVWsIpR5EVsa0z6JK25jo/GRmlk+f/eXh
	DSU2SuMJezju2L5sCJ/EPLjLJqEjMz18IHh0hTAtcqAkf4NnbUlvjraxNj3bm45X/NeZviu2ybbT1
	0jOyoiX8L7r830BgdsKs2sC4UsNEVmBSAMz04QvIv3g0YVPCGwM3wlyPS88wbTjLoLxgpYWudTONH
	V9jRJZBY9+osT3NckNrugGINGT2MC1NhmdFKEpn5UfeHryWwwIZpECqqc6HnEgfwGAyMD32sKDVX+
	P/nLReNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECCy-00000002fXU-2sMW;
	Wed, 29 Oct 2025 19:51:48 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECCv-00000002fVz-2NMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761767501; x=1762372301; i=wahrenst@gmx.net;
	bh=d2yGcyySeXyADu+wbT8E4ib2wnyaEk7mMm1o0foc9rM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=A0Dm4WDZgHVHJkGpRWZnLR6r3+WdSBRwGC4NpS4cMe26OFoBvLbcvawHY3T6Ytxk
	 AGgBoxlrl70TC3aSoH5YQrN1NbVPx3iCa2fMVgOoNnjONKj2ovQeh8iVsKtimNzis
	 JK+Come+z44Uq/0YD8JQO/IklqkJw7GoWn5GjYatQqTJVBCOLrlBObaijeCt8ebhR
	 3lBu3/Shha4bD5SLGWDVfvtZgWZgyobCUhxjJB5/RFIkF6jsT9WAOfg7DJvHP9BTd
	 qKESvv+vT/l8W2UHJTpyyt3TfHIvXFTwi6PnHnJFfm32Zyuq/NgReXVZcmQ2Dy58X
	 fCF5f3sOivPZE19+Tw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGrE-1vlddi4Ata-00MPNh; Wed, 29
 Oct 2025 20:51:41 +0100
Message-ID: <d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
Date: Wed, 29 Oct 2025 20:51:38 +0100
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
 <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
 <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
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
In-Reply-To: <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xV8UlzODuwiGwHX6qeLiVxxji4pbGya8VG8/lMnC+7UXBa8peVu
 PLZ7rgiTMfg05rYoBUaUPsaauqW7rvRNaAAd1/7nxmoOF7KmiVmVPcTyIaa+ommzUGAnCrL
 P6yCDnOvhpIQznJJ9E0zJmxebDTKkWB+SeTdIwRWNNSYLw0UJ1460OAvBgOFIuvvS84i8ht
 mLURoXE4KDy2XOf7ktgZQ==
UI-OutboundReport: notjunk:1;M01:P0:vHUvh8Kytes=;7BbnvTFrGXATKGygUSToU/dEzSK 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 07P5IuPmzy2dejTAQ6USrkVTyc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_125145_977520_4C673061 
X-CRM114-Status: GOOD (  12.29  )
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

Am 28.10.25 um 19:47 schrieb Mark Brown:
> On Tue, Oct 28, 2025 at 07:03:59PM +0100, Stefan Wahren wrote:
>> Am 27.10.25 um 17:51 schrieb Mark Brown:
>>>> Is there a HDMI cable connected?
>>> No, the boards only have ethernet, serial and power connected.
>> I switched to the same Raspberry Pi firmware 2023-10-17 and added U-Boo=
t
>> 2024.01 as second stage bootloader, but still not able to reproduce.
>> Looking at the LAVA output, I'm seeing this as the very first issue(s):
>> [=C2=A0 =C2=A013.480675] platform wifi-pwrseq: deferred probe pending: =
pwrseq_simple:
>> reset control not ready
>> [=C2=A0 =C2=A013.489095] platform bcm2835-power: deferred probe pending=
:
>> bcm2835-power: Failed to get clock v3d
Okay, here is my theory. The difference is about (boot) time. In my=20
setup the whole device boot from SD card and in your case the kernel=20
modules are stored via NFS.
V3D requires two resources, a clock and a PM domain. Additionally the PM=
=20
domain itself depends on the very same clock. In arm64/defconfig the=20
relevant clock driver is build as module, but the PM domain driver is=20
builtin.

During boot "driver_deferred_probe_timeout" (10 s) expires before the=20
clock driver could be loaded via NFS. So the PM domain core gave up:
[=C2=A0 =C2=A016.936547] v3d fec00000.gpu: deferred probe timeout, ignorin=
g dependency

So this breaks probing of V3D driver in this case.



