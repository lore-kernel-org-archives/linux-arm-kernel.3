Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3898EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 00:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gut7wHwViThehyrdZWnTmTy7cr5OmRmWE6v1BCG91m8=; b=1eNa1pR8zHBuzjdAJI7dsLyOx/
	iCZ/udQ0Z2zwd0xDAyR1cnoskoOJfxqaQZ7774cp6zp77ZVy3I+qxj32WSDYjzlAS6feUESwYWTPb
	cKvBiJQ+RtFh6VoCUY0m2NemT7q1XxlEy7mhPjueKiHHhvfYOik5XDGlvHYV5DZv0Yl/D3f6I/ggQ
	sRTKRD7bg7LtWbgu1A0XhYvZq/juwB9XNAUVKngrhbQ6L+kK8yFpb/zyW3MpEQ1XjYonSC67i13RL
	ekgyk1R9KL3LRP4rOwrbeDoWCRzSNh6Lf1jmYxkbbjJXlh4FoLWepTbxG3VyM3mSYHh3hacq3oY7H
	i4L96uqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OJR-0000000F8v3-2DBW;
	Sat, 12 Apr 2025 00:01:33 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O2A-0000000F758-3XAW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:43:44 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7848CC00035C;
	Fri, 11 Apr 2025 16:43:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7848CC00035C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1744415022;
	bh=DzedMiQG3AVGSKDf3skGJdk6le90+TdtXlLYWQkUTdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eh8SaD6bZlTSo3mbyKoWzXc3+6GygADghR41sy7/4EutbXS4eoH7IZVPy4iufGFTb
	 SbHJbNjOZ/Mx871wyI39tHCx5HbIdruqeWiFAWQza9x63DzLFvuhaToslrkH5m5kKU
	 9YYguey/utDp/YSIZW5xBMMpN0YFlIggHjtH76v0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 48835180004FC;
	Fri, 11 Apr 2025 16:43:42 -0700 (PDT)
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
Subject: Re: [PATCH v2 11/12] ARM64: dts: bcm6858: Add BCMBCA peripherals
Date: Fri, 11 Apr 2025 16:43:41 -0700
Message-ID: <20250411234341.1023279-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-11-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-11-22130836c2ed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164342_901606_9B48309E 
X-CRM114-Status: GOOD (  16.20  )
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

On Sun, 06 Apr 2025 17:32:51 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments. ARM64 SoCs have additional
> peripherals at 0xff858000. On BCM6858 the PERF window was
> too big so adjust it down to its real size (0x3000).
> 
> Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
> blocks for the BCM6858 based on the vendor files 6858_map_part.h
> and 6858_intr.h from the "bcmopen-consumer" code drop.
> 
> Curiously, on the BCM6858, the PL081 DMA block is separate
> from the two peripheral groups PERF and PERF1, so we put it
> in its own bus in the device tree to translate the fourcell
> addresses.
> 
> This SoC has up to 256 possible GPIOs due to having 8
> registers with 32 GPIOs in each available.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

