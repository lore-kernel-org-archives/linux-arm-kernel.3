Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C437D10DB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQOeXeiVkvhOLe3ErqOoSSoGW4JjirN8zefwDthKPwE=; b=ag0KCW+bQiuvlGeKHFCWhVZp48
	iN9i3cEJCIEUGtMDFU654u9kk1QisncaNcAm6NPHRZY5dKzGihPpBokpIs/CNx0bLZ9bLlVQhryJY
	yzZZQe8Fy0AR+ph6jNcB4u/pOLrYFd3ZxENxFLxL+08ZoY0z+xA8KlnSA0WvNUr5nZnh2mObBfN1L
	GRfjhKznkZaFw1M7lnaEjPU2MXUuPBZCKEhqXecGCuAC5weh6nwowa8gdHGBc2fSnz8S+jqcllx1T
	7BPDbSYCDoy24K7gM1s0gkNWC8IWtL54VxKAsqRwcNBttabSN+hIS9IWCEoLbkfHxwHxJwBmo9Z9i
	J3gOVZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0lA-00000005GhT-0W5N;
	Mon, 02 Dec 2024 07:22:20 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0k9-00000005GOU-2Ijz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DQOeXeiVkvhOLe3ErqOoSSoGW4JjirN8zefwDthKPwE=; b=frDWe2gyWqkXEN0hc+lflggVym
	ll5T9qsVjKUEsQIGC9I56xuE2qpjPSWzSuzrjIdQtvBB4AYBx7WtBFfvDN3n3SOnR/ChEMFd0Uk6M
	5jwfhO2mGrNGxsg0cg8upNKts/sKTUfqb9iUoh65JUlmETg2Hhg3cM8oQpzMEm5CLCjGyLY6cgPoQ
	1mp/QLaRUIQWS+Za6K2OMQ9+fABfa7Olp5ROSZZdQFKLpmsFkywbzt1vSArknCccexrW5s4pRxbxS
	XNFNItfogwYfFununuMjpPbcuP9xhvp7TXD62qAEgQ2z3X+LGpQRlO7wRXkyJXZ8xr+NPWwgF6NTQ
	7zdiQbkg==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0k5-007Bva-05;
	Mon, 02 Dec 2024 08:21:13 +0100
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
Subject: [PATCH v2 03/15] arm64: dts: imx8mm-phycore-som: Remove magic-packet property
Date: Mon,  2 Dec 2024 08:20:40 +0100
Message-Id: <20241202072052.2195283-4-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241201_232118_038062_A8E9D996 
X-CRM114-Status: UNSURE (   7.45  )
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

From: Teresa Remmet <t.remmet@phytec.de>

Remove device tree property "fsl,magic-packet" as WoL is not working
on the SoM and so not required. This also saves a significant amount of
power during suspend as the ethernet phy is not powered down otherwise.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v2:
 - no change
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 7761acc5c510..8de5a46512b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -69,7 +69,6 @@ opp-750000000 {
 
 /* Ethernet */
 &fec1 {
-	fsl,magic-packet;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
 	pinctrl-names = "default";
-- 
2.34.1


