Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A388C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y90Zr17wPFXbQNnQbGLpq2yfTWt1N64WXzYbYu6dZRA=; b=DksqQ6BQLoGB7Oy4NG+h1Jivol
	WyMxkFiD7Abwbia3RvW1PdW5azIufIrse85SGUFWV54884qruD+HymeB1gWdSrO5hOqSd+MXLO5g1
	8ZlhTl9xQ9YcVMewlN0OA1oELJx3Esv/epQ1/rWkDxttbQpWDsEsYVVORGk+79cNCo4nvAZPFX9Pz
	XhIXSOvPmW5ctefIilxTTifRjO14EgaFhk2WwNkoQNDhORkEamjV3J7thB/2mpAKs0jurCeLin+T7
	RdM0rIsuLJINoE3+yEnNlNrTDwh313hIxoK4bLOTNNyMUAP8cGr3eiV8S26FF/pjYKvB5tBxJJHjD
	EWyIu4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EFd-00000000ZRk-2tjW;
	Thu, 03 Sep 2026 20:41:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EFa-00000000ZQI-2G7X;
	Thu, 03 Sep 2026 20:41:36 +0000
Date: Thu, 3 Sep 2026 22:41:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788468091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y90Zr17wPFXbQNnQbGLpq2yfTWt1N64WXzYbYu6dZRA=;
	b=rKjHFff4irgeLi/nqMI1Q+g3qSGSjuZyes/PVnO5xczQg28iOim2dXqC9bR3giT/odFLHt
	TNIoBcte5o97MowpB3nvWmkvKPJLtFCZUME2TIf29sptxpIdR3yjqlWk6cDIBIQOSypWqB
	rd7JUaTGq5bf41y0lRSMpSVPsncnKE1UXI8jJK4F6iEb3d2Xkjt11f7sdfWaUYjt6l+wOs
	LVIq2O3RoN4UbEPwIEYmt5B7JBKGxJWwqz2pE8H1f7d2xzRWMQ1ghDeqsd8AxhKevXXTJR
	vJ2ZD7ncqyv6+ooiguL1M2k4sUc0FSDmNxB1qzAjggTOxdCUhhzoV+nN0wUPsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788468091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y90Zr17wPFXbQNnQbGLpq2yfTWt1N64WXzYbYu6dZRA=;
	b=Br0CgB7SH1VZupqfU9Hn/TFxuue8v+1Y9gDgTBZ8BEYHrRB9B7ktDWH+VrcULmvhp/yG48
	N4CD7qD1gmsyaRCA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Message-ID: <zgmvpqmjhtmk3mcbqef77zec3iitei2kx7qbyz4hqtcog66wes@vkv5cspi5vkg>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
 <95058f69-9d38-4367-aa8c-dffb0ea0ee54@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95058f69-9d38-4367-aa8c-dffb0ea0ee54@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_134134_730542_6751B6CB 
X-CRM114-Status: GOOD (  15.44  )
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

On Thu, Sep 03, 2026 at 07:55:53PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> Am 03.09.26 um 16:48 schrieb Gregor Herburger:
> > The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> > another partition. This can be used to create a A/B update scheme.
> > 
> > To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> > message must be sent to the firmware. Add support for this by
> > registering a reboot mode driver.
> sorry for the delay.
> 
> Do you know the consequences in case the firmware doesn't support
> RPI_FIRMWARE_SET_REBOOT_FLAGS ?
>
No I do not know what happens but I afaik tryboot is supported on all devices.
At least the doucmentation [0] says so.

[0]https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#fail-safe-os-updates-tryboot

Best regards
-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer

