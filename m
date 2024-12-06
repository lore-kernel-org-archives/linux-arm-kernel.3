Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE406E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BK3k0wQzG+wcJVdDJqI7qwgPPyd8dQa8qdUmnM7Xaf0=; b=w/K9yF7AtXrXaixO7nywlwxgMh
	Ar9y+7488bru8H4Cwo1dJ+BJYOSwZBHlYIT68z1A5H5FCARrILq3G5enb8ZiOvnLzJzmyM7chOJkw
	qDL1TG9iQmAliOB8Fd1UsK4ASt/GhN3K1jWM7vArpx2qHXzOUEDo2M7f+gpc6r1/SZUw8deFRAiHW
	rujLERSOgYTCnDjign8x2Gx3jxG4eCQdxMNynyUjiydaVOIJ2UAAQhtxiuh7vfAfAN2begaTxEaTR
	eCoGhOvMEySGFrnOYszgGbKh5aZRCptA4nLG/BAnPocMwOzCrHhqkikESRLR8AyE7wFQFN85iX+Cw
	w+v5zH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaXB-000000022MS-1LDO;
	Fri, 06 Dec 2024 15:46:25 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaTY-000000021OJ-2133
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:42:41 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9p0W60z4wJ9;
	Fri, 06 Dec 2024 15:42:38 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b9G6CG3z2x9V;
	Fri,  6 Dec 2024 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499733;
	bh=5TvZ7eh62szwn05oK/fVvj0pJfDk/MAb0mJhBHtI5i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVjeK6DJdkfLl8bWBj/CHbVzI8oMoUE8Bnqvp5cpFBSwqdvlz8Y/8b8hQIYGVRq5E
	 /RHMQntGwudwHi4ieF2PdHTcbBLDUBZsxrgCm5RK6qXMwxM46ygSNC3dq+k4yjDuve
	 5gpxcxTnULqaLtR9w9fwlTAxHDN7pbzVCyrA5nZfiPPIoc2inluIlsh9R0edwemnB2
	 o00A8HUwYSqLBz/ik+mQcv6gWSERHeW7jcx/tarGtdD7lvSEVAOiSZDytXXa3KVQe+
	 W+y3N/U381Mk3Y8h7lCEQ5WJwGbGYDoPfiltqmglF7vWafzv9xshmGdqJy48xXFqQh
	 xpnQJuspbPKAg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Fri,  6 Dec 2024 15:41:49 +0000
Message-ID: <20241206154149.4271-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_074240_535918_D65F931D 
X-CRM114-Status: GOOD (  10.24  )
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

Add initial support for the Samsung Galaxy S20 (x1slte/SM-G980F)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 8GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7dbecd367..3405d9e82 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -11,5 +11,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
         exynos990-x1s.dtb               \
+        exynos990-x1slte.dtb               \
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
-- 
2.47.1


