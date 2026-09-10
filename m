Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8539C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT2RZQUr60vbmO6AyGkACnvFNC6PHvmgqZfBZ2wJHeQ=; b=taPwsWP0aUSCUCeQWeg4IrCCE4
	BNnLwUB4ogZm+Sqxc6JUqrpmpujJbBUXvs1GQJAoMKXa0nKuoUkBjl9BeKOT1bC5m9k7kNgSdRI7N
	GkStDaEDovRMHdWIMkyD5l/5dywLPiMMExUNWt7aBcKDj9Q92me8KmYM+UUTKF3n4NfjupTbmlUEO
	imE7f5bWRKHJ19ClI6CuaCo7Z7STxJewV1thGmUrlIfMu5I7DuS2gbvdXze9TbhshPN4f4JF7i/8u
	iMERsy7mq1wlmYXT39Suoel/AlLsSkUyaYvauJFxVHogbM40vyIcaFIvT0akKIDnBkMPTiPTWBRoL
	KdT3YvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewM-0000000EUUK-3DMG;
	Thu, 10 Sep 2026 13:35:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewK-0000000EUP2-32Q8;
	Thu, 10 Sep 2026 13:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FT2RZQUr60vbmO6AyGkACnvFNC6PHvmgqZfBZ2wJHeQ=; b=Xz2PHdHjnJMYFgrkPu/cuFk7kc
	DgZ2YiH1iRPuTSsHOUloqY919Z0v6NTFye0uNUXtycT2GsjtxXecNZ5M6OuiAP9iJVRpNTQwptxkS
	BTOIB96m+AdFfohi0gNvPEs/o7P02sSdGU8VrN5g74ZEdkXpNmkugc43vO33KrPFtIKIi9Se+Vndg
	lbl/O9MRUb0PKlcYMdM2AO+wO//Fi7lNMNavx8URcGxD+NB2QV8uD14mtDXODoAi9nDjxdjGV8bPB
	2Q+605ld3g2OdJpVV04/IyAip7OBKTMuRKjkioqOagGDuExrQt8OftVycUuJWWMXDIINS4BTNL+vd
	bLsWf9Yw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ewH-00000002Xfp-1cYV;
	Thu, 10 Sep 2026 13:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047338;
	bh=BoOMfIFPIGwvljgrOki6vDKw076yvIl6ObzO4+ZHHUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jM5VKKB2jyUgY4IYCO7MPurWpDYnR+fBjdroLnWI0Yg0/nbJRpM+9qwo0IzmrV2Oh
	 k527jf+d3ahA1ZQjz+UdRRzW7DEHuaNHBRtkdE09ZGS1SCA6CQ/hYmZGXTZA9cIbx6
	 Q64dyBTGzEaBstnAnVgeYysW9DzQdVryv141RW5bg526lnpc0d41noBd3bIBhl6c/T
	 DupbVcuzbImxI4ItXqN2ex/8ysyZZosGjUII4E7Al096LQul6OjhP45uFD3Jdbf5Du
	 2tEUelr/19ewDPT8hHeUx1UdfF8fxZlbuLrDOnPyDQKjqFbZS0vP4V4MbrdYsiAgDm
	 jGjgpGp2+vRhA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33D9C17E0EB0;
	Thu, 10 Sep 2026 15:35:36 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:47 -0400
Subject: [PATCH v2 5/8] arm64: dts: rockchip: Rename rk3399 HDMI audio card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-5-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143541_526906_5EFAF7EF 
X-CRM114-Status: GOOD (  11.44  )
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

Rename the card from "hdmi-sound" to "RK3399 HDMI" so it identifies
the SoC in user-visible ALSA fields and matches the naming scheme
used across the rest of the Rockchip family.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 49c68fe65de6..c46e58d4af0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2008,7 +2008,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "hdmi-sound";
+		simple-audio-card,name = "RK3399 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0


