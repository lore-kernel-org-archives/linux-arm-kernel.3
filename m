Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461E1C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3u/ykhDq7r4ShX9I3fmkI3JbzbVWqdHF9eVM1GGm0Qg=; b=mdZgooidu7F0OlFUc2Uv4+Pwo7
	FjPhRgxfORzqzYxmPlbHXnSHQ/1f2+Qak+iY3jKG8O7eLfkrZxqwtRzzJY7FQsM2I6tm4+Z71WJ+M
	ko4XMADZc4MGsSxPdA5dlZEX8JTKvw08JNPGIJvQ44Ir1hwtlbpOCzpe+caeEy/AHxz7Asg5OKACc
	FJ0HCvhWLKFpPaWrL2XYvhf4ii6zAu5t4vh6bDAVBLCE0JTwaxRl/33J5mCRJzfJlAtwQJ6/BSipn
	9KSL1HvhovmaNexw6EPsQbHAzoBqr7i63ZqkQhk5pgwUAxHqPW8iEf695hdjkCy0ZoGn/wlm4paB9
	IffGaGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ApC-00000004PLf-3Fnz;
	Mon, 14 Sep 2026 17:50:38 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ap9-00000004PL1-3Pzx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 17:50:37 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 7DD6E1F8BD;
	Mon, 14 Sep 2026 19:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789408234;
	bh=3u/ykhDq7r4ShX9I3fmkI3JbzbVWqdHF9eVM1GGm0Qg=; h=From:To:Subject;
	b=aphJpyXFY95Q860grTyLZRiMtTsyeLB5QUr/dbj2o0jQ1pp9WiT/TYcqq278/GzPf
	 QHFqvnRR8DBRYKFBAGXsQfkzlu+m94GZ2AOMXKmzITFNm770fMBC0OOT8YTK/Zl6k+
	 NvS1j1/lZfqmmjlI/JqtA87xwDkUWL+wG6sZiQLzVJPKhFz6XD8L4FGfQg/JPtT8n5
	 0sUocTsHgK8nc7E1GqOWDbVA12IxF/7Gz+SGrKKLQYBinmyCFLOJMkcVloGOXfsD8T
	 HKZGPRAYqDff0vtfIie98PFm3DsVQv4u8+Cqq9PIFfNjAI9uASz69QcKQWGWujKESA
	 AwfCImET6O/+w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: enable Wi-Fi SD interface
Date: Mon, 14 Sep 2026 19:50:26 +0200
Message-ID: <20260914175027.9097-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_105036_025392_4B317BA6 
X-CRM114-Status: UNSURE (   7.47  )
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

Enable usdhc3, used for the on-module u-blox MAYA-W260 Wi-Fi/BT module,
it was left disabled by mistake in the initial commit.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3..4c102f213214 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -839,6 +839,7 @@ &usdhc3 {
 	keep-power-in-suspend;
 	non-removable;
 	vmmc-supply = <&reg_wifi_en>;
+	status = "okay";
 };
 
 &scmi_bbm {
-- 
2.47.3


