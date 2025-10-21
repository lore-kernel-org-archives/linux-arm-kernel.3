Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JOqXWQaq3hbi4YpvtGsddkEQ1aOnP/muTiS+mWoANSs=; b=dWxF+yX40XjRXpoBa8AXj5VSu5
	nI1FwuhVQ70FD2RKpgfdg6Nm5eWFqD9NhDM19DaxzzowsdoFD40A4Pf0CmE9yImjGtyH7/xxlX5qI
	N7fWle3IuT9xUQPp9tJLQlaVf2RFWObzu5wkWxrU+MOpxn7bZNyef/UfdVZkY6oue8EzW/qzfY7Ac
	5TVpMhRNLl4KbUb/Jj6MqiYU/Lp6jQg05UkUB/exAYKrMKIKkXc8DWSaTysh8A/Et3vJ/USRu1vRC
	5T8MIgDnNaIo6EnwuCqNmsv0nH4r75oKxWje8QovQcV/wW3zJkLrCxLNY9vVKJtyLXz94i6+lh/u4
	3EVo/yJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKrl-00000000ncq-2kIr;
	Tue, 21 Oct 2025 22:30:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKrj-00000000nc9-2CKS;
	Tue, 21 Oct 2025 22:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=JOqXWQaq3hbi4YpvtGsddkEQ1aOnP/muTiS+mWoANSs=; b=C10ZUdJkwWItkwiy4+X8dFPGeO
	tw1dN3wb13cdOYfLar3mdlKZRvIEzmqPCFHfuxM9Jrbn5GEAakXAWFSLa39RqHpe0OsUDFKFrhhWt
	7nfbZTZNAekNjVDYMrD/lcjpj2Ep9+Tsih4VTtrwPTxGI7ZGlYx99VUhAn4ZwWD1ItYtyTWMfiJkM
	+DAcUXidUhOoj957446vClWuKKwk81UQqWMYBZ75kA81kI/9bLJBmlLG5mFuAjVZVFpLNWnQcFdYn
	l6ARDgXBVM8Ap9ioAGhtSYO9xHimXc6eM6UBNAc0Flgp4TnI8KPCEwcwsHm1yVl8I1PZ0JtXpCva/
	e+IKJg+A==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBKrg-0006hP-N8; Wed, 22 Oct 2025 00:30:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for RK3506
Date: Wed, 22 Oct 2025 00:29:55 +0200
Message-ID: <20251021222955.193323-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_153003_561043_3F8A38F7 
X-CRM114-Status: GOOD (  10.22  )
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

The dw-mshc controller in the RK3506 is compatible to the one first found
in the RK3288 SoC, so add the RK3506 to the variant list.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index bf273115235b..acb9fb9a92cd 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3328-dw-mshc
               - rockchip,rk3368-dw-mshc
               - rockchip,rk3399-dw-mshc
+              - rockchip,rk3506-dw-mshc
               - rockchip,rk3528-dw-mshc
               - rockchip,rk3562-dw-mshc
               - rockchip,rk3568-dw-mshc
-- 
2.47.2


