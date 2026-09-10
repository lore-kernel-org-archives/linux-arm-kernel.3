Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC559C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld/PGk8Aygt2TJ9NZEk0jbeXxaCSrFrHwXSydmKzCvM=; b=MZ0R/96QHbpXGeMOUAWLeR8NL0
	9fhx68FzvNBgsl8KfVPamrZRUG+jEO9/u4o+LFWCJwJw+qikfLKZMkG1N5HflLIZABhZ0rA+OiA//
	2snmp1MqEiMDL9fhyr5WaUpahFBkS1X9a9ycTlLps+9DUv+f3uKxx71Noh+Kme3Jl9DMSO8HQC0lF
	bA4bWBOZoEftRS5Mg8Ij0rs60xnFlo+ZztY73J8qh9Jq6LyU/QLpJTFPRwUvdjZFWQSngIA/ELzve
	4vj/Fc+ylunOhe3DK/JQKjtxZbWTDusV6RAPI9aA6znz6wvDuoE28glh8X5wCnnrYMOHLJ+9yYY4/
	F/a9tW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewM-0000000EUTU-1pCW;
	Thu, 10 Sep 2026 13:35:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewJ-0000000EUNO-1Hgt;
	Thu, 10 Sep 2026 13:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ld/PGk8Aygt2TJ9NZEk0jbeXxaCSrFrHwXSydmKzCvM=; b=KfIu1cbcm3CM41GRl3fh+keT4/
	ZJ2hXqIH62dlkE5TgFEI2NsOSZuHbqqdfPX4Z3jt7g9zONsm58b94zdZazbwwUJi+eV2CrbUxMIt0
	77aQOrMi5jFbwoSxpNN3OVJBSXaaiub/hCtJKqIyDnhbkFsAU3bX25MEDHurUUsIBMEBfW3wqSdhP
	6QZYkVldDBennkywxjiF/UUg0FYe0yXKJ5kG4vXTXv8L56JmS5z84DZ7uuf30Onf0emZW9EdvJZbj
	NO8q/kEs9XHBQYoqL2OquZGzDJOWzQvfIVs+WuqYtM112LboESF6mM0ijHOdkJc4hac1Iq5QHYr6T
	NIbpt4/A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ewG-00000002XfT-1hom;
	Thu, 10 Sep 2026 13:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047335;
	bh=DoGowj4v55nBBEq+iip4Zm4WBOyuRaxvLazd1hFH7tA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IijqPaXdt78Q6dSsfKZdgPGhBrtpt3N12vIGOCuuuSICbdVMn/qgZAM7pqQA5Rmga
	 6ZX7+018QuMwnZmO94i6S5c8IUUDJFvYtQDRWfQzerOCnGSlBqRn9syvv0dZN20ET5
	 mAJih15I0QFeu7lWi4xvOBnkfZDiXNTnYRpRN0dQa4Fe7mCb5j9ijEsLF0qECNB6VL
	 v0Dji00MTM43Dt11AnmRL5xdL4pIwGmMuAiy6E4K/L6FBJodNHSWTp7+VDhkwA0Pit
	 bEiW+xR4wcwjwW+sK3rNMVzVSyVAYtIZJ/a9cTCaSs4syzpKxoRqZzizftU6lnEMw6
	 zXSiBobxnamDQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA7EE17E03E1;
	Thu, 10 Sep 2026 15:35:33 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:46 -0400
Subject: [PATCH v2 4/8] arm64: dts: rockchip: Rename rk3328 HDMI audio card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-4-1396a6168e20@collabora.com>
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
X-CRM114-CacheID: sfid-20260910_143540_588888_D6117AD9 
X-CRM114-Status: GOOD (  11.56  )
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

Rename the card from "HDMI" to "RK3328 HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 29e8976e604f1 ("arm64: dts: rockchip: Add RK3328 audio pipelines")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 03b7c4313750..26c9f4558ed9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -207,7 +207,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3328 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0


