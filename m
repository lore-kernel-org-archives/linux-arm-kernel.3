Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511F4CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOz2+iWRM2wDOOs0YNhvWRw3uLkbQzJuYN48Hif/9uo=; b=OoW6tQVlKZ4tPT2rtC3P46eW0d
	6hxYRuPgu7HIO4mrXzREI549VgcHhU/rLX7JvijjTjNhI5qgVJC5h+7GCYRpMZKoLCgcB6tDW8qzn
	E43e+k4G7+B+SEA9kF+sdZPgXKtLsdwbaJi1nbO8H1Z3Hr390IQC2rmc6mUgBvpYwhHjNr8kqTkY9
	UmHQNd9dorO0olfmUqxlsY2lS4rpgQckV42Tj8GWU7/QrH0iGNulADh0qQVsE6VpCeBsO4wfrPv4C
	wCg646IJZQLGWhjZ389ZaCRvZbYWXZwckDr9mPDkSZ8MIhzkdbCuhEucQpAITwK/nh6zZ6WKHbf2y
	wGK89wIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Xa-000000086IS-1EBH;
	Thu, 21 May 2026 14:38:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4XX-000000086H3-3gM8;
	Thu, 21 May 2026 14:38:25 +0000
Date: Thu, 21 May 2026 16:38:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779374299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOz2+iWRM2wDOOs0YNhvWRw3uLkbQzJuYN48Hif/9uo=;
	b=ubhaa0JLmOR3y9vevmVht6oRt8fB5pyi5Bv7tkih5zW0XDqmPutB5n0Vp+HX57ObDrHxgR
	PzyKrc3ep2GlQjj8U4ezpYZ1F21CuJXPwRKGjbm/W4J6Jhe280uz0lDGpDma8klD8wQokb
	1InfeFRj7OEP6fipD8ThNgkGVUwzzVKU42zRQEfTOxNHYUBfvEp/SRTlunfJRuBXx21S5f
	YmQelfaLG2J38RPfLXoTU0s/wobQUjBeOVltGl3B+T8dWz53OQCqjjiVaksYb3NSKqa2Nh
	M2e1E0Nrj1yMrejAgxiSSTyOmsfDkJIaCgv2dd4t84JqTLOUodHGvRN0qKgZtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779374299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOz2+iWRM2wDOOs0YNhvWRw3uLkbQzJuYN48Hif/9uo=;
	b=txcK/surYtQLmpTtlOUsTQg47X+5bf5hFPrnW0pWoZ+6X6E3P7EZRF+XLJuSaxn4AdM9d6
	Ykz9P8WetXt7gDDg==
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
Subject: Re: [PATCH v5 5/8] firmware: raspberrypi: register nvmem driver
Message-ID: <20260521163452-5e1b28b5-3c2c-4658-99e5-1e8b480e14b0@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
 <20260520-rpi-otp-driver-v5-5-b26e5908eeac@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-rpi-otp-driver-v5-5-b26e5908eeac@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073824_053405_89BEF6A0 
X-CRM114-Status: GOOD (  14.60  )
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

On Wed, May 20, 2026 at 04:27:57PM +0200, Gregor Herburger wrote:
> The Raspberry Pi firmware exposes two regions with otp registers. The
> first region called "customer otp" is available on all Raspberry Pi
> models. The second is only available on the Raspberry Pi 5 (bcm2712).
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/firmware/raspberrypi.c             | 59 +++++++++++++++++++++++++++++-
>  include/soc/bcm2835/raspberrypi-firmware.h |  5 +++
>  2 files changed, 63 insertions(+), 1 deletion(-)

(...)

> +static void rpi_register_otp_driver(struct device *dev)
> +{
> +	struct rpi_firmware *fw = dev_get_drvdata(dev);
> +
> +	rpi_otp_customer = platform_device_register_data(dev, "raspberrypi-otp",
> +							 PLATFORM_DEVID_AUTO,
> +							 &rpi_otp_customer_data,
> +							 sizeof(rpi_otp_customer_data));
> +
> +	if (IS_ERR(rpi_otp_customer))
> +		dev_err(dev, "Failed to register customer OTP device: %ld\n",
> +			PTR_ERR(rpi_otp_customer));

These should use %pe which will nicely format the error.
This also differs from the other subdevice registrations which do not
print a message on error.

> +
> +	if (fw->soc == RPI_FIRMWARE_SOC_BCM2712) {
> +		rpi_otp_private = platform_device_register_data(dev, "raspberrypi-otp",
> +								PLATFORM_DEVID_AUTO,
> +								&rpi_otp_private_data,
> +								sizeof(rpi_otp_private_data));
> +
> +		if (IS_ERR(rpi_otp_private))
> +			dev_err(dev, "Failed to register private OTP device: %ld\n",
> +				PTR_ERR(rpi_otp_private));
> +	}
> +}

(...)

