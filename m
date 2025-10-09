Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D012CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WLoRyTdOAzdrgDQu6Y9H3IPEVEhQZSzdy1Zv7I7aZiQ=; b=pZ5ejujL7kCGqKmrlzfc/9Z1AT
	CkUZhqJOuxDWSYkYU+77egJeag01ndKhRpambdJtgTR+00Q3cw8wUi3fOB1mvwyNegH6LzkHYi6xn
	WFMtmJ4doWzdlSycgk47zZi9UpGrO58/EAQkzTnADuUG2/+VHxYyjIfoGSqUDmRXvAe2+Xp3j0+LB
	BNy1opxUcMAv6fLN5Rq1aQWsF7RWAV3XKTUmGT2nTa7H0sK/d+R2+hHvOvGpYVCTVywzykI9SGJMF
	dBc1Rxkxr0wL+4penVeEAZtukT4tFX/JO4PGa6/f+EBVIVwBbsvPGer1f81XBN9Odbbm2frNiNLz1
	f+PnJc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vXI-00000006vWU-010B;
	Thu, 09 Oct 2025 18:38:44 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vXE-00000006vVC-2tAU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=WLoRyTdOAzdrgD
	Qu6Y9H3IPEVEhQZSzdy1Zv7I7aZiQ=; b=DWu2wiyNjhwAWbbOJBef4xB/CnSshK
	zMoP+yRSokij6/qzgL72FYMtsV3S7W8uQnH/GN2s9iOnj+jXwX5wNQi1/AkA7zhK
	S5zopw7SMn5p9xia4w2aj/d/1+4VjIpPEEDfiXMZL4Xqg4cLqBcPnqiR+mxvs6nT
	z1k280dSnqPwUtH00Oo5QnW0ltETgaAnX1Q3/bg9xLdTytTLzixQaMWjBRFUmUof
	dxA71hZORo4qFRpRe+eFntYtnlx+cPm5/+Jtjpg9hwBFRQD1LYxW10crIHU5YTsR
	Gyj1pOvLy04iBSFUrmLlg8C8Pq865jUs097buDMWpTVhlJ0xLw2OTkWw==
Received: (qmail 1186477 invoked from network); 9 Oct 2025 20:38:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:38:38 +0200
X-UD-Smtp-Session: l3s3148p1@iiAIHL5ATJ4ujnv2
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] dt-bindings: bus: allwinner,sun50i-a64-de2: don't check node names
Date: Thu,  9 Oct 2025 20:37:43 +0200
Message-ID: <20251009183835.5533-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_113841_008343_608B1C89 
X-CRM114-Status: UNSURE (   9.56  )
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

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* dropped superfluous '^.*' from the regex

 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..ff8dbc684bbc 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -44,7 +44,7 @@ properties:
 
 patternProperties:
   # All other properties should be child nodes with unit-address and 'reg'
-  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
+  "@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
     properties:
-- 
2.47.2


