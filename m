Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01915E7E36C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3JuxB+/G6y3udfdt5Fiil7AyJojWZfgqeS6B/HYrYI=; b=VsHz3gTtI0fjX0+HKNGT6mzjCE
	FKYVWaAcXymSazo4GwXzg6InYRETTJHHgzwvOi4olRBXGOdUUIv60PY6MltCQ8ROPWwJY9PjR/hx/
	b5kmMrjrkpm+tz1S+ikTgCsFCkHrIKoY7If1jCC1ZdM93tUJM+kvT53v8sBE1WuqrXyqhsxaKy3zQ
	J+gv55g1UOI52oKgxDCUwYq0yOVwAASVr5sIG8fAZrn8HRBF+o7gE80ZqHucsy0PYiKVdVEyDoYnl
	Y1/+uoXaYBcPTCqeYBSYpVYMjluMPAUNqrk+N8GfweOuu9j7K5iJxpJAsJJzQx49xeiQWcAmM6XuR
	dIpV1M9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ccL-00000001x1P-1nD2;
	Fri, 03 Apr 2026 11:23:13 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ccI-00000001x0Z-2Tgm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:23:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775215388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3JuxB+/G6y3udfdt5Fiil7AyJojWZfgqeS6B/HYrYI=;
	b=Z/Zf9lqt4f9XlMRl66ZxF6HW9wVwId5eNYruIMuBtIRIktZ8pw6HSCNlf6K2xgIRvsyjFe
	LH9BksYZFquQXmNzGdLykHauuq+ZVokFLhhFZxAU89/WEh4z3B/hdjYetequPQr7/Ol/2i
	THWI0H9JPM1amPfRF9QsxNgV6WhjIeE=
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
Subject: [PATCH 2/2] crypto: atmel-sha204a - add Thorsten Blum as maintainer
Date: Fri,  3 Apr 2026 13:21:39 +0200
Message-ID: <20260403112135.903162-7-thorsten.blum@linux.dev>
In-Reply-To: <20260403112135.903162-5-thorsten.blum@linux.dev>
References: <20260403112135.903162-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=thorsten.blum@linux.dev; h=from:subject; bh=cSJ3Ql1kXpO/gB5LFObrJvyNWLgO2lBRtMbPwrgRPyU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnnF+03VW9nzgu9+23C1HV+GisO2NpcaN279YNB/Y3d/ 2YXHDHq6ChlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJzM9k+MV0dN/um0vj106R mfj0/zaLCzcmRF4PkN91a3p/yJ4d6x6wMfzharYVm/b7flHs4dqMh7u0T/cWXWX8eD/95uT6n5d X+xzkBgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_042310_768768_B2A87F53 
X-CRM114-Status: UNSURE (   8.38  )
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

Add a MAINTAINERS entry for the atmel-sha204a driver and Thorsten Blum
as maintainer.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c23110384b91..7317d80592cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17197,6 +17197,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
 F:	drivers/spi/spi-at91-usart.c
 
+MICROCHIP ATSHA204A DRIVER
+M:	Thorsten Blum <thorsten.blum@linux.dev>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/atmel-sha204a.c
+
 MICROCHIP AUDIO ASOC DRIVERS
 M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 M:	Andrei Simion <andrei.simion@microchip.com>

