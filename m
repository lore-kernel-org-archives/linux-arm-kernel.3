Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC462D41C05
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzi4Fz/8qdzZMUIpWOM8hn8WXDg65D2r48ph45pVRFM=; b=PcbfTKLerVt++t8JajVkITDxM/
	mfISSEFNXNQ8shpKAk1wRQ8E/VdNbZ41Qhx0c+6+vXn/bhkilboWnuADxZTaOreM7xKZFKX8XRCwA
	97e5iqkyjkA2MtkPel77qsm5Qa/QGfPPOZHIHOpQBYio0SUuM0eKwIONWDN1+kjOmdDLyV1Cqj7iW
	oKwfZcdr4Cd77cF2rvHIxPlLILQwWcds6ZOZ/nRiccXvBPrF9wfUlZHsYhfp1RS62M29WFvud0xET
	/3+Ct+6zsAbvYIdZuggB//xbaJoRCpTOHxjhRdAskxclr0u+YeH4jE4u+SD2a8qufoh9n4Hd9pSEC
	9xuB4H1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKG-0000000GOjx-1LKV;
	Thu, 11 Dec 2025 08:47:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKC-0000000GOgx-313C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442818;
	bh=xzi4Fz/8qdzZMUIpWOM8hn8WXDg65D2r48ph45pVRFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LBexYCu5FLXa70UuDT+IeSRE9494xvFnAQ5B1VicNIsbUW/qZG3jj6tGJ59lFFv0I
	 R46vEDyKtZxOXwmamOgLKTDcuGERt+/frBHXX6bUkc69HCtm3sg+06255Mp4KZ2dxb
	 stTMwTcVtHS/42CGKOwJLJVKUU9oFQ43SFhZtRmkpOsnn/lPqpi+y0kxyagQv+DqSG
	 H4axat0DbeF83B/6ycx3p61xRxKqi2PeoKRDTFjs+PBJOsLyADQGkNcalLG6gLIEvv
	 Cv6cuNW6EQuYeXPn9nrSIxWREXM2hmAl7sseCtAKg8d+Db5a7WdhH8NvUyOJKvGirY
	 zTGENCcHCgpMw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7F8D67D6BB;
	Thu, 11 Dec 2025 16:46:53 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:48 +0900
Subject: [PATCH RFC 06/16] dt-bindings: mmc: Switch ref to
 sdhci-common.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004700_950196_21F30BCA 
X-CRM114-Status: UNSURE (   8.28  )
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

Enable use of common SDHCI-related properties such as sdhci-caps-mask as
found in the AST2600 EVB DTS.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index 9fce8cd7b0b6..d24950ccea95 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -41,7 +41,7 @@ properties:
 patternProperties:
   "^sdhci@[0-9a-f]+$":
     type: object
-    $ref: mmc-controller.yaml
+    $ref: sdhci-common.yaml
     unevaluatedProperties: false
 
     properties:

-- 
2.47.3


