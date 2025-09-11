Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB76CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utZgvaxYqFMnYfraIeeg7bF4qeMIQAuhrBq+YC/cjGU=; b=hPUNgxSSKRkvmRzdpSVO5Ju7YK
	/M0XeGTgYLYvrkw0l/9aKyoR1X3mmr5vSvTxnroJSkcWJtGf33fQKrgQGNf81SXp6xQrqXvSlsL7Z
	azBpI3laJSqXtNbn9KiBM5xwv5NWDU/y6L8oLBCYcbP1YW41+3kTs5tAoVmHFebO6Glj09sCRphr/
	bICzuwgiCGRvAaxZeWopn5De5QGUSwk9eJ1guW06gig1+b5sSX6UGVhpw7sqNTeFbW9Suhqzz7o/v
	yhM3QbUVdqqNuhJXdAvjJHwMkgmb7tOcs5noSqisX7ZauxuzHhPSFMC2FItuFHirvZA7T5LiSzcMo
	rhzpyejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjvK-000000048Fv-3D69;
	Thu, 11 Sep 2025 16:13:26 +0000
Received: from mail.nic.cz ([217.31.204.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjvH-000000048BG-2W8g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:13:24 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:1488:fffe:6220:c8a4:e06:31cb:d419])
	by mail.nic.cz (Postfix) with ESMTPSA id 0239D1C1087;
	Thu, 11 Sep 2025 18:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1757607199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utZgvaxYqFMnYfraIeeg7bF4qeMIQAuhrBq+YC/cjGU=;
	b=s8drBUNRCjXMBbLpoNNAvAUCpPJAbQLWuzca3g573fZxlaVo6+crfHSuHmgI05fiHYir/c
	4F5UCUvFqXu6ItYETdH1ieq65mEdOG7jAbeQ4HlEcmHGAyE1evF29Wh5DDAXlkpkvxWYj7
	m34C/nLb9UIvJqlRRlzGPH9LUGwc3aQ=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: gregory.clement@bootlin.com
Cc: devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	kabel@kernel.org,
	michal.hrusecky@nic.cz,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH v3 1/2] dt-bindings: marvell: armada-37xx: add ripe,atlas-v5 compatible
Date: Thu, 11 Sep 2025 18:13:07 +0200
Message-ID: <20250911161308.52876-2-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911161308.52876-1-tomas.macholda@nic.cz>
References: <20250911161308.52876-1-tomas.macholda@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: 0239D1C1087
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.49 / 16.00];
	R_MIXED_CHARSET(0.59)[subject];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6220:c8a4:e06:31cb:d419];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_091323_815936_4FB9AFA9 
X-CRM114-Status: UNSURE (   6.98  )
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

Document compatible for RIPE Atlas Probe v5.

Signed-off-by: Tomáš Macholda <tomas.macholda@nic.cz>
---
 Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
index 51e1386f0e01..b2f4fe81b97c 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
@@ -23,6 +23,7 @@ properties:
               - marvell,armada-3720-db
               - methode,edpu
               - methode,udpu
+              - ripe,atlas-v5
           - const: marvell,armada3720
           - const: marvell,armada3710
 
-- 
2.47.3


