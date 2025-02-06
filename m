Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzjtk//Wp5baYpqeQ5ioBfQJtIBbDj1Ub/HRRw5Ccr8=; b=s+CBugmDZyvQpXLd0EUjJzVTVP
	+xPZrJLry2N/5EPEb/ORJ/Wm6Wlul2upnUWWVN8L+3EuQnEsHywWJ4TBI1albCp2ssTNSVTRt/7Ek
	Qomb0FJ55IZrvoNTgF93qw5l7chgrtomzN4xXHDO+OLIx2fJ4NKeSFsnu+jXrZMcyHe9CzcOBvuRD
	hW+ra6tqjLcXczumwO8cSU6TneDZ8L5jaqgECUTJsMGO44/cwTS2LOOUAWLSeV1ut+7n6HdGe24/n
	xn3EgpPUZ6ZpdQbHEsO5o2Kpt/Szxdn/3YaV0NZ/7P97DqpZIIsY/rXhLc7xxGRlKD+zKq8aotvRe
	1dA2PdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvuD-00000005USM-3NUo;
	Thu, 06 Feb 2025 07:02:34 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfveL-00000005QMn-3Om7;
	Thu, 06 Feb 2025 06:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=lzjtk
	//Wp5baYpqeQ5ioBfQJtIBbDj1Ub/HRRw5Ccr8=; b=IQL8yQF7qePULeZ+HgTz9
	r3DWeSDGg3Ey1/FeW4HmZxSVmtKc83qJr5aYeI2gBDuSRZdyOql33+YrMwspd/EO
	j35RQNRvfS/31sR/QDZ3nCxTixgPJELf1sCZA5YjtPpJ2Iy5VD3R98g0N7sV2dDy
	rPeAspJniegLE9IsicjvHM=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v+2hWqRnj+u8KQ--.33691S2;
	Thu, 06 Feb 2025 14:45:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v13 11/13] dt-bindings: display: vop2: Add missing rockchip,grf property for rk3566/8
Date: Thu,  6 Feb 2025 14:45:48 +0800
Message-ID: <20250206064552.11466-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v+2hWqRnj+u8KQ--.33691S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZF45JFWDAryUCry8ZFykGrg_yoW8JrWDpa
	s3CFWDWay0gr1UXw1DtFn5Cr4vqF97Ca18KFs3JF1xt3ZIgrn8K34a9rn8XF45GFs7ZFWf
	ua1agryFyrn2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFsjbUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRHrXmekUdSoNgABsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_224610_245612_1C8A75A7 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The clock polarity of RGB signal output is controlled by GRF, this
property is already being used in the current device tree, but
forgot to describe it as a required property in the binding file.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v13:
- Fix typo
- Explain the function of this property.

Changes in v12:
- Split from patch 10/13

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 32da1625c063..cf68eb911118 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -142,6 +142,9 @@ allOf:
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -196,6 +199,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1


