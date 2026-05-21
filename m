Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1965CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDLY933PN2EBuLR1r8PdU5Fwy1ql5S35WUEgFUMoOsI=; b=1TkF6RxUkBPY5TixaQyMaRwmdX
	y9YVyM3ubNmquWm4U8ectEYZ44QxwZaPkKoRlfZajF99ROK9SKLLGaXhOWAG7GTD/o1M0B144dZUq
	sEfHOPABtd3ZT8sleg9UwrBzCYGLw3eAzrobpo+rCktP9vQxS4s+slks0KmwPJtFrrW40U7fuvgI9
	h5mYv0D7bG8fLl4+LYUsklW9ulTMZydl+EzzRNLSQ4O2ocxEo/jOWWuFlgV4zi/r0a/BQVJLRa3BN
	im2mSmshHIAkXfc6PQanIaCYg/6Z1nHAgO72K4iSrShJNGKUjNvEnDYzdWHEltuN2DOh3ceuTT5zD
	vUjzpsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Ri-000000084Xw-0x7N;
	Thu, 21 May 2026 14:32:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Rf-000000084Wi-30iH;
	Thu, 21 May 2026 14:32:20 +0000
Date: Thu, 21 May 2026 16:32:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779373936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDLY933PN2EBuLR1r8PdU5Fwy1ql5S35WUEgFUMoOsI=;
	b=KhQWixjbyY2ShxL9WlbXHBdJ7WHF+ugTNis+GXU9J1N08E7I86+Wdv7CflXrZxKlzyoh9O
	a9+K5D3LrEtkmk/wAG6iTWtV41NkkH9bcyc9C6kkyDGuE5iXHDqd+LnO+E35fcBYEAQEMr
	spIyR0APkZlUbJYJxwwBtrAyIgDveX9hHbXzqOGTD8i9FdwGS/aZgTzSXty1b4Po5vFoXg
	Hm8gjzwW/PVry0Ig8RqddkRejk9A3b9/SmVhfZ6iEg/Jm1hnSAgho2HEZdWkECLi8+hGUH
	4pUK2wd9DzYZ9A5a8rZEN+g0Ng1irlP+DTILxemqR3IFy4LeH3p9osgCIuw6Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779373936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDLY933PN2EBuLR1r8PdU5Fwy1ql5S35WUEgFUMoOsI=;
	b=CCJ0tBjjgldKioatLTsKpYYgsMCkOEpPtyoYvjSFInZzfumqyvk/E2HeOWC+Jgo4Maafh2
	AN0w7dxy9OsvXSAg==
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
Subject: Re: [PATCH v5 1/8] soc: bcm2835: Use IS_REACHABLE for function
 declaration
Message-ID: <20260521163126-47047e2d-8f24-4f72-98c1-7c5081ea9871@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
 <20260520-rpi-otp-driver-v5-1-b26e5908eeac@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-rpi-otp-driver-v5-1-b26e5908eeac@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073219_898356_4931182B 
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

On Wed, May 20, 2026 at 04:27:53PM +0200, Gregor Herburger wrote:
> The drivers that depend on the RASPBERRYPI_FIRMWARE use
> 
> 	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> 
> This should ensure that the driver is not compiled in when
> RASPBERRYPI_FIRMWARE is 'm' on COMPILE_TEST which leads to linker
> errors.
> 
> The same can be achieved by using IS_REACHABLE in the
> raspberrypi-firmware header. This evaluates to false when invoked from
> built-in code. This way the Kconfig can be written as
> 
> 	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
> 
> Which is a more readable variant.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

(...)

