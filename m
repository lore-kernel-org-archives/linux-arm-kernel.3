Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE3CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3yNKrGq1aqvoe2s8n0Xwx9ZOqCVGV9wtPn9Eqw3MyA=; b=huJ2D4oW9yrJAGvMrayzJzPDBG
	GiDfYkNwkqcHCDeYafXXB4z6Ve+0f+T8zTB6ftdSI05Wii3Cc7kvsz7KJTMioZkpkXJWv5L/x4xbO
	HXgZEnWDsCsQHqNOspzYJTckFOSnfR9p6gkyxgtgAP6bugVsbBYoBtNkML0kuUzRRNPxIhFPIUX4z
	LjLCI99+NgkkAu88N92+cS/gBavVeoGlmeeef4To5WWela9SVDAUpzYJ948l7nMiPmr1SPZnq95T/
	eUJHAQxUzdlgCt2IXWOrtgs9BebPUVMCiaQ7k5FZHp1o1WaKdSW/uEgQHqBLiQXhr0J+h/cQv/wB6
	gC+AVwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoIR-00000005D8e-2EId;
	Wed, 30 Sep 2026 07:00:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoIP-00000005D5w-0twR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CAD36024D;
	Wed, 30 Sep 2026 07:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A062DC4AF12;
	Wed, 30 Sep 2026 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790751602;
	bh=NUXJfcLnB98X+btHAhrx+u5ORoUQZ2deYZHabr4kZB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UkDFR8GSjN+PgiSJPlq8/vwir+femwPx7WtQAp8puKe/T1M/jdLbKmmTVgCP9NAMZ
	 34tODwzhL659wWlifePExd/Quu91Se8jyyWCNQfKXtsEztwmBDDttyD3OiXcz0GqCo
	 w6M+AsPFZpZdhrMZD5lmtyPtSDRM+pvik/K76amxcOYnQsvPxWgAFM36uLmKPfZ4/G
	 KGs5mAs5pmd+JWKUH2TZqD8bAq3ZNg0J5Vs+DthklAdPwKbR9/AfrN0s9NQsMKjzDH
	 cBGYRSmXysv0WAAa4dbBJE9hzw6FoD/syUgfj+FNkUU8KONtJWcuXWaGSCeF873Zsz
	 BOjjtfOQLeBmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1B7CA5FBB;
	Wed, 30 Sep 2026 07:00:02 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 30 Sep 2026 10:00:00 +0300
Subject: [PATCH RFC 01/10] dt-bindings: vendor-prefixes: Add Securifi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-cs75xx-v1-1-4617c4463529@gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751600; l=847;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=hyOvjdhPlNjoQnyIsoCU9bT3wcewUSXxEPYXQqGhmH4=;
 b=1yuqSgy/VAYx0GP8v1CH5iSUHU87XL6J8ox7FlNMLlCrSWLYhNxQdlvoJDwWopnUF1gG+bJdb
 BxEm3GlqyWPCYTdD3WqlPitcFb28VoDxQC0UEWKNdNw3YoVv5Xvtloq
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Securifi Ltd. makes the Almond series of touchscreen Wi-Fi routers.
Add a vendor prefix for it.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5ddeae3a697..71e6f82a71f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1497,6 +1497,8 @@ patternProperties:
     description: SDMC Technology Co., Ltd
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^securifi,.*":
+    description: Securifi Ltd.
   "^seeed,.*":
     description: Seeed Technology Co., Ltd
   "^seirobotics,.*":

-- 
2.53.0



