Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB9CD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvVppEk9o0CVKtieqGiuVEXEx/i7i+V7SNIMSZ5JJcM=; b=UcW+KHwaJwP3OAtApoqe5Ie6eN
	DkkeUAtJdbzEgR0TOruwPkjwk4ltj/fBGVxKKfc/zavImmbCGDCQrWEMy8tH3UsnXpNdOfBJ8G7vD
	7A4B+q3JpU9D5n9aKSHIecJo0Fth84oHyMEyvsWj0LF7x9K4pSOF0pKpKOgtBChqlAVFUg6xpnH+D
	tRgGYNioQAvUjuwXLe7G29qQyLSI0Ky7xQlvMCacDyrpn+g6prEM0kD/JX6a+1u2N0Y8rgHUVa9DD
	73blPVXf832ywSOjpDy50yOgYZlZmnwfdsaEx1MwXMjmzXKBK99BPpuHIV2Smc8Iik0awhR8mqlwW
	9ib/cFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunM-0000000E5rj-0ud2;
	Tue, 09 Dec 2025 10:18:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunH-0000000E5or-0Uis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:18:08 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id D18A022B27;
	Tue,  9 Dec 2025 11:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275485;
	bh=yvVppEk9o0CVKtieqGiuVEXEx/i7i+V7SNIMSZ5JJcM=; h=From:To:Subject;
	b=syUtrLsxp40MGO90w7xb4X58JcgsDYiDccbDvTHFautNN0wON3UlEmWEcCHXsZwXn
	 ExUJhNQ73HNZB5W7tOE91JJXvSbJ7tIgFepXKDh15+k/e4K9ScUIy30hCgMFNsHEmj
	 ljYnSQZa+toxdSNPOOKFHAPTlyR2laucFmMuxw6eoKrS3pB8yOYsWQzX4gSztr6IDl
	 7RVx/8Ej/VCKKo9QrJGCjPzgw48KmAaNtYKN41hGBMHBW+f5p+/Oted1LNbC3elkf2
	 L6x69oPe295WUsfIvsUH+MC/Fj8zP26xY+zQZDMhBCP25HwZdmYYGiazaVOLqdYitT
	 bCG6DEStTmJsw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
Date: Tue,  9 Dec 2025 11:17:49 +0100
Message-ID: <20251209101754.54067-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209101754.54067-1-francesco@dolcini.it>
References: <20251209101754.54067-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_021807_316275_2D406D64 
X-CRM114-Status: UNSURE (   8.39  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Remove obsolete TODO comments, I2S interface is supported since Linux v6.6.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d43ba0087126..d31f8082394f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -832,10 +832,6 @@ &pwm3 {
 	#pwm-cells = <3>;
 };
 
-/* TODO: Verdin I2S_1 */
-
-/* TODO: Verdin I2S_2 */
-
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3


