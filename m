Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B62C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55rdvZGXpLc0PvWcYDr6+AWR3J6006+iF/1mc6xK2sA=; b=d73mzPu94LSdzR44nJzi02o/zz
	zFVOtx5PT+ayUhzm6YXs+T/rVi3CsrqSRw/QKqC6rRmYxJ6x9HDedsJQ6msZRSomr6y2dOcMxgQoK
	XUef84zF+6Nrs7WrcXfbYFK+YHRlfrj6qSz8ukFg4y+pxdW0r4IDTgi6VzF/VzfiEjUW5Gl/XZ3H2
	SW72Vw7Ty89Vqw9CD+JQat9ZhFiqHZhs1kg75cuNaeb5RA4EjMYQD4lMK4X9LveXn9vpwAWaJGszy
	GRQN29zMAgFYxJ7hYY+oHnCd0KO0evj5gj0uxsigaKs4yI3DBXKmkQ9i3jYzeX1hOpZg/MCjMW57a
	vIieIakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJTS-00000004TTh-19iH;
	Sat, 03 May 2025 20:28:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJQq-00000004T9p-15BG;
	Sat, 03 May 2025 20:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=55rdvZGXpLc0PvWcYDr6+AWR3J6006+iF/1mc6xK2sA=; b=Okhsv0Pq+pX/ySFZzbgwx0eVIc
	iPU3DvZWWj3chx7l+QqrUc8+CbNwKj71pkKxZp6eyNEZ/eCkUKNP9tgtUZT+CkMZ87MJZonP60+/a
	XIwhzsxIoqSeSDgZWqvgi+Z9SblkXlcjYvBYuNk474xs+4Jkd7ImyTxD1LBn9/hdBAHTWU9ddC39m
	enRqOjZjP862g3Lx+f6BcKAV4EVrmzIAD4AeazVDVfLVyjD9FxGn4HeCrUn5cROyFH75Hg+w1G69L
	jfnvbYNexpZTwO5OQPIV7WJZ/EMmfLonVsD0XTlBfFJf1K1BorJSnkZ4IHRLwfWawYN95NbuN6hBe
	AiwTmKaQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQo-0001s2-EX; Sat, 03 May 2025 22:25:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
Date: Sat,  3 May 2025 22:25:29 +0200
Message-ID: <20250503202532.992033-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_132556_294986_395B2436 
X-CRM114-Status: GOOD (  11.62  )
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

Contrary to how it is implemented right now, the usb480m clock is a
controllable mux that can switch between the 24MHz oscillator and the
clock output of the usb2phy.

Add the needed clock-id to allow setting this mux from DT.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3036-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index 99cc617e1e54..5cbc0e2b08ff 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -47,6 +47,7 @@
 #define SCLK_MACREF		152
 #define SCLK_MACPLL		153
 #define SCLK_SFC		160
+#define SCLK_USB480M		161
 
 /* aclk gates */
 #define ACLK_DMAC2		194
-- 
2.47.2


