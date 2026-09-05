Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11212C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I596eH/N/ALTurMBAJDjCPnR2ONjyLmzJkdM+R3U7Zw=; b=4Kn3+rdDrQiQdG3+fQu6HAxOOR
	4x67jpXJstEtYruGIHREW1WXtZn+XhQJ0zI8tXUXuXf2Txltsc/Hv+Fb2hNrSGndW4kuA9O45TY8d
	Jf3R4cCa+YHUvYBD98U4y7XuSRGXAJp8oTHRzRVu+x/ighqP9gQnR1GLDh0dpHv0U+dc5bj43kZrQ
	7oJCovncta8wnQzDwtnEtkCkH4VN2XiW9vHMwTKAu1LfhMH+eZIEz2sTimNSocdjeIpgFZh26YQ9S
	+xBgxLyJDptzO5DJl96ekK7a/O612iNLpTvBzVA/uR+OZ8v5akiNWnoQkM4yyE7IrbL4rmtz3spxY
	pL9XKOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ttR-00000004HRE-2d10;
	Sat, 05 Sep 2026 17:09:29 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ttP-00000004HQY-2f1Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 17:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1788628164; bh=I596eH/N/ALTurMBAJDjCPnR2ONjyLmzJkdM+R3U7Zw=;
 b=nNMqkSjfaIxADv3bsXaJae3gg1ls+n1Ko/Z1LQVQFxW0QWsmKvmp8PwR+fLQ9IvlZR4EKeW/e
 x42lDRw8J7GfT7aPhDm98AlnjH6Z8+epOgxrF9XTi37CrccRIuXuKyPEJuwkZVhh+neNS6DIXCE
 n59jzOHAB3aVys26Ciu6c4A=
X-Forward-Email-ID: 6a9c4cc2a8f35195ccacae25
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v3 1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
Date: Sat,  5 Sep 2026 18:09:13 +0100
Message-ID: <20260905170914.1640-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905170914.1640-1-tturner@lineageos.org>
References: <20260905170914.1640-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_100927_725575_66371F9D 
X-CRM114-Status: UNSURE (   8.19  )
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

Exynos850 SoC uses the ARM Mali G52 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Add Acked-by tag

Changes in v2:
  - Introduce this patch

 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964..ece2b637cd41 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3562-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
+              - samsung,exynos850-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
-- 
2.47.3


