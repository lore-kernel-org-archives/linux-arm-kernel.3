Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D6CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAzC/E/F7q/7HFvoRLgpsRSdEdWdl1u9Ms//kuDq2hg=; b=QHRCmCg6cNGJMe/le+QkXNIAbC
	TSCL67kMtUamSUccuxjtYFP39jN94XL5dyOjteaenvwUijGT2vliqgWTbfIjel/qh+IpKS4lJkrAB
	qzHO9KVwokJTGZBSFfbFg9+KkMm8jQQl5LlX+SMmV5SFuRLz9EnxqcnHEUhdhqH2YfE9U5FJujv2i
	sNefzbObVcLgZzQL+WrrXI8JdcipyiotNmXU1JTxjnPjpUhKOTs4Q86lEWoaXOyUUGi1motciJoNT
	RgqEmykZEvVlArTM+4yJ70bmDjL3Qkd+OiGz8o5OamDCh5QtUXR08UxOS42x2fqv24kr1Ifkl5F+y
	DXwOSBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYd4-00000006wdB-1DoM;
	Tue, 31 Dec 2024 09:33:34 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYbp-00000006wQy-0lVM;
	Tue, 31 Dec 2024 09:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=gAzC/
	E/F7q/7HFvoRLgpsRSdEdWdl1u9Ms//kuDq2hg=; b=jDRhSSkxqwLJqKUdO1aaW
	F2Ha5TSL4HZSmDvqSh56vNz+ifMFrCHmMwi4nnLetoGB/8qGpuEuGOEMPdMDQ7yR
	erTouyT4rNVc3J0PV+itsShs1DG6LxEi5qen0SzF5Zhbd5zbM1YQoPbvwMTM4Y5d
	uJGrbf32sxWm4ByDyxRqPM=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD31yQLunNn0QGeCw--.9208S2;
	Tue, 31 Dec 2024 17:31:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: joro@8bytes.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [RESEND PATCH] dt-bindings: iommu: rockchip: Add Rockchip RK3576
Date: Tue, 31 Dec 2024 17:31:50 +0800
Message-ID: <20241231093154.252595-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31yQLunNn0QGeCw--.9208S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1xZFW3uF47Kw4kGw1rWFg_yoWfCFb_C3
	WxZw4UZF4rtrWFvw1qvrWxWrn8G3W2kFn5ZFn8CFn5Ja4qvrWkJF95Jw1Yyr1UGr47uFyS
	9Fn3Wry7XF9xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbD73PUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h7GXmdzt4U2PQABs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_013217_588903_F7DB000F 
X-CRM114-Status: UNSURE (   7.34  )
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

Just like RK3588, RK3576 is compatible to the existing rk3568
binding.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

 Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 621dde0e45d8..6ce41d11ff5e 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -25,6 +25,7 @@ properties:
           - rockchip,rk3568-iommu
       - items:
           - enum:
+              - rockchip,rk3576-iommu
               - rockchip,rk3588-iommu
           - const: rockchip,rk3568-iommu
 
-- 
2.34.1


