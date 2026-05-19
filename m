Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68858CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UenSn56tHjiovnvCW9LnUxXLUDHjuC4SqEgtGEyoh7A=; b=rrKB7bCLjpzudwcLDz6OXOs04u
	BmGE28R4vuk/lAb3qCh4SbK6HjsE10V7LS4VaT1hDqHt0i4sXrno/3C+CuCg4QbpsuPpsN8HJxYYg
	8iSPO3LnVau/iDIjRIZQjoL3smeXIB1mkjorsINxxyuEUrYpUkMq6OVd7UAZxwLphFKsTtsnlQ/LT
	GRu2ixE33+uS4H+R/pgPZP5zqElxqY6Has/qeTrxTbp8RzJgKbZ3mzfn7g/xxK15gA2fMACYfgRV4
	P/FQVglajHfG3NV6QKvvDIswW6gOArLvfxw7NRasJF4KpTDHMnvIuZudN4FEnsZuq+ziTmx17WTGa
	5lWYm4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLqv-00000001uYk-12bz;
	Tue, 19 May 2026 14:55:25 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLqr-00000001uXV-2Lsh;
	Tue, 19 May 2026 14:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1779202511; x=1779807311; i=wahrenst@gmx.net;
	bh=UenSn56tHjiovnvCW9LnUxXLUDHjuC4SqEgtGEyoh7A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lRJp8Wtq8l3pDwuqefw8UYtNPeDJvQrMdBbLzowtsqtbIzF1UDysk40nZliRnl7s
	 GNdpspuTacM8WFI6mU0brBav1v7uwTX2B+He1+TRXRFFE+pmtqbMfwvlOwThKla8M
	 m0UTtludjsxd9XFGcePx9ym1RZGBtLx++9yVEytOkEvXBVT10bWAqnQvfSADYztE1
	 lRFGq0GE3zwkBaNk9UAwKV0Dvg9AMzNAk7dDJUag7tTJ4h5YnAJj/xSPW9+nFl/Tr
	 NKK0u44aNPqtwTIW3n563aWDhXBJI+/QHLgzcke3dUCj8Fp5Kv5mH1zJQRi9+DiGq
	 KaljbqpA1LK3EZhVjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1wnzRl085K-00Vo0O; Tue, 19
 May 2026 16:55:11 +0200
Message-ID: <d9e3e10a-c346-4391-b133-4b60fbee5dc3@gmx.net>
Date: Tue, 19 May 2026 16:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] nvmem: Add Raspberry Pi OTP nvmem driver
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
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
In-Reply-To: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OnG+5dD0K7KxSjstX8VfXizzjE7eoOYGJavQEZ0TtkzGymWxZQv
 SCdtJhV18O1T3Er4NdL9lsXY1X1nEfNWrIip8BH6LijHZ+cZzWAddDEjnG24UlvsJMYRXMD
 LNZpQrqTRTl1ki9IrJkmcYGeRY/Peu9US1p/rXj2hUFGtJtLRMfC9x2ojbHGzE6vrZ6rlXU
 WnB8ubPUle9HUZcq7n/Ig==
UI-OutboundReport: notjunk:1;M01:P0:ytHTOb0poPU=;G4uxAu2MvP1GjJhRRVWuBaP0l0W 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 L2vODxmme9fsllNcUwDSzLKHsVo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_075521_959649_906C3562 
X-CRM114-Status: GOOD (  17.46  )
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

Am 08.05.26 um 16:42 schrieb Gregor Herburger:
> Hi,
>
> This series adds support for the Raspberry Pis OTP registers. The
> Raspberry Pi has one or more OTP regions. These registers are accessible
> through the firmware. Add a driver for it and add updates the devicetree
> for the Raspberry Pi 5.
>
> ---
> Changes in v4:
> - Additional patch to drop unnecessary select schema
> - fix dt-bindings
> - use __counted_by_le
> - additional alignment check in read/write callbacks
> - Link to v3: https://patch.msgid.link/20260506-rpi-otp-driver-v3-0-2946=
02663695@linutronix.de
>
> Changes in v3:
> - dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-binding=
s
> - Fix Kconfig depends
> - Changed firmware data fields to __le32
> - Add MODULE_ALIAS
> - Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e917=
6ec72837@linutronix.de
>
> Changes in v2:
> - register nvmem driver from firmware driver and drop firmware sub nodes
> - Use struct_size and __counted_by for dynamic array
> - Drop unneeded comment in Kconfig
> - Use NVMEM_DEVID_NONE
> - Use kzalloc
> - Update module description
> - Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d=
1dbe6008@linutronix.de
>
> ---
> Gregor Herburger (5):
>        dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware c=
ompatible
>        nvmem: Add the Raspberry Pi OTP driver
>        firmware: raspberrypi: register nvmem driver
>        arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware c=
ompatible
>        dt-bindings: raspberrypi,bcm2835-firmware: Drop unnecessary selec=
t
>
>   .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++--
>   .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
>   drivers/firmware/raspberrypi.c                     |  59 +++++++++-
>   drivers/nvmem/Kconfig                              |  10 ++
>   drivers/nvmem/Makefile                             |   1 +
>   drivers/nvmem/raspberrypi-otp.c                    | 130 +++++++++++++=
++++++++
>   include/soc/bcm2835/raspberrypi-firmware.h         |  14 +++
>   7 files changed, 224 insertions(+), 14 deletions(-)
since you plan to submit a V5 of this series, could you please append=20
another patch to enable the driver as module for arm64/defconfig?

Thanks

