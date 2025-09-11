Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0CCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0rBrJm30Ujnv7/uqbGRpN+whCeGubeOe0HHrobAEdw=; b=WAQRY3UpTbQ4tLnOFwBp4w9fVb
	ohoRrqTxzCi4Rx5U/kDhzAPck9QGxOS/hpHS+t4BI694zoE9EtXmnQIHHDKpdE+VzMF78i9n1g+Ut
	11izjpFxbaT7sqBRnvioFDUPg/i4TbQOVU67sOhPBkPpMld+Znzjy4Nech9znwLoy9P+LD5WvrpGG
	hgAv92uUrYT612J1KMfRZfDBb6zG46s48NJ6fs15eLBHLVqrObspli7qIKY2Pps17SZFURK0sovEl
	JNMUxQt1qZguL6WqbUP3+rzFsV0asSK++/q7i9Acx4R2OPKWphR/Ea1pRgiYMkAQUfzUqgQH92AXg
	qyBNGfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlOB-00000004XnI-2qD7;
	Thu, 11 Sep 2025 17:47:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlO6-00000004Xj9-42V7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:47:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41ADA4403A;
	Thu, 11 Sep 2025 17:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0090C4CEFA;
	Thu, 11 Sep 2025 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757612834;
	bh=/cTSt66cQ+6yac9OFUXZq7y3BS/9WNfqleMKgu9n+cU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1923mdyrb6wKeWPz0BQ+K8Ki71BI7YgVstxpHbobJLymlXvdhlo8hm3X5Dn9Zp74
	 Fi2SbgYSlBfITlSafaMwz/93h3RuiPr2ZQ9lwPcn1JmZyXXM/TWjrhiUNkNqfiaL/L
	 bOv3FtrzuMGfDpZU/1LYOjmvlx3O2MMEN2P5TSwVnK+zg+EZQK2+/wkp9jInk3MhJf
	 2tMmCbOUaNnpnguDcaZlGqriNK7wP9ilM5KZeKro8Vrs4EQ5ca85Dsqji4VpgrkskA
	 6xM9vghqFvn3s4bBZexgbjkqdJqkNCgrk2hUrpOO+RPBNqjAdw4vA9kY4DiNOsf7i4
	 QqA94Wd2+qDwQ==
Received: by wens.tw (Postfix, from userid 1000)
	id C990B5FBEB; Fri, 12 Sep 2025 01:47:11 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/7] dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
Date: Fri, 12 Sep 2025 01:47:04 +0800
Message-Id: <20250911174710.3149589-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911174710.3149589-1-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_104715_028184_97C349B7 
X-CRM114-Status: GOOD (  10.86  )
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


