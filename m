Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ADCC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7+9NHA8uHKcSqN4ck0qSZ7hO6Im2rYR1f73RFBsaas=; b=oNm5tQ0pNdQQFQrDW8S4kHv8px
	enFsTScrPnAiA9VOjgV+nX8iQ/HtbATz//YaGQoTcXiKqLTjP/MCMQxf7wbEZDuR7m0R51aG9X44u
	b4Po3VfkYXOLAP4P6SzjSb/Fc25SJ/n0naZT5EAeVK0nSwTemMNDtc11zySu8XlbyAN/Y5Z5hWkBt
	cD77aOXqNkW4IKFcu1vsNIZq0A9gPNsXqDYwo/RdzCERMfvH7hA3Po1nAILfjfC1IsD4UA49DnqwQ
	s3YHJKJnONdGcma11Ulz8OJJ1eU4CpVZXb9k/QPjQY6Wywx8xfPnEnysyRfJJcXNBkFQkKHB0yXhN
	B5/35IRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMT3-00000009wnd-2nF8;
	Thu, 17 Jul 2025 11:08:01 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLzv-00000009rsG-3O5G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1752748675; bh=k7+9NHA8uHKcSqN4ck0qSZ7hO6Im2rYR1f73RFBsaas=;
 b=YjUwodTcSzvR3Kkew3IIEn9XnEKhcSCgJ8rxBxSBM0QTXwTPFp+nP/g61fBPir73WI/snhCuI
 OHUm/nxz1SnF86jIW/GJWY5q4VIjtwew8jj9DBgpDkQ1m2/HSTQk3FhORMmIHIO8sRsYdoPXp3z
 QZmd9YRF6tW0V2v5AcvnUbjennqgEMU8tS8HM5BfaNRhKzntJsQsARnH/huNEwXMXQKXqasSiJj
 SsYd+Zq9oPbWVi6oWLM0ejOkWommB4EMw6RxDs9pOTPYhfDK5UeeTZDwu6a/rUQV3Vs07JuSltd
 KB0yovbgPvUJwGisJzsU32uEElvEozmcJ7TtFrgQkTWw==
X-Forward-Email-ID: 6878d27c5e51505848fe6067
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
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
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 5/6] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
Date: Thu, 17 Jul 2025 10:37:07 +0000
Message-ID: <20250717103720.2853031-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717103720.2853031-1-jonas@kwiboo.se>
References: <20250717103720.2853031-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033755_884920_945C5062 
X-CRM114-Status: UNSURE (   7.38  )
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

The NanoPi Zero2 is small single board computer developed by
FriendlyElec, based on the Rockchip RK3528A SoC.

Add devicetree binding documentation for the FriendlyElec NanoPi Zero2
board.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v4: No change
v3: Collect a-b tag
v2: No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 43f6403ecad6..e3d3d483de4a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -325,6 +325,11 @@ properties:
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s
 
+      - description: FriendlyElec NanoPi Zero2
+        items:
+          - const: friendlyarm,nanopi-zero2
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPC T6 series boards
         items:
           - enum:
-- 
2.50.1


