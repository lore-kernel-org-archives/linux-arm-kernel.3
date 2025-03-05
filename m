Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A950BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOf+f345+63izWPFL8o6h0GXKY2TapgX/yd88UAmCB8=; b=ZJg/bgVlkZtcSXfgULhqbyW0Qp
	OpybnFRYmEuq5i4jJqE1d5c3AwuS1zc8vs4ttQ9wVrEXFkwRfqx5H0Ulipih2//xyzWJzfo+HZgy/
	Yuy/f+J9Ly4gHrk89lHJCNI2QWTjFJpqRykJaHodW1QTqiFbVrXiVlSg8g8L3a8BcmxlRsCGgOQX1
	HsdaI3s/6O/ZQk0fFPTANWK66U24ZP1/9psrDkRh2uHaYUhOw3AfY99lqmYRo5nGSZQKYuTkGOS8m
	geq+fG6MIQ6h3Pipu5Cq5eey8eI8yuQ6to8dGNmcqM4UIjhbR4A8ynofhM0AnJUz5qsESA6xWyEUQ
	WN9EY7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXm-00000009OZn-1zYU;
	Wed, 05 Mar 2025 21:44:46 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwUX-00000009O2U-1oXV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741210882; bh=rOf+f345+63izWPFL8o6h0GXKY2TapgX/yd88UAmCB8=;
 b=h67f/iRewF8YgEOHxvCGM5N7IwkFrsgwhqq914G2DN9NfnbjjFaGsSaMxk6gsz0xHuWTAtX6/
 H9ThYy+hH7VqDpMXUBz+iO7dN5jmsgIt0sZM9cjYB7rruDzds6lIGNVRpTUlEXCBgN+jBHDQ75S
 qs4rDRJ0pAqJ/Y5U7LzhXBtNLgzAT07YOqR6fWFK0GP4zKZ4Tt2316L/Kcn1FTqBW/hWCdJ8pFB
 c1QYiBmMeyf2w5y89/ufu4dy6EJJqsn5BsAIDF4iubiwN/QD2RK2GjLRrQgytSlOjQaTjjFyQxn
 cLLQwazIYmbsDJ4PEgvKZ6coRkERL5Agif99MkusuShA==
X-Forward-Email-ID: 67c8c4fd88fb7bbab4530f45
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/3] dt-bindings: mmc: sdhci-of-dwcmhsc: Add compatible string for RK3528
Date: Wed,  5 Mar 2025 21:41:02 +0000
Message-ID: <20250305214108.1327208-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305214108.1327208-1-jonas@kwiboo.se>
References: <20250305214108.1327208-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134125_726757_15ED3078 
X-CRM114-Status: UNSURE (   9.66  )
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

The SDHCI controller in Rockchip RK3528 is similar to the one included
in RK3588.

Add compatible string for the SDHCI controller in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index c3d5e0230af1..fb2115e805f5 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -14,7 +14,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: rockchip,rk3576-dwcmshc
+          - enum:
+              - rockchip,rk3528-dwcmshc
+              - rockchip,rk3576-dwcmshc
           - const: rockchip,rk3588-dwcmshc
       - enum:
           - rockchip,rk3568-dwcmshc
-- 
2.48.1


