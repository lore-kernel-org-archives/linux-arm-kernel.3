Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD866CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Axm0z0t9Vgbtkl8tyQP29sbUaRobPDCmblkBy/kM7qE=; b=1JfdoXe982zIDxMdw21yNsBkKn
	ZZKI0pYwa73R1LZV1IaK+dg9rMaX09FRGkkpxbQN1LKBLHEgjUc/GPUou6lQo0jj35gLGKTxtMXVy
	s1y+AZrEhrL7d6Z4Rs79MbbLADBamei7e0mhg3Vse168uvUVCR6jEwsgKhXsi7ntKxgD2J5gXw2H1
	otbq0ZHZYZsxbPUuXgVRx6f8y9y9z2ARo1ZpSZ17r/v+bkTuX1DFQ7CcbKImfRANnn6gVc1DxzuRn
	lmSRsaKXFQbTylH1HtWI/H+aVIy9Y5oc0chyYQEQ9fhdabRVoNUcyd5zv8qvPkBBAaU/I2YzlSqIC
	azc0Nthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFurA-000000099ip-0kqH;
	Sun, 11 Oct 2026 14:48:56 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFur6-000000099i7-3XaM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 14:48:54 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D34E37A0096
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 10:48:47 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 11 Oct 2026 10:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791730125;
	 x=1791816525; bh=Axm0z0t9Vgbtkl8tyQP29sbUaRobPDCmblkBy/kM7qE=; b=
	ETHCpfefoTXBhbd3yMvINgcH/G/9PfwGVXzfUDRqRii/8DEexcC+3Ky8Y0l6vkYg
	QggUezBz9Gtt5fFgf6Jx4ze+QPbYG4ssJvZtEdB/4fy5DpuAIAXGmITrM5yx77u1
	Zoq3IfgswEYzMIPszRqPASgrnH4sYBSyEynr0odpWivB1ohfdmF2j8XjTnSEyui+
	YfVoxx8vgO/YQrIw0CMztpKslY+rDTETcMhBkO4pmhLrRUtD6ORMmkHRlUldj7Fs
	ZV7SrZPc2AtVE9yU4TiatFKpeemOOlYyAmBeM3QbreziujVRrUJxcOeuPZ02pEUJ
	X3EuvfXuyot+Ea3J4scWIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791730125; x=
	1791816525; bh=Axm0z0t9Vgbtkl8tyQP29sbUaRobPDCmblkBy/kM7qE=; b=x
	9mUYB2DFiOZdGDaD3V2M2QFlx2odui9k/Yhpv9B8SNEwPSiNOXjogDOoYZlZCg9K
	iBibOJTHP8teRui6Pz/G1XUGqgZbxBAioG/4f2Zg7VY/REoBKn3+sk9hPaSJpdcY
	YDJ9jrZID+FMw4ZQlbG9CugFgNFln99e5UKB2AXVwxHI6a17L6e9DIqlG8iuJSAS
	85yU5zJ64qJXy4L6XSLXsyvJ1renbeZh9tZio3BBj9UoRYbRYvSA9P//ckApmV4+
	SZ9TwDiv0A2tAJ0Fj5QHP3QZI1t8+m10AMHBWTrXUUmqgxu6l/w/qkj3mt6PAF8i
	yg73seal00gUWzFL+JNTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791730125; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:aZWeKtDCXHxWUdk8K5RQTF7TbHAqiRK/rJFEgN4Z+k6VKe5
	NzwIcgtr7qr8UrNAlJQEGJdj2thwsYmKxobrrOzzE8wXog+axzmpd1f1QM58BT+J
	nh6S/WJaYKQtH33YjnoQVgLya8K5mCF1TkqDT5NitQlq9/J4eRInJbmtI807ceDF
	tj52C14OnqVnPIqKQ/8jfgovl3Gd68bQs5T1IXYQOfGIeq1+vAy/mA6y7n4cKTgp
	gGKcFz5AlFWGlc5N5Dl5yoOM/hXmD4Mvt7nl6hIjTwm4Z378eu9MVH6n+/iPqlP+
	Nkb6YxiP9LpLIPl4m97PhmtI+FwoRo3cxoU7FyQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Zmt5RHXIZklQWTY/vXNbYxeV+ENmVvZ3kSVV+iZ1wD4=:gKTlSyqYGa9oJGFDgtRnbCQv3mFMbEsDBXP0tOGtHTg=;
X-ME-Sender: <xms:yqHLaoXQa7Ow-npIXdF-5wc25Uwr8OFSSyPJ6YXpc9WA7Yygo8maOg>
    <xme:yqHLanYaaq4PexKn8hQaLNqzkqds-Upn18RgIYy3541wuyNMpEM1emHLpfvxiIHEJ
    vQLCTg6T7hYAgP32K9nJCysnftwePWdy3umouUimDjUPwI8g-LhKWaV>
X-ME-Proxy-Cause: dmFkZTFlvCzuizRCxOGSyJ7dExCHkaPBMfn19wBrO5Fu+RJgyuZWAXJOoOkxfnVSdoV+7f
    3RO846yTCg7R9FEo2kMonMz3w171iaKzhUsBBonWUjLdBkDYODVwgLg2DJWROvM3st/eut
    LjgYPmY7fUO4KjV/lFiUDyy5y6ySWxganQ0/mv3+v/I+Hrs0EFgj/z/45ifI3Cq4Iew5oP
    /eEMgNfAIKSGAMwrQxiDSCT4DuupHQlm52sz8m5Tfu3IyTagtggaS2GyGBs9Sw+mkYUuBo
    BjyxCwh08+ZeVyzCZcHi80ecrKAR3r3ADQvpMif/0MfxnZyGM60ce3ZwhcEvuVr3EEBDuD
    7hf4CaXC1jT+MvxJTdLKEUTY4QmG4r0+fzCKLwcmsbNZs43vU3AYw+yzln3aD9tEQ2CeQi
    PrKRQmJ/oJQbK1XuBdhgyC4hn8YG2kvC7OfNx9RpsDtnQXAiKIJVH7VJkRuzg9cLEYDbWg
    qow8C3pogXiB9a5UTwXsIhdFCIoC0VRY8X6ySsSNwhXOmEubSTQhLcxSG0kQq6owZABOfC
    HOjzdtDOg4wfa/HLFpDv4899q8HYXcoYKvdQi697NMBpvitqrbQS/ZhMAvGOFc1qwX8zvU
    JLldm/v1ydrXBfIL4HOkhv8YqQ4P8BoGDaKIJzrp6P8CO/UtZDM0qrLhG/Rw
X-ME-Proxy: <xmx:y6HLagsA1ptQJ4tp75WK1KjmNQAQljQ28qfdEEldavhBvQs99Q3Pkg>
    <xmx:y6HLauJU-8CL8DLBaZ3d4ZV2xbmp4jHVGtNLN-vurl5Hc4MSfaq3MA>
    <xmx:y6HLap8EU314MwOaBvAmnDV978cv_sA2WiRxj5Ajw5wVGt9HDVd7tg>
    <xmx:y6HLanwxYWndpDEhM0SoL357i2AbJ7itIlH4_wCMA2sy8lmRGp80ew>
    <xmx:zaHLasfPBjj3YQyAWkpwc2wbkpnYm-vhJFvnKi5GrzsCh3emZKAgDbkC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2B6FF32A008E; Sun, 11 Oct 2026 10:48:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-dXEK1mihoo
Date: Sun, 11 Oct 2026 16:48:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Message-Id: <2bebabca-9df1-4ccd-afdc-3a1740c05061@app.fastmail.com>
In-Reply-To: <20261011010223.2379347-1-ghahramani.navid@gmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
 <20261011010223.2379347-1-ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when
 requested
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_074853_325153_2B940C21 
X-CRM114-Status: GOOD (  24.64  )
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

On Sun, Oct 11, 2026, at 03:02, Navid Ghahremani wrote:
>
> Thank you again for the suggestion to test arm,outer-sync-disable. I 
> have now completed extensive hardware tests on the physical ZTE ZXHN 
> H3600 across multiple bring-up orders and load scenarios, and 
> unfortunately disabling outer-sync alone is not sufficient to prevent 
> the interconnect deadlock.
>
> Here is what I tested:
> 1. Added arm,outer-sync-disable to the l2cc node in the device tree 
> (zx279128s.dtsi).
> 2. Rebuilt the kernel with CONFIG_CACHE_L2X0_IO_LOCK disabled and 
> completely removed my custom read lock from both cache-l2x0 and mt76.
> 3. Netbooted the initramfs uImage over TFTP into RAM via U-Boot (zero 
> flash modification).
>
> The kernel booted cleanly and confirmed the configuration:
> [    0.000000] L2C: disabling outer sync
> [    0.000000] L2C-310 cache controller enabled, 16 ways, 256 kB
>
> Both MT7915 cards enumerated over PCIe and initialized firmware. Here 
> are the observed results across the different test scenarios:

Thanks for the detailed testing!

> Given that this is a silicon crossbar flaw that requires software 
> serialization, what would you recommend as the cleanest, most 
> acceptable way to structure this for upstream? Would you prefer keeping 
> the serialization lock as an SoC-specific quirk in cache-l2x0, or is 
> there an alternative architectural mechanism you would suggest?

The best idea I have so far is to delay solving this problem and
just upstream the patches that are not impacted by it for the moment.
Even if you never upstream patches 2 and 3, that would still
get you much closer to something that works out of the box.

My hope would be that there is some errata workaround that you
can simply turn on with a chicken bit in the firmware, but if the
vendor BSP has the same approach as you tried here, that seems
a lot less likely.

You can also try to avoid the issue in a way that trades it for
overall performance, e.g. using only one CPU and turning off
the L2 coherency management in the CCU, or leaving SMP enabled
but turning off the L2 cache. Not sure if either approach would
work at all, and the performance cost may make this impractical.
At least it would give you something that works reliably
while you can still use a patched kernel for better performance.

One possible idea would be to use the helpers from
lib/logic_iomem.c to register a special MMIO range that takes
care of PCI MMIO regardless of the PCI device driver. This seems
like a cleaner approach, but I cannot guarantee that any patches
for this would find consensus.

      Arnd

