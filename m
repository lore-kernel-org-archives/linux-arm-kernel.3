Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D8DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYD4GIrqrVmfJCfvHLws1EnNjJzkziPouq2K4gmqIz0=; b=ue1Y5dvaFYY2yBaeqFwY298Ze7
	VmW39c8bfbe3vQXuq4Jjwr9p7gr8f9t7+j7xqbMBSDWO0lZ7SOe6wGYz5w9QJ4ij9Y6szxIP6Qmqn
	hfSK1hncvnBtcUawLy7uwRVJAKsXuTVawmw5HIn5sd8QIXdJbVIMkfWANWXcan1awkUW7oNQkwHFo
	r3G55WsxGU/kgF/GHxPYUj9Jv613hW71FNMBQB5Pzh+yBECct90fAq4KXAMFznzmu1B4No4bUo3GK
	L1BJ1dXfsy1PL/s5aeWPbtkczqvQtm4crq8Nargj0zh9o3sYAKcoh61jrvfWvY6nZX/OHyZXQ3p8G
	5o1e1bWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphe-0000000Gp6N-1gwC;
	Mon, 03 Aug 2026 10:15:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphb-0000000Gp45-20Bp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:15:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDEE11655;
	Mon,  3 Aug 2026 03:15:17 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 751373F632;
	Mon,  3 Aug 2026 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752121; bh=7wKHyfp4niHGBBx0/iWDlvVSkvWtxK1CYYaYiNUVvDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XDWWD/OJndvPR8SzBLqtBJSfQWqYWHAxOTSwNBeMSeavGzEJqsl7s+PzFZtwarv9l
	 InZ866CijNYmiuH8ktqG3li09BXIwWHlVuOOdG8Jt6NsGheDlNsfjNerQ2YkviUQby
	 7d18+vROmKDOiGSrdSxECO3d5+cfx3I7netYF9Ck=
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Liu Changjie <liucj1228@outlook.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout pins
Date: Mon,  3 Aug 2026 12:14:51 +0200
Message-ID: <20260803101452.2993721-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031523_554293_869F7D1A 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

The Allwinner A523 SoC family provides two clock fanout pins, which are
backed by gated clocks fixed to 25 MHz, divided down from the main
peripheral PLL. Those are meant to clock an Ethernet PHY, and allow to
save an external crystal oscillator typically employed for that purpose.

Add the pin descriptions of the two pins for those clocks, one is within
the RGMII0 pins, the other within the RGMII1 pins, although the clock
fanout works completely independently from the two MACs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..1a95c0a21509 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,20 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			ephy0_25m_pin: ephy0-25m-pin {
+				pins = "PH13";
+				allwinner,pinmux = <5>;
+				function = "ephy_25m";
+			};
+
+			/omit-if-no-ref/
+			ephy1_25m_pin: ephy1-25m-pin {
+				pins = "PJ10";
+				allwinner,pinmux = <5>;
+				function = "ephy_25m";
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.43.0


