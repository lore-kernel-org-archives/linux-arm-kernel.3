Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0333EE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkuqcMPgMhOvktAdO4R0HEr+0KhxRtMn3MM65yMphGE=; b=X6h5WfFT7v0Tquhxr0p+vXabDf
	xqVbjT9iLSZpE/dK7jvd1HQ9YDwH9iqS6UTA95+3skwdSbZuK+Z3qmp5qRjSvNVaYNmfTS2eZnokk
	0p3aKsy4a4fGkNBsmU2fkw/Z1XO4FTFqfIqrYGt9KGEdiucMpz6fUdD9LrhXfnr0gSaoMOA+uLcPC
	9j2mRZu44YNjATt7Uo0gaunycmlA7vdMGB4R5LqzP9hNTzulrWy14bQi1rO6taQyA4oL90tsX+KN5
	+FbDpbbGxyp+bxFtu6bHgqTpbB0sQkYa7mCVyOYrlx9Ej92WBYaOdkwAqq8mu9Gw7s3UdPO17rKvO
	n/usUiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYe-00000009sCV-0cTS;
	Wed, 18 Feb 2026 13:25:36 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYW-00000009s6U-3MfK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:25:30 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkuqcMPgMhOvktAdO4R0HEr+0KhxRtMn3MM65yMphGE=;
	b=A9BtxREd6FMLfp7RNjEc2V3SW2Q/lX2PmWk1ZcrmL5SS9WRR/JrmkZ1Ni+as3fUyufn6lZ
	YLpJ3UgJhTvRACai4t//8PGHf3iJ0+QnQ7eqI9aCpSD2s/Vwcies8SfjZ5hyv6tVWKO+jw
	XdD777G9VAm+BSZOMaIIAebvMHQDieprpwFyreAdJcYdTbuXrcNnGK8D8S6Z6+TkZ+ulbG
	W2hxdUa1Za+LRFIt3XjOrE9Gh/WT1gXsc2vUsy35KpGO+N0/62uhUhRqLTlz6siFHfRfrt
	fcyN22mecKB7AhPv3wsE8Mj9T81K28+BHKYzUv/Kcm5XLOvXn4bYYMuSlV5+Ag==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/4] arm64: dts: imx8mp-kontron: Fix SD card supply on SMARC eval carrier
Date: Wed, 18 Feb 2026 14:25:06 +0100
Message-ID: <20260218132519.74570-3-frieder@fris.de>
In-Reply-To: <20260218132519.74570-1-frieder@fris.de>
References: <20260218132519.74570-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052528_996684_3E964BB4 
X-CRM114-Status: GOOD (  10.93  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The SMARC eval carrier has a power switch for the SD card compliant
to the OSM standard definition. To use this as already specified in
the OSM base devicetree, stop overriding it in the board tree.

This fixes the power-supply for the SC card.

Fixes: 6fe1ced5ccab7 ("arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
index 2173a36ff6917..74d620dd06b7b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
@@ -249,6 +249,5 @@ &usb3_phy1 {
 };
 
 &usdhc2 {
-	vmmc-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
-- 
2.52.0


