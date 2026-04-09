Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCBE9DE6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N5jGRa8k8ho44x6kxKXfOn0v5fdgNOC2UYBlehneq68=; b=BDkNXfGks1AHA3cgUCHrlIIV1g
	ibpqXQoG6iEOvDzcZxPsutr8CpwUytGzyH//afB59hQ3W3ToLkGs4+bH/nXfiwsqO7GuDRZixf699
	JiMahb50QCj58NG6X+uXF0bD48MkiDy7NUzPgVEBmhOK5hjhesN6uzc+zAz7ugOrcSeoPQHZEfl+L
	os7JTefSkwHmlsQg++3RjoozPlEln7cvrRmazQCHlVfBQr3mBFlF87rGwQ21b1smG31NkTc5JHmiz
	aSGopLVc4lOWjdpp+TeKF1hOVqfVjKS55j/HszOvZE2hSMoPi7/8GptSs9UXmAriX9fNulxJs71Oo
	JRoapvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAllK-0000000A3im-1TZE;
	Thu, 09 Apr 2026 09:33:22 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAllG-0000000A3hz-3eXs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:33:20 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 0BC611F920;
	Thu,  9 Apr 2026 11:33:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775727192;
	bh=N5jGRa8k8ho44x6kxKXfOn0v5fdgNOC2UYBlehneq68=; h=From:To:Subject;
	b=C+P/oFvCdmVwP4vHysF2vWWDgKM/64WHarjEP+UGhuf8l2Z4GAha7Sg3Bmq1HzMn9
	 gkAVLAIyt98JV1NojyNqNxBhKoMlyZ5Xqbs1+mOfV5pXoHMZNI7lYXSArsa9pwP3Kq
	 CmCIwZpM6qBbeJ6BT9zvZarvKvuSMhnoArqO1jCGQsGhQ/ZvXlZYD0ZgT38H5LPrBB
	 WmQAfRSHk83NQ4CUyVjpd7n0XxgRoq2XfXmavDC7i/SVhVnhhCXTM8pO+D9oz7QgtS
	 MruburPXk2RTlwqfVj4i30KXX4/TBjnn22ew77kX4QhsSX6+0SFDv61C0jtYG9SmWM
	 B6hZ0te5O0vlQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-verdin-ivy: fix RS485 RTS polarity
Date: Thu,  9 Apr 2026 11:33:04 +0200
Message-ID: <20260409093307.56471-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_023319_093376_1C9B1A72 
X-CRM114-Status: UNSURE (   7.33  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Fix the RS485 functionality, the RS485 RTS signal is active high on Ivy.

Fixes: f33a1f9a942c ("arm64: dts: freescale: imx95-verdin: Add Ivy carrier board")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
index 8337c8b25f05..ff31f7c48cfb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
@@ -452,7 +452,6 @@ &lpuart7 {
 
 /* Verdin UART_2, through RS485 transceiver */
 &lpuart8 {
-	rs485-rts-active-low;
 	rs485-rx-during-tx;
 	linux,rs485-enabled-at-boot-time;
 
-- 
2.47.3


