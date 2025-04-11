Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D36FC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBNn/YgNXx8CMojkJn954kIAbAZ2xHz3gtuWOmchiWs=; b=MuyNV6Wuak09w6vyctVRbPwF8D
	LRpsY1Cbqexy7AKtdVk2BTZGE3Qe+XKP0RAcQJ+OJlhP6lULR1moG9wFdyW++MLz4gw2hneZtdhhW
	BBxXPH10OXmxjDqgC9hlqdncH6qQeqil9HyoYzsTZ5o4bL42TF7Azbif1+9+AI4Q/onTgvTRir3F7
	pVKPK60HSRAOstEfu0TglSVNGH8pcTUOE9n7SQeJSssouSb9zpIvoFRKJJ4uhHd9g6j/KucLJeQ0m
	2iJhxwbH+U97XifvQIlrvICJbVZoyfBYbHs9MAOsmMpI5REU1krD/Px8dRPzJwyI6VCaMDHHdygOn
	keLIGLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OAX-0000000F8As-0Akv;
	Fri, 11 Apr 2025 23:52:21 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O1Y-0000000F6x1-298M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:43:06 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6E0E7C004318;
	Fri, 11 Apr 2025 16:43:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6E0E7C004318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1744414983;
	bh=UbDyCoR7IH0MBQoPj6zeb4U55QoxSgT8OH4P5hdg8Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OlwXKa6mSMP76x8PBSbi9WV3NgRBiCyuB+y43CpkJ+QqpZotbCcv3cePiUMN6tmvG
	 ScuYE1tYgX6ne+6lvIEkDvQp1GmLRzRO2HTNctc78m5qbZ8UHfyU7AD+KarGZL9GS0
	 nEP8PjbFrn+p5+wFNbIlPJDFGQiToorsQ/YnFpQM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 0317E180004FC;
	Fri, 11 Apr 2025 16:43:03 -0700 (PDT)
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
Subject: Re: [PATCH v2 06/12] ARM: dts: bcm63138: Add BCMBCA peripherals
Date: Fri, 11 Apr 2025 16:43:02 -0700
Message-ID: <20250411234302.1022809-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-6-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-6-22130836c2ed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164304_616674_69754080 
X-CRM114-Status: GOOD (  13.76  )
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

On Sun, 06 Apr 2025 17:32:46 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments.
> 
> Extend the peripheral interrupt window to 0x10000 as it need
> to fit the DMA block.
> 
> Add the GPIO, RNG and LED and DMA blocks for the
> BCM63138 based on the vendor files 63138_map_part.h and
> 63138_intr.h from the "bcmopen-consumer" code drop.
> 
> This SoC has up to 160 possible GPIOs due to having 5
> registers with 32 GPIOs in each available.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

