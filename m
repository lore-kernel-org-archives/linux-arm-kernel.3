Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B20C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIdeV1+pXq0QaKtzBsI6ANLMHSHhAqjh7JQhiSF7JzM=; b=M9NDJShzmZS5oXR6TnxnDMPfed
	i0to3EjMNsxeT/sbc3HtF+1yv37Di4HAaIl3o4Iupppq3MJlCn+V5supIJ0ZU6u8a+IdQDdMGF69+
	JcFCvb0fzkvjjDsN+7tVim8qEGZlzLB1KJDmTPij0pP1iiLY/ojn/D5zfnDn74Vf27mtb01qfBZ2D
	pCvI4NwC393VIWY55+/7adb0tf0gA7hrI2/8uOzHPbg+sHGjriF7sgpyZBqhiHbDvRpdL1J904UFs
	DsXO46S1R8J4wG0gc2G7BHkc7ESeWCP3BVUUNJAghptqZHdMEqDj3dISFEMxiRKoBRjryyUKcqAd5
	OOpQKaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBt0-00000007f12-3ola;
	Tue, 21 Jan 2025 10:53:34 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBbC-00000007bXH-0PKT;
	Tue, 21 Jan 2025 10:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=rIdeV
	1+pXq0QaKtzBsI6ANLMHSHhAqjh7JQhiSF7JzM=; b=M2ZGcCIgxmuY+dOCZstHE
	iEv6LegmSeOgJ4xguxvbAPFnG+Qc2hPNxnzZNkK3S4nbQkUzQc0HMCoG6K2jUeVQ
	6HEbcIRL04L/0FnBYnwbdRUPhSJxpMVxrQNBv5orjkR9nYODeb9pVv1FKWkUwWpZ
	fMDooB+Cs4/pfYFWV63yXE=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHVyxIeI9nfog_LQ--.31266S2;
	Tue, 21 Jan 2025 18:34:51 +0800 (CST)
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
Subject: [PATCH v12 11/13] dt-bindings: display: vop2: Add missing rockchip,grf propertie for rk3566/8
Date: Tue, 21 Jan 2025 18:34:44 +0800
Message-ID: <20250121103446.2528212-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121103254.2528004-1-andyshrk@163.com>
References: <20250121103254.2528004-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgDHVyxIeI9nfog_LQ--.31266S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxtw43Zr4UGrWxXF1kKrg_yoWDZFXEq3
	yxuF1Y9rs5Xrn8Kw1DA3yxCrs8Za1Ikr4DCayqyF4qy3Z5A34v9F95Jw15CF18CF43uF4S
	krs5urZrWanxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8RRRtUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gDbXmePdPdBiAAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023510_489609_D0843B9F 
X-CRM114-Status: UNSURE (   8.03  )
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

Propertie "rockchip,grf" is required for rk3566/8.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v12:
- Split from patch 10/13

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index f23939e67fd0..157a37ed84da 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -145,6 +145,9 @@ allOf:
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -200,6 +203,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1


