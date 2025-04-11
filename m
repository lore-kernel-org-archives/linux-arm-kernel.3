Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDEFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 00:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdIEitjgsA9oOEckjrK7I77J8/NVHiVy0i2KeSwkmiA=; b=EuBs8TABXtMXfrIEbeDWIKVcbQ
	/Kay6ML7H5d/HrjIcEXbU+xOTGQvFPt6jMjrimTXKpiPvkC3R1CcFv07q3Z8UmEkqqU+YKCi1JUCG
	rtQI1rTS4Si3y/qzwsXL1JxOU5YsX0KwLRSEzMk+gFxrH7C0CJKtAJeqY5scW2pUlqYMDAOtwtsqr
	9kp4HUYgKV5K4ehDrra1OY0j5igAMMI7noQ//LTCz5W8Uga4JLFLWBLyj3FDEo7swqNKfklhv910c
	WomGr+T9Kqdtx2lXwSemku/AakUnBMJqWm9jA8i9mSeo/HOho2Bj8XF0J0dNdMKD+xaMz+bUG3fwh
	Nb14PyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ON0-0000000F9BO-3nlK;
	Sat, 12 Apr 2025 00:05:14 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O2j-0000000F79d-0aD7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:44:18 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B3280C0004E9;
	Fri, 11 Apr 2025 16:44:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B3280C0004E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1744415056;
	bh=fEKOzKlvelgdVgB8dlcuUPM3nk96uyOOonGkap/UOq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lX6+nAd4pejMDMA7GYM46vJ5l7AgaTy/INmtG6LPpDwJ+qSw99OnYMCJYYIn6aDOY
	 NO7ucUnoOmdXKqtfr6jFZhp4ULjzsDV7AmhB0kEh6DPbVlSQJESArsdWGj0/gG0P+v
	 ju9A/jp2B1yLNkj7072QO7ladG6rQngNn6xEFoPU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7DB48180004FC;
	Fri, 11 Apr 2025 16:43:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Olivia Mackall <olivia@selenic.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 12/12] ARM64: dts: bcm63158: Add BCMBCA peripherals
Date: Fri, 11 Apr 2025 16:43:46 -0700
Message-ID: <20250411234346.1023364-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-12-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-12-22130836c2ed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164417_213200_F8407CE4 
X-CRM114-Status: GOOD (  17.25  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 06 Apr 2025 17:32:52 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments. On BCM63158 the PERF window was
> too big so adjust it down to its real size (0x3000).
> 
> Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
> blocks for the BCM63158 based on the vendor files 63158_map_part.h
> and 63158_intr.h from the "bcmopen-consumer" code drop.
> 
> The DTSI file has clearly been authored for the B0 revision of
> the SoC: there is an earlier A0 version, but this has
> the UARTs in the legacy PERF memory space, while the B0
> has opened a new peripheral window at 0xff812000 for the
> three UARTs. It also has a designated AHB peripheral area
> at 0xff810000 where the DMA resides, so we create new windows
> for these two peripheral group reflecting the internal
> structure of the B0 SoC.
> 
> This SoC has up to 256 possible GPIOs due to having 8
> registers with 32 GPIOs in each available.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

