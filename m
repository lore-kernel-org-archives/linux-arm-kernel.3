Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778CDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MTGMIbD8JDMKewvHa7xkt6mK1aCaEYuOYA22JGSRHE=; b=fL2YNzTXPa43LifV4ZtM7IBIPc
	mMdyNKfPfCzYAKdmGlRzTXNxt4pndbtXUdmbUX6Ww4YnkQI6GLrQBAl4CZGn2i49+mMa1grmKenST
	E1ONemEfP6bQbTdLOA8N7CzveTIHO++BLBSPIZ8uhXRpgXIF1bghvwyfzgPW2su3yhNV92PbYGb43
	BwOA0LGUFc0wIaYUV7hxL0SrxTpi6KE00o2Yh+n7VoptKd9wgDJoqwhdysEwZDLZvGcYtDWf0LkAb
	CpwjdBJIby9tyeDB3XhONDEnHLOKY4XcEh+bCXQYEfNj+yUxSF85n9s8xVP3I3XEKlwxv13yw8nqI
	q/sywvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhDS-0000000ApJx-3w45;
	Thu, 26 Jun 2025 07:40:14 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh6j-0000000AoQc-0jvI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:33:18 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0215D25F96;
	Thu, 26 Jun 2025 09:33:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlF9J5AHqZAt; Thu, 26 Jun 2025 09:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750923195; bh=VimxYiXgfisgElanUh5f+frPH3YNE9qoTKNe16RL7vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eXhojVren3B5MpIXLOtS4iLWlCb6nC8hBzgfvJJt7Ryyyc3AXo/pgSlVidj+hmby5
	 k+x0XRafTcmjiVbFz53cSW3HN7JdKbdhkAwJ6zbBXeACE2U46GPMAok/2TfAFr4MYf
	 QV91HVQulPMWCKZRtFZWSEFTJ1xcJu24e/dq3FmZ6hZSIBhTKEWt//mSqmZTrta/PI
	 AyxguCScX7tocTRaVpVjCKLcZcOO8KY2hJzMiSfJrrprYI+bN4jur6kWQ/7iwNz1pb
	 Dgaa6xbJrdmY7k9YJm/4PzS4Lsy3k2htYA9B+1RTZrh5Iqu/cqGB9hKIWJcHWUvfxx
	 6iZxRla+cb69A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 26 Jun 2025 13:02:57 +0530
Subject: [PATCH 2/3] arm64: dts: exynos7870-on7xelte: reduce memory ranges
 to base amount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-exynos7870-dts-fixes-v1-2-349987874d9a@disroot.org>
References: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
In-Reply-To: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750923181; l=1295;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=VimxYiXgfisgElanUh5f+frPH3YNE9qoTKNe16RL7vo=;
 b=OhZIEH3niapUpqaSeCChzbwN1Dn8AXEv9OYQ/YE3FiYYgqGhZg3X6CmLj5GQSZIJkrFQ1oxpq
 7932NrXeomWDdXLsPb9sR9PrpuegZ/S0v47z3zDbvrqKpe3SU/YcOEA
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_003317_349614_88DF99F5 
X-CRM114-Status: GOOD (  10.78  )
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

The device is available in multiple variants with differing RAM
capacities. The memory range defined in the 0x80000000 bank exceeds the
address range of the memory controller, which eventually leads to ARM
SError crashes. Reduce the bank size to a value which is available to
all devices.

The bootloader must be responsible for identifying the RAM capacity and
editing the memory node accordingly.

Fixes: d6f3a7f91fdb ("arm64: dts: exynos: add initial devicetree support for exynos7870")
Cc: stable@vger.kernel.org # v6.16
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index eb97dcc415423f405d7df9b9869b2db3432fb483..b1d9eff5a82702cd7c9797b2124486207e03ad89 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -78,7 +78,7 @@ key-volup {
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x3e400000>,
-		      <0x0 0x80000000 0xbe400000>;
+		      <0x0 0x80000000 0x80000000>;
 	};
 
 	pwrseq_mmc1: pwrseq-mmc1 {

-- 
2.49.0


