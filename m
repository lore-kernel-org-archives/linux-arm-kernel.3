Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530CDCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQbDaimavDSXAjhfUfESveh1U5Rj3dLDq//yPi8sX7o=; b=zixonXCNOVt3I2KV3twucrNw8r
	MDLDMp7W4C9+Nrw02fqEN55xlkYAl7LWToFbMQWklcp1cPwhlZwsQIl4u7yJGPFv+epVoNtBt1UL/
	aTELHYyX5hBDVD3IfBKKXFkbpqJ/vfTn+YZU2sQrv9o5VW6FgnQYCfvBjIIqZIz8elBI+5yDZR16M
	yFsnKwX79qjTJOm6hTBxiPj08cZBPHMCUC46bsNpIMmnKkr7JJzzA9SWHswOXzTRSIvgUO7eOA3Ch
	jxkeJZca7h7HhTbHQ78iJfwV3j3Qcc+9KyR2Y9LX/x/yvL+B4kVO5Db87BfIXeIRJK3bcakTxOyie
	wVSr+wcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4uK-00000008OpU-28nq;
	Mon, 18 Aug 2025 18:48:36 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2jz-000000081ky-17DT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:29:48 +0000
X-CSE-ConnectionGUID: c5Z12sA3SAqo4sSCem8pHA==
X-CSE-MsgGUID: 8Rzlmlh8TwiMwWJOK25AZg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Aug 2025 01:29:46 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.173])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8BFFF4016EE7;
	Tue, 19 Aug 2025 01:29:39 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v7 4/6] arm64: dts: renesas: r9a09g047: Add #address-cells property in sys node
Date: Mon, 18 Aug 2025 18:28:50 +0200
Message-ID: <20250818162859.9661-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_092947_419019_31BA6DD1 
X-CRM114-Status: UNSURE (   8.49  )
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

A couple of registers of the system controller (sys) are shared with the TSU
device. Add #address-cells property to sys node to allow proper parsing a
access to these registers from the TSU driver.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 - v7: new patch: as sys specifier has changed for TSU node, add this patch
 to specify #address-cells.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index e4fac7e0d764..7cbba492edd5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -278,6 +278,7 @@ sys: system-controller@10430000 {
 			reg = <0 0x10430000 0 0x10000>;
 			clocks = <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
 			resets = <&cpg 0x30>;
+			#address-cells = <1>;
 		};
 
 		xspi: spi@11030000 {
-- 
2.25.1


