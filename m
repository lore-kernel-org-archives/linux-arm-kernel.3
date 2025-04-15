Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B9EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4p/0VxIff/BqHY5k/CUxFW5zZdAT12GHojWa2aHOQo=; b=tM86C+hh+u4dAV9WjAIjg8JM/h
	E734V6JOhDSVwrjCs0vgZIPbCox+OZA22H0P4ln91nj0LIOHX1+y4PsRJFSJVBFcf6yAPOuWrLbAx
	PvReH7LiL+cqPPvu2UbRqchNPOK14fks9v+WMWD+C1NaYVC2ebQUyQzK8NwOuQZu11mHs6AEOz2tM
	8cL9BjvQ93C0hN2B2mUK2jE8mDVHcfe/Y+LPt4EyOjZ/gCVctwgOwbdC9JDWbtw9QrBQdyLfjx5ya
	H/ej9Sgrn4qCFBmVziGD4q3Z/qYCTX2Seh5//G/GADy5uN7AwK0TsfUqpSVxcabVUWQHfhl2vLevp
	idkuFi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Yxi-00000004ZRT-3aJK;
	Tue, 15 Apr 2025 05:35:58 +0000
Received: from mail-m49240.qiye.163.com ([45.254.49.240])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YhP-00000004XK3-0Dsw;
	Tue, 15 Apr 2025 05:19:08 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d965f;
	Tue, 15 Apr 2025 13:19:02 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/7] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
Date: Tue, 15 Apr 2025 13:18:49 +0800
Message-Id: <20250415051855.59740-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415051855.59740-1-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGB0ZVhoZHx9PTkhCQxhKSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637e2f41403afkunm11e6d965f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhg6DTo*NDJMMBoXCgxJCj1C
	SlYKCUNVSlVKTE9PTUJPSE9PTUpCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlNTEw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=F+NgVsKFaUSn4Iwqzeyqodc6EoWQjFO6FCY9RXrhSGCiozim14KILpMuE5Z+P+/th0PILqxmSLTfrTS3kBbRbQsOM/p3wpJKe0CzBj+iLPMagIEYPRGTBHaSZlu4KOeG+FS5kjjj3aRSDFpApRV9lSlhxT9j8z1BfwMLopm3MJQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=b4p/0VxIff/BqHY5k/CUxFW5zZdAT12GHojWa2aHOQo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_221907_300666_DFF8DE2F 
X-CRM114-Status: UNSURE (   7.41  )
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

rk3562 is using the same dwc controller as rk3576.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

Changes in v4:
- Collect ack tag;

Changes in v3:
- Rebase the change base on rk3576 pcie patches

Changes in v2: None

 .../devicetree/bindings/pci/rockchip-dw-pcie.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 4764a0173ae4..6c6d828ce964 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -22,6 +22,7 @@ properties:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3562-pcie
               - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
           - const: rockchip,rk3568-pcie
@@ -76,7 +77,9 @@ allOf:
         properties:
           compatible:
             contains:
-              const: rockchip,rk3576-pcie
+              enum:
+                - rockchip,rk3562-pcie
+                - rockchip,rk3576-pcie
     then:
       required:
         - msi-map
@@ -85,7 +88,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3576-pcie
+            enum:
+              - rockchip,rk3562-pcie
+              - rockchip,rk3576-pcie
     then:
       properties:
         interrupts:
-- 
2.25.1


