Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252FBCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4OdqquRkr6UmIvev0wHEbWO3nZAjp+PtnezGPRgzOo=; b=R4MW2ab6W0tRUH4GhG0XyhXkuO
	w29KfRzDsPcFPQ8mRhL0mLWvMSJUi/LXV0c+xa8hEEMogvj5pqz+Lu7vCgalnteDONxT/0uGgdlYh
	XbyJzzUBKiJop362I4t5vEygKbX3cvbdqtD4xFbUh3zn8kTI0wYzj+oLJyMf3jkv2OshUb0tbp6R2
	Xg+IkdDsg0fvLawE/xixmVEZL91iUpmJ+BIfdCeYFNVBAb8o7d4NzYprl7C+lUqkifcQfEC2LlztJ
	K/JXY5vm9HKAmXIF/bc7tS0bbO6z+aYoxm7XLlq9TyFchGGAe49mxwmo4djUfEO22gnAR5imCQekh
	mzXbwDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkEa-00000003z7S-0GMQ;
	Thu, 08 Oct 2026 09:16:16 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkEW-00000003z6C-2dLY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:16:14 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0FCCF200582;
	Thu, 08 Oct 2026 11:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4OdqquRkr6UmIvev0wHEbWO3nZAjp+PtnezGPRgzOo=;
	b=Y1Yiio78FKUWT5PqDICsj87JHuQ/9IUnAOENLD8AkAIwceLaYGhz1uf77oxWXPiGydupND
	o4PsYIdxkslPktgcEdnE7+rUjJblLJ5/v49kaJlUZiG4nKuXULLKyusnQPxz+Nhp1apwMM
	sTf/mCeaalA3zdvlpXRbs8KE8AiLpeMQs71ywfRBoGNnW8lbFgajeAvtSxB7ZYc3EVgNZ0
	wW4F/mccUsN6omzQHmvYwVc2WNrMls9xjMUsxzs8wJm1SjMgW6z9ESG685YfIcDMk2HoBl
	xSKWFPfcUMiu5W/E+ovdvAmGFTPf1N7iImeLD1IATOiQFAOFjkrfx86ww+TXnw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791450969; a=rsa-sha256;
	cv=none;
	b=Avj3vfltkwy+Q+7x3yRblRREjCIDnO9u0mmbfW5a5zH+f1tHTv2adixSIGvHVnFqK0ZI8R
	ihSFPjYJQh5xKUGoH+/0TcHV6S4apbUn0SPDRE0Wzq689LevOCY7ZrI3CiX7BaiNSnIi5+
	2B0ZNyI/aQIwyKOi2b/sE+94YLyj1wRYt/Nv5AN42cQyo0Qe9nqxWaKvM1RK78TrC9USyx
	I+p6dq+fBzl8FVayPBSX9P/YrSn5o+41WjmM5DTyysajLOfhoMd+kTqMqrdIedaZf/mgsP
	bfbq8F0uHibOks5YQHJf69kvI3eaa4azIXyQNaA4Hfnqk9hr//h7JAj662cRKg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4OdqquRkr6UmIvev0wHEbWO3nZAjp+PtnezGPRgzOo=;
	b=C8SABDphPBj+iChaaeaXgJjbtLHdbJLTgHUOkmp2jSL5boWe256V6ucUtBPrmgiqGHBBdF
	+Vy1LTR8naog7qtI5bCj2EhUtu+DxcQ6OlbOtCbxhdaR48+9nb8aYMzVTJ9XttvhkWo0z8
	7KipReyEJg3KlAaLCvTXzBmtMv8Z/kD4Mha2G5NtMFP7svxic/F93fdbYimIoDGDsvRAZu
	5s7Bi9hnJw1lfwaNWp08gK8KF/+g7xvEIoEkfSxkXx76SRFkNWeqRuiNUaVAsu0ECawlNO
	HW0bWEwM1si1fdZirFZZ0BqWdjSUeL/zF5EthW0Hlp1+VVGzq8JyGXi6Z2JKow==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 08 Oct 2026 11:15:59 +0200
Subject: [PATCH v9 1/3] arm64: dts: freescale: imx8mp: skov: fix sort order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-1-11fa90f531fc@pengutronix.de>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=8fA+PcBqCWGEj0dJDDjO6qBFZFaRQnYFP6vrrHwXRlE=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bx+AhVi/dbsy9Ffe9eaz5rafz7H/m3lJ5Vzfzv2Zl93
 yag0Xd5RykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIlwWDL8s37seuJmg7uTo46j
 8HplY/0oZdfiXZevztwwt7tIfP4ybYa/ckuX3tji6f50esDpHV0/U3Sv3/x9qthp4pYtBn+ur3j
 zlBsA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_021612_840058_7E706493 
X-CRM114-Status: UNSURE (   8.66  )
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

The imx8mp-skov-revc-jutouch should be alphabetically before the
imx8mp-skov-revc-tian variant.

Sort the entries in the correct order.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf5..49025ae465f22 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -475,8 +475,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb

-- 
2.51.0


