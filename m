Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F39EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IA+0hrqXQEzwG3UxcQ6zFvAN49iycuH2/ZvwolQRu7w=; b=EBNaBv1HaRD+VZYLT5dbljjMZ+
	RPaMJbVsqATo0zrm4DDaRymGCO7xUO5Qg6rtlPfusWDrbb2ITAhQKG8O5NGlhj6YsEnNYBJro5ZOa
	9zeHBMEuLzLY5fUlaeeoJ/9ce297ZV3BsV4Aj6ClOfhIOwp6bMUIkRiKooZtLDASXQBQeGXnSnKdi
	J8FBHllnudcm2J8Le2ARAIIrUrQSEz3SmsCLaPxkjkr8ADKv5mbUSgxJJY5/o4GfUP3HVmPCugFzn
	pEXr5hnYxrraJ+CN46xhR6BoeDU3gNdghG8e1GvnJV8IQ7rHSsYwxvxWmTp0oyfvG7ptcWAIkSEuZ
	tkutujUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo5o-0000000AL1U-0MQA;
	Thu, 09 Apr 2026 12:02:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo5k-0000000AL15-3ZOS;
	Thu, 09 Apr 2026 12:02:38 +0000
Date: Thu, 9 Apr 2026 14:02:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775736153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IA+0hrqXQEzwG3UxcQ6zFvAN49iycuH2/ZvwolQRu7w=;
	b=HWMb02X9hZnmwbsmCWmyfkn+yQxedtDdNFPT0nA9Schn1cYcVfN1OkaUy8vta68DsXkX66
	f2mrA5MUgn/QDaiVjZ2xTJVrk8WIbRsrBJktrJDq94Au5u/tsS9aI9h0zEHG4GISxR8kpF
	uHKJDG0EvbwLBDwEhOY8+J7lVDJNOSJWgBaQfAg4kVZhU8RtjfB9ksuoqhKpGU0kguJ12P
	Ndyl/mTySp3JOuKAOL0gYNs4R7irDWlpJ4BphM8tEFjrgTShGfhnSz1rHCr+JUbWxOAoCV
	k89MMO+ha/hIhwF8B6MpvjKhSfu8eLmW8uawojAf66kB6uBI6ibpJ/cORtx0xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775736153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IA+0hrqXQEzwG3UxcQ6zFvAN49iycuH2/ZvwolQRu7w=;
	b=PR47/d+6755hTGWZuXpTUXkL0Gh4OmUTAOMPUZBTaY9D5m0+TtCgUIt5QDe+z5oAe+RFI9
	iNR1qqC8GC/A7GDg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add the otp nodes to
 firmware
Message-ID: <adeVWKcQyfkKKY5J@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
 <20260409-imposing-strict-snail-5d2a6f@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-imposing-strict-snail-5d2a6f@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_050237_057084_08825BB1 
X-CRM114-Status: GOOD (  15.73  )
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

Hi Krzysztof,

thanks for reviewing.

On Thu, Apr 09, 2026 at 10:15:12AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 08, 2026 at 10:00:17AM +0200, Gregor Herburger wrote:
> > The Raspberry Pi 5 has two OTP registers (private and customer), add these
> > to the devicetree.
> 
> So this sentence confirms my question on bindings - your device
> raspberrypi,bcm2835-firmware has these, thus you do not need these child
> nodes at all. Neither compatibles.

I dont't think so. In my understanding the bcm2835-firmware does not
provide the otp registers but only provides the interface to the
registers. Though I don't know the details how this is done but [1] says
that only BCM2712 has 512bits and the others (like bcm2711) have
256bits. So both devicetrees have the raspberrypi,bcm2835-firmware node
but only the bcm2712 has the raspberrypi,firmware-otp-private node while the 
raspberrypi,firmware-otp-customer is available in all raspberrys.

> Drop entire DTS and binding patches.

If I drop the binding patch how to distinguish the variants? Should I
add a SoC specific compatible? e.g. `raspberrypi,bcm2712-firmware` and
use it in the firmware/raspberrypi driver to add the second otp region?

Also what I don't understand why we have all the bindings for
'raspberrypi,firmware-clocks', 'raspberrypi,firmware-gpio',
'raspberrypi,firmware-reset', 'raspberrypi,firmware-poe-pwm' and
'raspberrypi,firmware-ts'. What is the difference between these devices
and the otp registers. They are all accessed through the firmware.

[1] https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#device-specific-private-key

Best regards
Gregor

