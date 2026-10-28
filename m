Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6FD606AA41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+neEaVX;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vYB5pRQc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=; b=s+neEaVXK1tYW6
	QXeVM46gWWdKQb0ZkTB931xBmoEZE84yGW6CKBuDm8JW0Emi9RF2YgHSELmWu9XXys0SWUuaMZ+dd
	5RugcwI8HqVctwQDPY1eML4MgP8cUkp9zHr2Y+ou5fJlJwagMNyXN0ifCdp9KJhMEcmffJARTbrj+
	IJY06FzghOq69aXx3y9HKW1lQPtVNy7dAwfFTxzeGSwwbdmBijS0GHjEhqcLyhThcUDD8gDPQLa3p
	0qmPXyUpFiXdnmaZpXXcl3CO50PKQTgOcji7XrltGpJpKzzG9ynBuZ8CPo+LY8mEO3rx3yisUbFU6
	j+iod7V9lzSBkY5E6ggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aj-00000007UV3-06KH;
	Wed, 28 Oct 2026 16:06:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AY-00000007UNF-13jN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so11096975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203589; x=1793808389; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
        b=vYB5pRQcXkDI7cJXh3XfICTbroNWVpQ0xLDijijX+ctqhSyBQnvP1ofqO5ENWHD3DL
         249Y2PK/iI0t+9fL27raLbHVYAtea40bCBBsi48MkXja5UDjzPt2PpSRmcn2vy1BzQlH
         y+0fOrgZyygAE0O2UffJHc2zB2mC4UuuxXCHQPts7mzyPsn0TPYqImxlc2let96naQKG
         dbgx/YxwVoE4oc4hnRqW7SFvRwlVbztQSI+A98y+ErpFbeLMkY4MHXKUPHrvtnp0e2ai
         pKNRpuBKC0crORTDsg1iH+96o/qJZLUewNlH5ePsUsMGg0Bv01WZfi5wFI0f3HkhP9XS
         05tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203589; x=1793808389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
        b=hQiD0WuzCNfTIE8oy28L0RTNPOzN/FQmIIdBk3fVLp4tbrR1Ho0eBD1h9zynQOqHKN
         RV3PTqiwLKXqriyqKvIjBFAYLqk3BGIZVw4fBKbc1yw9Bhpfd6avt+ZavKpZdZL9Zdtt
         MMMsSDMPpdmty46VG2cY6C3+XTvzH1Sp7XTIHJ6IEEg+el+i1jG0s/tShhaDnC9s35Ex
         ZdTE+hp8YRhqBYCEU02nje8+ebNG6rM/4f5vmAaWTD/RVPsMe8YA9gBn8pfXuoTWGULC
         RhJMT0IbkJlGnnENYOnan74PM13ZS5eYGlR41SN3lnh/w7M0fJX0YVlfs14ekcXeVOpM
         21lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOvEXjJf1lOWYTtKYvJVgtCEdKBpayaZfvhXWsjqSJIs0NzPbyE/PFJphJb4ecdCZlpyR4nvQeyJyn17qk4Mw1@lists.infradead.org
X-Gm-Message-State: AFq9FYKTT6scF8HV8na8dOFcFp/lzz4a1tgNkI33iLyOG8hocTgCT5Pl
	9fnuGFZdVRVq2oEYNAi9oC9MCQgHRUJ4PrJKD8zHkd0Nx5e9+Xs+mvJc5z1SCQnpp68=
X-Gm-Gg: AYBFou1bNVy+rX18Hm2FnBsx3QUfUULatuT9GPE2Pgns1eDmKs9n+lrzbRKBG4Px2A5
	byaD4rZi5mTl8KmJqqWJZTCt0iceglS5HRI5cVX0xRpRNeoaVo+3A/2VV9deh3EO7LO8/+BfCB+
	SPfu3xtsKRo4zDavHXF5eGM4GRRi1zV+emQilqqtZDkjFVWEr6tkAxyfTkwo/8aVcYeR5ys/GWN
	ScLldbbbVJPmwU3IlAWnm/UhE8aWp5nayeU0i+ppu+NUDIs92KubgNGb6k0eb2naTtxaYlbzeXt
	j2UfQ4M1QVmN6EMPpJY4QYw8YZcveGnpcoPXhdLysHsmbRrFgGoVY1thfNuyWdhaVRBiUxAf8mg
	02GOeSTtt2NhxXoj2v03b2L7SJBE42msL1RbjmJAAUQI270OUXYzwSkYZ/gD2GrMplHUMWs8Z7Q
	gpX1ORBJjpZtGT6migaREmCMY1VEZmGcZPU0aqI/dUUudlTOM82t5Ua9puqFWEmVgpBGeS6UzmG
	Gj6eiJBxdlW7wdeeIadQqer1LA7TmJBxfizBQ2TiiFq1ee9eDq8RpTKEU4qrxp6JTQDkOH1y6/F
	pdyiTnRjbjw68FQtfe/Tg6xYAxPiGKpZhYDreIWibY0vBSMlsJUA4+fklxioRtTeKnC75ZAvykT
	p1kIkNhBWhHDWfoVU+2dFuOfjcg==
X-Received: by 2002:a05:600c:1546:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4aa86a42518mr551525e9.2.1793203588489;
        Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:05 +0100
Subject: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1896;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=IkyleFnGyybE4VzcWEWPfLI1Efue7Bk+OPR7RvuZIO0=;
 b=lIHp8XwSVWwwtqhg9KXgnsjTTPwk8NehLG81Fs5GcnUmU5x9Wem4sQ65vOXY3nTuDNjdInMfh
 QOUq/2ATOCpCsaCVOLmbWdkcluBE4eJ9hNEUFz9+CeuBmsqCH/yq6iJ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090630_318827_FDA9CE97 
X-CRM114-Status: GOOD (  12.65  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index fc124f9ecfa1..e3d49651b44e 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0


