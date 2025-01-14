Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F54C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 00:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11bw0J6qO+9mxKLe0Z2Gb7Ay6M6TocNEYgsoy2WMvnc=; b=f7RTxO7I6X17ie+R1N3v0JnYO8
	KputAX4tEf8jmKs5ULJt+H84Xb8pM1Gw7mwWQQCT3SKL7BgF0+5Rv7+VvX8tk9WKWGyg+s4is/wRd
	EH+3DN46zsqOXtwoUlWyW/313mC0G4F2pRl68cHZW6VNPJ1QpBR9w9ZZgngxwynwmDaZywQQsbUvR
	c/iwKNVQg2+/495mNwkTPmNM0MZFeJ9pXiYxdYRFkyJ/MgbehxW8AtG2Y/E7MTGqyORcICu7nZSDf
	e0BoBS6PlBRC8/kVa5ViBd7VztAcAG26dwGBNYBVQyHDpuRONjEgwzWc3s9svnBRL3MZ3saPQ0ger
	uR6VsWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUdm-0000000729f-2Wju;
	Tue, 14 Jan 2025 00:18:42 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUa7-000000071Z3-3Snd;
	Tue, 14 Jan 2025 00:14:57 +0000
Received: from bigfoot-server-storage.classfun.cn (unknown [124.72.162.122])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 19B757891C;
	Tue, 14 Jan 2025 08:14:54 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 19B757891C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736813694;
	bh=11bw0J6qO+9mxKLe0Z2Gb7Ay6M6TocNEYgsoy2WMvnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=USIcRRT8f4K4RNSLnwiZhfBDotI352qD2GliYOL617lfWjfgz2Q8WxsLNduKaQAfN
	 RBM3/BMZI6BazPtuSu4gP9QA5SdsYhwNsM6eWX91dPEWY/wrbf+hPS077jMWWQ2W6l
	 WvAQuwSRGIpmg0isi/WF32mwSD2b5CWozpCXgsbs=
From: Junhao Xie <bigfoot@classfun.cn>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Junhao Xie <bigfoot@classfun.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 2/3] dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
Date: Tue, 14 Jan 2025 08:14:10 +0800
Message-ID: <20250114001411.1848529-3-bigfoot@classfun.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114001411.1848529-1-bigfoot@classfun.cn>
References: <20250114001411.1848529-1-bigfoot@classfun.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_161456_019286_80C03D72 
X-CRM114-Status: UNSURE (   7.30  )
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

This documents Ariaboard Photonicat which is a router based on RK3568 SoC.

Link: https://ariaboard.com/
Link: https://photonicat.com/

Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..4802ced008b7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -49,6 +49,11 @@ properties:
               - anbernic,rg-arc-s
           - const: rockchip,rk3566
 
+      - description: Ariaboard Photonicat
+        items:
+          - const: ariaboard,photonicat
+          - const: rockchip,rk3568
+
       - description: ArmSoM Sige5 board
         items:
           - const: armsom,sige5
-- 
2.47.1


