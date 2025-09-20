Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F39CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aaAslXuUtUX6oS3VLGxNFurl4ejRCOlN9+jSRnvqk/U=; b=MoBe/Eg9J6SPxz+bNCKRJlBqJO
	wP2RNlfteZptH4Bx04S3+hmB/sBRzNTwMtGFyJgFyTmAefEp35GUSED2aiLcG4Fkn/yH+nqGOPEF6
	ffV3M5bh4sFexA3eQoL9L4mz/iNrDfRPtP9BYZpG1DFaAVBMR9Kc/YWuqvMF1f9TP+a/1WZ02xhee
	cZ+rBvonVX3ORmXC6zRUOyrARwEQZfJ1kdaf8iy8LxhyWR6Y5W1P1XgwmQPLvPp61ouprc1+MQdS4
	tlWx9QGhAGJqjfi282o/2eAL2gz/I+4G3iJU6Uyeg+YG65fPLUCIhXJTYV5AWOzRGPZSoo3AyIKjQ
	tLd2Tlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v01Ix-00000005gff-3Sep;
	Sat, 20 Sep 2025 17:23:23 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v01Iv-00000005geH-2Qjw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 17:23:22 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ba5PtmFjowsIaHfACEh+0dU237szl4KEjgtN+AEHH5yNE4yl8t6kGqtsqa0LpXSvC3Eo4uGU7y68CtTs9Oic7MoZHr8ByUS+46tQknWuPP9clbP37TKBhw76hpfxuVI752/+YXC8Ll1/qZYu7OqhayQVWQT9NCEaMAEVnjJ9PgiQGxbjKROBFBE5MvuvUklmQJRkWMjmhxXDVnXw+VvWkKmd9czttkTFKIgRphvTP+1LZIcgDOz5NqLdjmNv/V39qXrf3CV/heebpvs329wnoji6AY1HcmxTEJg5FmDRS4nML6WJVlL1+X2/dXItwFYJiGPAjnpjRshcbyXqPbQlrw==; s=purelymail1; d=purelymail.com; v=1; bh=6/Bi9HXJdwmtXopWk4wjqbKq9IfI+RP10q7/G7trKjE=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1392048781;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 17:23:04 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 20 Sep 2025 19:22:52 +0200
Subject: [PATCH v2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878
 I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAOvizmgC/32NQQ6CMBBFr0K6dkypUNCV9zAsSjuFSaCQKRIJ4
 e5WDuDyveS/v4uITBjFI9sF40qRppBAXTJhexM6BHKJhZKqlHclYVx0XdVAykLLFLr3DLqQrqh
 t67VuRRrOjJ4+Z/TVJO4pLhNv58ea/+zf3JqDBJeXqvLe3ayrniOGxQzDFk3A0VAYKCDH68Sda
 I7j+AIbBwCnxQAAAA==
X-Change-ID: 20250920-mt6878-i2c-bringup-640d48cbf66b
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758388982; l=1428;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=6/Bi9HXJdwmtXopWk4wjqbKq9IfI+RP10q7/G7trKjE=;
 b=vNonu+OGzG1QGA4lfkYdNlJVPkanBGWOsfd/gZnlyCoNtSvnYDZ3hMHmvgtL3a7KF4FMHt+Yt
 4v5m6V101nbBX7mQEFH98yis37DhzMY9NfRonqE8E/C5RphlUkKgbJK
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_102321_691970_C70827C6 
X-CRM114-Status: UNSURE (   9.10  )
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

Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
a new compatible string for the controllers. Their design is compatible
with the design from the MediaTek MT8188 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v2:
- Removed driver change, made the binding compatible with mt8188
- Link to v1: https://lore.kernel.org/r/20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 23fe8ff76645e440c19469999ae9a86b7fdabe68..bd6811cbde701ce0fd9baa002aea59d43f8af445 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -50,6 +50,10 @@ properties:
           - enum:
               - mediatek,mt6795-i2c
           - const: mediatek,mt8173-i2c
+      - items:
+          - enum:
+              - mediatek,mt6878-i2c
+          - const: mediatek,mt8188-i2c
       - items:
           - enum:
               - mediatek,mt6893-i2c

---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250920-mt6878-i2c-bringup-640d48cbf66b

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


