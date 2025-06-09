Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC229C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=; b=Q3NxsuNO4m3EKCAYlGNEynpT0a
	Jtc0k8FkhUry/AMwHYhJ5vTdsDBjSnsLsl9Aiewt8inFNAnjCCIixJtKZ9cbxUcK9y4p/HBSiN1go
	lz9FpyXEGud2gHdeaOg8kfX/hja2fwrbLH1sgJQPyxg/2XCa5ZwdGOjb4PC5nJeXbbtN6482VYI/g
	36miyateFxOorkR53djyvoD0vPfp438Po+Z2seve6cSS4yKrxru3oVHkIW5RcZUIFOY01xj8vSvW/
	XQLY1a/CrMsW2ON9EQ7+wOevABQ5yn2cxgi/36nkmfQNPQDwTG7DUx3IrkPWZJEO1q/qqCtT0xhj3
	icBZgDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOj8S-000000059oC-1HJD;
	Mon, 09 Jun 2025 20:30:24 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOj6H-000000059cg-44Gp;
	Mon, 09 Jun 2025 20:28:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso5612103a12.3;
        Mon, 09 Jun 2025 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749500888; x=1750105688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=;
        b=fAFhLT/zLpcDREFBME5az+JYLpulUm0IrJT4x8a8EknV05HUYJuql1L4r+tsHAJyV1
         jWlH6jTgkOWJtRAqRYOEJP2pU60mJQ0FoBYZqVv7lU7jB9HgRRVsjypbb66hftaWHR42
         Oo4V28En9aNvW5fiKlm2Cil6DTx3Mbzacu14GfLm7DMm9ifMOmv67iCIY8Q84K+Y1w/e
         IMX+85b5fgPHdIxJfMGSyibCiK7xsCvH+dYhrnkvRteUXcUINWCEdPeoqVRfXsbvRKfn
         OoSMvGukH8gSjYRbGOUKUbDbDeutQodWm1XUC6YIEAKQVTeDq1ir/V8gsPfmbNw9frVQ
         UoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500888; x=1750105688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=;
        b=BUIIR/CAIa8NWFgWQkb0CY8MqKSZhFx3wfG/jW5v5gp8SvFq1gZMu5dA+83NG7NKjv
         C86e3U7UToxk9Akhm/lZbVrUsFvWcrAFs4xYeA8J/LuIl8TDcMgu2J/emov4v+yzXr65
         wtxRR/PxFJ2Kr0yX15k93Elm+pR7xT2aPfjQ5niX2kzhtTkrCcN5LNooiiK85s1yyaHT
         Xt7ISbWfz+74p+M4KVxdmqo5h+x1LOOjujBJK58FLQIVfF6OiLdHpGZgRRWuBQ/2hmXx
         EFkN6sMJo1AoOzHUOwOqGTrUa0LG+Rtg40lFQlFa78O3ASYy7FKpdXcUIhEj5TzQCV4b
         ecjg==
X-Gm-Message-State: AOJu0YyU4qhFu3rLl8W7JzEq3ApWKXL9sH6fo6/nzhTjwcqNuoer+Usb
	QcfcPp+KEW9wmyFRYrh9XzCikcqq8cSDq9XPEXWAlBPkJEapSvtr7q7snlYAww==
X-Gm-Gg: ASbGncuatsAIUs8yDkweIQz1kEtunTEeOrGCx39Kao1901TwSVpfrDr02ZSLacjLqU3
	GUA/MqMvl00lVKpaOjExyvoRPO/k4jG/deFQdczW07+HUk0KGZQLxkwUr4I5p6Tx6Sv96kpCHo+
	H89EINca74Fh/4Ew2i3WLJ/gHowPnZr+crc26HkPNrvG+Zai9zug1TI9/SwY8xH/QZR2XR4vhAg
	VJ9SkSblAGkfb2BJ/3o9IcCogRWI9oN1M8bLvuDFxFsMAet3NDc+NHgAH99/h7QM47ovwmrMMUO
	LOQz7kJ3eHnaV/gdzZz4cGgiNFzLDUB0M22aEMytOw++A3gV+BLljcazOZBNiliq17+QrtpLuYO
	GiG+o9X5rtPOrXgsRyzp4MaoTuqjOCDZwOXivdCEq1UYUWyU7fiw4NRaznsmMgEwj7oQR5VfnOZ
	kt3GluBz3Tj8I9LPXbYbZXlOkSr2v50cE=
X-Google-Smtp-Source: AGHT+IFi7MkYch5ZiIQCrja1K+1GnPJzZYyvzsdQM08R79bAjY5eVBMgahZGzkClFbVhMfH45r3M0Q==
X-Received: by 2002:a05:6402:2693:b0:607:f55d:7c56 with SMTP id 4fb4d7f45d1cf-607f55d7cedmr4103975a12.25.1749500887401;
        Mon, 09 Jun 2025 13:28:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a839-7f00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a839:7f00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-607783e654asm5021219a12.69.2025.06.09.13.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:28:05 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
Date: Mon,  9 Jun 2025 22:27:51 +0200
Message-ID: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_132810_008983_5183D7F8 
X-CRM114-Status: GOOD (  19.85  )
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

Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
frequency types") attempts to resolve video playback using 59.94Hz.
 using YUV420 by changing the clock calculation to use
Hz instead of kHz (thus yielding more precision).

The basic calculation itself is correct, however the comparisions in
meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
With the mentioend commit we convert this to Hz. Then meson_vclk
tries to find a matchig "params" entry (as the clock setup code
currently only supports specific frequencies) by taking the venc_freq
from the params and calculating the "alt frequency" (used for the
59.94Hz modes) from it, which is:
  (594000000Hz * 1000) / 1001 = 593406593Hz

Similar calculation is applied to the phy_freq (TMDS clock), which is 10
times the pixel clock.

Implement a new meson_vclk_freqs_are_matching_param() function whose
purpose is to compare if the requested and calculated frequencies. They
may not match exactly (for the reasons mentioned above). Allow the
clocks to deviate slightly to make the 59.94Hz modes again.

Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for frequency types")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Special thanks to Christian for testing (off-list) and managing so I
can do better testing myself in the future!

This is meant to be applied on top of "drm/meson: use vclk_freq instead
of pixel_freq in debug print" from [0]


[0] https://lore.kernel.org/dri-devel/20250606221031.3419353-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_vclk.c | 55 ++++++++++++++++++------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index c4123bb958e4..dfe0c28a0f05 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -110,10 +110,7 @@
 #define HDMI_PLL_LOCK		BIT(31)
 #define HDMI_PLL_LOCK_G12A	(3 << 30)
 
-#define PIXEL_FREQ_1000_1001(_freq)	\
-	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
-#define PHY_FREQ_1000_1001(_freq)	\
-	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
+#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
 
 /* VID PLL Dividers */
 enum {
@@ -772,6 +769,36 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		  pll_freq);
 }
 
+static bool meson_vclk_freqs_are_matching_param(unsigned int idx,
+						unsigned long long phy_freq,
+						unsigned long long vclk_freq)
+{
+	DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
+			 idx, params[idx].vclk_freq,
+			 FREQ_1000_1001(params[idx].vclk_freq));
+	DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
+			 idx, params[idx].phy_freq,
+			 FREQ_1000_1001(params[idx].phy_freq));
+
+	/* Match strict frequency */
+	if (phy_freq == params[idx].phy_freq &&
+	    vclk_freq == params[idx].vclk_freq)
+		return true;
+
+	/* Match 1000/1001 variant: vclk deviation has to be less than 1kHz
+	 * (drm EDID is defined in 1kHz steps, so everything smaller must be
+	 * rounding error) and the PHY freq deviation has to be less than
+	 * 10kHz (as the TMDS clock is 10 times the pixel clock, so anything
+	 * smaller must be rounding error as well).
+	 */
+	if (abs(vclk_freq - FREQ_1000_1001(params[idx].vclk_freq)) < 1000 &&
+	    abs(phy_freq - FREQ_1000_1001(params[idx].phy_freq)) < 10000)
+		return true;
+
+	/* no match */
+	return false;
+}
+
 enum drm_mode_status
 meson_vclk_vic_supported_freq(struct meson_drm *priv,
 			      unsigned long long phy_freq,
@@ -790,19 +817,7 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].vclk_freq,
-				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
-		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].phy_freq,
-				 PHY_FREQ_1000_1001(params[i].phy_freq));
-		/* Match strict frequency */
-		if (phy_freq == params[i].phy_freq &&
-		    vclk_freq == params[i].vclk_freq)
-			return MODE_OK;
-		/* Match 1000/1001 variant */
-		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
-		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
+		if (meson_vclk_freqs_are_matching_param(i, phy_freq, vclk_freq))
 			return MODE_OK;
 	}
 
@@ -1075,10 +1090,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 	}
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
-		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
-		    (vclk_freq == params[freq].vclk_freq ||
-		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
+		if (meson_vclk_freqs_are_matching_param(freq, phy_freq,
+							vclk_freq)) {
 			if (vclk_freq != params[freq].vclk_freq)
 				vic_alternate_clock = true;
 			else
-- 
2.49.0


