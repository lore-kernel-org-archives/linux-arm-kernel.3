Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF9DC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jLAUP4jz+dgc7lU8O+gk1WGdzJhOquk63hh6x9abPs=; b=v89cMG4D6Azb/AnLp+Cb0qV685
	8Bo9JJFXlFeV3hpmOYUpdO1pw8cJiYR3JHe/zfjWpuCUT+//8jpORt/Vsb5bu7XOZDMcL+5BdAVxn
	CL9NA17vbRi1SXPzbPRtjIoPaNdPNUASneZFj/c+eV1Eg7RuH9O2V38DqKzEfh1m7hdlZ25X8Lfta
	ECLWvPeLKGeLI0vgqVtUk9mxye+YG6pEgoU9LlQAeL0M6PYpG3o417JqkeryTvOpnf2t9onBW9w4P
	SdqEQzEvdg6/FJT7gRh8rziv9F5U1qlVRNuLbxVk5mzDpJP9aGm6BvivFjm85Psq6klTsEzC81z/2
	5EIfy+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSUa-0000000CL5O-1whJ;
	Mon, 10 Aug 2026 16:04:48 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSUX-0000000CL4h-173j;
	Mon, 10 Aug 2026 16:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1786377877; x=1786982677; i=wahrenst@gmx.net;
	bh=8jLAUP4jz+dgc7lU8O+gk1WGdzJhOquk63hh6x9abPs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S4uo8qSKMSReDdVtgnY/hlu+tkeCA9Oy7EW1AoWGCqkivvNf3LRdX+QJkF0iuRsG
	 jUdR6KiyB3/Qohb5HYMTkuEeXVjqdDrnZ8gQFngKBpwD5OFXA9YAdQmFxIBmsM/cs
	 IofGtdue/PIxgOwLm3der3RHOJIGXFvijOLqYDBCuK46aTiNtzxUbM+ULxUHiUwlI
	 hsz9sutVM+f+g3c2e9HtazA1G03EC0dk17yzXdGfW6ZA2hwWQIoBwwxv0z+J2f6mW
	 qRoDXjh+0WvMOEbmuD3PvMm5YNegZIt9Ti0oagodZpU+axt5KxDErvFB/LZhcXguF
	 1yC/DWNuLT4WqcrQuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeQr-1wOoYY191P-00Tk7t; Mon, 10
 Aug 2026 18:04:37 +0200
Message-ID: <a406e17e-cd64-4167-a130-c39c7efa345f@gmx.net>
Date: Mon, 10 Aug 2026 18:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
 <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
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
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:crks0hCYR6L9GMilOHyN8vBM2/dFO/JlSJqHPi1fWDK/fp0nTZC
 p5DReBvyikMfg9Sz/T1xEgKFJ0PYtoNdKHc12GQzen9VMTUHmO1hU0/9MWWLQsa7C0CCKT5
 zVAt51w2or9+zKjyO/cy3Pfdfnos7v+hYe4FmI02NF7BrmLxgYUJIToouQQZj3vWagmlOCA
 n5BI10tmfZhmR7Km1SHmA==
UI-OutboundReport: notjunk:1;M01:P0:iqhBw4SeHeA=;oeCYXrozEh3HPxGyLrPFdY18Ga3 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_090445_605601_02827FAB 
X-CRM114-Status: GOOD (  11.02  )
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

Am 10.08.26 um 13:46 schrieb Gregor Herburger:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b" through its include.
>
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
>
> Add a compatibles string "raspberrypi,5-model-b-d0" together with a
> "bcm2712-d0" string to allow us to distinguish between those two
> steppings.
>
> Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

