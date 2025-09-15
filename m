Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F5CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 02:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ac7l5dVkk0vpzdT7SKs5XS4Zx6HoDGJagXwG71sDqrA=; b=LX55thzBxNSX1uifWT5ogmrYby
	zv8MBqJthKJpxuXXwoyONZVZ4mEONH10O9yqE8lxXXqx5mtbW85Y7gHoFbbFAwCkqRhLYxD4oNt8y
	0FmXlWXgN+laShPcE8VCjAzYC3Y8TMpR/9weNYlxRg5e/8bJVCVz902laVg+XtxkA/chc19rFJuQ+
	XRNWXbcvbK388XGuq9YazNQsd7YRPx+BVj2+l8S3nOKiv78xzv5bO/+XYXNqx1bERdyFdIqTOQkxQ
	O3hm7Xo+UQXuRtbRYNuGhY5DQKGJZ26DVrXMC9LinXp/kM4G6VieB9qXvc+flXh1XLlDFrGoguh2S
	LrrEEY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyta-00000002ZI1-3Jrd;
	Mon, 15 Sep 2025 02:24:46 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxytX-00000002Z3Y-2oI7;
	Mon, 15 Sep 2025 02:24:45 +0000
X-QQ-mid: zesmtpsz9t1757902965tcee76ace
X-QQ-Originating-IP: 8SygWpMkLfN+wjomF1uQCBSYsTX1NhwX4hZX4glgh2A=
Received: from localhost.localdomain ( [183.51.120.121])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 10:22:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 254777178612388058
EX-QQ-RecipientCnt: 17
From: Kaison Deng <dkx@t-chip.com.cn>
To: Rob Herring <robh@kernel.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kaison Deng <dkx@t-chip.com.cn>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
Date: Mon, 15 Sep 2025 10:22:04 +0800
Message-Id: <27b2ce7950fdbf28c6c8404c3f8be3c1c35d6b3c.1757902513.git.dkx@t-chip.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1757902513.git.dkx@t-chip.com.cn>
References: <cover.1757902513.git.dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MbLl0hvuz6wXSB4rYr6xyW00PodqRBasf3yaMgtvdodk8D4xWFumbGAJ
	b2oJ8EYIU4gDebh6TvqNBidn2CsVcGjC2T9f5+Ks23PXq+p3mF8R9SogFZwKOWUWYmr8Dhf
	OeSPPvsPYsyo2fb2/DtSPO7NlmM7J4de+MU5trX2JgnpqbNHZsWDlO5yrzUulkpMPbgQmZE
	Q5OreHXK7ICpm+DavL2bKF5bPST7OpfM3nvfyBFczbldA6BzLpE7btLCkg7maSGD+AS9lkS
	lWpz/mYmXNbM1RuD6Ebw4vro6X2VOeX7bT9F0D9XCBs6T5Inw8/DF3/pxlcMQlN8NunLE5h
	lSJxa1aBAhmIU2SfNRajL1494x56dXtS+zaH3D6TAXBsZRDoFQq5TffpyZgWtQiyAFV1Ji/
	vtO2Xxtg4RlJPxJfTe2wM3wXwpN0tZxBkdOps8mNIF1i/F1etFZju385Toh1+ahGRvuVklO
	vBcOT4LgER/ynf/46TUGLN7t0ZuaaRxwplTxSvYdKuBu3Y/AHhcQtihGZGAhoLhozYHkEOW
	gG845+IrZwaTMZ7rqVeGFPb0oVIY89oWrWFAwCIz7g3xHMH6Fg3DExI6dJ17jShWR9Dz4xH
	D/D3yudclZgT5qjS5nLmYqh6vtWK9Uh7t107iZ+IAR4do7Wr6wXohzj9sMvdCIWHISC6Gt4
	+TzHEp4yyRAAwqXhwJmDsrBWaiMHR2XyuhXCaNK9JYHGytK4DKVsfY83oI8+3G47YhrxCVK
	a80jg666/XGFbyqb39N19H2yWhMX+g47d24i3Z/5zcxXIZ7g8y68xku0oOAMBRedJVP+1lj
	GDPWLsvinHX+edelnArYJEFbmTLyZl97NvgXHuwHqgExZ2Vlw9LNUdP3kN0mc1pvBvRdYn2
	SII49SSiIm21tbW5GskdMjbxox0T7gZXh1gRGh2Ifodvs2TQ6AHZJ+gLHEXgQuzTYwG+LmV
	jEPgjqjc46bCScL59mHPDhWq5YPMnEtlD6numP28PE3aqjfBskZ9fdwUs5vuQUy+/vAZEEn
	xeQmQ59bYcA98neAI+lxso4wV9v250SR2HMh1XtzW1LRhGdxlbRCYKoBtVf1bUTFEBGPSYI
	nMS0C4Z3P2T6J4RUPGyybHyv3FaH8R72r+WYTrQblLKx7ytl1xzniKEqpPY2bFtX4G9CQdd
	yFH1g9pFZvAUDWVJj1fk+sr9dmfW4r5eiQZwJjhKTtDuQO4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_192443_987342_F0BFC64B 
X-CRM114-Status: UNSURE (   7.90  )
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

This documents Firefly ROC-RK3588-RT which is a SBC based on RK3588 SoC.

Link: https://en.t-firefly.com/product/industry/rocrk3588rt

Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index f9ee77f17ad7..6aceaa8acbb2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,roc-rk3576-pc
           - const: rockchip,rk3576
 
+      - description: Firefly ROC-RK3588-RT
+        items:
+          - const: firefly,roc-rk3588-rt
+          - const: rockchip,rk3588
+
       - description: Firefly Station M2
         items:
           - const: firefly,rk3566-roc-pc
-- 
2.25.1


