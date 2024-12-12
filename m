Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D181BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 04:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0PYJ7WKUwAnlFfWJXCfHd+2GPlJxAHzQS2LGo+pJDk=; b=hCiv+fOKfYFcB88IJ9bUSHkzK/
	iDOBuNTMNwHNQsfFHAP+YtQ0BcwRV1nUJ8GSpiIW0Vp3PejlzaMsTPtGQkpTp+XghSO+phZdCHuwX
	kAuOtiE1OH0INULMFQdjIUv9GJY5Pz+XxbY8emdI4Cz7AguMaUzafZwC6dX7b5O8X7f2mnG8FGe4n
	HL78O+9IzYvhiUCZ0/4Ifuq6s1ZYlpuvDSaS5+pUT/4/mkDxgEdLTi4sW+qbf9NOIilJ2poCjXNcl
	O/CveXsB/RePaKbDREaLDwQeJHuXpzL/hdZaAMN1syCksRZmzTB5lv0Ozigi94ZT2szvttqBcduUY
	vGfPdNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLaua-0000000Gu1E-0KQP;
	Thu, 12 Dec 2024 04:34:52 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLatU-0000000GtxR-2uEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 04:33:46 +0000
Received: from hwang4-ThinkPad-T14s-Gen-2a.conference (1.general.hwang4.uk.vpn [10.172.195.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A23B040241;
	Thu, 12 Dec 2024 04:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733978020;
	bh=O0PYJ7WKUwAnlFfWJXCfHd+2GPlJxAHzQS2LGo+pJDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=IMTcTnuqnmCxsOrW+zIWj45SFRoQ6c3iOb4HWubzq3zQTEaZck0FZWea8xIKHMilZ
	 W5Z0l9YE/16+X0ULiPoZ3qXx2DdN9MQKx+khnUfxtDzfiOdGVFN8XGUcdpgJSpPlTy
	 2RlUsj6XF63oQ5hRnyvfowKZQvl0UVypAmnODQAcZoomdHE0Ucn/EEZvH6Xdie+gJI
	 xiRBp8zF9tkf8FXdNcvJxjE6Mar50YzUp9poLm9AQ/Bcgvs7s7rkub0J6T0E/A8jdT
	 XsvlfpMnbf8xHEKP/BlTdh0/Pw0oDJt3CZP2THP2UjqFH5yaKe7zckdH86eMWVdTo7
	 L2YTl2R30DXEw==
From: Hui Wang <hui.wang@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hui.wang@canonical.com
Subject: [PATCH] ARM: dts: nxp: imx6qdl: add dr_mode to usbotg
Date: Thu, 12 Dec 2024 12:31:26 +0800
Message-Id: <20241212043126.73045-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_203345_114350_FEA1F39F 
X-CRM114-Status: GOOD (  10.53  )
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

For the chipidea usb driver, if the dr_mode is not set, it will set
the device to otg mode by default, so here the dr_mode has not been
set for a long time. But some testcases need to parse the dr_mode from
DT and decide the follow-up test strategy, here set the dr_mode to otg
explicitly for QA's testcases.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index d2200c9db25a..285fb7314a88 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -982,6 +982,7 @@ usbotg: usb@2184000 {
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 				fsl,usbphy = <&usbphy1>;
 				fsl,usbmisc = <&usbmisc 0>;
+				dr_mode = "otg";
 				ahb-burst-config = <0x0>;
 				tx-burst-size-dword = <0x10>;
 				rx-burst-size-dword = <0x10>;
-- 
2.34.1


