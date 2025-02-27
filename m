Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FBDC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvHFJXiZUej2/rw2Y0TEZw4Mh/rNQelI7yzxW1da/8w=; b=RMWxc53OtNGo8jto+RpOK8qz38
	MQod5cV4yym+AFVYTPKqCBt63/jD/+mg8qmaxG7Ok5axmzOKtgzWs5CuHTLGvLGJHdLd4dcb8EGSd
	ysZ21XL5PLSPEuxwxJIieVNycyC1xVWUiU7/IAi64eHBKJlPOnVnaKPVDTqxTE/Yv8SuWK3qb1b5F
	1Q4eEvqK96FdBETob7LDh796lGHwKEErUHZKXfJxrvDdPtzAcAhDBHHc0L6k8CPy/+YIKJhe47G0c
	Hz5Vg0LGcic71O7Xo01wlGsDJQpBedjP2Tgf5J2o0mjoQfGooL8nnNady49NkpKO+2qxqd+UzFWe3
	HAnP4BtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncKE-00000007E6L-054d;
	Thu, 27 Feb 2025 11:45:10 +0000
Received: from mail-m49200.qiye.163.com ([45.254.49.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbvM-000000079DZ-1Vuj;
	Thu, 27 Feb 2025 11:19:29 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97d6;
	Thu, 27 Feb 2025 19:19:24 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 03/15] dt-bindings: mmc: rockchip-dw-mshc: Add support for rk3562
Date: Thu, 27 Feb 2025 19:19:01 +0800
Message-Id: <20250227111913.2344207-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlDQlZKShlOT0xOGk5LS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a954721fd0c03afkunmc65f97d6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KyI6Dzo*FDIQHQ04Ek0#Hkw6
	QzdPFB9VSlVKTE9LTU5OSk1NS0hKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0NJNwY+
DKIM-Signature: a=rsa-sha256;
	b=PHIrBApMVXT9zti3L8tS1YLRYOuXmNkqOv8CKgjzyZcMB2nKS14j24mRLttFqUhQ8OZ7pQBHwVda2BLXnWYFWGRnLqtm/eaNYyJFFFOFum/rZSoaajES1k2BaoKN4YRLAqHojmYeTjq49UdCh1c7xGaMb9zLYHt1st3vbvkzOSY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=gvHFJXiZUej2/rw2Y0TEZw4Mh/rNQelI7yzxW1da/8w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031928_605631_39E391D1 
X-CRM114-Status: UNSURE (   7.66  )
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

The dw-mshc core on Rockchip's RK3562 is the same as the one already
included in RK3288. Extend the binding accordingly to allow

	compatible = "rockchip,rk3562-dw-mshc", "rockchip,rk3288-dw-mshc";

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- update commit msg

Changes in v2: None

 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 06df1269f247..772f592291bf 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3328-dw-mshc
               - rockchip,rk3368-dw-mshc
               - rockchip,rk3399-dw-mshc
+              - rockchip,rk3562-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
               - rockchip,rv1108-dw-mshc
-- 
2.25.1


