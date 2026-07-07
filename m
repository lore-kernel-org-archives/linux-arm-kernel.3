Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51AFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v9NXiIWq97CSEahGJjuUvI29ZGrwLPU2keRY+33LcSI=; b=2P2qNuJI1iOXa1uwi/b49LLROp
	a2l3dy+6TiwAx0psOl7oNyEG4lQiA80T2YizyhPVYf+AZQnQXBs8vBZpkJdUUhckrSbuzBBAAzjkR
	OMYNAiKxXaC9T9bw/s2/mmHoOTY6qCQ+81qzf7ZzWD1Wz4NoVdspf/Plbz3DgBVoGy2jhWThuWkRc
	4PGWzAnusyrJBP5KAAuBXo4LIWG6Naz9KlkkaM/c2v/Lumic2HesP/njyIzQsc+Erho156z/jL/jr
	0SbIXAkj3xRsedoX7eNploBOKADJPczmR8fMd6kAKy09yTu10cWWGDgL8SZNn44wKCswTYjXmvnuA
	i19TjNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2J2-0000000EeGo-3hLE;
	Tue, 07 Jul 2026 09:41:32 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2J0-0000000EeGA-2BNI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=v9NXiIWq97CSEahGJjuUvI29ZGrwLPU2keRY+33LcSI=; b=mPJhhhlI56T75SYEhfYWfwOqEq
	kJoGB6le84rtACnnIWrrYt6AjvnoXy3upKM7sn3Qsf3UDVv/fNc1VS6GgTQ6aVR+Xfei3Ub7PW186
	YrP9rEDl7Jw76r9ZP6k8rQl2gaR6dYSZkmRY/8ePA7zyfIoDvajISiadFJZQGT44rh3CIjKqYhSkJ
	mC7t7+Vn/3KHJOPORzwlVcO59kjt7unu5a7AkfHC81Q0WoMSaLsX1QCtMxiVrAjrOxkcpRNXN1HzS
	cxlvS8ho0dgWyyFlqYf4TN4ZjD9924uuWKgJEYI4cXC1qU5UTzMs6BB8Jtfr5Q2Slm/XQzOPOCIVe
	MX5cXaGw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2Iy-000OVg-27;
	Tue, 07 Jul 2026 11:41:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2Iy-0007v7-21;
	Tue, 07 Jul 2026 11:41:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx8mp: add missing #sound-dai-cells to xcvr
Date: Tue,  7 Jul 2026 11:41:25 +0200
Message-ID: <20260707094126.1738410-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_024130_566552_856F534B 
X-CRM114-Status: UNSURE (   9.14  )
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

This device is used for 'sound-dai' and needs #sound-dai-cells. dtbs_check
raises a warning regarding sound_dai_property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5ce2825182fdb..9cf9f6f08654d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1599,6 +1599,7 @@ xcvr: xcvr@30cc0000 {
 					      <0x30cc0e00 0x080>;
 					reg-names = "ram", "regs", "rxfifo",
 						    "txfifo";
+					#sound-dai-cells = <0>;
 					interrupts = /* XCVR IRQ 0 */
 						     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 						     /* XCVR IRQ 1 */
-- 
2.54.0


