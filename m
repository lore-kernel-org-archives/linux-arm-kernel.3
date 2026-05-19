Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EF4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4stZwo5XtvjTeC6H9z4YtrqfpxDlrJABEAgk0JjJlg=; b=NLnXrYssPlNBTWIQxoB+OxLpyO
	Khf1l4o5BGUT7v6jMmGotdZEi7DcmH4lp3UFJ4gTw1bjjKETqfmbzGqLNsKNzbOhBBCKIA+AqFYGX
	PX1SS4SIYNjDJZKcWV9BAW5wq/xXbzXl5KzdNeVk2uxoEPIRe93pRP9eh2A6RqGLDL7vCFPu0E7r1
	yDL2jBnQpYQNX3jI5VpaQG4bK1Mt6dP1uzooICyCRwhI6iLeoS6KjEaMIrJTVHUfSpNf7v3skTCpR
	Zp27nM2khb5AWC3IGH3+e3PT7pNHpuIUfOrQmUvlaOOjtah97U+aIKpgFOupg3XrIyh20yhL4NK4h
	c2nbb1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMFU-00000001zzV-1Sr3;
	Tue, 19 May 2026 15:20:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMFR-00000001zyC-3FYD;
	Tue, 19 May 2026 15:20:47 +0000
Date: Tue, 19 May 2026 17:20:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779204043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k4stZwo5XtvjTeC6H9z4YtrqfpxDlrJABEAgk0JjJlg=;
	b=zhxAd3SjA66WDR0R93s6RvGfnx2/NwNYoxf6IHx6t67PARrmpq7CU7VVwf/E+FDFhSuN0c
	AQ+1jyQrzoA0k7OZilYptZBXFpTQoJBAD1A1H0+HaIgHeUGSBNzvZrxnvZ/TEKFMiMJLLI
	N4t8LaBZOZsjpJeW/zbNGkYsHcKaMeBwFdIGMkKcTs3i2370iPjdELM/E9nKNxhh8JO1if
	uwSi33V5s9Scw/T79kToAaXxJntUqkEu5BZE2A5hbWnyK93pO918bkapktPM/XPJns1AY8
	4n/88+kFy5o/BlTflyioRsY+cUm97ZFk9Sf94SqTLYfKz9sJGSwpdTs7U1+chQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779204043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k4stZwo5XtvjTeC6H9z4YtrqfpxDlrJABEAgk0JjJlg=;
	b=dRFjD/uf/RFqJSChTWxlyaOf82lquqKJrUWh7i81J773hhcoaDQpTIsbmdGWAtbYtezZvJ
	M2MWyqVjCUnDeJBQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/5] nvmem: Add Raspberry Pi OTP nvmem driver
Message-ID: <ppjkp4v4por5ot3ahmmhr5tz7mderm5ga7ttsop34ob4kbcqft@crydafv6wscb>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <d9e3e10a-c346-4391-b133-4b60fbee5dc3@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e3e10a-c346-4391-b133-4b60fbee5dc3@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082045_948046_535D360E 
X-CRM114-Status: GOOD (  21.81  )
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

On Tue, May 19, 2026 at 04:55:10PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> Am 08.05.26 um 16:42 schrieb Gregor Herburger:
> > Hi,
> > 
> > This series adds support for the Raspberry Pis OTP registers. The
> > Raspberry Pi has one or more OTP regions. These registers are accessible
> > through the firmware. Add a driver for it and add updates the devicetree
> > for the Raspberry Pi 5.
> > 
> > ---
> > Changes in v4:
> > - Additional patch to drop unnecessary select schema
> > - fix dt-bindings
> > - use __counted_by_le
> > - additional alignment check in read/write callbacks
> > - Link to v3: https://patch.msgid.link/20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de
> > 
> > Changes in v3:
> > - dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-bindings
> > - Fix Kconfig depends
> > - Changed firmware data fields to __le32
> > - Add MODULE_ALIAS
> > - Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de
> > 
> > Changes in v2:
> > - register nvmem driver from firmware driver and drop firmware sub nodes
> > - Use struct_size and __counted_by for dynamic array
> > - Drop unneeded comment in Kconfig
> > - Use NVMEM_DEVID_NONE
> > - Use kzalloc
> > - Update module description
> > - Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de
> > 
> > ---
> > Gregor Herburger (5):
> >        dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
> >        nvmem: Add the Raspberry Pi OTP driver
> >        firmware: raspberrypi: register nvmem driver
> >        arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware compatible
> >        dt-bindings: raspberrypi,bcm2835-firmware: Drop unnecessary select
> > 
> >   .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++--
> >   .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
> >   drivers/firmware/raspberrypi.c                     |  59 +++++++++-
> >   drivers/nvmem/Kconfig                              |  10 ++
> >   drivers/nvmem/Makefile                             |   1 +
> >   drivers/nvmem/raspberrypi-otp.c                    | 130 +++++++++++++++++++++
> >   include/soc/bcm2835/raspberrypi-firmware.h         |  14 +++
> >   7 files changed, 224 insertions(+), 14 deletions(-)
> since you plan to submit a V5 of this series, could you please append
> another patch to enable the driver as module for arm64/defconfig?

Good Idea, will add it.

Gregor

