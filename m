Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEC4CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaijd8hccqXWxhqJSe73hWvYJAmmUrkcUVuNY1EW4hQ=; b=SIJuxG3BbvqIPqvP16JgxnBcR2
	n9Af9P6oa/b9rwnvCaAdDp2mxKa0gfggFIpLCk+Y8uU/amy7BNi9pVIr2Rjn9Pb4EVINVjClCnEM9
	lCqbjS0nAtzJ3elx9FRFxPdp6W7DIsaFM7IkfQfTKS/WjNrdAVNCPuQitr3YgSAmXblENnOUO+dyX
	82dAFyAcTikiD+hbx7CePuD0j7lap64Fja9sBVUkdhwnIDuKRnc+qOaQ4d0yUr3AnPOLjDbqn2a2R
	PwTO8tB9srFgLhZk2TtlsN9n4WhNBGuDDWfvePjDhJ9XW8NbFOC1t7lAFz/0BAFXpCxKB/PSIhnr5
	yo8ZRafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN36-0000000FELu-1PTs;
	Wed, 10 Sep 2025 15:47:56 +0000
Received: from mail.nic.cz ([217.31.204.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN31-0000000FEIW-0XRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:47:52 +0000
Received: from macholda.lan (unknown [IPv6:2001:1488:fffe:6220:172f:2c63:54a0:e850])
	by mail.nic.cz (Postfix) with ESMTPSA id 3F0FE1C0390;
	Wed, 10 Sep 2025 17:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1757519267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xaijd8hccqXWxhqJSe73hWvYJAmmUrkcUVuNY1EW4hQ=;
	b=pELyqHuJ4bYles5bLRB7f+gfzTgZcPfA3mr6PxgaH4YG1E0N8YUDS/bQnO9Mh3/XBZe4Wr
	TKOXsT5N0bmDdM3a70j6bx+bb1LEWeuQQHOTPrJKJE4WSV3gNBDKSmj8Gjsg0K9q9d5xll
	9XoDD0UWRgB5XN0G2meDTNSXoO3A6qY=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: Gregory Clement <gregory.clement@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	kabel@kernel.org,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH 1/2] dt-bindings: marvell: armada-37xx: add cznic,ripe-atlas compatible
Date: Wed, 10 Sep 2025 17:47:33 +0200
Message-ID: <20250910154734.24686-2-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250910154734.24686-1-tomas.macholda@nic.cz>
References: <20250910154734.24686-1-tomas.macholda@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: 3F0FE1C0390
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6220:172f:2c63:54a0:e850];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Server: mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084751_374416_6C8513F8 
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
index 51e1386f0e01..28fc750c72b2 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
@@ -17,6 +17,7 @@ properties:
       - description: Armada 3720 SoC boards
         items:
           - enum:
+              - cznic,ripe-atlas
               - cznic,turris-mox
               - glinet,gl-mv1000
               - globalscale,espressobin
-- 
2.47.3


