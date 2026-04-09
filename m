Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6AEEA3C23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OV2GCA32gAnlYxlCqmA6yqtgsz4STfr5MZ9WlxqJfMk=; b=L3OlBi6W5G+h6+BGOLcj9ZvZNx
	OEZ3oZa21IDDcA82Sb/5l16PNmQz0hVvbjakeU+y/NNtB6TTmH7a3wqALDRhwL0l2z1j/wQiErIB1
	05BumbFbBCMBobmF8e3FwjFCATvcGx2QGjX5WOk/yNtk98hpLJn97WWsxxnJ5/cqQCw9v4ih3qZct
	9johPvnQ+uhplowOaUJusbdsUK1OgBN6pp9i4JREdGhi0yoKyo/zgbEvPnxve6y1VsXKYjHGhxEQr
	1LXs4yOBdL59EhSZU550pnJxnYnj2lcfS84h8mm0kvwewlHJEL1RdBBHsM+8cEr4zZHnx9XVTU1jI
	n+FSovbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnIf-0000000AExw-2Ojc;
	Thu, 09 Apr 2026 11:12:03 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnHu-0000000AEwh-3IvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=OV2GCA32gAnlYxlCqmA6yqtgsz4STfr5MZ9WlxqJfMk=; b=M7s5GcvUow4ygO1jbwOr5E8FCw
	Y2MXGnfo0CdgEpTYLMzuOjqzntRwVL607SqqGEpa7pHcIaSt82SOgiUnhDyt8dXYGeF5Dv1SGty5x
	vlrY6ARm/5O+e2hsmvllYZCLMk+y+otyg713ZN1VY53Ff2Ra84I+Z6uSbrmaIvutUCa7IYjrndIVY
	BXxiLvqQaGvZSbyJj4L3z1BUS4794RwZMqD15C9BGR9wnccWtoJW/IiF2DHBgC5IjnfVMlmfBBRCf
	DPsu5zkMvJlYZ3NLicYdCBxfl4JBzmxMNVVfxUKXtjouMChINrQuOaUy+1Wa52MZiWdCluDavyvyI
	MkSux5yw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAnHq-000Jcc-2a;
	Thu, 09 Apr 2026 13:11:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAnHp-000GvU-39;
	Thu, 09 Apr 2026 13:11:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
Date: Thu,  9 Apr 2026 13:10:59 +0200
Message-ID: <20260409111100.4177389-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27966/Thu Apr  9 08:24:43 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_041118_555852_1F832437 
X-CRM114-Status: UNSURE (   8.30  )
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

Add #io-channel-cells property to the ADC node. This property is required
for an IIO consumer driver to work.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Use imperative wording in commit message

 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 24541fdf49ceb..d2bfa08b5e767 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -951,6 +951,7 @@ adc1: adc@2198000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_ADC1>;
 				clock-names = "adc";
+				#io-channel-cells = <1>;
 				fsl,adck-max-frequency = <30000000>, <40000000>,
 							 <20000000>;
 				status = "disabled";
-- 
2.43.0


