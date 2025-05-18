Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ABAC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLHfQ6GJDHKwJN9/gg2l7mvEQ/TXrvVecH6KzjJn08k=; b=iuSlpu/GD09x4nUAtZbGeFeXJN
	tVlMgRXgYrE4VFtmBt5T7gbcSQm7j1HfMEokh879j6754sX+9vsaLQlgK4pjkhf9Yr6FgPED1njq5
	qHPFW8dCMdmg6NXixTJspozVqDqpNWrh18hbAEXC30aSErjpqgzOtLLFDfXe1A1EoW6+jU7iZDTYg
	aoUaA5y3eFKzgrHjA6C+fKSm9wX2RFX9EHI3EiYRA4sbGpoLNqBHb5X/gRMcj3/moUklev9P/I/9i
	qILeEP/1zXtcNJQVfyjfrb9RfX2QoQy+zFen9E9NIDbQWsdRRXqM7oq9Pxltp8o+3lIdxM71IUkS1
	aZWJlD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmVo-00000007cxJ-01Jj;
	Sun, 18 May 2025 22:29:40 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmAP-00000007ah9-1J3B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606053; bh=oLHfQ6GJDHKwJN9/gg2l7mvEQ/TXrvVecH6KzjJn08k=;
 b=ly8BIAH364GKa8jM55XQp9SicSpvfYlJU5SFk0BMHW9nv0+jQ0hqQHB+hNc6N3nkDOZIH/xwi
 LqvB2bF0vC4m469ntnQwGE8KF9h9bcN8RWPxX3hzNIS3/C4XDiVleDGulP6J8/n1Xc3LIECS4V8
 FOfQjpxVK+CO9p9eRxUxcSMd7lidy6Nh6USN3Vw8QZj+woLF3euYIOHrSUTEEX67px10J1DiULG
 4B8EtVx5Fq2F4R0A/+KKBEMHgVqtVrbtPJCklbL+g7xTjkBkueynGwUvW7CunCNtJZBlTS+ZEBm
 E5NxnQrKqnDOzDmjUYv1JojdKk6ZC6gEXksPkEVA3ywQ==
X-Forward-Email-ID: 682a5a1e78cae75fbd8d46b0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] dt-bindings: rockchip: pmu: Add compatible for RK3528
Date: Sun, 18 May 2025 22:06:50 +0000
Message-ID: <20250518220707.669515-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150733_375679_AD54F32F 
X-CRM114-Status: UNSURE (   8.42  )
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

Add the compatible for the pmu mfd on RK3528 SoC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 46c1af851be7..55b2200d6e75 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -25,6 +25,7 @@ select:
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
+          - rockchip,rk3528-pmu
           - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
           - rockchip,rk3576-pmu
@@ -44,6 +45,7 @@ properties:
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
+          - rockchip,rk3528-pmu
           - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
           - rockchip,rk3576-pmu
-- 
2.49.0


