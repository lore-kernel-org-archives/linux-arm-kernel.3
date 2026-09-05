Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1384C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUQrPzdg9Fwku+8OCzMzZH8Wv2NynzdwJhyMvSnn2PQ=; b=cegOKw4ZYfdR8luG8niYcS/5Rp
	VX1vkh1lS0NO5au+4G2+Wfwhch2I/cFl6tBLe5DdYPn6dhMNTiEl/1rrD47Ta0Vmu8EtnL0K8s/Qn
	P2abDUTTmbyTHAOB3nQnNlKUiIKV0/wwD2N+4KlsLYaeOTPO+SwvckT7oTBLcbx7jS9/CK6uFNGnH
	3MOGgtRhbWX0OtclwoyiKVcFA4KrNiu267xwCrvug79f5icbb5PzAfrD8OjFphKnhUt2vGggCIPGf
	0h7JaO2dOoAXNdSIjoMbN+FLKdpM1KzeVxVFnXqykAWxKsgN5oo6ne/H2nVAuPmaYJTvJyUSX+PiE
	rwdH4hNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oT2-000000040pN-21ub;
	Sat, 05 Sep 2026 11:21:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oT0-000000040oL-1ojP;
	Sat, 05 Sep 2026 11:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5612447AE;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE2D7C4AF0B;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788607308;
	bh=8Gwxp5aoWJUfNbbLdYN5LWeAcCfH1LcXcRH62cWgIps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t69NQKl8k+lWcDnTDuUnHOqqJXZg04FcbATtudZZVNqhxRbhdM4PVMB7+wyMxkH9I
	 Xjulm1Fx4DlZpjN053CKoBgE22YnTT3ZR96P/AP+Sa0SGFqEZJ9dW0LRuYKo1kCuny
	 g6GlDWGCUdR5hsCg8reHlqXg6/SCH6fNPE6qxLeXpfZHaH+z2s1xR+xloz++M1Lwmz
	 g4YWkgraAoG6v4ZAZy6pSvkjUCJI21V1A7CLGcYv5J6VU3dfEaVat5jI9V035luY+i
	 1WWobptxzrLZ8f36AtAmpTbIxF+QjZpmrXv7naX8DZOqcl0AKBk/R0ohwI3i55I5Xh
	 Nh5e5WtXex1rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69B6C624DB;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Sat, 05 Sep 2026 19:17:26 +0800
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260905-r28s-upstream-v1-1-f68d5389269a@proton.me>
References: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
In-Reply-To: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=LDAlcJQezbRbao3W92BQlWiQhp4bd/SQs/nEjmwyH1U=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzZv72lDpnbH9m8ciW/mOvuDut/lW3aCyt0ImRn7+Wdr
 Cu5cPKGjlIWBjEuBlkxRRbZTdWRQquiZxaxSB2HmcPKBDKEgYtTACaSlM3wv9RQhMF56/8C16Oz
 TXUWLV32+ebdL8W93jNnzxFczySq9Y6R4fvdcqEjj15HS0zQ5ozqFRdNNkh1mB0pISU03zZIYf8
 CZgA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC.

Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..709e2cc44d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

-- 
2.55.0



