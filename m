Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C637CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qZjuXJBiANp+9zScLJMqXa99VOzBuWOAEWSOPpMpkU=; b=LQGREsxMZFQGVXSI6LYW27zG+U
	TKust+yq5kNqoQB0pjzKgxd2qmjfADzB2FAQlUJ/VCQ6uOnW3p3kNimCq3WO9OnxPZc8bKt2OOWlu
	aUpqdY5B5rsvWJkO6iflUYNKb9B/eT49ArcOdoEb929ibZIo9TTjgPNnTiU2YVvn4f0ubuoTJBFcn
	WzHU5Ueh3AhP3ZA+ICusnbrBS+fzYI9c3N8RzY3Gg9Mk8oeOzgLj7A+czEv++Rm8kp62wQm09gXFQ
	KegSRpqg+5MA7XlKNSeOYdXlzRyaXxSxaV9X9WG/HXKXOCo0iPwr3o23eHzQxDYSCX/8BMAnO2zh5
	u6FxkEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Ta-0000000856D-04jA;
	Thu, 21 May 2026 14:34:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4TX-0000000854u-3L6b;
	Thu, 21 May 2026 14:34:16 +0000
Date: Thu, 21 May 2026 16:34:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779374054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3qZjuXJBiANp+9zScLJMqXa99VOzBuWOAEWSOPpMpkU=;
	b=Sk661n9K47N5EqHbFZdAnux+K6yRw2O+7OulPg1dUBpuuDGmjgsF3IvIO8f8aL1+geChDW
	GcXQl8fUfj/PhrlNW7SE+D5f0o2XF2+c621Ml4wu21hlnjsTuV8iRSl0NJUTNafcMptr97
	SbPdIRuskYH8XSAMEQvU0N3H8mszq8DVghvadAGwLEFykFH+BxBGYYyQzbHOSHujMNUi0x
	0EmlETX4tQvD+V5axTaApelp8OEHPZcyW/tHwN/GbSaaeTXNiyqu7D9km6ynqcu1aDxmFn
	tyhW5XS/Rkl3DSFqjh9UPb+s7y0V6DZSgii721PSEqWma8WQJ+nW6HA0fwsUtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779374054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3qZjuXJBiANp+9zScLJMqXa99VOzBuWOAEWSOPpMpkU=;
	b=0yWIprTsJejVqpNi5M8FC4KNi/qJAp5QYHcZ2428yee5FLrX6b+/Fgz8McuTDq2LzrsF9h
	opFy0g3NECzczcCg==
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
Subject: Re: [PATCH v5 4/8] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <20260521163245-10305d54-ede8-4b5c-94bc-3abfcfc9d880@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
 <20260520-rpi-otp-driver-v5-4-b26e5908eeac@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-rpi-otp-driver-v5-4-b26e5908eeac@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073415_971813_8DA8D46B 
X-CRM114-Status: GOOD (  11.05  )
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

On Wed, May 20, 2026 at 04:27:56PM +0200, Gregor Herburger wrote:
> Raspberry Pis have OTP registers which can be accessed through the
> videocore firmware. Add a nvmem driver to support these OTP registers.
> 
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/nvmem/Kconfig                      |  11 +++
>  drivers/nvmem/Makefile                     |   1 +
>  drivers/nvmem/raspberrypi-otp.c            | 130 +++++++++++++++++++++++++++++
>  include/soc/bcm2835/raspberrypi-firmware.h |  10 +++
>  4 files changed, 152 insertions(+)

(...)

> +static const struct platform_device_id raspberrypi_otp_id[] = {
> +	{ "raspberrypi-otp" },
> +	{},

The last sentinel element should not have a trailing comma,
to make sure nobody places an element after it by accident.

> +};
> +MODULE_DEVICE_TABLE(platform, raspberrypi_otp_id);

(...)

