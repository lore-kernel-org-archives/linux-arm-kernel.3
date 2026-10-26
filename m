Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AAF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eiehQb38;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a/2nMQaJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=; b=eiehQb38qzkRKbVWCaoQkLAace
	OB/hpv7DswBBcxM2tkh9xbvJUAdVQaiVnB3mtLIAq4w5g9gd0ntTn8nP+E9OXxOQBxTI1KOO04M3g
	tguq7Vx4I/8ACoZmM0l1NxzCGTyiBXSooaJDZHREMS2EuKHCVnmXWh9RMyF7f7efJnw6n0nPOIKSP
	KzrGyNf4+bCyHHEDSH5xniVsvMILdhMeuyT//oYhnoJWDIVKT+yPD61/zp8b1Jx5uFqv0nFDXNSoM
	SQC5wEU+jJKLEIQK3vvyPYGGbb//mOp4bYxXT2ZrDQBf7WxWaLVaSdGz5k3FFfrfzyj/VzJwe4Zz2
	X07RngTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHq8-00000002Fu4-04wn;
	Mon, 26 Oct 2026 10:22:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHq5-00000002Fsu-3n7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:22:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b060ec084so1695146f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010120; x=1793614920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=a/2nMQaJwqaXD8K8OgA10o+9jItI1duelKMqOAL6lCCwmMV23Lea1QWL9xUEWlECux
         EtE9jxcoTlC4wLxwBGdhe1ShZyYhiDyPkdqlW9e3/2gwaTrcRgZwzNipA+MWRACC8V4C
         AnR0kAX37WAQoDNrXpJFGC2K8xATcmOn4XN0vGLuZ6ynEDDQecaNkCoO35EfssESnGo5
         m8nYeFWnxhrE95zXfOim8EHGH61Mv2raRO5bZfcX52xoez/FhkQRgPeMb35jQhmn0c7R
         rtnoyrxjw61oyX/Y9cLFqsl26/dv5iSw919ehLzdQkxRl9hh2KGAGqfalsTAIdcj3wno
         G7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010120; x=1793614920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=RY+leCCGPXAYtiGbgkX0DZs62+0hiDyOEVZc0hbAaaRmWw4kMDcXBSO19cpKZenft7
         lk1kgJPN8aswk9SdwBtvEPjqnoZBVTuX3ZoDUFx61+2W/ZjV7s5BFULtQL5nbcnmFRmf
         gsvg6Wb8FjzJdy3oACoY/zis+Coo5au5HOgFYP3vCJQFUae7U9goIDrw3dAB9NaM/y/v
         mSwgQnqx21i4JmPIz1fQWjtMvuujJvtETL3wolDeeHxT1AwSurm9xGp9U8a+ZVcpls0R
         kVnJV1wwLqd6IgQgZ7LERReIpSWlAiHfsJxNGxw6+ceXUEqmPtRoXvBgeqQi2ud0h7px
         FCJA==
X-Forwarded-Encrypted: i=1; AKwUvBy3w6gEMt0s1od3Z6h9KOf2EIYjYnaps/uqEX9d9mydGRULMcR1yGfrAYP+PM17xULZjVIvq5LeaMxfjsUoxBTo@lists.infradead.org
X-Gm-Message-State: AFq9FYJguBwmOve91tKvwVsKQH8cbcjFMKfN9ug8uoYxOaKdd0oe8qpe
	6yu84+6PMsQmYJgkQPl21MzesPc5KiD40uv3WWOxbQZ8s9CzmWVwve8I
X-Gm-Gg: AYBFou27RZUtHBXj6E6vhHXXzUZ+0b0KLVyQbqYkVd9U8ZI4C+fucMJxxYMCHyhZcr2
	Osff+RZ6r9YA/5aFmq4viQT+79Wux+ldN+5qdmklZiS7zvdTAty56QPZRx9xznUeQTtH/jnw3Ki
	CyUce6X6ollqMDv2agTyzhGqJrp2bSFFAOYJ6gvITyEmbgqfIx8KB/lmKGk9NLk5Zhbcbh5DDZf
	sZUIMlWeKxpHbGTYp64w1bGBxUYQbTZG6YnnVMRgCDK0eyHwuUbRzLru0iKL/lJ64wjI5e7oiDY
	2uxEkM5RPPTS3NdTfLqzPIMjArK95XNEBhGVR8cNRCENOp7GLB04fELYuyMIJ+ito7uTllAjnrj
	EFE6OY7YxjrGK2/rMzXVJiss2sxhhUuU3NWwOqQEvSyYwtsihPloBglVyFYKspUx/xMoMjAwEPz
	hQYbIT32a9Z5tAXOyObeJ2oKg/q/aKwSSlXybNe0gnPkLyOQl00dRBJKuYCiLkHnPcdcWMFSvKe
	L7ySI6IIbsUMBJ3hU36ow9IJEJlJbgd8XU8SH+T9gaHOO3Tzgw7QkBBk6Y53FGaZ+j16maTlF+g
	4xY23UdluULkaEqHPCy8quDQEumvOX3h82gsE/uBri9JDwb41XQIdnA0nV1Q
X-Received: by 2002:a05:6000:612:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-48e3eba5700mr11608540f8f.50.1793010119803;
        Mon, 26 Oct 2026 03:21:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Mon, 26 Oct 2026 11:21:36 +0100
Message-ID: <20261026102138.36786-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_032201_957622_6A4F4257 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..49ad2a8a390d 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -238,6 +239,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0


