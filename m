Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4889CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vZK3vppnPXE9w+XkjoZFUqXpNJS9jy09Vj+8yd4Fjc=; b=rW/W6+jzl3sJg0CP8w195qIwTv
	Cd8XcWHgW8bdU7remXgaeHnypfktTW2hw6t6VOym/5oaYsvHetbT9jeyN4S90D9VeONHXcFkcmrfM
	dfA0Cwe0+OiCM2Wml2bHgHN/IPa3SQQSCbMwXQa964AYDvby9XE5UNad9frv2Zvryq/7XwWfKmNql
	cd5CRLjhD1d0DxuOaAK4Wy8DbOx8IgN9js/BEwD1bdTj5ECicFJvg6f6qlcYEySkIS9g+Pb5HJ5m7
	HlhtirKtnVnIoppZWFqUYVDs6rbJniXYZ93VZwo0HHFnFCC4t6H1uLZjU7tnRuAf9eUPbWI17TkLX
	AnXfQRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Qo-00000000RM7-1drH;
	Mon, 28 Sep 2026 11:22:02 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9Qm-00000000RL6-1ACB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7vZK3vppnPXE9w+XkjoZFUqXpNJS9jy09Vj+8yd4Fjc=; b=IfDOZfkIlnpP7Ba5hxOdolNLjf
	6ACdrrab22gjJo2npM95shBKfxh2L3WgvS2hg3XyTqFZqghrqhuXotZhGfgeRvv3NGWxcqG6Mdkhy
	nCse74L7xPBEcg99GxtBZzS+/8nSys1sVMyMqwq4/OyTp/rBYIzajvoQcurMqOgFJD0CXhGeZrBf2
	2EgwhmpDLyAFeFUGvqqQBov8y1Hnc3FoPrZuM+mCK05doRpy4O9npcatI3+C0RNj2MtQWfgZ7cZr3
	1G42fCTEqKeIGlIQR+IusCppcrgpgzis6WbNTXwN3DteiNJGM7TyweqrTDmyjx1IfcPKpZ0KZxzUo
	VRvDa5Ag==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9Qj-000GD8-24;
	Mon, 28 Sep 2026 13:21:57 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9Qi-0006Dd-2h;
	Mon, 28 Sep 2026 13:21:57 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] arm64: dts: imx95-tqma9596sa-mb-smarc-2.dts: improve SD reset pulse
Date: Mon, 28 Sep 2026 13:21:41 +0200
Message-ID: <20260928112143.294091-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_042200_433133_0F47713D 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

SD card spec says that at least 1 msec of power cut is needed
to reset an SD card. This is needed to get out of UHS-I mode.

In fact this pulse length alone is far too short in real world
environment due to capacitance etc. Implement a longer pulse using
regulator settings: 200 msec as working for other SoM using MB-SMARC-2.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 97726eded0f86..e376d3a9d6180 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -243,6 +243,8 @@ &pcie1 {
 };
 
 &reg_sdvmmc {
+	startup-delay-us = <100>;
+	off-on-delay-us = <200000>;
 	status = "okay";
 };
 
-- 
2.55.0


