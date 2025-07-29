Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4A0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1DVO47gvS6UWjKDvUYox8GWZkvqXljuut3TigsUQkg=; b=QhKA9OYXXcDZOLEXv0HRI4Iz16
	1Ry3qhM5/FK6RTzBPt7jBdRohstT0PlNgyUCiNk3kSM/dJ8NbMDMJrwl/bseSykeGA1LM6K1PGHGL
	u4aQ8JcySMZRUlSe5ZdUeXl3NslmSVKPU1lUamToTGAzmtmPR1mLBkXz79PSbi8EkdmWJ4F8xqK3t
	vB6HlYBUetizJQ3sMj8j0RV4dqcsLXo83r2FjRUX3xPmG2MnpYJP+jdz7LH3Jo6y3/WfDF8TOU7el
	56wBH92hm4yJzsGx0nFo5+9NKG6kxa8yF+nQYXyX81EcTAvy8CW1Mz4i5xPfPSt5ef1DvWMHW9Ysb
	aK0/k6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglXM-0000000Gw8K-3lc4;
	Tue, 29 Jul 2025 14:42:40 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglUu-0000000Gvmk-0LII;
	Tue, 29 Jul 2025 14:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753800007;
	bh=uvTHoWDfs2EDKcTU/ctS/fdFesLbnoOsjLa1+Mgz95M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e7f+1gF04EPCJtMjvzWXTovDsLqaG/DQcATOpq/FxVfZdzpC4TPRztqcuxnF6B+5V
	 V/vQRlY2FySRnjldujy/hfBKpFMERlRxDz+HERA3hnyZoaPFMIPd1ae8GDvIZ79uCF
	 4uKheQUkp4/LE5Zj70QHptIjzlzaPYTky70IrGnZ9FZGXkXmEexnpyr1d/4K3NmH42
	 FoJGNgoGCgnG2OkErsYoKVk1RJKFVspnma4bog3+HIDPu4hbYRzkjYpYc4Zum0HWce
	 Ljh+eI9rXA9TSoT+868HlPxJTtDuK8MOX2x0OgIPGOnmlbxXIfcEMiYgqyIWi3qxWP
	 Hs92GuGq2CgXw==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:f717:c76f:99e7:4a24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 4F31527E5BC;
	Tue, 29 Jul 2025 14:40:07 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Date: Tue, 29 Jul 2025 10:39:51 -0400
Subject: [PATCH v6 1/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-linkstar-6-16-rc1-v6-v6-1-92307f465835@tahomasoft.com>
References: <20250729-linkstar-6-16-rc1-v6-v6-0-92307f465835@tahomasoft.com>
In-Reply-To: <20250729-linkstar-6-16-rc1-v6-v6-0-92307f465835@tahomasoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753800001; l=1156;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=uvTHoWDfs2EDKcTU/ctS/fdFesLbnoOsjLa1+Mgz95M=;
 b=V6/m2tlOfsIWk2cC8KTlKZI6zh95Fkkghwoqhv0WwiCwkWxYvYNiFntnkOW9Oi4b3MdqJaiF0
 olwkg0MatQDA/0FPJIfXoHRYl+G0XsL6DvUB025YzEgXGDGobevhjqL
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_074008_234145_AA7C7A1F 
X-CRM114-Status: UNSURE (   8.69  )
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

Add device tree bindings.

This device:
  - Is a single board travel router made by Seeed, using an rk3568;
  - Has four ethernet ports;
  - Has four USB ports;
  - Has WiFi (MediaTek MT7921e);
  - Has a real-time clock (rk809)

Signed-off-by: Erik Beck <xunil@tahomasoft.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390e53b44f9093d32b869a7e0655db6..7f3904b69293f31fdd4f6080fab5ce054c1abee2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Seeed LinkStar H68K-1432v1 RK3568
+        items:
+          - const: seeed,rk3568-linkstar-h68k-1432v1
+          - const: rockchip,rk3568
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro

-- 
2.43.0


