Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B690C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5DQYrySeDkkLQiiwQzAAdjLQ+owinBNaixbR+g1tqE=; b=nPZSfCzi903vSfI2Q0zy3F/xEe
	e7BEZfWKEsc30ipH6DQ0xj4wHw1mAu6dpj+pyk5mImNq01bVgWEmFj9hgRKK2I8jZWTEpCjcGcZcz
	lksYupNnuitDShUBi9QImxThU3aq+VaQj/5qzxefegKlz2iXARgIQi5GsRPyP7tQzEbsxFT/xTLu/
	CuytbK50xpCm2oMqmjRf78yoHoHYgOfrBzje+G5KqH8bVhzaUMJar4XAlv+7F4mon6D3dSLph8WIO
	2tWRJfe1hEVo6rRYSv+kDJtTzEXO8LA6Zk48GEEnrQl3qW0C7veGJSEnlW/s42ySFS87C76yEvGGa
	R54oEy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzK-0000000H4cF-3gD6;
	Tue, 30 Jun 2026 12:54:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzC-0000000H4Vu-3Mk8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F48A43CEE;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C51CC2BCC7;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782824086;
	bh=v5K8YIOQSM4pcHUmb0+gBEqEMmgttu3NrEpZewiOH7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lMJtJWsLzUcDLEVPamBva2P15vIXr6oDES9ANs6QAxxnrglPRE2MTsajK/KUDz9sc
	 2W0LVUg2HbDas259NOZ/62IRFtHNZYklGQA3yN6nbVAUpDbUpST8UNz5s6yznc3JPA
	 aCNpEQD5vwRPPOCTabYh0qhtVNMHr74zu5b6Yo5PP1B55rUKJJqPke/gl/wfwflCvQ
	 q3SRkBcegYykpsxvj+xt4ZIdRqcBey/54tjcMO1ptXILozzFfcoqdLqfhS6M+MigKk
	 3cnCfPrTCcZ+VxP1fqdkuGDCJX8rKL3tqIWdonhzRbYWw+sthpwuM2z/CrcHVgWP6U
	 qcgsrjlswmiYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47405C43602;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Tue, 30 Jun 2026 22:54:29 +1000
Subject: [PATCH 01/10] dt-bindings: mailbox: Add Apple t8122 ASC mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-apple-mtp-keyboard-final-v1-1-506d936a1707@gmail.com>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782824083; l=1027;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=NwNyyVWwfMGwXyyxkslAk52mQZkXJnBNHg2CHXQEQ4E=;
 b=CK7aMG4Z4oGnQhA3PjnKecoI+wEIKEftwtDJ0ZlWJ5B07dBzEvYZDDfqij4ju+7c5A6BbCZQt
 9KrMNVXDe0YAL4cotqDbFqmlvSNrK6wuclH5S/Qy5TS1RuJLKDGYP5o
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

The ASC mailbox on t8122 is compatible with the v4 mailbox block used
by other Apple Silicon SoCs.

Document the t8122 compatible in the v4 mailbox section so M3 device
trees can describe their coprocessor mailboxes.

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 28985cc62c25..946c909c6922 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -30,6 +30,7 @@ properties:
           - enum:
               - apple,t8103-asc-mailbox
               - apple,t8112-asc-mailbox
+              - apple,t8122-asc-mailbox
               - apple,t6000-asc-mailbox
               - apple,t6020-asc-mailbox
           - const: apple,asc-mailbox-v4

-- 
2.51.2



