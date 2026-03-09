Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298CAEA8525
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYUW9AAjYAsnFAXAucRe5jrcfA6RJusAQq56ZnZO7/0=; b=4zPvAOGPBh9w8Aox9qoXi6HTBC
	4yTOyR0Vvo3nIDRaCQOkdLOGiDbgC+nnNfB4haXEsQ0EbuiJXTiGXvzPDzzZizfs2i5rS+pfwYZUL
	elYtbvyeFq63tpwaOVsbTbgIJfr1OOVNz+4BB/ZoyPuFWqp7uL7rY1N6rd/vv8okSx7C78IDvQ1Nv
	IFKyvcsJ4RIs7FCNTXmD659xoUwdcqV+WdUvazi75YGKMEWhK8isjIMSO5HzXunhQA/lkBJXl6HTV
	WNVS+0ldPmCHxsVCTsizx36WQGRspQ/ASBXKFk1hXNuPDMtaM7UDxqxHvEE0xiRxKWk2laO2xxAb3
	IQfoMGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRJV-00000006b85-2Q2v;
	Mon, 09 Mar 2026 03:29:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRJP-00000006b4P-3Dps
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ECE443827;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36793C2BC87;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773026982;
	bh=COteykeXiz9nP7yZMcSFC+zN7ElCRxjdKlB0bSbry68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WrGLNQbpzqKqSzxyhQmmZMXbHsR+aX+qSVzi2REcqzeT9AJdJk2w2ZO1GdSI62aPc
	 WeAp3PQ43j27gT4eqZG37e7w3KQz6n0Rg2gxZ/hFE4yJUop3SMlQkqlSpXFCbXXuEW
	 lC5qxnjXx6JaiEp6EUEcbe0YHSiMDDnUckiW63lG79S27Es3720q8cOe10AMRDCalW
	 iDoZw6BWN7jvbjp3Xq+ddpiJmz8UiqFUaPU2O7hUTVE1t4o/x+h7GMKFQkGVvZoxVW
	 MDMalBsRAkeqX2P2fR87IZv8YtzpIuUK86wlUxq2JM1ZYHylEXinV4IHJKj4D0TmHg
	 BIJ427iAD1HQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F60EA854C;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Mon, 09 Mar 2026 11:29:27 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: anacapa: Add eeprom device node for
 PRoT module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-1-45092310e0e6@amd.com>
References: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com>
In-Reply-To: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773026981; l=712;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=4aUo+I25yKcWkfZ/hlkVpDZQt+CsSEqAbr9PaSDqHsg=;
 b=3tAsCSbsPpsPhvfGTXlpzgPTJPk7d61OGjUrgblTid5E+Kh1SZMxz/XNk3I6A/r4SM/0xmf6s
 MgaiyyjUEsBAA5/RaDvyLlXQywZtYW5oU5EX5TosmnWHVXjSE5zf2tq
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_202943_827475_DC5B59B9 
X-CRM114-Status: UNSURE (   9.43  )
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
Reply-To: carl.lee@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for PRot module FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..680108b00664 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -586,6 +586,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
 	// BSM FRU
 	eeprom@56 {
 		compatible = "atmel,24c64";

-- 
2.34.1



