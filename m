Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F17E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljHWgokkB1ap6/+m1zXKuGRwlB0ssGgzZoSi2l98IAc=; b=d/JJ30Wm8tO3MPDJWYng2AkPAc
	r8dXjOcKv4fn51XbZRFFXESDuSd4oZqF+HKPRk4bvATWkXVb4uO/2YGBRkUBTOYfI8xTU0deTdo2N
	DNyxRAJ844c+i2G+pa5/G0h2k4Um4XwZveU1/Hib+5W13n8A715gZ6MjXzPAquWpLTTOwcNHmmrE7
	Hm2gI1cYMMw0sy6IwKbdqTmWgzlP8zJomWZoCy5Yg06XZ/dKGtBekJt4a/Hhh7HpijZzW+q5Bfvt0
	AWvO63Zhd1MJGW0l2sAryoZXxcTcF/cDBpOkcgCEjZ23NjUa+DHQhF+0av9lgMjSjZVfQPGi+eToA
	zHt+Ee+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqry-0000000CvEq-1W6n;
	Wed, 04 Dec 2024 15:00:50 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqqw-0000000CuyQ-190a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:59:48 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y3LKD0JDNz4wVW;
	Wed, 04 Dec 2024 14:59:44 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y3LK501txz8sWV;
	Wed,  4 Dec 2024 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733324378;
	bh=NcUhC83cFlqmRmSFrXtC0hbpqm6HSQrM74C2peoi7/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOqS+q4KniEzdyIqIrbQMfKgc0SzdFrItO9+xVg61ME9ZaE9lgsvLqwhOKrSATEq0
	 vNQX0pGhDNdm4wmGHP/RJTa/OdPIgM+A9sHrx8r42t0amx+dPxa0oI4absH8d8rbFl
	 2Ui2FSARKScF3zQze4f8ybXCwKnj1DKes6guYRJcO/T1Vp9hgxAhj3mZx7LxjcNO7B
	 M9qfxzAx3uDkPyxWAXUVlhesxk8lERD+ZiraFmYWVx30NwtZldigAxWDlNPmfusCCK
	 8COsfKiDRt37CNlHtXhTG7pDnrxYvefxWbloyTRGKW5IZ8ui9DtRCKfqHdLvax1BNj
	 szWjOQ7NBbYNw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Wed,  4 Dec 2024 15:55:58 +0100
Message-ID: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_065946_407838_0C6A5123 
X-CRM114-Status: GOOD (  10.31  )
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

Add a dt-binding compatible for the Exynos990 PMU. It's compatible
with the Exynos7 PMU design. It handles system reboot, as well as
other system control registers (i.e registers for the USB PHY).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.45.2


