Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0317E7E371
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+rPShtDZMIHf5R4iGqfjObtCM/Idw2gV5jz+EjoaDW4=; b=Kc8/TY8XD9JuFP8Glag1CBTJzu
	+g9qLme+RlkChZcXIia8o7rQLP9kjk/BtLYAsvnxw8pHf6ilw88Eoblwr9IV6ulMYUi1u/2hs5+Ze
	GFKCx6/GUs+xbU4oxWPKp0nmLvv+9FBUwukIRO1sYJ5fcq1cMzpcz5SBGuTxzgx+ThHqwsobIpdsB
	IM8T0hyqaXkiB+KKvUNXM8S5FQzM/WQI7iJZo0clSvAZoIMa4v2l454orT2GC1de8rJ64OjEpx048
	EP9+cWK4aFaFqtm9G3NofVq/RNoyDZRCd3e6o42ieYRYC5LNLTGwSnEelRnbKJ2Dov1g/F/wXskVP
	sjusBJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cbw-00000001wxa-0WPx;
	Fri, 03 Apr 2026 11:22:48 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cbt-00000001wwu-3EEL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:22:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775215361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+rPShtDZMIHf5R4iGqfjObtCM/Idw2gV5jz+EjoaDW4=;
	b=iRD+eydya6bC8b8h8sM/FmclSJ4CGjAHcaxJG5lvk3w4C/WtotVjjVTVSRfC7//ldB4eFF
	pF/xn9RmEIheT+obXZt2K9y2kLXuYdz0kHUp4VWxioPuyQ4I/lLyHTxpQmcPnmTZjnwYvE
	D4YrLr7nomj/k5A5P5fsNBHwQsZKWzA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH 1/2] crypto: atmel-ecc - add Thorsten Blum as maintainer
Date: Fri,  3 Apr 2026 13:21:37 +0200
Message-ID: <20260403112135.903162-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=734; i=thorsten.blum@linux.dev; h=from:subject; bh=aRAzUf5gemmdK5F+5MKPd01K/sBf7Mnx4XljF9Dm4sc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnnF+3vPLyMWXdqy271Q7O7HjzU+LdVL87ZIzNqwUpfn gWWCm3hHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRN/KMDPcXhibFivC7lodG frDUa5wt1/HA1eGbqp5Z/F7VDTfeFzEyPPgUxeu74VGt7/eyg3PzJi2oeNV5Q6j49d8clx3aRmI djAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_042246_108576_8BCCD7D0 
X-CRM114-Status: UNSURE (   8.40  )
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

Add Thorsten Blum as maintainer of the atmel-ecc driver.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..c23110384b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17216,9 +17216,10 @@ F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 F:	drivers/media/platform/microchip/microchip-csi2dc.c
 
 MICROCHIP ECC DRIVER
+M:	Thorsten Blum <thorsten.blum@linux.dev>
 L:	linux-crypto@vger.kernel.org
-S:	Orphan
-F:	drivers/crypto/atmel-ecc.*
+S:	Maintained
+F:	drivers/crypto/atmel-ecc.c
 
 MICROCHIP EIC DRIVER
 M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>

