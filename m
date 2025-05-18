Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7563DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L371iAHTquiamr1qOBIkRG8ZfA4URTmo9Yt5n9upXbQ=; b=tIWnTbj5klKSabqmGUTagv8FTU
	IJo3ujdjaNiR6NTRF98RRcNuSw+tqLA0BArkuCxc20t7Ygm/4swlqu203jS1r3gjswlz72QrQXGfb
	/ZkAIrNAQ/x2AthhTTstCneCLzLufU9Kd8092t5r2tzlnFV6olBb3a34QQWvgS6M37XW3r7A0fc+Q
	CA9l6ohjdIZnoP/S2P67cFd6aLZD3l661SBBxNNDBZKJIhSFwcKo9IHIKw+gaGxFfyk8GtS5HENK1
	hG6tm+p3x5wNJ+IIqxfuR0clm9LVeCgFVjuVwKqGPYDnozWUckw08Fv+QIoz1EVzC3iV8pEqh0e/V
	D8jEiy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGn1v-00000007g5y-0o8I;
	Sun, 18 May 2025 23:02:51 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmuD-00000007fTE-1wNA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747608893; bh=L371iAHTquiamr1qOBIkRG8ZfA4URTmo9Yt5n9upXbQ=;
 b=ubVIW0vD82alIIAHHoLg5S6NuhzO/TaQmGmpwF8VermGVguCi7IMtFPhv175ZRC0b2cYxfhVr
 P9thoaZxNdGLuagYJ++T+1GcT7s1N6+/rNlFDV6dExFv0da1ZBXsz0HERiicdj17c3P8s78SQvq
 3GVD1edfoEQt93/MeZMWbF1JZtlcnDWwNkDWHKt8FKNfUMIftdGrzNeYdnuHzAHnA75bdhREmJ6
 XcR5prOMWIUxNmT/VmEdGuklesmfu6lTGOclOameDe6mIhVzVR3PD07AJAVktFJ8K34LN8z9bv+
 4Rm14sr6aAXzvL/RrelWCEMbgeanLfRgnZF8U4pXcwrg==
X-Forward-Email-ID: 682a6536db63046e3392f2dd
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable GPU on Radxa E20C
Date: Sun, 18 May 2025 22:54:13 +0000
Message-ID: <20250518225418.682182-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_155453_526771_D0A54CCC 
X-CRM114-Status: UNSURE (   8.54  )
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

Enable the Mali-450 MP2 GPU on the Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 9f6ccd9dd1f7..e4333674a0ec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -198,6 +198,11 @@ &gmac1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_logic>;
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
-- 
2.49.0


