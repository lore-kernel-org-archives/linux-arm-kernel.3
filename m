Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4712DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp/E3DMmxqFfKf7nr8y8xpC3WW8LriSrgQ6tS+xpEao=; b=XsHk7pFH919uz3qlO3JMcnsee/
	5hGbzo5/6UPW1VZ2bCPIiThaOY4X9zeEMdNyLpXOOaXfflPMz5dv4RCKkXSdNQeblxxFIgJpiU+Q+
	U9Ykr+MH+hsFdj7abxE5zE+28GipK/KfDgGkRhn7EqIBkZVEr5MRNo+6ffAuOpPpfY/Klqq6WPDQN
	8p3VNvxNkbp6mkx4dXYZeA8mXqlOmB/8tNgN3zWUlvgIRynix5p1qEqDol19VoH15bxCJcQmFzf7q
	e56OtCPeK1+5ejunGhskUCHmJHWrfeIU3lkngCKcf0nS2jAh8FjPg/Ad4NY20GaQoR3tVEUUYiCLI
	P3jLfcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Ul-00000003pNN-11BS;
	Tue, 07 Jan 2025 07:59:23 +0000
Received: from mail-m49206.qiye.163.com ([45.254.49.206])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4L8-00000003nlp-22oW;
	Tue, 07 Jan 2025 07:49:30 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f3b5aa3;
	Tue, 7 Jan 2025 15:49:22 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org,
	Tim Lunn <tim@feathertop.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 6/7] dt-bindings: arm: rockchip: Add rk3576 evb1 board
Date: Tue,  7 Jan 2025 15:49:10 +0800
Message-Id: <20250107074911.550057-7-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107074911.550057-1-kever.yang@rock-chips.com>
References: <20250107074911.550057-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRpJSlYaHkofSx4ZHksZSEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a943fbd5fc503afkunm7f3b5aa3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ok06Sww4DjINLRMWFC8hSEod
	KD9PCSNVSlVKTEhNSUhNSk1PSUJLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS09MNwY+
DKIM-Signature: a=rsa-sha256;
	b=U+5XNebAtpYBijCgr1z5KsGJKon9coo9B+Cnp/OdYciWqLPJpm4Xf5ssVgw5I0g1Unu3tx622I74+VYW1AkF8WFAmfft6dA9XkVTRaiOai4qJZYvC3ceKKHAFl7qPBbvA9ndLImuQmCUFaSrdEnCum2yN9BDt9e5ZJ9pV8/6Fk4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Lp/E3DMmxqFfKf7nr8y8xpC3WW8LriSrgQ6tS+xpEao=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234926_692888_9714F115 
X-CRM114-Status: UNSURE (   6.93  )
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

Add device tree documentation for rk3576-evb1-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
- collect acked-by tag

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 01439d7bbde9..1bd1b609fcff 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1016,6 +1016,11 @@ properties:
           - const: rockchip,rk3568-evb1-v10
           - const: rockchip,rk3568
 
+      - description: Rockchip RK3576 Evaluation board
+        items:
+          - const: rockchip,rk3576-evb1-v10
+          - const: rockchip,rk3576
+
       - description: Rockchip RK3588 Evaluation board
         items:
           - const: rockchip,rk3588-evb1-v10
-- 
2.25.1


