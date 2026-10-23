Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B61606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s/X5zOyT;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BwQLI+qt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YUDDCMB8Ncom1Brn64DunMxTfMAb7Xq11EIX175DCyI=; b=s/X5zOyTLnt3bfgkqNJUtgu1hB
	O35xCUuYN9bwYIwd7I+Wk6v+nTdt0rYkK6bHciZgLD219bbJM+AWU39jkroVJssOVK6SRPl8vjGjt
	+F2o9dbL2/0iAPRbohBi9cMz2nsYGOmpCUKgiQYreFS/YQbpl9Xg1O5K8qAxs7lVdsSz7BWoIJwuj
	TvD8mr4BvXTLObt8D1rWNw2LqNGEO/4ZhDHfzS4ZuI/FOic47C7xXn6cy0G7wKknbAhVYFXZCz7pY
	wRdaceFeGkNOuCdmPFL1yfOW4igWAKpCvbyENu7SOp2a0B2HsXB0fExdrrNkzbV5z0lvirHlDRQH8
	k+wreZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCRk-0000000G9dT-3TIR;
	Fri, 23 Oct 2026 10:24:24 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCRh-0000000G9cd-1JiR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:24:23 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D12321FC00;
	Fri, 23 Oct 2026 12:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792751055;
	bh=YUDDCMB8Ncom1Brn64DunMxTfMAb7Xq11EIX175DCyI=; h=From:To:Subject;
	b=BwQLI+qtN0OH86v3RJgTRy8loOhj/WD7C/ApbZZQzSRZicovFmznn5D5PePGcAFcm
	 ZGjXdNYgPsX1H1psCa6ZZ4oA13+FozEMeoEy79Cj1y6XZDdaB6RZnfpcFhgBM1UyEO
	 W1lNBIlYocwkMdr9nx6Wl6eDUQkPsDcRy9MUKBivZ+6Fh88/B56Y+xzbWuUxaPa74R
	 0pSLX3mhCaEgyXycz7SzXTMEFskVw6B3YW76/vyVITvNMb6tOmBsDzFOmps7qr4kWJ
	 /tCzMxgOaoKSrlokGAFZgAjoa8g8RG1nR42yqyn+Nbsh7SXdtHj4SXppIKitZDdGlS
	 YrPGBULv97zxA==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-aquila: mark +V1.2_DP as boot-on
Date: Fri, 23 Oct 2026 12:24:03 +0200
Message-ID: <20261023102408.119509-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_032422_270580_4BD1EF89 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Mark the +V1.2_DP regulator as boot-on, matching the hardware: the
CTRL_DP_BRIDGE_EN enable line of this supply of the SN65DSI86 DSI-to-DP
bridge is pulled up on the module, so the supply is on by default,
before any software runs.

Without it the regulator is briefly switched off and on again during
the board start-up, potentially disrupting I2C transactions on the bus
where the SN65DSI86 is connected.

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..d40514cd2e00 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -91,6 +91,7 @@ reg_dp_1p2v: regulator-dp-1p2v {
 		gpios = <&som_gpio_expander_0 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <1200000>;
 		regulator-min-microvolt = <1200000>;
 		regulator-name = "On-module +V1.2_DP";
-- 
2.47.3


