Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE5606D839
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wC0AQBUS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ei9BOE0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xyv5QiQC/fJR9Hi5C+KlTYMrVRwfl8cUX06VGdm38e0=; b=wC0AQBUSQIuJijcdq5FqM5Roim
	DKFXi4JOTl8Kx8XHZXTQBx6nHUPTU17sb4UYRqz0iCd2bdQ7ooI09zDhQPyoqG6jv86OUYQGyTefd
	F9pvcXX9ZHrhOUvGupQB/P9YyEXzEWGgGfyooCj1iYpXy1TiZ42lk5k++wktOX95h6vD/T8Q7NZU1
	o3pMVopcmMnZwIQBuPEsf9IblrOovRn9uf/oiibV1/pG6Z+wx6HzbQtvw1dMdnK6pJGSuIhacFQo4
	lHLS1UsxkQkZXyMzmlr2vpHcvhv6Pd3l1L07kijlAKi1FMPuxxgebfVA1RyitNSGQg3xUidTw+R0t
	stQuVHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySf-00000009Gjn-3q8j;
	Thu, 05 Nov 2026 14:29:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySe-00000009Gik-0hrm;
	Thu, 05 Nov 2026 14:29:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A385600AA;
	Thu,  5 Nov 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793888943;
	b=gCqvips0I34xCkLj3W0MVdoo2XPTwv4wEmnJOtGa9NmPbjDLJpDsaP74mLjX5d+NEpY7
	 4tfFpwqwJ99QMS/vdMunL4MJUUA+24xYiFsHWf9lCKw0lzEIpfpWftB3LRkUFA863vpUu
	 foiOreb8HY778X5iCZPy5jniE0M24ukYFX9kUEZP2PMd6ENlUc8duxBHoMWI7nzovD1Su
	 Z6HZOgXsilOIeiWImnBVAkpAG+dUcZsYDExoKcLUq1RZNbn8pgVK3uhvj3FVMdM0QoHM4
	 wm8Iu3GjNwlR3QCOUhEWN7eZb2QwCf0cBc1wzmU2wbADAWLl72tyINoYXtfspH20vRQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793888943;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xyv5QiQC/fJR9Hi5C+KlTYMrVRwfl8cUX06VGdm38e0=;
	b=0uXEvwztY7fGRAnREyfc+YqO5czKejdz0QGy9pgeQFXDsQIDmlcuCcWBwikRYR7rqGp9
	 yHHmnCbkmJ/Hf+0RWeL4UePIwGdO7LQZQ9JD0ncfR8EpkZpb5JjZ5blm7+YXQBmn+muNz
	 /fH/0J4trfpFUjf1HjIKPvnqDmRMzfACZq0OWWsy2cLIOet71pbtQVAlKJOSZqDYfSDj7
	 iqoUBOSj8T4pl72Dea/Kifr07BGhMOcQ3hFLvvtR+gBgR4zwqECRoE1hKkBBrtHokFEyv
	 hljMlzPn80o4+WHXwUlpkMRgMXS/jC8sg0VTrF96JDNsQTE36ochxRj0rKJKM/arolw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B01381F000C1;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888943;
	bh=xyv5QiQC/fJR9Hi5C+KlTYMrVRwfl8cUX06VGdm38e0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ei9BOE0mZ1H3E+5eZaJZjM2Z08TSMXaU432FQKSDeblHJRQOtJiF+Xxf5qBS859IV
	 h6gtROO5BLaN77SHrsaJfvtAtpwzK+qq2VNExHXWZvtv2OSwohllBVLKSrm0Gzm4Y7
	 vBudnY15PFRRkopf0C24Bjl4f9O6KU3cGZpByjm8d50mnFpdwG0dv/LDMBEphobjxu
	 U6MNLmMbdH8ao0t/u3nF+qfSCnVFLcg6cOXyRpElcR+9RDEpPkqhQ4CFKq1nV8Dmzm
	 UfBU9V8iogSxj1YGaGYIvCzBlz9J4iOeZJzqqIY6oVJN6Mxeehfx8tEl7NJ+vqdcqD
	 92JBkalcpgjWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 23D45472A3;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Thu, 05 Nov 2026 14:28:46 +0000
Subject: [PATCH v2 1/6] dt-bindings: arm: mediatek: Add MT8163 Amazon Echo
 Dot (2016)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-1-e68d7d428f99@protonmail.ch>
References: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
In-Reply-To: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793888941; l=964;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=68O/KFoEd8IiZ5hJEtL4JTCzMFkMQ0kQN5eapp9a42s=;
 b=wcE3Nn99jWzv7w1Dm9Rw94NFLpd/08GdQen1Di6JhiiMKBMGhEhqLbZz5u/In/9+1LTkJhft+
 0JHPerJVhL2AGcHe9vgNkx/oB0AJh3go+C+huLixrbfd7m2PN+ysRIj
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ben Grisdale <bengris32@protonmail.ch>

Add compatible strings for the MediaTek MT8163 SoC and the Amazon Echo
Dot (2nd generation, 2016), codenamed "biscuit".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..15db402552c1 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -129,6 +129,10 @@ properties:
           - enum:
               - mediatek,mt8135-evbp1
           - const: mediatek,mt8135
+      - items:
+          - enum:
+              - amazon,biscuit
+          - const: mediatek,mt8163
       - items:
           - enum:
               - mediatek,mt8167-pumpkin

-- 
2.56.0



