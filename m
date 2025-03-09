Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAE5C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6FofIrD7CYolfdCZLFky0bu07JPr7+xedE7DFSwBiA=; b=T0rojA1vMfSQgp3AChxKUgJ/Xf
	xoUqOUKNIgcDE5CgXdUpd3rLMwYVSAlaiv+TTQ60gOXTGu18hqWJZp5Hue+oROcl1UXSgnwONFpQG
	Pb7YyVODS7j4cK87UOm4D0p/yOx3w+yaBkTwyDEH/Sc84ZMC0I1EsW03Iezlzs+i0CbUIj2gfibeL
	vGbTSDG3Ye1i+C4/q6TEmqR7efmV9TqsSvnCjbyfAzKuBJWUqxVtq2ioFfBKIeEJ+tFN/+/rRJN7l
	/H4Exv7fUsHz+llnH0wuwHtpF47I4AlJXGfntHk7nEYwF6xW3vXbskVs+1n9tvJZzbdH7O5RBN6I9
	aWnY7N/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAnR-000000006Le-0tA2;
	Sun, 09 Mar 2025 07:10:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAkE-00000000635-3Wfi;
	Sun, 09 Mar 2025 07:06:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B9B325EC7;
	Sun,  9 Mar 2025 08:06:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kU1ZBSc3RQnr; Sun,  9 Mar 2025 08:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741503998; bh=y/wMl0WzuNkOtQ0dqQBPbWzJw0X9RJ3jK0zL4sYnIVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IzLru5C0JtKymWuyEqvYcOy9MKh+ksZql7LksPIJshi0L0IGFipV7gRSfzdDebipO
	 QYldtE86L2Lrqe7CTqmbn2tcMGHYaFCEzhIfkA+VzdTHhma+62a+VQAbUMiP7QgZTb
	 XCPYgGar2LihDcMcJePCBsjWUQ3Dlf98bktCP70MZqrowlxb6r9tgy45rZoB0jo975
	 9Ry0xpvBB6OA8p4I6AN7vv6s2003PF1h7AwxOpkj/bMKXXKHJeSSmSfcW46KUIFZPj
	 +Dajljv+fGI4+eAC6CdJd2ZuF8jxN03QUr05mViLJTRFTlnLSivRv1bVXc3/7Jesf9
	 Dqwho9dX5xA7Q==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
Date: Sun,  9 Mar 2025 07:06:01 +0000
Message-ID: <20250309070603.35254-2-ziyao@disroot.org>
In-Reply-To: <20250309070603.35254-1-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_230643_007825_64AC5D9F 
X-CRM114-Status: UNSURE (   8.12  )
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

Document I2C controllers integrated in RK3528, which are compatible with
the RK3399 variant.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index a9dae5b52f28..259770b1aa08 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3528-i2c
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
-- 
2.48.1


