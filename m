Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF1ECF8856
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG+h95GJxw8aLE0rxgJBewweYYYfOwxLVyFr5Tr645w=; b=gmkO1BOJl3rKFrQJACXcX+JCQh
	qQ8v7lM1pH9B4gN77Khde+SpeLKghnNy9FFeTWLaNDYOFIaWl+w+o8fVloUIjOKfART2ZZROFOy4S
	3GcjHJVIDW5XBYJ5lkyA9Zgt11nXcGpd/6eOvJGTKXC3aytb9vNzDy+dDjwXAtZdG9TbnjT3TkAW+
	EFi/PDvPoq7KPT8qZh1eKjVy/l7rxkelVzTXuC1S4fu4dsKQTLQjKuA1JSvvSurHJtT+1juFdPv79
	9KLLrb5VszmgYEpCSsqRCqW+qBj1pIHDzd40zvpAwAguAQN8hJ5HzEx5Ij6A/Skl7DKPBIxfGZk6s
	+DDqf/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM50d-00000006lTH-1hrJ;
	Thu, 20 Nov 2025 13:47:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM50c-00000006lT7-2MVn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A96E060148;
	Thu, 20 Nov 2025 13:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B79C4CEF1;
	Thu, 20 Nov 2025 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763646457;
	bh=CJvDRzJ6YFbRHvYRFotqckNLhW7HcjNVMeyVDaTUxIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXUsnNhTC9c9YaZ7AYyCFxRs7XWV+0G1RxEDkF/L+x7qwqxzTpsxsvbxaVc5NWahR
	 huMD/s+bOqTwgoExzXL5ZQfoxJoFI2FIy+zJbH/o7FY5MZjtHWGse/BnJEK1rKC6mV
	 LIiHMkFddRichUUmbIrQtGM/hS2SXwYOPRLF2XwFCOyM+li198/4L66MC9bg1kl1w5
	 cx+RS+vJGmtZShei7zVzbQ0EdlmKzOHS9HZKv8rDTZiUb68cuewCMbqSgSQddRWaTC
	 IeP/jDdzMzDe5euq4kc8PzFD9uj/IQ8u8qTIjqpM1vxVh7ppoKlgZQE+BgOWXLT8Ju
	 tS7zCQoeEbIjA==
Date: Thu, 20 Nov 2025 13:47:29 +0000
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
Subject: Re: [PATCH v5 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20251120134729.GD661940@google.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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

On Wed, 12 Nov 2025, James Calligeros wrote:

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
> conflicts. Per [2], the hwmon driver should be merged along with the preceding
> mfd patch adding the __SMC_KEY macro to avoid build errors.

Apart from my (perhaps naive) question on patch 5, the other MFD patches
look okay to me.  Once my question has been answered, I can apply the
MFD, or at least 3 of them, orthogonally.

-- 
Lee Jones [李琼斯]

