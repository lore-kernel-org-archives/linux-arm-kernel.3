Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663E3E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mcTkKmanEr2PwIBSDfsP1SV1PVVrlfYHu7XxJmfmhzM=; b=N+A4ZA7fETc7DsDTgC2Zht2O8S
	VPfIfJbo7KADc//ZwWYKLX1QleW/iO9LON8dNa7hW6LMQ3oruTPOwJGDGX/DpjbLEeExBLLkTlIKW
	eS9nJ1OG/V18cqEWAA3Y8+Mqb1UwPZIv+3bfIkdSsNWdNxa8dai46/5SnZfeqe8hdP9gOPihSY01N
	+zeRhDNpozUcN4G5sHEWwRQ6bu55n05BLv9YRR17fFqA1XCJ5eRyT8w9XqVJ3xdc56TSSD57BRLnz
	588AD/UMQ9PgaDvgRyefZiUwu9MLgZG7dQKKfETy6d51ZAbX4MyL8kn9eapfG+8vg34Kyz7DQ+Qn7
	n8DHB/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIujP-0000000DcYN-0QFf;
	Wed, 04 Dec 2024 19:08:15 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIui9-0000000Dc9K-2FZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:06:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733339209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mcTkKmanEr2PwIBSDfsP1SV1PVVrlfYHu7XxJmfmhzM=;
	b=cg5XFyfW8RsFUMmzJaSf3HHB/rVwd2UQLS2TVrGKys43akX+iFMEvIT32KNHIEU2QXtI3t
	8Zqmlyn8LehNz5qEwULhK2wAzaCnUCTskV+Cm5/+VpVs7uKbn4VXyGJV1TzxmUiBhnMew1
	Wbm9SHKk6CnfkRNSnkr9CEDHfBCQPR0NMknfEXi5BEgUpEcbelwcVaX0+xSgspFjvaFtT/
	y6MlJKRJe/rZO4z/gvY727A029id+Cy0mpmTi6PNXryvkyK8lzG7IGAOoOc/1xPKd7GpQS
	kQQKXPZ6wH1pp4Q5otv/O4x6w58mkWZVz8n43NGknj5ccJ5Omte4XdnHrqjPVA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/5] MT8516/MT8167 dtsi fixes
Date: Wed,  4 Dec 2024 16:05:03 -0300
Message-ID: <20241204190524.21862-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_110657_712696_31A09A3D 
X-CRM114-Status: GOOD (  15.18  )
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

Hi everyone,

I've been working on mainline bringup on an MT8167 tablet I found at a
junkyard sale (lenovo,tb7304f) for postmarketOS :3

This first series consists of basic device tree fixes for the MT8516
dtsi that the MT8167 one inherits from.

The changes that follow add support for the MT6392 PMIC, and that's
mostly been implemented by Fabien Parent back in 2020 and not merged:

<https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201027181157.862927-3-fparent@baylibre.com/>
<https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201024200304.1427864-2-fparent@baylibre.com/>

but I have a couple changes on top of those patches (like adding the
missing mt6392_set_buck_vosel_reg). I'm wondering what the best way to
get this in would be, should I squash my changes and submit the "final"
patches with a Co-developed-by tag?

(Similar situation with DRM nodes, not merged due to "concerns about
the driver architecture" in 2021, now missing GCE/CMDQ mailbox props:
<https://lore.kernel.org/df4c57f9-115b-c4da-e656-e4bdec62c2d7@gmail.com/>)

By the way, is anyone familiar with PSCI cpuidle/hot-unplug issues on
Mediatek Android devices from around this time? Specifically on this
tablet, I can't make the cores come back from suspend. I have
investigated local-timer-stop and arm,no-tick-in-suspend, Fabien pointed
me to the mediatek timer and its required clocks, but nothing helped.
Trying the psci_checker, I realized that it's not just suspend: they
do not come back from hot-unplug either. Initial CPU_ON on boot is fine,
but then after a CPU_OFF they do not actually come back when CPU_ON
supposedly turns them on. Now I can't help but notice that the only DTS
in mainline for a device that came with Android, mt6795-sony-xperia-m5,
does not have any cpuidle nodes in its SoC's dtsi either..

Val Packett (5):
  arm64: dts: mediatek: mt8516: fix GICv2 range
  arm64: dts: mediatek: mt8516: fix wdt irq type
  arm64: dts: mediatek: mt8516: add i2c clock-div property
  arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
  arm64: dts: mediatek: mt8516: add keypad node

 arch/arm64/boot/dts/mediatek/mt8516.dtsi      | 21 +++++++++++++++----
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  2 --
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.47.1


