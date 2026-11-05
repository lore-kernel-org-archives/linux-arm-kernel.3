Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5648606D802
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HTEujz5g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGpYxquc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=llhJDHVHoisfN0tHe6o8AiZ3pTp0FIou5pivHrQApOg=; b=HTEujz5ghO9BCo7BA4R+1EPn37
	FwNws5TKLDAi6vtZkJSKYGixIkAgaYoVIkA8T6Ya/0tBlWlGEmrGfo+AI2rVBJUacmwWhzcQaSyho
	u6l8qGpVG76qsyTz9DkHat8TNjsjIV+qp9LkPU9AulYZg7sbaoSgG+AXzei9Iwgbp5/wvo33bmhZ2
	yGcej4Q9eydEFc2mW8FQMjWvsyf5yylLHTKTiR35qpKCMh6D90fTxbNeBKJHUhNqpawgpgLAY3jkJ
	iHYUWFFXh74F7jo8I5z9D70Bx2M02a59eIobOKGaRL/Ejx0evot+0PNUCf1ADyDa5riSOkGWjUBrJ
	1GXbBsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHb-00000007n5S-3aOX;
	Thu, 05 Nov 2026 04:41:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHZ-00000007n3c-1DKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10ABD43354;
	Thu,  5 Nov 2026 04:41:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793853660;
	b=A89FxL0cVsscIclqwBNWFofYer3qkwqWHMoPEK/e390or7ZCPa3zN8Ta//5t0948ldTF
	 Sz0D7NdYsLb875dr9E/M8ZDUCCCB62fSbMuxF9Gv7ZYhyGWNGkJWJpN4w2IJwUcgQ4wRe
	 sWgOh2S8+RLoYPav5zMSyhWZ1CW8H2gvzdyHTsX/FTQc5rnnCVEhkC1yy44yXP5++6muN
	 fxTfU6c6rAGf8V5WaArHrKRKGqgidz3H3VX28rLcIJFs66pJYGg7FFhEG5EoifZOMlXOp
	 1WEqzJoBIArs+o3UYLfO/N5ebAHoy25W5ryjCieAWnUgcSZ/kSxBviQH6LP+VG6eYCA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793853660;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=llhJDHVHoisfN0tHe6o8AiZ3pTp0FIou5pivHrQApOg=;
	b=0mINOOwxXAFaMKonjWbRHLMWsTzcTZsABQ5ZJCGzJuBs+1Cve4q4FPQtPgrTbSBYEn9Y
	 qTsC76bym0VsVEDnC97KyhicIVkoCBKjUnPh7czM/6lTwcIWnYMZvivrh1P+mcYQQmnKu
	 cW0NtVHqH582mPlFneQRoQOJHwNzFd8dyZ5PiRWPqUPOkXdE+1hRache4HXZgWJmHEJZj
	 /BUlYW0AijIdcopi3XQwh6izmTUp7WItg/xisKHUllQkfsbgbf9PD3WzQD2dc0HWEH+yO
	 nobZcwt96R08MoyJRJD+Lf9Pj2f+WPYj8Nd/q1E32xm+/QZF20Bs8mybHAHOkVml39A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F9261F00A1C;
	Thu,  5 Nov 2026 04:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793853660;
	bh=llhJDHVHoisfN0tHe6o8AiZ3pTp0FIou5pivHrQApOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lGpYxqucer31Q62JUlnGIk3/YOy0dwz4SuRU4P63q0F1SsL6yijEeIfOM1lgAOeke
	 jUujqqGPLjG4qxADOLOIIB78jkbFarQR7mVu/+j9EXeLwqzlH39X21qe+RVDfQjarp
	 h/iaf/jnY9Hn85ANiOsEKqE5xrSeA0HOdon30ORBrLJLzMETV5H47MUIuhUoZsF9Xl
	 XE8Tx8vM2rPKgErHBSnYbof4DNeJrCEoJOkWEKXWnzyiGGW7neQqAWMt55cRhGTDZ1
	 hFv079HMKfe2v3/luXn3JoreHcZVbvNMEKbD738WLeapOTSZ5M387h97wze/L2WR11
	 uv/+LdPpvCIgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 091D2470A3;
	Thu,  5 Nov 2026 04:40:58 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 22:40:59 -0600
Subject: [PATCH 4/6] arm64: dts: allwinner: a100: Add A133 speed grade
 efuse cells
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-a133-series-v1-4-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
In-Reply-To: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>, 
 Alexander Sverdlin <alex@sverdlin.org>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793853656; l=1561;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=/IybJoRS+RCeafxjvBtCrPNxM5kYK6ctY7B27mLTNVg=;
 b=NgBTLrOPCIZQ/56YuWB9qFnXvWIEKYUbNUchtr1oEcU4Ll5eeGgzPWYJLFIgfVLIeJDA9sL71
 dhuIeKxEsVpC3qoVoVyJ6nEXPP+mXZUgXiMEbe8nOvVpG9YSewD6k5c
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
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
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The A133 speed grade selection also needs the chip marking ID (SID
offset 0x00), the word at 0x20, whose low 12 bits the vendor BSP calls
PCPU, and the word at 0x28 with the bin extension bit. Add nvmem cells
for them at the offsets the BSP uses. The H616 reads the same kind of
marking ID at offset 0x00 as its speed grade.

The cells are used by the A133 OPP table added later in this series;
the A100 OPP table keeps using only the existing 0x1c cell.

Claude Code (Anthropic) drafted this change and its message from the
vendor BSP device tree; I reviewed it and checked it with dtbs_check.

Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index ba6020989ce..d1164f3b549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -176,6 +176,10 @@ efuse@3006000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			chip_marking: chip-marking@0 {
+				reg = <0x0 0x2>;
+			};
+
 			ths_calibration: calib@14 {
 				reg = <0x14 8>;
 			};
@@ -183,6 +187,14 @@ ths_calibration: calib@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x2>;
 			};
+
+			cpu_pcpu: cpu-pcpu@20 {
+				reg = <0x20 0x2>;
+			};
+
+			cpu_bin_ext: cpu-bin-ext@28 {
+				reg = <0x28 0x4>;
+			};
 		};
 
 		watchdog@30090a0 {

-- 
2.34.1



