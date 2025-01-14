Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E44E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PwaGY2hQdA53dM9uSqyQfAgTJuHd1T+/rPbspVftxY=; b=0Y1bMZKNB8Kblr4KVnwTQV57Y1
	yIkZzkKCfMInmgALY1YAohQHkLlv5O59fUa7WLIPb9dE7f4Ym9ZVSUsumEyidN6wynebsRbaqzmSS
	5cYLI8XHx2g0yU7Rqnw7BBB3Fz2a+0a3e+lurbytuvay5G6bJUOqo1TGYfvHYrtjjAm7zAYmNa3iO
	xAKgUfHN/a1nPTJK+p/pOoedM/WCJgbvbQsNhLkVmb7GKSuVpOFa/834vBIwUY6udT4Td1cyPDGOu
	X+4lUlvt5IQ5750G3YtjW0lSfoo9pwK0T+mWu6WNzrYYApBYYM5dJP7JBmGhe8z0Yei4TTDLjduCn
	VJNztlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbYN-00000007iiP-0wqm;
	Tue, 14 Jan 2025 07:41:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbVt-00000007i9w-3lMN;
	Tue, 14 Jan 2025 07:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736840339;
	bh=onP3TwVXvky7SmG0oH4gyIJ/metH/fIt2vO6CmeNHU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iOZzIagIPmiWXdK5lnqUP0MVL9aRPb6NOf9A538RgVbV2rhJqNtdYFqPcahOkhOtK
	 B+BExHlp1hP4Hz5qAL+kDskeQRWJxxYbIffzVsLPEI+bifuhX18ySvUIZ0OZgKpNL1
	 Dvejhp9zWMPezAtGqJcbmiPES2L1BXTKM/HePcv4OF/+PkcD0d/KUVLOdYISicT5N1
	 sek0d/+KIfgQ620asVg11DAN1xBMw5e7tju2yjs2rRz2GgEUsqoorPYJsZMNdFO4fm
	 sRmajEW7OxvU94Lr2t7ce1GdouD8ZPWsaYzwTAZOgGuIRh6MBC694xefx/v4QslHN4
	 ylYRlsR0ZvMSQ==
Received: from fedora.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E76EE17E0E6E;
	Tue, 14 Jan 2025 08:38:58 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Jan 2025 08:38:39 +0100
Subject: [PATCH 1/3] dt-bindings: arm: mediatek: add mt8370-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-dts_mt8370-genio-510-v1-1-8517ee0fdbe8@collabora.com>
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
In-Reply-To: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736840337; l=966;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=onP3TwVXvky7SmG0oH4gyIJ/metH/fIt2vO6CmeNHU0=;
 b=0p3TZri7c6j+zhjMD/5h18E52KsVc8ilF5nqLimvDUtDMqdBo1LxmIqgmRjeTTGEhSVWqVR8B
 F2JNyouhAmpA0UiSpQeGXgmn6peOhfQPj/mOfaBdCOH3AgfmbOYsKZY
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_233902_079520_CB91E705 
X-CRM114-Status: UNSURE (   8.16  )
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

Add bindings for the MediaTek mt8370-evk board, also known
as the "Genio 510-EVK".

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 3ce34d68c213acae44c27bdee3a9bb0b9dbcd1fd..108ae5e0185d93976556a03768595961961bcc33 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -412,6 +412,11 @@ properties:
           - enum:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
+      - items:
+          - enum:
+              - mediatek,mt8370-evk
+          - const: mediatek,mt8370
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8390-evk

-- 
2.47.1


