Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A32AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoKJ6FOgCFP1HuVMBu37S6FxFo809cHz971Ja0kvKBU=; b=t9ZGrGEey6Tp2tzrcWk7x8Cn9F
	Y/bbgAkDZgH3kWtBETXIe6qunVXJYJ4tcg6ADGduKTkBxE3n/wLhATRN75d1KWansoR7R7lbjY5ow
	R0PCUJJE8ZZ9Cy2hBROLcfBs2G1CbLjsQZQOViD7hq+/OGise1Ze6uSlinZRXpHXn9IZk4rWHgjVo
	yJPtL7ZMZ1ohOohcMfGB/wdZPbpGRpDSqeksEgrE/Mgjp5Ks0JcuA4H/YnkUFNp1MxMIbXuwQO4+O
	AgX5tnE7clOYm+pJ37DFCrmzRLUAgQtiemOoc099hZFh9Kkdd3F+QfNQeBd8CA/+UM4Hws5GMaoqh
	+Ihg/WbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1iR-0000000BgHi-3lbu;
	Tue, 24 Dec 2024 10:00:39 +0000
Received: from mail-m127171.xmail.ntesmail.com ([115.236.127.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Xf-0000000BdzO-1Vof;
	Tue, 24 Dec 2024 09:49:32 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4eef;
	Tue, 24 Dec 2024 17:49:28 +0800 (GMT+08:00)
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
Subject: [PATCH v2 03/17] dt-bindings: mmc: rockchip-dw-mshc: Add rk3562 compatible string
Date: Tue, 24 Dec 2024 17:49:06 +0800
Message-Id: <20241224094920.3821861-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGktOSlZPGB5OGEMeTktIQxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNT0
	1VSktLVUpCWQY+
X-HM-Tid: 0a93f812488403afkunm6aad4eef
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PzI6TQw4QzIcNkosFlYCLDIv
	DFYaFDhVSlVKTEhOS0hITE1CSkJMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDQ0I3Bg++
DKIM-Signature: a=rsa-sha256;
	b=RLV+8yjfPEqclnGQKP48Duwe2uNc5Hxwjo1n5ZycnicSBvaYJRm9G0xkcQN4sHPsO5Q3W3L5kRsUM7A3HbY49oluqxpdeUSYBd8uoXYbd6AKEQXtZKt6E5etHUlEKvAjyud1bq3x+zMw2Rshqih8d+IU+OIWudMiC2hLVIetnUw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=VoKJ6FOgCFP1HuVMBu37S6FxFo809cHz971Ja0kvKBU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014931_562012_A08630FA 
X-CRM114-Status: UNSURE (   6.08  )
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

Add RK3588 compatible string for SD interface.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

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


