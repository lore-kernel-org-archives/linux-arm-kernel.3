Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1228CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMGlyrCBop3la0imMgYJeakA2V0whVzG/+pLGAlldu8=; b=MsC8WrJvVSC0+95Lz96qrawdGA
	GVbNs0gx/xL/PbnBa289h0U7ocr6M25KIP7dLnZ4z0U04NWfnRe6ZVqnGlVxLss3ilqkSkUnxwhya
	G+VdNmQ7lmAieVRch9ZGihGkLYDWZaGhrVwGX+D0YE3dHZFF8aU8kFKAeZCElgd8J/a8fUc2ysNLE
	1BjZSQ/edtOWE/tvb3PGDBuOleLCFVWKlNaiZfkvtc7SeQ4BcrG9pp3G3QjHlIHc3j66ch3+AT2V2
	QT5wTvkjrtR7mjCeNtdONxXiKKp7jArhSTI7vVI6JCHpUdwiPIgSPcRvXdkl/6qmOWZknftoEU3OX
	QrkA17cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLew-00000001s7l-3mO0;
	Tue, 19 May 2026 14:43:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLeu-00000001s6s-1pKf;
	Tue, 19 May 2026 14:43:01 +0000
Date: Tue, 19 May 2026 16:42:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779201777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMGlyrCBop3la0imMgYJeakA2V0whVzG/+pLGAlldu8=;
	b=OH+Qgj+tzCHqtO+cprnzOIC4l4VI6aeYCO5YXg4tv8XLtgRrzbBKmzIgaxPNqQ67DC2/21
	IeyERJwhSv4TCCjZHXnd88+eyhmLSnOO3vIOS7GfxIZ3hG4zfmdAJa++f9wqGI+bbxN6pv
	SB4Z37YA4jUmWwgNHkwr2zmMv9LHTQfwfe29oHnvLZt0M1IqRMqJi07XNMPtpMP72aTKby
	KYoQ4utgevUG+o03QCXw1uW9MXA02ljj9N4gAF/P7HJ1nQ/X2T+H7vkn9xqztLuB699/JD
	jIPbNTQnyD1KWSZc682vV9RR2dApXmLWBbezCchY/2QhYQ5YGZCo++c+dPr4ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779201777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMGlyrCBop3la0imMgYJeakA2V0whVzG/+pLGAlldu8=;
	b=3B2kVHX1Tw0rd+7jn56ZQDjP9WpyGeprzdwvSyiyokdmGpVza++UDyU4p1CHwUUy1ZP0Gr
	9uGwBCTd22SA/IAA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <v3trqljork46ao3haew4abeky4q5ghjhf2uvkttpptlqgn46ht@kmgbgv6h7qqj>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
 <20260519110041-2d8d92c2-d265-43d1-848f-bf9231a106c8@linutronix.de>
 <bv4vwmkkjh23lahkrupwclqs7il4vxqeknalgqn52k3wc6ztsg@z5ukn774brtg>
 <20260519123911-0a9ca1dc-7fee-425f-ba0f-e86368596e55@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519123911-0a9ca1dc-7fee-425f-ba0f-e86368596e55@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074300_613724_3B45857D 
X-CRM114-Status: GOOD (  25.94  )
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

On Tue, May 19, 2026 at 12:47:31PM +0200, Thomas Weißschuh wrote:
> On Tue, May 19, 2026 at 12:20:14PM +0200, Gregor Herburger wrote:
> > On Tue, May 19, 2026 at 11:14:28AM +0200, Thomas Weißschuh wrote:
> > > On Fri, May 08, 2026 at 04:42:45PM +0200, Gregor Herburger wrote:
> > > > +config NVMEM_RASPBERRYPI_OTP
> > > > +	tristate "Raspberry Pi OTP support"
> > > > +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> > > 
> > > The '&& !RASPBERRYPI_FIRMWARE' clause looks weird, is it really necessary?
> > 
> > Yes it does looks weird but I think it is necessary. Without this it would be
> > possible to build RASPBERRYPI_FIRMWARE=m and NVMEM_RASPBERRYPI_OTP=y which
> > results in linker errors.
> 
> Fair enough. I would prefer the solution below, though.
> It would cleanly solve the issues also for other (future) drivers.
> 
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index 17595a96e90b..0efd479ffced 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -188,7 +188,7 @@ struct rpi_otp_driver_data {
>         int size;
>  };
>  
> -#if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
> +#if IS_REACHABLE(CONFIG_RASPBERRYPI_FIRMWARE)
>  int rpi_firmware_property(struct rpi_firmware *fw,
>                           u32 tag, void *data, size_t len);
>  int rpi_firmware_property_list(struct rpi_firmware *fw,
> 
> (...)
> 
Yes this should work. Will change it in the next version.

> > > > +static int rpi_otp_read(void *context, unsigned int offset, void *buf, size_t bytes)
> > > > +{
> > > > +	struct rpi_otp_priv *priv = context;
> > > > +	struct rpi_otp_header *fwbuf;
> > > > +	u32 count;
> > > > +	int ret;
> > > > +
> > > > +	if (!IS_ALIGNED(offset, 4) || !IS_ALIGNED(bytes, 4))
> > > > +		return -EINVAL;
> > > 
> > > Isn't this already enforced by the nvmem core?
> > 
> > Only for sysfs access through bin_attr_nvmem_read/bin_attr_nvmem_write. But
> > there is an in-kernel API nvmem_device_read/nvmem_device_write which does not
> > have alignment checks. So I added the check to be more defensive here.
> 
> The other drivers don't seem to check this explicitly. It looks like an
> accident waiting to happen.

Indeed, I will have a look at nvmem core and see if I can find a proper solution
for this.

Gregor

