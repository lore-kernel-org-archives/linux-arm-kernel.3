Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12095E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFIlkTMa8J3lFRn50Sms4aL3EbVlGjtrH8+TBDt/hsU=; b=xDZRhGsf/XZrMouj4VHtN5yiVC
	gkq8gcw+1LAKEk4t7OJ2h1UbFmQRV6afFNl+Z9+yxV7JfZsHqxOz7BeTLj6tF2XJtM+XGvzsTYqey
	+kzWhmb+m+yynWi/Hi9ynwr6zDaZ0lbd1i9FSS9IRYodm1XTA3bflwH+FzPvYb6PX9SuCfVi1E2zx
	0VO+ao+AtTxvcbe/x3z/UxSGFrPEFT+/OP1a6xJ3Mhj56nzHxZYkShMqQzqE7wSPtaLdhY5tN2get
	lXf9UMREgHUqq3PvBQmAw3/vfXDBdIOjePtbL0RVQgG5avd1AnibMTqkfu6fb42KLiylj9uAsjig8
	uYsLAehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTodF-0000000Dy3g-1Yj4;
	Fri, 03 Jan 2025 20:50:57 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTobw-0000000Dxnv-0ctW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 20:49:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=eFIlkTMa8J3lFRn50Sms4aL3EbVlGjtrH8+TBDt/hsU=;
	b=lfpw/YhW/mB1DEUmnnKXWkpPAi29k6AEcNSP/iRhit/SYN96JNCPYYjTgP8P3UpXgFUUO4sbVpsWg3e/y+qhIvQEz3ivFCwlfU2cLTDKzR9dGSs3tYF00IffEVad0Szhhf2xlz9InCXSfHmLQ1CoQH0tLxSpidxQ5I/0lCRDotI=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 3 Jan 2025 21:49:28 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
Date: Fri,  3 Jan 2025 20:45:17 +0000
Message-Id: <20250103204523.3779-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103204523.3779-1-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_124936_501661_6D361B11 
X-CRM114-Status: UNSURE (   8.77  )
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

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..a30ed9547098 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1027,6 +1027,8 @@ patternProperties:
     description: Neofidelity Inc.
   "^neonode,.*":
     description: Neonode Inc.
+  "^netcube,.*":
+    description: NetCube Systems Austria
   "^netgear,.*":
     description: NETGEAR
   "^netlogic,.*":
-- 
2.47.1



