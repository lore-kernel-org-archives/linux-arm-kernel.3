Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6994C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUayCc7qleG+GQaAoICfJGubFfeF4aKvAB2CaQTkBI8=; b=e5LTZkFb3/Q0F7rhftmXOjnof0
	NZ2NDfH10NqrbB8Adgg8dHnIXvi7UCEX2/VEUsFST+zB4/BjGAGnajtGEK2L1TrfMTOCZCvIKjswS
	gmhatAEB0QBIjZ32KMKriYInRLDAJq+KCWCNjdcbI0qRWYskql2pw2L8jbQfI/189hsCgUF7gZW6+
	qGfMGZvfm8OWVPxcUeqXywCzrZDGRauJYA8z0VyqkI2qYGMIz1JbFCHWHyfs06CTkakl4RsHgb44N
	USZEQbYi6jAplPSjxesEZ85revvQ+etUmC5ZxDUfJdAsr4hSXLDHt4yDe78VGJKR3A1CrDJanLr+k
	eO7g1LWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDf4p-00000005abb-3YvZ;
	Sat, 10 May 2025 07:56:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDetS-00000005ZPB-22J3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F2AE4A6FF;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AFB5C4CEF2;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=+zKk01WvQFEh+9PS5+vkAROny5qxzLPQphXlcj06AMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TiMKl3FIidgw00YlMPoMBmwK9lE3bbpwUptOCGHvbVzkOVCXUbldm5Jlop+mXfxhj
	 naXoADkLN7+lZu0v9TiJQFuL2NmqX2ybEjKb7IY6lhQLE4BhqKL9G9X924Ur69VP4c
	 d+WZo1PsE9A7Ruy0+bXPe9I6IXMSY0zNXFzw9K1JeMM+tu+xCmYi8hpJiD0qruR8nJ
	 b0t6tL0M5z0FIOzgz0pw8pHA5h1s7UeIvuCXKxAX7KScewNB2bV8xue7AH1czMJt1W
	 GE+AWAWJK1gDRBHn1TfwEi3CDNXoeCBqBctlsH2UVrUE3ocAKMXFePIpgy2CMTnwuO
	 PQW61e94QB3lA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D03AC3ABC3;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:44 +0000
Subject: [PATCH 4/7] dt-bindings: nvmem: apple: Add T8112 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-4-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=1rEv9jNzjWLwB2+MWFArfWPPCr4WKfPng+/WgNvEPzQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y8C4PvicJlb00+JvVvFvq+NWXph6TEiiNVD74bLXz0/
 OFL3a+TO0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATUfNh+B9XbvTq4S8N3oxP
 u1Y/2fD8ygy+/xsl79iarTDmSW55frqakeHa1qveyjbVLVnN7nLvlA8f/5FWMWGL8V+7rQ2sn9R
 j+DkA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_004510_590764_E45A1697 
X-CRM114-Status: UNSURE (   8.16  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

The eFuse controller found in Apple's M2 is compatible to the one found
in M1 SoCs

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 Documentation/devicetree/bindings/nvmem/apple,efuses.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
index d3abdafdbca06245cdba000ce2ca757b5ce77d3f..2e8b014e9854a1a25d662bab75fee773c62369cd 100644
--- a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+++ b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - apple,t8103-efuses
           - apple,t6000-efuses
+          - apple,t8112-efuses
       - const: apple,efuses
 
   reg:

-- 
2.34.1



