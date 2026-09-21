Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00492C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=; b=nA4nK2387BdqWH/q7FxZoG+J4f
	h4tFiyOEpr6jF32I/CvrGLVNen2kkgls1LG2Y6alljc+Njj3CiGcXuQujQWHvG2LW5izi/mZwMTFZ
	ay3r3b92Wq64RpnoJUSMIdeY8L/6WoOhsvGc3EYLcX8yTgWJfahyrIKsjgzpeKeu4m8TkrXHmtAg3
	gPGRNxi6/kE0UXxHAuA7OxHJkKBV06HFfQ7zZ+7wjJyBhiMXdQ4KBDl3kgbYin+xE+4fLaZ55r59f
	KgqjtaqdBXK2qfpO11dps0DMggSk8VaKF3KZ22shc6ePEbFmb8qlf/xNqlhws7CErInZ3sOFIVEHm
	CMAnmQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN7-00000001wNY-2jxU;
	Mon, 21 Sep 2026 11:39:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN5-00000001wL7-2MeS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=; b=Vg93cxyfKf9XeElM/WjCBqyoHZ
	Xq8JMTAJUUd69/EbNzGaE7rGEuyK1QQyAONPYy/pK4+C66LtovqJ5SudkS/sLA4SHngiJfiskEBYw
	3Hsc5l1DVc5nCZMxC2aRGOLQozazXmE4qVYqwyYh+PsUrNa26ikEH7YXEEkFX2MN39ZFM33OrHULc
	h1ZFCwcnLVMwgXKnSM4c3fjhKbkkmShlqTHJqvB75hgkOprejaM9F+nTFWyFmClsMUhBk5E9nZAxj
	YIEUqcw0CYFhkURwKv8N9O0gZLSTsXWU6oCOR7vpAAQNkgQ2SnkOWwdZh5OzRM+huQOz3QpQrvD1Q
	T7Q+Sakw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8cMq-0000000CDko-2xo4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:39:30 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccff31419so24128925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990767; x=1790595567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=;
        b=jXwwRhOLY8GlB8AJrQBqyjYuDOdGBIh5z6IVi77vkJpVpqlQXCDeefMog/5jSUKtgl
         713W69CsD/aCG1QuHzUEWVBzROclRWVr7qyLfsV3XDsZyVAVe87t2KNC80R58nHPL70P
         n2omsgi/1bzcx4Zuode098wiOx0ttnzNOn9VejXIww7AEwM7u5/Du0IT1s5X51en4sMX
         ltdqZNG9LqZproS24yCz+fIvo9vFR/W5Yhat07m1MCX3xU8QE7DhgTC4fs3kzSQgUN2A
         EtqY1fB05QQBbufHotuqawD6JTRg7n+nKEX9rNdlvEE+1cNdf0KRnQ5OrWbwKIEhT8Ij
         rRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990767; x=1790595567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=;
        b=sTx7bpRXLJGCnjTFVHbKnY7ce5dp6hKqT0DHQ6z+qnMU4kB5ML05y0pQu+Pl39Hqfo
         o36OMfkrNT0IySeGL44If1wVwVClfJwoIbp4yOnmxkmp6nNBWkjDWDO/a6yJ8t7QuwSD
         xMu/QYONAZ7pmv0vRCBgp4qDe93FTB1giw+TiV+GrZ7JJPZqAj5jfZ0KRxpKRz3IhTQV
         nuZEBYSyXk/hbAjJjLSHLfdUtKqFdwf3UTFWYr7pNzoqmaKjqHPuN7rYSGfkV6zKZK8g
         cWmXlBAGBqFafieVwGYLpXDMp4GHu5646gaYPLMDRquTVa0hrrgb2UHepz0TWEm1l5CO
         SUFw==
X-Forwarded-Encrypted: i=1; AKwUvBzQKxIai7Se0bzj4C/qvoSWzZttWnWKRIad2/M3nmrbjtxv4YmbsYEDjUKGe7Tn4POFuhiOkl9u/brQNM5Fm691@lists.infradead.org
X-Gm-Message-State: AFuF++lnTXUYJSbKTHVVkmvyWBnYkuMdPncbOOhoKZsIYAKfacqPrq8t
	QU6XuQxsmSqykb7xTME6x6S/llxqKeAkZLrlCSASoWptokf56UGuRQ3N
X-Gm-Gg: AYBFou3BsOd+e8JARQ93GkdNWP/NJh0Cx3P7oNdQ7B95LeV1t31kGaUz5mUfmHg+XzH
	WLHX/yFemmRzrRKcp2bukl7atMb/VY/0TwzL+DUHXi9RAikiTGgVplIT071cftY3h/DLr8W/5PQ
	UK/nFDjwnx97ip0xuF90axzPBs2Q7ROeSLd/e9ZpIVfuzR/ST2MoMm/ccZh0SUNa5Fza1jopCVq
	hJdaMxDRZRsKruU1sPN8NZTw/rGhBOoI1lhFL1d43+eLQzTAyrfokjFgn315AR2Qw6WU+2QZ2Uv
	ta6kmF6CIYZExEAEBcA0VqvDqXETqgTG863PbataqPu9GUiX8YSGveDUJPfnLAOaKyU8VhBdwsU
	vIR/n1/j7j4uJzu6LVYlWj+w34DzbIZZ2dJlhqXlhAUJMtiXS+0LekYtKro0it9+fqygX02FqCN
	VbBOljhT4B61AgcZjJVoFWcfHiHMScc2Z5UYXsveJG2MUeTM0pm/b5qcQbmLfAd9IruHM=
X-Received: by 2002:a05:600c:1c05:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49fc56af038mr172418205e9.13.1789990767340;
        Mon, 21 Sep 2026 04:39:27 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Mon, 21 Sep 2026 13:38:55 +0200
Message-ID: <20260921113914.779393-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123929_079625_AB80AE4E 
X-CRM114-Status: GOOD (  12.38  )
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

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0


