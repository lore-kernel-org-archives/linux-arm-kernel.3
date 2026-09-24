Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822BBC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdA69aMb2gXgOJuAm3klAA2htUXJ2SFBE/05Yps+PkI=; b=1MoW/yVx24ciJphpwUqbG9Z52Y
	ROPP/jP6bWVapVr2yDOG+stXgm2fdszn9otyX2RQPL4hxXOqKqgpFgcOITI54g1gkLJKjIFmj6bZI
	Y0CXqcXxcABi9FEMfJqYcSDVMcR+POhvpjOykcClKtUKbWHsrAjYwSNWZb7ImXz7n5FQtx9/kV/8L
	WWCrqJp9FpKoVS3pFD9JEGgOiMjB9gMwGE0OGSUBgsF1HscafbbZLri5trd8nGnN8cw+f6wOntYC5
	ZU8TQGJVU92WIY4VhL06bWMUcrdjpeqqMAv9chdxKW2IzYATiB87Kp0FI+0/pa36HH+t3/UgnBrmj
	/VBt9osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mo5-0000000Bfxq-0cfQ;
	Thu, 24 Sep 2026 17:00:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mo2-0000000BfxJ-0qLL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:00:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FCF81A0FF5;
	Thu, 24 Sep 2026 17:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5C4060738;
	Thu, 24 Sep 2026 17:00:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBD3310328253;
	Thu, 24 Sep 2026 19:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790269210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JdA69aMb2gXgOJuAm3klAA2htUXJ2SFBE/05Yps+PkI=;
	b=BUzNj49uALFRrh+wUXwPBd+xXadOvLuhaJxQzws2Qz0SZBEkULNKoSlvHbnmsliUZ8TbY/
	4YxlbJ0P3VWY2xhsoJ4v+f65ffYWYHuihjrKol1GWrmuRBNeQKO6UQTSQHO55S6Ovs0t82
	c4iqFdRVxAc+SeYIqd6i2SPBmSKi+/cLl+R0BoZIqWQaXwK/ni1i1ywNQl+Ij3YkdAGDQ2
	74n30RzR+7JQm6a/vzjNhazWcsk+M4js/VZ6jj8QRicav8nvZYYxQh/Px3mu0LhVGW8DOm
	m+4gYaFu2hQ7Ai55GUvW5yp4r6xqRjYetuSrP5RLmWtFwvWEjoLQBi+x6HZgoQ==
Message-ID: <1bd67ddc-4910-4f7f-a2fc-21d9c58cf655@bootlin.com>
Date: Thu, 24 Sep 2026 19:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, alexander.sverdlin@siemens.com,
 jan.kiszka@siemens.com, ayush@beagleboard.org, robertcnelson@gmail.com,
 upstream@lists.phytec.de, francesco.dolcini@toradex.com,
 leonardo.costa@toradex.com, matthias.schiffer@ew.tq-group.com,
 stefano.r@variscite.com, eblanc@baylibre.com, msp@baylibre.com,
 miquel.raynal@bootlin.com, mwalle@kernel.org
References: <20260910134409.1713610-1-nm@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260910134409.1713610-1-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_100022_393525_988378B9 
X-CRM114-Status: GOOD (  11.57  )
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

Hi Nishanth,

On 9/10/26 3:44 PM, Nishanth Menon wrote:
> Now that all relevant drivers have are ready, convert the
> TISCI drivers to modules. This impacts all K3 platforms for
> boot, recommendation (based on empirical evidence) is to use
> deferred_probe_timeout=60 in kernel command line to allow for driver
> probes to complete successfully based on the initrd used.
> 
It's maybe a bit late, but I did test your patch (linux next-20260923)
on J7200. Indeed with default deferred_probe_timeout value I got some
deferred probe.

[   16.869217] platform 2830000.serial: deferred probe pending: (reason
unknown)
[   16.869241] platform 24c0000.timer: deferred probe pending: (reason
unknown)

Using deferred_probe_timeout=60 fixes sometimes deferred probe for
24c0000.timer, but never not for 2830000.serial.

[   68.582069] platform 2830000.serial: deferred probe pending: (reason
unknown)
[   68.582094] platform 24c0000.timer: deferred probe pending: (reason
unknown)
[   68.582128] ti_sci_pm_domains
44083000.system-controller:power-controller: sync_state() pending due to
24c0000.timer
[   68.582144] ti_sci_pm_domains
44083000.system-controller:power-controller: sync_state() pending due to
2830000.serial

But switching all TISCI drivers to 'y' fixed them. Looks like an
ordering issue.

I also did test suspend-to-ram, it works as expected. Fun fact, doing a
suspend-to-ram allows to probe these 2 missing devices during resume. I
guess it confirms a timing/ordering issue during the boot. At the end of
the resume, no device anymore in /sys/kernel/debug/devices_deferred.

[  124.053571] Restarting tasks: Starting
[  124.053861] Restarting tasks: Done
[  124.053907] random: crng reseeded on system resumption
[  124.053970] PM: suspend exit
[  124.058833] 2830000.serial: ttyS0 MMIO:0x0000000002830000 (irq = 700,
base_baud = 3000000) is a 8250

Best Regards,
Thomas

