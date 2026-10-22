Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrIH3uy9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fE30Vozm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=; b=xrIH3uy9S5NEIe
	2ooPO/hsPrHKD1Jxrna2RXZah4PAMKcjDIJUjrBmI6mGNTkVrJZKvZ0qSQ/YxovIqWA+BmSYGI4Fy
	1tqVr599d/U/wNsMmMEaKGSMvNBIBdvLAdt662yrd2Pqe5rrUK0p8Ep3DOiFhFW64I77fjceKGUQs
	J/9LRDbB2oGPlheaRvsD2/ngW/m3EhzNY3TrWKwv+uT+s9+IdTC27b/MzN5S6UcaECNRxn0l6GOcg
	MKTAyRnmxihUYONs3nuJz9AH2VZ01jHNKcXroN0B1MwjneflKDkZZYKtoXODRJQRoEgGE8bGas1ae
	0LezeL9xgdQqCbJTReDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKg-0000000DNiU-2xQT;
	Thu, 22 Oct 2026 05:27:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKe-0000000DNga-2gFk;
	Thu, 22 Oct 2026 05:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF62060A56;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646835;
	b=tHgVe8Gfacnh6xYMJy9HbC4mulZL2/LQ060OvbdQXUH/Hx+xlN/CK7RHACWVnhGiZ5OO
	 i3k/raAkaWZ61RSV++KiAy5oowLd93Qn2tX9mFrkx24H2gB8COZx0IG4iAwYN0BLoGAN4
	 M8/EI7H8VAOyWd2BAfxjB5skpUabkRtuunmih2+L+y3iJ2ukVFGlX+aHe7HO27DhI1Nro
	 TIaYZydtsmr8tdOmPjyTynuh/NRXPewGwUCTX5+MnNmnpZ26tP+vReMTXP3cttVAqBVdu
	 /gBsh4PN8Fpxwcjdyla6UHbXfJiqJlbYsWn1WullX4TnLnCR8oLKryWXrAzf/gYCGQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=;
	b=lFrBdhlqWmeugxw5PwMhcmLeduv/Em105Jze+v5gxJXaqzcqL8AslB2s7bPCk+7NTgFH
	 3hPNhWclyctx7fdoJ24AENMbkUgFvnVrsu5GQVKV3CgttmpyabV0G7tYupZwu+tmcY5G4
	 wMclE8UD4tXexJ3asmjTKzfbplgn6v/IApCnxs2eLI/kbDuqrJdC5DkIxwvYkKouMRIYU
	 XRUvls6jNuxt13n4RhTNA8ewdBFSyrfh8LWdgmg/0kzOW5A5rLn62zeQ8XgfgJipBAPwx
	 KFAiGZ8KC1j9zMHxoePVULHx7//1aAfKmJ/akFDyxdc4tBBXF8I7Vfs/r5yfVS7SJCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B5E81F000C6;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646835;
	bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fE30Vozm4R9LagRYglKu6F2w+DDOh4WEY+/746Ow2KmxnYIK+4qlNmP+RhPrxa72Y
	 GpiEDQvyeNsNDarVI6EGNMJX0y4XqyGFBafzLPgfXmKTcYGpF8Mjqgy5n/WX0/8y8c
	 h95r07mzHrn/S3itrd2y1cMClsEt7hsJDihBlhs4tIEB9KwN5sJQHQ/deF7qEyZWoL
	 lsyvym79YNNGwxOa59qHTFHkGM3gN0g9AkUcdW68pSsnGG/4lKsSrfGXl8t1LAkhZd
	 QL1Og2Xd7mjeFMfUs0EBQ+UenUby1wW+HvjTtD6fyjXngYbPlrGgyr0d9ojW8tGhkl
	 mGKGIj/15txPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 60FD4434F1;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:03 +0800
Subject: [PATCH v12 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-b4-s4-vdec-upstream-v12-5-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=1805;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=6mvln4gF/Xr6GIzNj9H9+pGxV5CsOeJcJGZ1vZicQxY=;
 b=pbloZj7Iqhpy4+9EKHoTYPp+0CaOtmY/BW43JXVUSzB36aOXC7pKJM4XNyYKPadBC35jMltcG
 oUYQua/KnZnCHUynY5vwMacNyWptUEvUmL7sTlNnWLTBixacoeSQvmB
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support. Since the video fw needs to be loaded via TEE helpers,
enable the optee node in this patch.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..7a1dcb3951c8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -80,6 +80,11 @@ pwrc: power-controller {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	saradc: adc@fe026000 {
@@ -907,5 +912,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "vdec",
+				      "hvdec";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hvdec";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			amlogic,secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0



