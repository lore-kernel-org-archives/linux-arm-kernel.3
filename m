Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E548C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo4HpRjhDB146bO+d/SZp/tbPboqnBH+kc4IPu0Lg98=; b=cGQza0HnGlZ7mtlvviInKr5UuC
	cFDGEEXqCChDDKM3PtLMu3H3pYI9ZqjDX+MkL/6HVfRgB+BRWps+k/eMzTI4Lhg2lD5h9yrS9X7k4
	1rIMI+tuPjGOqxI/WVl2qDTq22F/XGFTWkHljlaaLwxwW+egknu2t4g8WrhE/rYBPE323ccHD1vCB
	aF+8OG+STy1vMJKwEENWzQXCHicWbDXL4SEt1tUr9vA21ZMFSw0OewEwBm1//zTzPEuuhjLofJGLI
	etk6cQfqUq+T+SpJdbMlpQIZWCKd8/eMoPVVHH+PwpakD3cs6C2HUtJ3D1RSGA3pEYp6a+IhhW1zx
	7c9YLlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLuQ-00000003R1b-0S9H;
	Fri, 09 May 2025 11:28:54 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKsy-00000003G64-3vet;
	Fri, 09 May 2025 10:23:22 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1483147ec;
	Fri, 9 May 2025 18:23:17 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Rob Herring <robh@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-kernel@vger.kernel.org,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 3/5] dt-bindings: arm: rockchip: Add rk3562 evb2 board
Date: Fri,  9 May 2025 18:23:06 +0800
Message-Id: <20250509102308.761424-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509102308.761424-1-kever.yang@rock-chips.com>
References: <20250509102308.761424-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0fQlYZTU5CHkwaTxlJTklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a96b4921e6b03afkunm1483147ec
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjI6Pjo4VjJRFQEzI0goMBgC
	K08KCUtVSlVKTE9NTENNSkJDT0NCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSUtONwY+
DKIM-Signature: a=rsa-sha256;
	b=PKCCOdTPZ+nLTHcQSV9aLN2oKJIM7pyTrkh1GQ7PQDaYe6f3NIqezGG0D8a9h68HEUq//GcHivcEFjOkHDpDxESmJ7RxEXV5Lmod5A3ysHOUvCYA1sSjDyy1sE8w0peJpiMJghF6vnzOZngX06Tx9e2j3h/7rtaOslVeegsM45c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=mo4HpRjhDB146bO+d/SZp/tbPboqnBH+kc4IPu0Lg98=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_032321_149653_0FC00123 
X-CRM114-Status: UNSURE (   7.28  )
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

Add device tree documentation for rk3562-evb2-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- Collect the Acked-by tag

Changes in v2:
- Update in sort order

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..3372aff63e4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1057,6 +1057,11 @@ properties:
           - const: rockchip,rk3399-sapphire-excavator
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3562 Evaluation board 2
+        items:
+          - const: rockchip,rk3562-evb2-v10
+          - const: rockchip,rk3562
+
       - description: Rockchip RK3566 BOX Evaluation Demo board
         items:
           - const: rockchip,rk3566-box-demo
-- 
2.25.1


