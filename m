Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C28CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=olP6+ZMssv+GG7vBkFycsm66e4Vrx3nQ+fFfC+znn2E=; b=PAyymRvXmUGurQsVjerGOqiKGq
	FuFrF6ZKCtO6A9nLislkm7cGc0/Pryqi1e4GKzBkXHiOCctdVtnIztZq/1sDCbkFQ2bwycts2COwK
	z6ZP0U1KGj2E4NVHk4dfsZoaOQ3U8vUnjFX2LVwaW1Gaon8JIEmzVGNhIBqDmonc1fCzGjfMl9FxW
	HEZUNhG7IcMnjyNFXWHgWm9Xsj7MBZ0pdts40jrembDxyruXWRdZV01kSNNKZmkPHY+vG+0GMnhz/
	fIhv0jMU/uY6fZtCtstUN7libsEfv9ZPPiouPB64OV8E5ZH/gjIBpAdYo6y9CYbch8+RybYszX/JP
	zMIPr4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc27-00000007Ax0-0Qd9;
	Thu, 27 Feb 2025 11:26:27 +0000
Received: from mail-m49217.qiye.163.com ([45.254.49.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbkv-000000076Vk-1taO;
	Thu, 27 Feb 2025 11:08:42 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65b3840;
	Thu, 27 Feb 2025 19:08:38 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: phy: rockchip: Add rk3562 naneng-combophy compatible
Date: Thu, 27 Feb 2025 19:08:35 +0800
Message-Id: <20250227110836.2343158-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkJKTFZKTRkdThgYGkNKGUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9547181f5303afkunmc65b3840
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxg6KSo5SjIXCQ0zOAtCLioV
	MyowCipVSlVKTE9LTU5PTkpCSE5MVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCSUg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=GVyOOujpn+khgzO3Z048/SEeA5nr3Gkm2uzTfzlcxqR6fIr5Tb3ItdJvMY+vWXL7hsoAVLaTJKzgZ8pPG5UeqY/gfjOOyhBEFuXM4YuPH2TIoN8I3geGQWAzl7qq6UOobV6BGNK8HG/un4xhMJvGHqTbuk0XwnwWeejnzvH/Y3w=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=olP6+ZMssv+GG7vBkFycsm66e4Vrx3nQ+fFfC+znn2E=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030841_641138_16AE37B4 
X-CRM114-Status: UNSURE (   5.66  )
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

rk3562 use the same Naneng Combo Phy driver as rk3568.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Collect review tag

 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 1b3de6678c08..888e6b2aac5a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - rockchip,rk3562-naneng-combphy
       - rockchip,rk3568-naneng-combphy
       - rockchip,rk3576-naneng-combphy
       - rockchip,rk3588-naneng-combphy
-- 
2.25.1


