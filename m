Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB35C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X739XGYENPyH7eKazNs980sUXKrePD1lY80Wn6mxsc=; b=3gBV8DM334JnpuMLJWVBrFKfvw
	AucWr87450M4AFhTZA5cHQ26+5nz0Dxyse5w3ab0Qc+JRTUBl2R4qAvGiWVUI21jrdd9OvtxzYPMN
	UF2S0XxVcNm5MZulodX30pjPKR4rgdm52VEjTXaT9QWGp3nxbmdAkubsSsp+1HLE5oI/QTNuEkaCo
	DMJA/W7D4t0dFW/TIIvDhbxyibt5ngRN53dYPSXSj3MA2XAVpvlkOJHnU4QNYcGDLkzleBYK4tv3T
	kLLXzZ6a8o1naJOEUGrloCO7QNAECNP/D5tHVTrEnI7K6AzW3f6+2t45ZmwjAvD79jlN7BiQqDExs
	DNs3OnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcR6H-00000002bfR-3j9J;
	Mon, 27 Jan 2025 15:32:33 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcR50-00000002b4x-1UUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 15:31:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C79F044307;
	Mon, 27 Jan 2025 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737991870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4X739XGYENPyH7eKazNs980sUXKrePD1lY80Wn6mxsc=;
	b=CqL+tAKwM0nZ9UtDkFRmku5cGz9WFsQFCYj3weMvu8NDd/9ZOIy+cl8SlpZ7IQ6eWi2n18
	9Cf3gSACjGgTHbC7ZGQ4SRgMo8UBildXPImPEDM3GwWC7kTHfxNHv/sg9W4Bawu2+/pYaT
	3LjpdY8oIEAsTmd557If/qwptQ9T+KMMEnNDxPMHLbg7M+H1LGhqTiBxw1Uo5wi3rvRPFa
	+ZeRZlZr7zxnUMGhdDBB99oymJpmX6JYdaPIRr9Lcf5KtwuUikac8vEoWpivB6wA8xlT5O
	D6O0o/4q4+S6gUmEbyoWIsXDVD7EZ/JXiryM4INdX1VgPBfGtFuh63fd8HzyLQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Jan 2025 16:31:00 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-varsom6ul-concerto-dts-v2-1-4dac29256989@bootlin.com>
References: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
In-Reply-To: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kgJQKIwXeuIiFHUIgynm2SK+9xP+PtmmawP4ZBc9Mlc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnl6a8eX0fJ1piwCuJPV9T7FOfKSTFfoKmGSZzO
 jmLQp0upy+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5emvAAKCRDRgEFAKaOo
 NsEyEAC8ZsLZA0TPxVU/E9BEYiMbIa6BLVHbc0kicCqMbx/CxVryTHVCRlu1OF5o7Uh+aSKdRKM
 XQ6h3xHKMX1XsUArZEYowe/iiJf0smTH2yuKP+b27HirWi7nAP0TXab5hOgC5S8bO+icDnb/0r8
 CYG/sh82o4hUqnIj2rJlKZ/dgzcl4EO/5AEDWXVpZIEvHeBraywGE4GN36693Di3OlXmyg0L3bm
 W483sl/MXplAkFD7Xv4K2TUy9xqr1pjxBexuziAkdHros1c89uOSBU4HR+BlUexOYfEU44XliNK
 ZUxvmhCLi4JffhIPs3xbLpAAJVjKmULdk6W6P995o4Ry0hbdKcKBcd7iiVb2OKe+UvJZrMkaDhT
 /vFIo8pl0kPWiFgUY/dMI4DmIYp8rw4OX44TRwD+YXM8k4thNppg8ynJuyXN25UCrDigrshkI/2
 0+h2TPCZpUM5UvIU44iKlCK4VCkKeHLoWDr/TdtgRRlMxLsY/8XWFdzYymu1jLIakmpvr76h+xP
 Mu94X16Ej+tQ/wngMTk8A1Z0TmzBz6uYRIro+/WEkHhy1cyyEQ0aYB/Wb3Bb6tx6PyyUGfbkruw
 IW2O9eO61xigwHFJZ9OUvCUcS6ViV/ZJ77BjO06oFnr3KW4laXCFv4dl4TOuNQYt3xox93keOAx
 KvkG3vCW3SVEzHg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghls
 ehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_073114_539620_193BA047 
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

Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
Concerto carrier board.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6e0dcf4307f1..4da575b31061 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,6 +688,12 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+        items:
+          - const: variscite,mx6ulconcerto
+          - const: variscite,var-som-imx6ul
+          - const: fsl,imx6ul
+
       - description: Kontron BL i.MX6UL (N631X S) Board
         items:
           - const: kontron,bl-imx6ul       # Kontron BL i.MX6UL Carrier Board

-- 
2.47.0.2.g7caf9f4c55.dirty


