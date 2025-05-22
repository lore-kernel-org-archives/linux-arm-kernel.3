Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BADAC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLjIX7nSKhkcnuApiD0KRwJJujcGBBsiXxOFrQ/KWTc=; b=cL+9SIuT5q5b9XFdufdwJgueFr
	u+8PD72h0pVAk8P+PIoQZRg2PKG821j9OmFfKk0oHdX7la8wOXzdsDK+KxBzO8sX6jXnpLJtxdlko
	RITWC/wbIq8oFEQ81W1W/PA4fLAEIGcG9AEJbnmleIt9OT8odmoH2YprQFZFLpfqIrizlu/aX/Faa
	5zYygTLNfBg0E6lyq5qdcaBoBmqLeHzlgGHOqxCw8m866I9b+Crhq5MeIf4yboOMJj2Pk+Mdd7ova
	y6wbIZy0VlpQIjD8yBMHQCPu6ZoN16TfIQKQi5dsb44W9TRZ9ZWnJ3TJW2C9WfspYSiWg+IboETyA
	Odofyb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1bn-00000000M0j-0a88;
	Thu, 22 May 2025 08:48:59 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1SM-00000000JNr-2EP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 08:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VLjIX7nSKhkcnuApiD0KRwJJujcGBBsiXxOFrQ/KWTc=; b=GKUe9g1D9ayAnusFpEJP2ZdXcM
	Cfs3ZLh9fZTVemOy7zdZcDDn9+PbQ3IKNf92Rfp5QWlI6ixHQXx9qBiMHucmbv2i8a8pmy6nU6c4l
	Is2KZ3EysWeWNqqiTFbK0Ppwaz5HZR4TZr4mZ/J3VBfPOMzv9Uryo4Zm9VthDqfFFnc8zbEz2YdLW
	Q7ZJQ+QhMncTk+w3NFsA10GHFxS7Ea69UBCPzNKJZRqdutyVRTBjD24L5BfsyeO7o199iieOozBLK
	sUys5gk0Fx4kMUl+De7QtbZLMq9pGctcF9uQ1+1Ve0Vj7gg7D26XPdWEaPNlp0oQBE3jaKV30bas9
	1q+qCR4Q==;
Received: from [89.212.21.243] (port=51574 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uI1SI-002sBQ-1V;
	Thu, 22 May 2025 10:39:10 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] arm64: dts: freescale: imx93-phyboard-segin: Set ethernet1 alias
Date: Thu, 22 May 2025 10:39:09 +0200
Message-Id: <20250522083909.533567-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522083909.533567-1-primoz.fiser@norik.com>
References: <20250522083909.533567-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_013915_029102_BCBB57C9 
X-CRM114-Status: UNSURE (   5.07  )
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

Set ethernet1 alias to EQOS interface on phyBOARD-Segin-i.MX93 marking
it the secondary networking interface. The primary ethernet0 interface
is already set by the SoM include file (imx93-phycore-som.dtsi).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 0c55b749c834..6f1374f5757f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -18,6 +18,7 @@ /{
 		     "fsl,imx93";
 
 	aliases {
+		ethernet1 = &eqos;
 		rtc0 = &i2c_rtc;
 		rtc1 = &bbnsm_rtc;
 	};
-- 
2.34.1


