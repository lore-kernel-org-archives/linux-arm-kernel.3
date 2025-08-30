Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A3CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMadSsSaeBFm1oO8fawgRrm+BvJYFHPwkhcWbNsCVZo=; b=ifCEPk0BZEXUoZk0Y1JZj+wDYg
	Lg3wdYNraZQgB9FnhiXg/6bvFqkrv6fnQD1RuS0WL0JjuoK1BZGu2myxLS5K2Zehg3nyBNavg65TI
	m+csa/hH13x3q4/nTMFYEdE1SdUDfsASB4XNXiqc/COykPSLYguhk0JPmseSEcdZUb81/2+JfJaBP
	Z6HX5o3alzQw92VUu6+b5j4263alNHBNO+TG1E27aZBCX7KxJwEyrXwYH5s6gVeG8mdMRw/NI8Afi
	hRlbRLNa9Pi79El1cIY8DaxfNUOYPwy5eYVv4lxf9JIbDwA7ImgP/hzkaUe/zvGk+SoLs7uwy/Hef
	mlN0flJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPSW-00000008F3Y-3GGD;
	Sat, 30 Aug 2025 17:33:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4q-00000008CUJ-2VIJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E516643EF5;
	Sat, 30 Aug 2025 17:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0378C4CEEB;
	Sat, 30 Aug 2025 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573759;
	bh=u+4gHkt5DXNrjLXkvTpfwwb6DKaKcxGOlqkLQ/0Gubc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4ferjS0lWDaRDEPSigpfpZXcn1ecAQ4cv3cFgwhBBCG2vX1kOc45QAnqBpUwdVq9
	 c3v44Y514Aw0hG7KECWZeN6eT4E2F65t7NZ+0tnWQkbD/ZDqHM7HibVSUasgoadxa/
	 uxHudqTidIvqbjllVV4lP0TOZRN8YZHXkDSUnRxNBCZ+TX5xilo9HoBYy76ii41tCu
	 KbP5/fRr1EDXUInEbNNKJBUTbPPgfAu7ENnVUUFNfLKAFwPVHUxW/Pg5lPwlkOqZAE
	 vrNi0me373DjR7oHTJUqmLTEgRr7GT/uMoikO86PZ0bYpnWKqMD4vfp0UYFgmobLMw
	 fnUkdpeZUMxaw==
Received: by wens.tw (Postfix, from userid 1000)
	id 2686B5FA73; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
Date: Sun, 31 Aug 2025 01:08:54 +0800
Message-Id: <20250830170901.1996227-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100920_655432_87828EA1 
X-CRM114-Status: GOOD (  10.94  )
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

From: Chen-Yu Tsai <wens@csie.org>

The main clock controller on the A523/T527 has the NPU's module clock.
It was missing from the original submission, likely because that was
based on the A523 user manual; the A523 is marketed without the NPU.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 include/dt-bindings/clock/sun55i-a523-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/sun55i-a523-ccu.h b/include/dt-bindings/clock/sun55i-a523-ccu.h
index c8259ac5ada7..54808fcfd556 100644
--- a/include/dt-bindings/clock/sun55i-a523-ccu.h
+++ b/include/dt-bindings/clock/sun55i-a523-ccu.h
@@ -185,5 +185,6 @@
 #define CLK_FANOUT0		176
 #define CLK_FANOUT1		177
 #define CLK_FANOUT2		178
+#define CLK_NPU			179
 
 #endif /* _DT_BINDINGS_CLK_SUN55I_A523_CCU_H_ */
-- 
2.39.5


