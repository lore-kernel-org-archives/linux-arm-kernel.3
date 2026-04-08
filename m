Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D057AFD5F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbOGGRZRGKUC9wg/u4bagIerJWK0O28aWsRrCdAdIQM=; b=kAmRgOJk4KA/yerCMt98f9a5IA
	AFLI6ztNRv9/KZJyX1BCUfh7URST3ePUhmfqVYNTKVJhdIuMRraOc7/lKCRDIYg3/vhAgrNxGuIu6
	vnWooR1i0wQb3jCN9AzdzOrxc7xZrZl2OUtlrpAsvUXq1t2K0gSuSFq6MUUsWmbNwVG3Tm9ZlylMd
	SmYlI0H/+KAZQ5I9oCgBE42jTpeKOBE6Y3ujK3m5ZsDcH9t5dL3nvh+uDMEEgDLfQi5NRbTzWhheh
	r/gknhcWiZ+gT7Bie+5sgRIgDke4LOSm/xqzZ+YZcWxVLDZgTUjepmsuhzpzQUEgPzflTb527t9IY
	xE0OwSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANEI-00000008PgD-35VG;
	Wed, 08 Apr 2026 07:21:38 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANEE-00000008PfJ-3JmN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flordal.net;
	s=protonmail; t=1775632888; x=1775892088;
	bh=MbOGGRZRGKUC9wg/u4bagIerJWK0O28aWsRrCdAdIQM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lQGO3y3YMaCA8kDO8TvKmTevFk/tJrkj/WdjGhLen9DlP89s0Y99bZnZy8tvJ1jSw
	 rN2cl0J9WKuaOI5u2qLMOWqPNmkMIT4eRaC+jSmcVFbxwT5kko1EuoBZrVM15QVYlI
	 IA+TuIW0v+51qKLl4ZlozYBkbaK+z25l+yrTUu0CnJ+y6P6r9JvhvwBUNipBbqMbyd
	 5w7aDY4hATuRHvlBv9aDplAppb7JzGrjspnHj1bGBen3Fo1JMVs3bnhF3sGA+o5b8Z
	 sJTcm637R5yS8dbupZaTloI4oi1p01mjELU2d/7cjeeBdyHvf8+TfdGVy2kyBC8Scs
	 ORDCnAc4Pn/fA==
Date: Wed, 08 Apr 2026 07:21:23 +0000
To: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RESEND] arm64: dts: apple: fix spelling error
Message-ID: <2338500.vFx2qVVIhK@fedora>
Feedback-ID: 166586150:user:proton
X-Pm-Message-ID: c48aabe3f901b14e1434363741495137f986d95f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_002135_760034_96A97EF8 
X-CRM114-Status: UNSURE (   7.54  )
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

Change "configiguration" to "configuration".

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Axel Flordal <axel@flordal.net>
---
Original patch: https://lore.kernel.org/asahi/CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_=
5seuj1Qeh2_1dt994iCJSA@mail.gmail.com/T/#t
If this is unwanted I of course won't send again.
---
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dt=
s/apple/spi1-nvram.dtsi
index 9740fbf200f0..d2720b307774 100644
--- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
+++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
@@ -2,7 +2,7 @@
 //
 // Devicetree include for common spi-nor nvram flash.
 //
-// Apple uses a consistent configiguration for the nvram on all known M1* =
and
+// Apple uses a consistent configuration for the nvram on all known M1* an=
d
 // M2* devices.
 //
 // Copyright The Asahi Linux Contributors
--=20
2.53.0






