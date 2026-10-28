Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zfouG81Q;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=K2ARK63N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=; b=zfouG81QXBnRgk
	/F2+lS9TVNxBCUNHDWrZcQZPR7V/5PL1tyj9sXzjHeySR9gi6eQ4PqXPkMPHKpL9IjAsvdA9rf1rp
	ALQxCy9X62EY4J4QN4emNdRchozosCb1o5f0vEcEE8Sa0sTUCRx8LcE+JU+jPMW8dGervcaep6pk/
	HLZA25aLltYBXDNtCT4WImcihap5nGhW6T4sADkZCwzSBO3c8//YyvvTQa1XS1Kh+RlNC0LRsRQVw
	4uplcVh8PT9SibMS7wvITVyhJ7tN7x6tSkbqHsKXq2cEW+Z6bHIvOEEDqZF+gdnOe0XoV8d7V6nVU
	XYNWGmauP0Qp2H5aKSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4Bz-000000079K8-1EIY;
	Wed, 28 Oct 2026 13:59:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4Bc-0000000792g-3GbE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:59:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8346995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195967; x=1793800767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
        b=K2ARK63NHSrXRvnlkwvuFNg7r+5ARnhAxqzVmzGn+EDoWrcnH8qJTryvdvSaD7AT53
         HNd6iKq4Dj77sZ08xRhQVD6XxHLOZTIfxXmRWXDGyMdJYqutnOw+FHJlCO62RaywtGyj
         GfS1NOVgySXGHp3rDI77+sfZ1rsuyLaUMhY4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195967; x=1793800767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
        b=uf8gfyGfAgwdlVa/okunn52e1ZeiaXSVCMOokkh9jGn37/3ipE+cV0KJv0T8zJV1EQ
         fKGPkfSHhq7+hsH1rklkQ9WHdXP5Qw44xBUqVja5RZlsyYD/5sBDDD/IojEUR2vCshoR
         bt2L5w1JOsx6CIPAegeY7H2OFntI0/PGKM3SyS/+HkwRwE71jUspPdHvzhzoqh6U3cHd
         pZs2UuGcEvZwqo5C7HRRexfVeVjqJ0Ts8m26UxW4tv4BMe3qQOQBwbLAt387fflrRr9n
         6GZ/h37eQeKX508zJZ1a1N0j8sw8WqbtpVxs/8O6iNFTh7+q8cyGn18DoWgL2XIMygBD
         T2aA==
X-Forwarded-Encrypted: i=1; AKwUvByggNHSapGUOT/EWGQzDX/0FHMd8G2O25uunHy1Aw65DIA73m6uax8AscNLtaHyK5Y8gvFtW3pW3NQm45nMvTrC@lists.infradead.org
X-Gm-Message-State: AFq9FYKmzqC4vhalfDPX/Xx2CUUf/n1ynUXbqdpOZgMWO30xY7F5DusI
	jKeHfHl+Znm9TyKI0SWl6+taeCTvOM3HT4sfNA/rH56kxbpOQhrlOaxOiQ6KSxwD1/o=
X-Gm-Gg: AYBFou35nTIrHH5P4VBLwiBMeC6pc809xqL9Pq/fw67N9KsLzl4WcDdWj4mk8HwpAsJ
	ciVgqtM4wTZpYJMtLlv/bWJ8KdUy1wATEsEXxAGuJ3O0JDd1q2x8NpXMc9DHh9oy5a2yLDhP3uH
	A3T0c6ZpaEJCGMd0QPvuVuYSiU9h+uqBvAcgX3RVW65oIQaybndA8F+zQAkmghpVLN2nB6yk7ZZ
	QjRoQNFcL5v6JnVXKohkzS3Qk+hbawbdFnyNYapZqgH/0uE2z6jK3qyvTxoEgJnQWhWRdX0rNjZ
	Ibzu6vNRwuxRlhiJSMBAjt8cXDnNiQrfJzMgczhx+0/KitHT6zkTJma+mx9JpDVdK71ntxM33jK
	+ALeoNAaxuLnOWLKBd2YaabVpQt6ExDzXfI2E/yGBXjGknDY5WOaaMFtbzZkC2+vlMOKYGA3lXa
	4cjVrg/Tnq//VjppNDSTm8DkPqEvt/bMWAhVANb27HyuA/qzX6mrPg9uvHGUqO3yvBia7Vv85z8
	mxZmuHe677EyC6JD054TDsaR0ZGFrFT5vUMm2o7NZRopxNreKZgla2TPCZhansgbcamy+RRgzZV
	CJa2KaKBXtyIqntcVRo3lKkLfLSa1s0NB3ikXfEdxjDhnzzfVqIi+JxcfWTI2o5+ocR2qe0MsG8
	jApLzcAlxre/9DwwImDUKrDry3W6jsGEYCWmohINEsFQcRs6w19gP629ATHWCrkNibjtPZg==
X-Received: by 2002:a05:600c:3512:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4a9665876a3mr51801145e9.17.1793195966837;
        Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 4/4] arm64: dts: st: select the Engicam RMM display pixel clock source
Date: Wed, 28 Oct 2026 14:59:08 +0100
Message-ID: <20261028135915.2665857-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065929_164589_A1B8F429 
X-CRM114-Status: GOOD (  12.70  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On STM32MP255/257 the LTDC pixel clock is selected by the SYSCFG
pixel clock mux, whose reset value is the LVDS PHY pixel clock. With
the RGB panel the LTDC is then clocked by the unused LVDS PHY, and every
commit times out:

  [CRTC:42:crtc-0] vblank wait timed out
  [drm] *ERROR* flip_done timed out

Select the LTDC kernel clock as pixel clock source in the RGB panel
overlay and, for consistency, without relying on the reset value, the
LVDS PHY pixel clock in the LVDS panel overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 ...57d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 3 +++
 ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
index 7655c1bf56b1..b44e1d3ddb1b 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
@@ -32,6 +32,9 @@ &framebuffer {
 };
 
 &ltdc {
+	/* LVDS output: the pixel clock is the LVDS PHY one */
+	assigned-clocks = <&syscfg>;
+	assigned-clock-parents = <&lvds>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
index 7be955be58ed..7855086c33c7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -38,6 +38,8 @@ touchscreen@38 {
 &ltdc {
 	/* RGB output: the pixel clock is the LTDC kernel clock */
 	clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	assigned-clocks = <&syscfg>;
+	assigned-clock-parents = <&rcc CK_KER_LTDC>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
-- 
2.43.0


