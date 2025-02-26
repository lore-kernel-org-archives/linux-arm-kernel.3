Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CA1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v1UAwVFC7mS/QirMYrHfPNDSkcpoGhMMfEhSCgpqXo=; b=AyZjUWmqtW2gQEUxBw1F03zUMn
	ckr5e3T+oWMH1zq2Y1tO/7DbYkLihk24485vieq8GftkXLW2A2Qz2o9NfjIqGik4F+NEDYFyvojjL
	SbXctinPS/8CTMKwQAkf3KLRhcOIpZm9SiTypqgVoDLew3iFJC6bUUuyhMHd+tOhEghqvBguvfmK+
	KoEHi+PbtF8IPOHTVAJB1j4oGw2laA4kBPA87NX4XXfqUrvzJcoVsIDPZKzCLK2UoHI5Zmo5eRgLq
	lwXJAtaJcM6I3lFzOb2V/cLlJHRU7EXByCkkNEs+WiHwGvS1VNet6BmejxEyKZstq5FsIGB834Qj2
	0nB38UOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIVR-000000046oK-1PI6;
	Wed, 26 Feb 2025 14:35:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFx-00000004328-1pDw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 14:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=/v1UAwVFC7mS/QirMYrHfPNDSkcpoGhMMfEhSCgpqXo=; b=J2h56W//aDPZaFOZ9dh0tYcylZ
	09qPuCZeg+0eas5CuWeVcYMw1qPtU2OoBGs+lZ/KdTF71XYjPXfPWlXtkGyvdYjQFX/dP0RSw6JjA
	iZS7i6B9/ZGtbgYC75FrG/Mwz1inMLd9TMW8xx1AKEtgDWFrjKHYsjiMGn9Bf9WoPpd1TQDihwT9w
	JCNaoNV39GHdaN4c65W6i3UOhskDHu+OHrQPypGL9DQwfLJo9T5Btd13i1mSF975q/GLoNYxqpq+W
	vb2BUfwUbi8DBvzoJJs718mxXdjFRshtaPlXKBEHB3ROy6+AI8StxRjHLoA684mqGzYdZBBE8OYh+
	R3K6wa/w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFu-00000003cXg-0xzr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 515845C45F9;
	Wed, 26 Feb 2025 14:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C803C4CEE4;
	Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740579558;
	bh=w48Gtlgi8iO22JGBkIhg/tszWTob5ViJlyp87dlVGys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RTGfSV0vs4M1Te2F/O08Wv/YqQGAFXPFSIbgYnGw/8Vf2v3R4VWg3DqQmnXYj8Rt3
	 RChA4exN/zziV9DzVi4fyt2fUC+WYgDZVLDTDXD52zTlsqTE8YYvpCPGbXzI1Uebkz
	 WMwTF/kqD346tx2pG0c2Z/pkfngbr+vrZvllM2mIa3Bkd4UaPzyAyKVEExQyIOSH11
	 OsyaOgKQgZsaZwZVFsu6j31K8SUsBt5vr6ONSD3xGg7kL4BVnJ/Qygd3a1LQCj8Gtd
	 LcXsQgAwBvthSPO701JFmpTbdH36TcBfOFIIkZ+ddIsk7cZkpjczpmV9rZQhnQHuwo
	 ko/J1RKUKvWxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFCDC18E7C;
	Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:13 +0100
Subject: [PATCH v2 02/12] dt-bindings: vendor-prefixes: add GOcontroll
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-initial_display-v2-2-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=1019;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=QrUKw+1GlBeS4gjTwGekEGjOZJwzhcXs7wKcC4kZ2dY=;
 b=Rn9xYMCCPZAaFDU37lBWjcHyXDsbSfUSWIegppwKcclLyui8/SxtoImAHTHbKS1g516Fkg9Fe
 pSjSTd2jSfoCoR+We3nCjQ4Pw1Axj3of6sWd8Me6cRf4vgMvff8mnHC
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_141922_772761_056BBFE8 
X-CRM114-Status: UNSURE (   8.17  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

GOcontroll produces embedded linux systems and IO modules to use in
these systems, add its prefix.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dac80c62b742fec14cd7652d9d690acc4b4b1ee6..5dc61a05de0ce907caeb60bb92018569df0d19e3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -597,6 +597,8 @@ patternProperties:
     description: GlobalTop Technology, Inc.
   "^gmt,.*":
     description: Global Mixed-mode Technology, Inc.
+  "^gocontroll,.*":
+    description: GOcontroll Modular Embedded Electronics B.V.
   "^goldelico,.*":
     description: Golden Delicious Computers GmbH & Co. KG
   "^goodix,.*":

-- 
2.48.1



