Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A3D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bantzhwh/JQi8eGyb6CIiIiwNEHnowhlxIlaKq4g4mI=; b=LSp4QkyIbaONu56V/qmlbjzeF4
	PKA4DrvL6KKh/CJ/DerjJyovwZFmlq7RcC/I3FjzdqqoQbizSTthslLCWJGUlXdoE0nA9ECNuu20y
	vHtqm1liGeS/ySLjGNzag74cEbRcT9MamjsvInHfNIKAcc9pai/Xdd6Ao2wmDX29Gav8hiKXP84WK
	HTm9HlmvU0vEbAA7tXpm1fSkSczHAjjW05eZbyuTfRxjE9FYDz5weacAZ+tGQhyCTJRS5zQGpOf0T
	0/cKPyf/sWyqp+2u+2U3g6ClsrV57s6OfMlPiQhIKJ6QqOZW0j02HsRD9R8eH2grX2oa6r8bTZTrj
	VRrSA5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0uk-00000005IXY-2JGi;
	Mon, 02 Dec 2024 07:32:14 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0kH-00000005GRv-00ag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bantzhwh/JQi8eGyb6CIiIiwNEHnowhlxIlaKq4g4mI=; b=MEmIfd53Kd1sMSjzM5w0cLblX2
	uP6wnJINVmNPJKtefvkl3QdZConWWXRJdVLzE4xaRsrAqRM2lRSa1jiWAHRlthZhxS//bLmUCBiVI
	RXbrhx+RpbJv2pkX/zsk74w30N7wSzAVXB4iObtx89Yqm7Da6vPYWKgPKgQ/nyyDh6RckdGT+BGiO
	Sr00ZBalPxtWp23t2rUhtJEzzaQ/4p3SgJMIqJpjcOm9GLlk3LTfmTGw3S8pgObqjMHsZwVb95mEi
	havgWJpOac+hMQgx51agTbkjUCQjpcK8yupw8IY/1ux8Pz77nF+fFhF1d4MZxYxvxSGxxKfsO/BNu
	cSSzKvBQ==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0kF-007Bva-2V;
	Mon, 02 Dec 2024 08:21:23 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 10/15] arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for bluetooth
Date: Mon,  2 Dec 2024 08:20:47 +0100
Message-Id: <20241202072052.2195283-11-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202072052.2195283-1-andrej.picej@norik.com>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_232125_196632_050753EC 
X-CRM114-Status: UNSURE (   6.01  )
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

From: Yashwanth Varakala <y.varakala@phytec.de>

Assign the missing regulator to the bluetooth node. Absence of
this regulator triggers the warning message from kernel as driver
uses a fallback dummy regulator when there is no regulator assigned.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v2:
 - no change.
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 17e5dd40b5d7..be470cfb03d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -266,6 +266,7 @@ bluetooth {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_bt>;
 		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_vcc_3v3>;
 		vddio-supply = <&reg_vcc_3v3>;
 	};
 };
-- 
2.34.1


