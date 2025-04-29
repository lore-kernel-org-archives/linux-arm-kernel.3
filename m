Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC270C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBbGVyieOghmZLlg7Pw4NSfP9F5vBz10sBznCLal1ig=; b=JfQrugL5JXbYHwCuUFcRSmHcjN
	JNxXfXVh+omSppZf4XpRKVL/RzDVFwVbhVWo/K7WpEjN6lFZLfa3a6Zre5FtYxUS2Y0J55PjgQaSj
	t+GE3VaGq3/CgVZEplj4Y98oTi2ak5i0MA37sY3hRF6mHbGqaU4Cf6bUUYjVN2AQ7TyaZ4WA4pzl7
	RphUprwJS3Zr7GaxC5JaS9qRmAwnZv/HK0CSP7I1tdUeEu5sP7DTGurVlEtcWZcrKqU8BINT5vtsK
	I0/REzrLasC7kAcq4jhzbj4zAAcdCVlXrUPmmhQ7B13Tw04Y1+x9qlj8D96ufy3Z3SpRLH9bW+r/z
	w9bw9PbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jDW-00000009Sju-0jSe;
	Tue, 29 Apr 2025 11:33:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jBX-00000009SI5-17Ti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:31:37 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9F8ED1F9F1;
	Tue, 29 Apr 2025 13:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926291;
	bh=XBbGVyieOghmZLlg7Pw4NSfP9F5vBz10sBznCLal1ig=; h=From:To:Subject;
	b=eRiVfhHs2QSe53VlR58VXQG0In7uHtNC4kvqKmMYJJoFycv/mOzcXiXtJ7PzPPPER
	 /CCXNlpTWsrs/B4eIUvTJvc0Of43IR99watzPwa9WgocXjueMpDELcVeyA/7EHT9rQ
	 CmL6aadE0tdQAEynNUIERY5N4GptwZKzjCNkTKouxnzbmLpJ3I0R+Xg1+/bylelg8n
	 cNacLatDRla5aGSABTPW9VDOClPGEt9ZSSTWaihEpOEPPBb7+g7aYBtaRE/CTcf8rB
	 ZsGLyf/sI5CTDHsLZD3t+OyG2gTT7nMFUrRpBIR+P8SdX0nHNlnmycR6mK8lIjzpDA
	 1HafBEpafOMww==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] arm64: defconfig: Add Toradex Embedded Controller config
Date: Tue, 29 Apr 2025 13:31:19 +0200
Message-Id: <20250429113119.124427-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_043136_321079_395B306C 
X-CRM114-Status: UNSURE (   6.58  )
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

Enable config for Toradex SMARC Embedded Controller, this is required
for proper reset and power-off functionalities on Toradex SMARC iMX8M
Plus.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..d4f1230250fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -680,6 +680,7 @@ CONFIG_GPIO_SL28CPLD=m
 CONFIG_GPIO_AGGREGATOR=m
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
+CONFIG_POWER_RESET_TORADEX_EC=m
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-- 
2.39.5


