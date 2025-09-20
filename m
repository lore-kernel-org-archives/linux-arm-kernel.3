Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CD4CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5StLawx+qqMJQrals8ClyS5b4PSEb71MIGtLfZ3h/4=; b=AoPPDoTDp6t+TD3rXeF9+/VBSc
	oHIhzMI7EPkvgFt9K8kEvRqQbd8PBPf9ZyzG+6TzecdFed8fjjw2+TWZLShhBHk02WiCT4Z/Vp0LM
	pAOL5RIbZP0o80QGHIOcKW5pSS9mcko8RSPAYCTgbf4Nc+sON0TXuVwkCczAVgxHTc0fGMiVWLi2a
	N05xDftf1ixa4JiX/Hxii+qfxQO+hohNbL84uZRLNhNAihV/PhXTDDnddSlgZo0ISx3OyawdZbbZb
	iZ7BjrPNiQJn19ysbbc0xLksuoxF/DTf3L7V6/LHoK4Abvxh6M/o+xWZvQm8PlOefs9SJHntKHTH9
	1i1RtHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzYV-00000005XUz-1FrT;
	Sat, 20 Sep 2025 15:31:19 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzYS-00000005XTY-0Nnw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 15:31:17 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=mgAenjroz9uQ51Qfl3SdJRi+P7U5GqtTYbXi+z8t5Fl++2IuxwyyiLvUXrbxZBKeSI1jRUSsugAvSmOmf1ObrQMpcw1MV6bW9+TmU1LO+2A1bV6dLBZsR3LJ93ZG5whCQ0bm6vAXfYXmVzzc5iQijTBuVWqSCrPJtwbV3PbQQFfIGlDSjz+BrBXNxHO3Cq47dfSomHDW+CEgEe6CaXGObPRIs+rSFzYB5EmyOPblEmziaq8+5g0RWZnMk0YK2rhrgbfShOAshz7qOD9A9D0EVUJUedu1BGpGGwK6bf3YBo9D8wh0QJpn6hm06gKdlqLB7Lk3KEKXMjAQZTueYAoXKw==; s=purelymail1; d=purelymail.com; v=1; bh=RjfYDW3XL3WFS67dBPrYHYQD9w91q2A/xdKqO8p9qok=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1935225507;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 15:31:11 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 20 Sep 2025 17:31:03 +0200
Subject: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878
 I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6878-i2c-bringup-v1-1-d1527ffd3cd7@mentallysanemainliners.org>
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758382267; l=941;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=RjfYDW3XL3WFS67dBPrYHYQD9w91q2A/xdKqO8p9qok=;
 b=ZXan0Dlj6yTNyY363LasAgg5Y0RHz7OwnbUOCm3Byq5WFKaxXm00S9qCbRZrVl/Paa9hv89MK
 CNbcuNhTdhsBCpGXtEzZn85aH8gc9EYpxUj8lAbZoHjuwND1ynfmdiR
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_083116_209165_E95AAE6D 
X-CRM114-Status: UNSURE (   7.85  )
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
a new compatible string for the controllers.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 23fe8ff76645e440c19469999ae9a86b7fdabe68..b0d7dd0dd8fdd7b0dba14d11f75c8f0b7ac15f58 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -22,6 +22,7 @@ properties:
       - const: mediatek,mt2712-i2c
       - const: mediatek,mt6577-i2c
       - const: mediatek,mt6589-i2c
+      - const: mediatek,mt6878-i2c
       - const: mediatek,mt7622-i2c
       - const: mediatek,mt7981-i2c
       - const: mediatek,mt7986-i2c

-- 
2.51.0


