Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48895CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVPrZCD+coHGpNa0YIBuPsQX/qkRW6hAr9QMIdvd5Xw=; b=hqqigEgQCvrpEzDMdQ6KBsBg+Q
	iKB8R6sbUgM+yRQVOaC3/e8+fV0eHYyxbEshVfxjSuin7n55qpyNnAA0ub145Z86118CJiJZ0gj9p
	8pOEYbVJKgD2lWDkLv5+vZrJtTDyMyVGqY/mwYa6hAZe51+oq4+uDnQYk4bKxCq3f/T0FmN/UaiHZ
	ZmFxEYiGPsKYECAvL3F5ls+4j+iZjBLiGoQl+Hwiv+pHYRrzSdOGfuGZEPj8RKFFphDD/nDQwYfYh
	ygNc27DWpUOi2Eln+iSD3eDIIWaIpZOcGOHZIND3n+rrxYm4VYZCQeKYN0Dn3mw/rW2b8sH1TWHsU
	LIP6tuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4S4-000000084dX-1mWR;
	Thu, 21 May 2026 14:32:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4S2-000000084ci-0QyY;
	Thu, 21 May 2026 14:32:43 +0000
Date: Thu, 21 May 2026 16:32:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779373960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVPrZCD+coHGpNa0YIBuPsQX/qkRW6hAr9QMIdvd5Xw=;
	b=lSMj5lBXBIp3M8gIdnnq/1uQEZ0Mf52/hkfA9o4DW3umiPSjka+xZh5gb8SboPn6x6Lkf6
	x2fEqaApnRcLJ+p0hqdnFQq8TgsI3xg+vFm6TRGfCm7NrTFBhqvHF1DxA7QhYuigoTm0pC
	bYrrNbnDY0fwcMwZroDEC/ScwqTl9PEdAd1YecWdleM6otntMxTUCw7J3jggKM3hQvzpQ6
	b7zAfYqZuegxpMbMA2+3B6zoIJa499KeP9bmgBCHPam+rnzvkpb8YXWyCsvIo5uaCkOfJH
	1QuzGkQzfHQUcRoiNU1BXQCjlZ14IIEkFlH5Kojr+iVqBXG9DL30pPRh05kHKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779373960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVPrZCD+coHGpNa0YIBuPsQX/qkRW6hAr9QMIdvd5Xw=;
	b=kaHE5VX3I6PELgMgGQXQb65vmYnq1tflZkIqVHQ+vQe7t4TMdg7qjYQvuQBJKGVYZk21+L
	d4kfp1ZaLZeijtDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 2/8] nvmem: core: Enforce stride and alignment checks
 for nvmem_device functions
Message-ID: <20260521163223-0b54b648-5272-43ad-a837-cc5364484b6a@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
 <20260520-rpi-otp-driver-v5-2-b26e5908eeac@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-rpi-otp-driver-v5-2-b26e5908eeac@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073242_577435_87216C3A 
X-CRM114-Status: GOOD (  10.43  )
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

On Wed, May 20, 2026 at 04:27:54PM +0200, Gregor Herburger wrote:
> The stride and word_size attributes in the nvmem_config struct are
> currently only used when reading/writing through sysfs functions
> bin_attr_nvmem_read/bin_attr_nvmem_write and in the nvmem_cell api.
> Reads and writes with nvmem_device_write/nvmem_device_read still allow
> unaligned access.
> 
> Add a check to these functions to enforce word_size and stride_length
> aligned reads and writes.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/nvmem/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

(...)

