Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4373BD1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwFka7JtBnqL36WYt42oO3Sd0NYme1o8EJZnWiwvY44=; b=Lhg6HBnYnNHFOyht+nOCh8U7EJ
	v23NIyvKan0JdFtLW7sey4/N99k2yw4ogWUTBRK2bsAtGykXPP7lIKjPOrizk3LxPJ0uOJhpk5Z3G
	NlDOVCWH3USnzZaq/Jy4qsdgaZrWF9bsI6sMTxQHAKPeL4FNJIipUBSxg7ctxfZbAQRVYwN1b/9NL
	nlebfT/+mEvhofweBf0qHzaxsPJ/XP65UQPMr5ohawW28ADcDf3vS4crJ7kVcxi+W8Mhx0puZ8EMW
	6oifLSkW933u+we2qmTyE/lh9XCkeRASaK0WXVxV9bVcC1ZC4Dct7sxSnE1LwOmokIXTl4QV/inFR
	Ldvo33XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdttc-00000000QeS-38MQ;
	Thu, 08 Jan 2026 17:34:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdttY-00000000QZh-2PZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24B3341658;
	Thu,  8 Jan 2026 17:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4428C116D0;
	Thu,  8 Jan 2026 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893638;
	bh=YfdOM3X+dex2GwYPDQAVwZhy1TpxzRQTxxNf8pg3MnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OcO32ZHR/2IhxRSLh73aJSqfw4ev5w92PgmyVkS9acY6s1BNqiCddFZlIMKHwLVm7
	 E5wvykFVKq4LNCipDJ5PzpOWxIFuFb9aH9TwYNK6Gehhdc7ofszL9H0HeGafNdcwuh
	 2YpjVUdWrXMjZ9RBm7bS2mme7ftRAH6e1Tj5+fN/D5vTv89OaW5hd1FIel6lEbSshK
	 BR/XETisXLw4KzHJaiDgufVQ74MgEUmYN/dfsSJ2kRrJE5hhy9r7fvCLrkK9W6VBge
	 VhLjMdVDgJEA2IdvJDRdZUB8ipVF7E4HGiS/8a+pWpEOg6oQEOAfVpLT6y6mCczPG9
	 xFk5Dw5fKnRvQ==
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
Subject: Re: (subset) [PATCH v6 0/7] mfd: macsmc: add rtc, hwmon and hid
 subdevices
Message-Id: <176789363340.1116194.12135010190762961915.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 17:33:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093400_901215_C4FF11F5 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, 15 Dec 2025 19:37:44 +1000, James Calligeros wrote:
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> [...]

Applied, thanks!

[2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
      commit: a13cc4981449b9108921981a5e7c8824eaaa7604
[3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
      commit: fb90c90aec3a9b7212a243f383f73a01bc653672
[5/7] mfd: macsmc: Wire up Apple SMC input subdevice
      commit: 3e9271dcb2dfdc4a98e9f6dc35c9be13276c3cfd

--
Lee Jones [李琼斯]


