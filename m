Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9A9CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Dhb9IRZrY5OxNh4l78kpxnIPd2RjSS1cMW9ZzlM+Dc=; b=puOC2nd4GGpIbMNpV2FulY8POy
	xuXmNltEF4oPBVOaF2TnN325kiFeJjRUMzYsB1JNl919f2XBPgXqTZGmRksJWf1eJ1lSXXG7AhxQg
	ponSWGTbS36lh30DTirP4I+IDu8E4xgcNqGO8W7BOiQhV/ibj9pcmFCHb1FO26pn2WU+AgtQ3hD8e
	vjSsKeOFQse59SqcI8WVpn6ki7w8faiNwI52fce7KSvAIFXgAgo3DY8hB/5jhvziOiu/E5QcYi7br
	TXhZ6p3fcV2EvJy6QjBaJbrTOt9YBacDNe+pj/KW1YJUeJJNgCnoMYd6vxx0zn26J0QOQgXITRZgv
	jphTyX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0T8-0000000Fe4X-06oh;
	Thu, 06 Nov 2025 13:56:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0T6-0000000Fe3z-0RZj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E88343D27;
	Thu,  6 Nov 2025 13:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14698C4CEF7;
	Thu,  6 Nov 2025 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437363;
	bh=NDmfeyNji4d6yMNWtsY5RGMB0RhVGt7DeQaYrl2G384=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IY8B4am+n9NPjHPxZal5gV/UG3Re3bytgQq8hfMNy5qEzwKVHjCaOvI3JeKXmxK57
	 VTh/RqIonvmgwvwGprCRMzRuDec9Sq7FB8XbuGwZN32qe+6IMpZ1XsfLni2OWTjtDh
	 cBgfbf2WsN6SjwBN/SM3T+19kcjVoe0wpYM+o46dHDtQ106yLYGXw7UMIJ0MWQtKUq
	 cEzWr/SPp7enQrmwejVsCFA0vcSTZEt5cALgvUX8uAZ5xJgdsxIvXEuo5HanP10Usk
	 veWBTrqvT14esfPHuHmlLBjv+nBnUzqz4yTQS3hy3VCIoBtSDFNOlASCHNoWlBTwzU
	 HtcCNHpAQMANg==
Date: Thu, 6 Nov 2025 13:55:56 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v4 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20251106135556.GP8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_055604_164035_9CBEB0FC 
X-CRM114-Status: GOOD (  23.08  )
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

On Sat, 25 Oct 2025, James Calligeros wrote:

> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> The hwmon function is an interesting one. While each Apple Silicon device
> exposes pretty similar sets of sensors, these all seem to be paired to
> different SMC keys in the firmware interface. This is true even when the
> sensors are on the SoC. For example, an M1 MacBook Pro will use different
> keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
> necessitates describing which keys correspond to which sensors for each
> device individually, and populating the hwmon structs at runtime. We do
> this with a node in the device tree. This series includes only the keys
> for sensors which we know to be common to all devices. The SMC is also
> responsible for monitoring and controlling fan speeds on systems with fans,
> which we expose via the hwmon driver.
> 
> The SMC also handles the hardware power button and lid switch. Power
> button presses and lid opening/closing are emitted as HID events, so we
> add an input subdevice to handle them.
> 
> Since there are no real dependencies between the components of this series,
> it should be fine for each subsystem to take the relevant patches through
> their trees. The mfd one-liners should be taken in order to avoid trivial
> conflicts.

The MFD parts look okay.  Let me know when the other drivers have been
accepted and I'll apply them all.

-- 
Lee Jones [李琼斯]

