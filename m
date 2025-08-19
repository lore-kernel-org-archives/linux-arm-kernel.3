Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792D5CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIu2MTvmZeGcpxMHXGcj27zfd0+kck3CvCawQbMDX2E=; b=sxIih99E3kdTvd3xV64dgOLpnG
	r87sZRSS5q6Wc9kdkCs/O0UtXCj+NeCSMICbE+k16+szMgvBHj/shGpWShIl4jSTisY7jtWViJXk4
	sqg8zo+Dlrve2rM4T/7UKXggjmuk/KlcZIdLxfMUHS2ae3oXJr6HG9RpnrLUje4PxTZuAkDeWRJ9q
	khuVBdmvpd2gcTXbclt1H6ARUv4zKbWi+YKlAMy1LMsc+ysf5RN1Z2Apr1Sitpoc4Yr1ts7QAi4Zc
	gJPcNLJfMwYfNz8a68xv6OE4auKPG6sFof5rkTwa7na9GNL69lKVbjMoac4bb2/aOvhzNOPVVxazM
	V3tlSBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOMe-0000000Au7Z-1myE;
	Tue, 19 Aug 2025 15:35:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLYX-0000000ASB1-0lyF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5235361427;
	Tue, 19 Aug 2025 12:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EA0C4CEF1;
	Tue, 19 Aug 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606912;
	bh=/B14jPtqrr9C4Z5zVJbaqvRmr2grzAZ6lWE1PNr5tW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPxFOX/IPeSTRYa+D1kZKCAX/YP/a3nREN8GQ9IaGWTLyIpbZ/0Lhyz0eODa8yyO0
	 wV0tW89wkj5Q/tiwnWG4QVi4oQvn4knYjlS/q8GbVniQNPPp3IkpETlqZIwtI0EEL1
	 ItmA5O62hhF/33/JIv1Aifyv2BKwXW6C00R8Lify4Wg245jWJBR4OBbK+r1uHx84bZ
	 bm4H7sbYTuuTaGcI7mF86/4XQuxoYVFzD8mWFa0TQ2mW36JOZuh67BICnlIYrYaTwV
	 jZMvbYOeU9ghElSeviDg9iDv5pZkMPaoZ5BVISJ4NhMK7dGmhldxIAU8xftjj5z7DV
	 f6Xli9h23PT8g==
Date: Tue, 19 Aug 2025 13:35:05 +0100
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Message-ID: <20250819123505.GC7508@google.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
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

On Tue, 19 Aug 2025, James Calligeros wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements power button and lid switch support for Apple Mac
> devices using SMC controllers driven by the macsmc driver.
> 
> In addition to basic input support, this also responds to the final
> shutdown warning (when the power button is held down long enough) by
> doing an emergency kernel poweroff. This allows the NVMe controller to
> be cleanly shut down, which prevents data loss for in-cache data.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/input/misc/Kconfig      |  11 ++
>  drivers/input/misc/Makefile     |   1 +
>  drivers/input/misc/macsmc-hid.c | 210 +++++++++++++++++++++++++

>  drivers/mfd/macsmc.c            |   1 +

Separate patch please.

>  5 files changed, 224 insertions(+)

-- 
Lee Jones [李琼斯]

