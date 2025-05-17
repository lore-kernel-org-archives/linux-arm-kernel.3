Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1973C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5cfeEeUQkK8HtvmN4orVWaSs/MtabSXETIvN6UqQ+w=; b=sXE3nh5ItNU5Asq57N2b9ntZXf
	TnpFBOlDKW8PtSxD4aXSoiAErhjBGd1/M0cvobvmV+QoEl7nCv0GdURbWEYTU0peRRYEbPiZr0i9L
	xl/LOThCkyI/UF+MCVkmwzF+rEhrMug5XkNAknX8hPteEFaNja3jmha9skfWjSdHHl+7yg3XEIsJQ
	Stvr3kbOFCEIzkahvnHs70wQO5h7x0piP0G0PN2NDaLXiAtoLG1+qhyCORT+lCLXvrHStsJeKL4Zf
	y3UgcdVrrM7R7ubKkdQR+VEdgyn5znO2zZ0cFZmSjhTwF6VpTMvWytVi4QkR58rSq7Op1fl+fmC5W
	dATVkfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGJOh-00000005tnO-0V63;
	Sat, 17 May 2025 15:24:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGJKm-00000005tXk-1KlV;
	Sat, 17 May 2025 15:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA068A4E7E9;
	Sat, 17 May 2025 15:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84BDC4CEE3;
	Sat, 17 May 2025 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747495218;
	bh=3IhosQmCLhKrfG7vs46vBLEIjQuGjyaCLT5I81CNamI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H+gr/mhmtc+udx+CNtPL6uxQ3GlQDiwjbRjvmiqgSAlZ0Zddij1GfhZC3fQ+md050
	 CaI1nXEpH0uthlSKFQ8xc3FSTyUBv0TvkQ6qW1YwZPYyM6u9XVKHoEm6Tpk1UccNiR
	 NFpCijVA5dE+5mBSbRpyZtaoI2WaQKGiF8aoQ6O+WuVPUuvlAYefEgHyq7adT8fNw6
	 loS3Sr/2DpyxXTVP3wC+LDSKL5L/QVCjgalcupnQJWrkD8wdeQ1OB5srwzBCzm9XX0
	 jBYT4Y2GzNRbhXQMPqA13eLZYuaYTzslNdSMPtEKB2r//QuTMNzmPpwS+IR0ciOhMK
	 cvmuSntQ8iuUQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 17 May 2025 17:19:43 +0200
Subject: [PATCH 1/2] arm64: dts: airoha: en7581: Add gpio-ranges property
 for gpio controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-en7581-evb-pcie-v1-1-97297eb063bb@kernel.org>
References: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
In-Reply-To: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_082020_426154_71D2B3A7 
X-CRM114-Status: UNSURE (   8.23  )
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

Introduce missing gpio-ranges property for Airoha EN7581 gpio controller

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..a8f8a9f0b807a2ee4fd11f8418b8e810a6945d73 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -65,6 +65,10 @@ reserved_bmt@7e00000 {
 	};
 };
 
+&en7581_pinctrl {
+	gpio-ranges = <&en7581_pinctrl 0 13 47>;
+};
+
 &i2c0 {
 	status = "okay";
 };

-- 
2.49.0


