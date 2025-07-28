Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E36C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1DVO47gvS6UWjKDvUYox8GWZkvqXljuut3TigsUQkg=; b=lGEg4oY3jBncItInAHfmhcLJcU
	LrNYWOnOZ0sH9EpnaE9bOXESDqx6fCwdw7nmmP4Wg1Fmk0WHGVsmujk+nrAmToizjWdQnEZ2HuuKR
	eR77s+QtkXc8g3iMpQs9SEG2ylfFc3LD1HgiuVjHjuGMHIe/C3CFKCaSsyQCJSIbppu44O9xXuv1G
	UYUei9chq9MKLH2h6szYghdXzkImHxloGMg/4WZwsj0ODzjKBSom+Y2EtmoMdscr5pV71f9CwMdzc
	IEKKc7aewEHKfa9lXc5ZyYxT4JTh/Jk8zaHm/GhesCT+wH62Vg8hv+iS5HzBY995shVeCy0R7mMD2
	Ll/eCnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPUd-0000000Elpu-2xbr;
	Mon, 28 Jul 2025 15:10:23 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPRz-0000000ElM8-17yn;
	Mon, 28 Jul 2025 15:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753715258;
	bh=uvTHoWDfs2EDKcTU/ctS/fdFesLbnoOsjLa1+Mgz95M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B1p6GydTvvV9IUlpvSF7BW+R/jZiJLDJk1X1ho3uJX91QeIXLtHkm2SOWG/BbP152
	 QVSm2nEzgp0cygItof5QokKepy/Jr/fbhGeGaSH4AN96S0GLoQ7ZU7qUAsQSm7y1+z
	 uc8x0xjOjv+mdqGXlm1WeSvR9A+Wk1md4bPfrrQdaj1zxtgi7RhGNQ/fAYw0s71GMU
	 KHH5RQ1G6UnMrLqVFr37jTzAKendrQdZkPrJoChDMTIhugh0THUQJKQkuC0l/lNQR8
	 7vRz6JQjMFxBdumHfY8Roak1PvqFA2mbOwyq9LzfHaDt7yxGzOhhZGI2AKAe/jRSZd
	 izplVda2lQRZQ==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:31ee:da95:eea2:34e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 89C9C27E83B;
	Mon, 28 Jul 2025 15:07:38 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Date: Mon, 28 Jul 2025 11:07:37 -0400
Subject: [PATCH v5 2/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-linkstarpatch_v5-v5-2-b4ebfeaca652@tahomasoft.com>
References: <20250728-linkstarpatch_v5-v5-0-b4ebfeaca652@tahomasoft.com>
In-Reply-To: <20250728-linkstarpatch_v5-v5-0-b4ebfeaca652@tahomasoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753715257; l=1156;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=uvTHoWDfs2EDKcTU/ctS/fdFesLbnoOsjLa1+Mgz95M=;
 b=jS97AuXubreofn2GtbncJNoEvjWPnHULAnjzCIRTJUVzrXRw9PovBHcnUMte3OHu7lrCE5xGy
 fiSEuxE9MBCANt9dIS6FOxBWnR2t3mw7teMzKH/HlgtZaD33TY7IVlY
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_080739_428325_AB73A702 
X-CRM114-Status: UNSURE (   8.44  )
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


