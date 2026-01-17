Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B54C98322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FN6aQXtkPGvwJazEWBzSB+8oekQEJp9xSMmX+sFap5o=; b=F62XxdLCZXknK2+kuCtrLOYV4e
	tA9KwrLT36UkwiPVh8yk5UdZRIKNex76qkkgJIiZNRvzZpgeW/tll4XtGNwZbneefFINONBZ0OHI2
	eIvEXwNevcQOqndWk7Gs3XrgTRA9xvedMSaivTRVfKEMoXn/EmVsMbROaIrkP+58xhrZ1+qPE73bg
	XQoFjC5Xv18stt4cAJ2DRj3OW8R6n+jblP4QCFzH/al2nFP8D7nASIbYgpDljPb8k3jm/DAkZLQzR
	BcEkIBJ4QW6pOet8K5LaUKL/qUqY2QiU0lxKGDCJyIVRvIOkDHAVD3cy98IGZg2ZQP7ZWB8FSbMJN
	QwfXW/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4JM-0000000FU6f-1wEN;
	Sat, 17 Jan 2026 11:17:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4JH-0000000FU1Y-0Srd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 11:17:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 17 Jan
 2026 19:17:17 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 17 Jan 2026 19:17:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Sat, 17 Jan 2026 19:17:11 +0800
Subject: [PATCH 4/5] dt-bindings: gpio: aspeed,sgpio: Support ast2700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260117-upstream_sgpio-v1-4-850ef3ffb680@aspeedtech.com>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
In-Reply-To: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768648637; l=1334;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XG7pFsnR1EluRR+EFdEVQzRXxWGFIGc/mPiruNMQ0xs=;
 b=fBUpqWXZ3gZbvVmGZDnwQESir3BVUnInQZVNigV+6h1dREc3oa9lSK1yJ/gLlHqEIx3FesdjB
 wD22J7LklN4BMVLJoVCp4EMHEn3ZEOSfWnSTK3dZGETbOg7O5CMSz5d
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_031739_157164_C06F2777 
X-CRM114-Status: UNSURE (   8.94  )
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

The AST2700 is the 7th generation SoC from Aspeed, featuring two SGPIO
master controllers: both with 256 serial inputs and outputs.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 1046f0331c09..974185e3478f 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -10,7 +10,8 @@ maintainers:
   - Andrew Jeffery <andrew@aj.id.au>
 
 description:
-  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
+  This SGPIO controller is for ASPEED AST2400, AST2500, AST2600 and AST2700 SoC,
+  AST2700 have two sgpio master both with 256 pins,
   AST2600 have two sgpio master one with 128 pins another one with 80 pins,
   AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
   GPIO pins can be programmed to support the following options
@@ -27,6 +28,7 @@ properties:
       - aspeed,ast2400-sgpio
       - aspeed,ast2500-sgpio
       - aspeed,ast2600-sgpiom
+      - aspeed,ast2700-sgpiom
 
   reg:
     maxItems: 1

-- 
2.34.1


