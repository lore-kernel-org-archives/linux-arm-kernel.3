Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815CAC98319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgH9aXwvqgfqbqezs3KUQvOw/Zu0xUnKdvawEIlUNtQ=; b=eBj1Q9XYrCpIsTjUjdoPm9SFnH
	5f1nm2Aucl9pqi7u4/3psaxuFAhleNlAueEY5dPDh62gM2sZOGxcIvokinHOvBPOuJovhXichNr0z
	V0FpDIgGdP+/8+BADCMI93Owa67tEkdmyOnLVOMdrm4Jr0IFgkoqWrT4NOLqMABvhlgw94n60sfAu
	13LAVeytvHTQigiKfZmPyw5c7S5G1nRPJnLs/WgS6Oel8rfo54B/twa3oqi+xZhJZdmxS9saLhEf6
	uLapMSizlW1JryXlWhCkwtyGUayv7t2eAv0MgIeVsHPq32K3LuZtta/130bVV/O1CDiSJ8yvPY5+U
	hzPXKgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIW-0000000ABkL-3Mhc;
	Thu, 24 Sep 2026 06:51:12 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIF-0000000ABfU-1Qd6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BgH9aXwvqgfqbqezs3KUQvOw/Zu0xUnKdvawEIlUNtQ=; b=ECp9ei6N6YRHLwj95m2VaDTIoO
	IdqjibPUVsmmX5uU8pHRbxnMhaqbu2O0XjNvqb/HzuffyThK/ecGy4EzkkbNGx78pbt9zGd2CFsx8
	dbKbXNnUAM1l22oQjBk1tlBYL9U0Ag01iy8bvlCUsAHwnCU0amB1ztjXdwPd9lprc6TovJ2orVCDo
	u/uYxP+VHPIMv2RsY3+aObMqBW/dxQFAxo8Y9V+Kyr0Vj56c8puwXj5ties3/HnWPKzF4xsX/fyNG
	n98iqWirfFEq/osG6hiLrkHC5FCjGoxABJMRJJXy/nj5cjnR4ejqbI/FqyL/yJJB/XrpsjyU6ZUHF
	gZrrAhdA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:54176 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9dID-0000000AyGs-0pX7;
	Thu, 24 Sep 2026 08:50:53 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH v2 4/4] ARM: dts: imx6: phycore-som: Set watchdog timeout mode to shutdown
Date: Thu, 24 Sep 2026 08:50:44 +0200
Message-Id: <20260924065044.368341-5-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924065044.368341-1-primoz.fiser@norik.com>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_235055_714281_6FE45387 
X-CRM114-Status: UNSURE (   5.67  )
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

From: Andrej Picej <andrej.picej@norik.com>

Enable system restart when the watchdog timeout occurs.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- capitalize subject description

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 85e278eb2016..ddbfecd591f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -115,6 +115,7 @@ da9062_onkey: onkey {
 		watchdog {
 			compatible = "dlg,da9062-watchdog";
 			dlg,use-sw-pm;
+			dlg,wdt-sd = <1>;
 		};
 
 		thermal {
-- 
2.34.1


