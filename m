Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF7F327B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8cbkz26tH+hbP9ritPgHaZIUoTSvinjiMdchpn0UZQ=; b=SGxfV8DmPSj7ADDCirOGYQvX9f
	On+mqrhKDDoqUlLL8Mxz5EA5vdkQwHxc0LbJlBwFn8X09ucLzCJj2ynVTnczi0hNbKm9K5Jb4oJ6c
	x87A3QH8CwocdvHJTp9r9OKghBs+h+ddt15Ts5jgFDLZsejM9SSma70ALRHgn59vuk6GLNJTLypG8
	azi1A9M+g8JInMvsEZO3lgrMfpaYRA6RJ1Huhd2h2oTaHH8fpKWdHh2tPI6jnpMmr59Amrqnv6rSZ
	Ar+mZ6Zuce/8asyX25Eb9xM9LnEr/aFIrLhppgbjidYfO8XO4HdZCEiSvPRzyKX22XEp719Toe9iB
	ORi6GMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Jl-00000008FCc-0Xmi;
	Tue, 21 Apr 2026 08:18:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6Jd-00000008F8J-1ocv;
	Tue, 21 Apr 2026 08:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DE864459D;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E06C2BCC7;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759520;
	bh=2p8v9HyeQUHeTxqkCA4n8zBB/soPTy6Aus9gXPPPwGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tWNwid6E0yG/8aEyA1YUGJdg0+C/1iJVHZi3V97XpfItsBATpK/jyq71lHsyiBBat
	 AXaGp//55kdGtivMGiZ8QUZoFJAHxWeZO+VmM8rox6K6dBs4uQtqkUgUHVednw5xV/
	 BBBYlaNr/medUh7xrZGUxwUigeePwLvCfDJft5GXiOoUJZg1WpwF+8HIrdds7jcLsk
	 1LcVBw6OzA30rymGDwRiUifewEYmVtMTQkfQmPPJWBADgYwSxVTtsBJvrYnYLkYsB6
	 u6wNZV6XIIgrD74TQuklsYIrXHp1/5cbQYjQzW76FQzwK4U6ryBH1PPUMnw+CRNHlO
	 sfynWprBr5aJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397BFF327C0;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 21 Apr 2026 16:17:44 +0800
Subject: [PATCH v3 4/4] arm64: dts: amlogic: t7: Add clk measure support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776759517; l=784;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=Tf9KdJZta3E1sMtIMvQjV5B/7GkVZhyINNxFHHV1vnk=;
 b=GnLEY5O/Xdp4hnbpdZG0KW+p8rK4KZ1+9cExF186TaDe3Wpe4908C3cEvwxyGYBIVLofJgCuH
 +SEoPlNDIAyB1kdcHvnyECvYKxH56fF0M0x1Gdv12GVR4kW9wDaBHX6
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_011841_514303_3332857C 
X-CRM114-Status: UNSURE (   9.07  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Add the clock measure device to the T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed62..6a22b48a42b7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -656,6 +656,11 @@ pwm_ao_gh: pwm@32000 {
 				status = "disabled";
 			};
 
+			clock-measurer@48000 {
+				compatible = "amlogic,t7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			pwm_ab: pwm@58000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x58000 0x0 0x24>;

-- 
2.47.1



