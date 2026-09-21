Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11377C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 00:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChCCtURRUG2JR4jfYCi2CnNeuLOMbvvHuLF9vSHoy1k=; b=HNTVJcipikj03jjqO3H6D5DYoK
	YeAcuBv+yPsjhcKKjgDw1V0dNRVYMVpVE6rjIo12TIHj/dcWdYu/qEqnigMMO+367qtap02IBIkpR
	1RzCYcK+/RNc6q1Pa6Xe165BgaZK2ZSrjikxojzmM0cx9MD3L/kCJhD1I1+js0VzeG2Anwe137hW7
	QTTmtvUoO4uCkRRKelVyp0aXb9AwVp2FjwfOXLh5+9NfeXO0spthcmlVrLuTvQmcDwHsWm2zzT9Qr
	RXT42w+TQTh+gpCADA6BmP6dZxhLPcqNZrWwjPtj0pqBXCBgU4PA8V4KrxwktiU1A1X9euSVs91Y8
	I5OR364g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Rrp-00000000dCC-0A36;
	Mon, 21 Sep 2026 00:26:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Rrn-00000000dAx-38UQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 00:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE34A601F0;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 770A6C2BCF5;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789950402;
	bh=AbdL3O6G/yNWEj72i8vXqvCJ2p6+AboINKG2AHfj4ro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PIv5Zb17YJBrCk4t8niVa3gseMI3M/zlzBw5WIRdLEbjclIh4v1toO9YYCYI6bPd4
	 dyJR07tQkFoeTY0BCw46ZGn8Z1sNIxLERvsYkmuio9J6kgXOWVmbjPVP2PxmaDmaDJ
	 6wZq6XmGeZo0DhDqkCrGhxHaUrKvGKdTIqt5kYvlDDrTvFzWexAg0h/9MV31lAp6Jq
	 H3EjnvtSUwT0M4oojiqK2322PqccnHp267m3rBlwMXCnCOgj5NgXNtX5j1414/Fzjo
	 YWrURS2EqsEhEuAFTd6suf1TiLZRXqtijRX7dFW98MTHUG1M3D5vg/rlrr5EUhpilt
	 KWctWPe2wAxiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63646C982DA;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Mon, 21 Sep 2026 02:26:41 +0200
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Sophos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-send-dt-v2-1-fb6b81002ad7@studio.unibo.it>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
In-Reply-To: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789950401; l=922;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=+G/P8vdSy/WAoSbx8vK45ADrYNnfP7i4AKHiwIu/gD8=;
 b=rGjJwB+7xpm/+G3PMkWkV50tW3ylod6WFvQFXLjtQUPIreX+BojjBPp4YK+hFDlB8yhYK/0H1
 jGrvtJp38dGDez/yYxisIlotNl06XiJD8zJ4Yqi1b54gZONhlZN+qtT
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
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
Reply-To: nicolo.giuliani6@studio.unibo.it
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Add the "sophos" vendor prefix for Sophos Ltd., a vendor of network
security appliances.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..3dd9d9b8ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1595,6 +1595,8 @@ patternProperties:
     description: Sony Corporation
   "^sophgo,.*":
     description: Sophgo Technology Inc.
+  "^sophos,.*":
+    description: Sophos Ltd.
   "^sourceparts,.*":
     description: Source Parts Inc.
   "^spacemit,.*":

-- 
2.48.1



