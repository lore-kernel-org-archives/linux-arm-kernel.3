Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E60E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EpTE79/6drSRRiwOZ9rtrjeU7y9GmdVcMImOalthfk=; b=l0CIYa+wtPwbm/l0P9DooG1QyZ
	1+IbMdq6DUj57M7mYF9qyadbeK4DbZDnSjuKZJJXgTwnEKBAKTDPXiSR3IlCGVH1j71Z8ZqMLXqIa
	+WIIyfFnbixErh15CKazRaj8RzlLJd6w2T6TTNoupwFvFZVbtBAciWhRdHrvnKZqrLh7foiJ0MDeJ
	cxrjqAFBWtT5WiBxQzMAN9NpzG+UikCTs5tS34prA7Divsx5aErRzT3q0CN2ktY2s1xgXxeePaFdX
	p3jnI+S1LUDItwZgx1j+ZJp8QUJAYTpETiUAuClW8cffbTipOqmntnR+W5EVTtVdIrx17u79OKpmp
	Rrsg/5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVxF-00000001rup-3Xto;
	Sat, 28 Dec 2024 12:30:05 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVq1-00000001qcF-0caB;
	Sat, 28 Dec 2024 12:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=5EpTE
	79/6drSRRiwOZ9rtrjeU7y9GmdVcMImOalthfk=; b=HYDS1cyTZ4/oL9yISMplu
	vLrB3ZQh4PVMJVLe2U0TEDoT/6F1pXPpZJBI/IsmGS+Sl9IvpmnqFilCgLtzRK8o
	7CDKL7JYJTodSXNR3CPH5meLf5JnHG2VdAyA84GJeb5UKnud4IKJzHcK8OR+9OUJ
	tZiaiDAjVU/qyb70QyuUmc=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3t0tl7W9nUxdCCQ--.1009S8;
	Sat, 28 Dec 2024 20:22:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	krzk+dt@kernel.org,
	joro@8bytes.org
Cc: cl@rock-chips.com,
	robh@kernel.org,
	hjc@rock-chips.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 6/8] arm64: dts: rockchip: Add vop for rk3576
Date: Sat, 28 Dec 2024 20:21:49 +0800
Message-ID: <20241228122155.646957-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0tl7W9nUxdCCQ--.1009S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyrXFy5WF4Uuw1UKFy8Xwb_yoW8KFyxp3
	ZrCrW8JrW8uF12qa9xKFyvyrZ5Jan5Can3KwnxAF18Kr1Skr9rKryfKr93A3ZrJFW8Xa12
	qFs2kry8KFnxXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jgNVkUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hHDXmdv5N-vSgAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_042237_612839_4361B170 
X-CRM114-Status: UNSURE (   7.43  )
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

Add VOP and VOP_MMU found on rk3576.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 436232ffe4d1..130d11a2cc89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -393,6 +393,11 @@ opp-950000000 {
 		};
 	};
 
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+	};
+
 	firmware {
 		scmi: scmi {
 			compatible = "arm,scmi-smc";
@@ -826,6 +831,69 @@ gpu: gpu@27800000 {
 			status = "disabled";
 		};
 
+		vop: vop@27d00000 {
+			compatible = "rockchip,rk3576-vop";
+			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;
+			reg-names = "vop", "gamma-lut";
+			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "vop-sys",
+					  "vop-vp0",
+					  "vop-vp1",
+					  "vop-vp2";
+			clocks = <&cru ACLK_VOP>,
+				 <&cru HCLK_VOP>,
+				 <&cru DCLK_VP0>,
+				 <&cru DCLK_VP1>,
+				 <&cru DCLK_VP2>;
+			clock-names = "aclk",
+				      "hclk",
+				      "dclk_vp0",
+				      "dclk_vp1",
+				      "dclk_vp2";
+			iommus = <&vop_mmu>;
+			power-domains = <&power RK3576_PD_VOP>;
+			rockchip,grf = <&sys_grf>;
+			rockchip,pmu = <&pmu>;
+			status = "disabled";
+
+			vop_out: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vp0: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				vp1: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				vp2: port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+			};
+		};
+
+		vop_mmu: iommu@27d07e00 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27d07e00 0x0 0x100>, <0x0 0x27d07f00 0x0 0x100>;
+			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
+			clock-names = "aclk", "iface";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_VOP>;
+			status = "disabled";
+		};
+
 		qos_hdcp1: qos@27f02000 {
 			compatible = "rockchip,rk3576-qos", "syscon";
 			reg = <0x0 0x27f02000 0x0 0x20>;
-- 
2.34.1


