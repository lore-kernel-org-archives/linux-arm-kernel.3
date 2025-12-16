Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AFED5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq+lzXGxxoDEwpxte16D1D1WXNhN/lvNXA7mbucg0gM=; b=DD0wA2DzDjJC/pGGNi5Fk84Wzt
	vtLYRX682KB9Q1FvtJVfFzRPpVQBkCYsbAPcWKTkyd3ozu4dloFBs4ELuNoxTmZhV3UF6XZdi6CUE
	dxqNOjn8fqPbcsGt07tTf32nThT7pKbXuKPT0Jml+pibj3qLuiHmfdytxbocAlF6V0HcOzqUEuAxc
	Dn5Xrs2cmeJMGIBqZiBPddifasas1o0on26imVKh7h4DkRHE7ThJhNc9pk05RRrcwbvBXOaVOosPb
	25WxhrYhwLyz09wOxnD/X15Ry5GcsiLWUDJBCawksmNLxXkY9iPBlCEzNfCvjtQqAunMfRPbtGMV6
	tNzgrIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSoB-0000000557z-2voK;
	Tue, 16 Dec 2025 11:01:35 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo6-0000000554L-09AM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:01:32 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 20:01:28 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id A5CB12069FC4;
	Tue, 16 Dec 2025 20:01:28 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 20:01:28 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 602451C55;
	Tue, 16 Dec 2025 20:01:28 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 3/5] ARM: dts: uniphier: Drop unit-address from port node of wm8960
Date: Tue, 16 Dec 2025 20:01:11 +0900
Message-Id: <20251216110113.1801245-4-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
References: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030130_582193_9F083D73 
X-CRM114-Status: GOOD (  13.42  )
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

The "port" node represents a logical connection and does not have a
reg property. According to dt-bindings, the "port" node should not use
unit-address. Rename "port@0" to "port" to remove warnings.

  arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dtb: wm8960@1a (wlf,wm8960):
  Unevaluated properties are not allowed ('port@0' was unexpected)

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dts
index 5f18b926c50a..78653d4bec0b 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dts
+++ b/arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dts
@@ -68,7 +68,7 @@ wm8960@1a {
 		reg = <0x1a>;
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			wm_speaker: endpoint {
 				dai-format = "i2s";
 				remote-endpoint = <&i2s_aux>;
-- 
2.34.1


