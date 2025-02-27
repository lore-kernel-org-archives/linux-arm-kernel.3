Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E1C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fktVaFKovjecxV81xIAXyNMJaQRx8m47zFV33JrqbE=; b=MC5i9SphvFuSrpHBUH9g7Dygk0
	mQgR5xf3uuW9DyKv2hjh5wt9WU7b6BAd2NyQZ2TfZNcv/70baaBIj0yZ8J1jRIZVHI6z8GCpRzVRJ
	K4Bn3AyiDayn+jyJK4DP94vq11BDt4rUiQQVbg0DgvJkBtN5qNA4cDSJd5dyQG45umcaYDD8rnOZc
	waJOuRsu1AB6Yr203cGgzQihc/B0KBvXHvim+xQ4CFsWp9Eluu698zQz4/V4gpS0MolBDF6WYcu1d
	RuZb0CBaUULHrgp9z/INl4oeDsCDjP0+cloCprwh5LAbkgmj5btsu1/QeSv094Z8oa2g/swhAHAIK
	23OaGyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncQG-00000007FEt-3jNC;
	Thu, 27 Feb 2025 11:51:24 +0000
Received: from mail-m3278.qiye.163.com ([220.197.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbvY-000000079II-3EXo;
	Thu, 27 Feb 2025 11:19:42 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97ee;
	Thu, 27 Feb 2025 19:19:37 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 11/15] dt-bindings: rockchip: pmu: Add rk3562 compatible
Date: Thu, 27 Feb 2025 19:19:09 +0800
Message-Id: <20250227111913.2344207-12-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxoaTlYdSh5DSUoaQkwdS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a9547222d6a03afkunmc65f97ee
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQw6Vgw6IjINGQ0pKE0hHkIe
	LVFPChdVSlVKTE9LTU5OSkxDT0tCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSktLNwY+
DKIM-Signature: a=rsa-sha256;
	b=fEdLJ4x5HQA3FnCbyYmtLwifAt7Lu0K2jEi1z8fDYnFyH1+lzLf8qpNG+6b9Cj5MBqPvM2G/SwBHBPvI8Vu64Bd73M0Zwts0uqmAzo5AmcSpgEC6DcxUjPGT6vyS775PiWLgKbux5A+p73X+fjxt8XvcdR2o4ykUwQ2LzcReL9o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3fktVaFKovjecxV81xIAXyNMJaQRx8m47zFV33JrqbE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031940_991253_AF0C25C3 
X-CRM114-Status: UNSURE (   6.75  )
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

Add the compatible for the pmu mfd on rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 932f981265cc..9b1919fc5598 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -25,6 +25,7 @@ select:
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
+          - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
           - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
@@ -43,6 +44,7 @@ properties:
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
+          - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
           - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
-- 
2.25.1


