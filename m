Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807460A6F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o+V4Sisx;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bwUcESra
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=; b=o+V4SisxhR5C8g
	o/dv1TDWlRWZYnwczzQCicBz/KJskDGm4L/MoBDjqb4Kqy3znFmOL14Qpd1anisJY9SMgfTSz40zA
	hM7N/IrMORih61+wtiZsYE1J+Qjo8spVPGODLNDI+sID6MSjUNmtplghPflEW1qnBayz/dsxAHPpC
	F5cH8/03EbTpDxLUn2kaze3i0KcP57XcVSKaw4Ky7bbJxV8WJVhy0zwrNsYW+VExCkziL8V4deDto
	Y3eHwasnbL6m4kGq0F2D1dLvhOEKe9XLrIvdFRyy3Y4fuGQ/UUibKInU0qWMFTm58GkeTednx1V+Q
	zOXWjKgxZh70sGeVyL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aj-00000007UXM-3oeh;
	Wed, 28 Oct 2026 16:06:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Ad-00000007UQf-0q3k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10335315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203593; x=1793808393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
        b=bwUcESraQlIHqLgAI946KLaPlaG5mOaYEujZz39Lhp+JK4j6bXl0b6pjN8+WnxNjfA
         4HnRTMXLaVRELRcr2W1Od5Y8rhkY/4YekNc/C/u8D8dk5epbBUirJUnBJvMRbab1Y6W3
         CAECG9cHURmuzEfSNxW8WVzwnNcvdtgtbzcgJQ/fVxUzL1WCBbiBMW2GVKFqbvlw2BZi
         RdVoGhnDLEeRNFWKQY8QL8W1mNG7gTTSGPBByiyyvUYil+2GGIeIfreh4OvCiH2VPRbR
         hp7JWt9DCFdgFLGbTdX80b1thAVS/QhQkoOaByImVwsG9HZ8PXG+UwqC0kIo3lS7xjAo
         J4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203593; x=1793808393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
        b=peF3tCtqS8QonHHPOcvBrRfGstefwRcnljXBeQHz7ptpAWM7ZFU4a42GpY1O2BBWcb
         +uixGBGerN7hGNbXF6K1UO3iU8pYYcZm7CKlwYBThetKBgng6XsEYao3pC3uWTm3Xbeh
         qzyrgtdPK5zls4vXLoKGnwDH2YAjhUckIaUWyHoGWnjkcVos9Qb8JL8zN2bwwD1o4MmP
         s0h5ADQ6kVNIvzXsKb+ibmud/iYe/gf4ba80zdYHFMnerMMXVnZY8mco/VmY/PWmGKLM
         kAFnygkzaiER8hzfHN9OFUxbfvSbkSLdKsFkIaR722V1ajDFLdi0jIe0hAyFxFEXpXsW
         PDdA==
X-Forwarded-Encrypted: i=1; AKwUvBwcNZJH+7uYCwMU7VL3M+zm8VezITt7D9t63Z7MdVFMm3YpTyQYzk2zCin/JIezn+e30ZrfCdi+G1zEiReVG3DW@lists.infradead.org
X-Gm-Message-State: AFq9FYL1ggr0klh9RWthjzltMtMtgINSTc3iK83bTJvKaD4D0pzcxv69
	Q6hmUmxMnPxzpSB2zX+Xb35hA32VloKJzw9gIWUkCjGNHqffgCruZsBXD4fPhl41L6g=
X-Gm-Gg: AYBFou2EkoAz9UxT4S+LoHbF0IDAK35fmmmHEmiQ6JILgvlxgqtEPh6PCPunvJvb3Ut
	mdqr8gobYa9kY9jiq8GJPABmfRQiqb7KmbGTeFJ20QNZBUnv4b4qAF6jS3o4OTgXItlhvA2qiHM
	UJ9o1GqT55Ga+HOiO1sgPOFZV0CyT5SOSDN88RgU2FlGJBQVH7cQdfNz4m0lsZEJ154X/RAt4cP
	GS2+j9NqUxD0MrXG01E26fjAFdVACCetA1M/4uK5EFDRL9I1fIfa+CGT5Fdzofy2sVdFiX+CUSa
	9lZy0pKnC+at2HUb7ARQWwD7kkumUMecLTg1nZCEYRnS61PStTiwaGJt4/EwCdlSc6YBjxqZG1S
	6Z3pHEE5xZLrD4PAGry5jkHg1p+83lcDDWADZxxOiQFff1HNqLwNEdKW9wixDOLrzGnAVerWg2Q
	71G4ctd8WreOSnRt/KTdN02fwKcxFw8B1w4h+EA0GSc1SOy5JDW+fcjJwGBgLep6uBN8vVJuQhR
	7+6Dg2CKzmx3nxmRYgsUwwgTCAboFA0HWmlLLU54jWrf118luoZkN3P8TNfubtFJGC/KM5AaIC0
	yUA31PRGIHs6grzyoiVO6nnFZSAV4vcl0PABkolzSwqg4FliPi3tXjnzCjv3pE9q/NWFwxN/+kK
	StJRMAuNgG3flnS6dyfpN0gZzCN0O6AYopoRlSoOqFAcA/cg=
X-Received: by 2002:a05:600c:34cf:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a9667755f3mr61530825e9.12.1793203592754;
        Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:09 +0100
Subject: [PATCH v2 8/9] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-8-4544429251e2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2102;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=eWhzeB8jAMTZPI1KrE3IIq1D7Ssewn5fvDeiaH0we+4=;
 b=CUTdkEkF+dq1LidthdxZMOHWhYkh3VNaqmkMHQcbzmIMwWqhtlFSpowlgfjJ9B+E6nNFDhmgJ
 4l964OezPWqCU8RpaNDL7ofSCLEmk1/wscSP2drx4dcm0qqWHWQZ+ME
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090635_272328_331D9828 
X-CRM114-Status: GOOD (  11.67  )
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

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0


