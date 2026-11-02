Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nBya06Ru;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=RRN2HoOG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=; b=nBya06RuM6PGvWDnwEjnvqNIFX
	rI4ZOUcuzZFn99mK0ECxkfLo60R4YxobmOiIYP3uAnwkkSF07/8xMjwDfEJdKdj7HcUxrDeGHkCtW
	kdk2HSZ8m0rFb+a2pFfaSxwTtYz16S2S/te+KKEjGO1+5MW6++qi5ngtVtjMPOxPCwxBpeUqZGyJj
	zjKybJLWXbttADl+h5RI9kwYU+4Qt8DAsHUEGW7WVZn/xhMzGelw98BaoYZHniejMrEjqsVARdtdq
	fupRaAHUc1TO3EWK6U8kmlgxLAWBz1g+05e16DBo3Bei1nXNVjEkW8X0ZoPpPJluh9eUaIOz2diBc
	fdj3+wwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzaQ-00000000U0V-3VJr;
	Mon, 02 Nov 2026 21:29:03 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzaM-00000000Typ-102Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:29:01 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2136373f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654936; x=1794259736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
        b=RRN2HoOGwgLCHLr8W9ZxRwivQg+dMVB+e7ATBWicgSuAUlW6Zet3NdRZ6EBOL5FY4f
         0Lt5aB35oRpKtRWoJCavJ3xny47QECsgYsowsw6gJbTezBezfZFmhwS4yMpFOJ1LyOWU
         p6Yn/GThFAtdfZy/IjkHBeXcpzIdEZ2rULxXbkAz0exNH/kyUdygmOWDpg7VahjeOCnJ
         EnwEvVpqMjS16juRX2NhKypcxS2i1YewcXhTQ5VkUCD5mOp8pmlcVJDLpOS5YG8qFPwp
         Lhm7TCUlzHM2u2YA9aRx0YQazvzfIDge7YVOEfDBb8Mj7axkFTF6XgoxP8xcgq2UzSsR
         2EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654936; x=1794259736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
        b=Zsmwrr4k+Itlolcyg0wo2zQS9y9nSFU1DPwQAWKCQEYfrjpVQaim4Jbbwpb/7HxPd/
         ySTqjWabO1Ik65NBlpvhGivUAuxw660cToLWvxlJSrPYf5DayIqFzN2837yD9BuW3Sq2
         W46v9oAg5p1nL+T2zqBpq6Pvzb87y5DR8H5hxIWR5+WqEnBaoukkW9ozttN40H4/UVud
         oNGUaszxwvStB68Qx1ztpk7MXRJkGpahxrR+npl7dIO81Dd0pYpIGdJau+w+TW+VO9ED
         z7L/xhb6jBf3E2vzY3taE1YpummcfJW5FAPDk8uZQclhSZY4aOkD87WZbxR5zo82onQf
         WAdg==
X-Gm-Message-State: APuU4Z9HyR51l0iw7QYdU7AmsDEUapT0TFEL3SjdI/2ejXAkMS3OoNfT
	wI0+/uF+Gp6Ygbhl14vifAmOwCfttt4ZfjHGPrwOsuDWvyuyefjIzQZZ
X-Gm-Gg: AYBFou094oU1Mlg0paDrX2qfO/80PqmAgXgiidLqDXXGEwEZspRt1FcWW3HlZwgLIAK
	eUzFTD/TbN+4nXLyUVseqwDPxoR+RT8nOY86gZTLwKqHSiuRgnf0/8urhA+tVRbzi3P2D6Aiy1s
	eRLDDvRdKQO4c7CNmy1eryTvH0Qh9WLNWfsDCmu1mJ5TZt5AD4LqUlCOR9N+fTeDiHJHDCu5yK9
	NjjONbCxCBkwSHqiPE/DoKI5xk/qS4Sbtn12ceDIYwnPe18C0q4wf2HpmxChWqXxRtEz3iXKtJv
	U3bnlzyCLn+2TzdR3HObzD1BwpH/CRjympW+l6HooHpvD2USITEwzjJlNk9mbvqQvc63KH5nU+p
	QtyHV5TJE+9Zrf1dHfOkLn/I3X6Hnvxop+HNW6i50laGMnYfTk2JsKk40+v/p88a3ZPPA+TuNPh
	3Drn1Ht2RPz5i2OVckEcdl2Bjukq8foqNOsK4V83hJk6pkj080pUuuy83afCrP3bcmzMKQMx+FU
	6IUSwYdTy8XTFvYbUMQAL3t1AsYON1obtxzH95iPXRSx7t1wFOfoJHSuDNXZqdPcdFmqQwZgRbd
	D/TeZF0jQ79T+GSavQk5cVUoLLtJOzWj83N7gaiGtgQGhrReBNYsCJBw/6dCwYY+nunPPbxfuVv
	OrSApgZMFOpHBW7ini8uoJbLCs9MotLRrNjk4xKBXBhjfdBL9a+H83Unc
X-Received: by 2002:a05:6000:2dc5:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e6e52c720mr25066663f8f.54.1793654936073;
        Mon, 02 Nov 2026 13:28:56 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b725a2sm20540521f8f.13.2026.11.02.13.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:28:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH re-send] drm/meson: add support for higher bandwidth HDMI DTDs
Date: Mon,  2 Nov 2026 22:28:43 +0100
Message-ID: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132858_286609_F380D241 
X-CRM114-Status: GOOD (  17.90  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's a report from a user with a DELL U3415W monitor and a Khadas
VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
  DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
               Hfront   80 Hsync  32 Hback   48 Hpol P
               Vfront   28 Vsync  10 Vback    3 Vpol N

Those high clock rates are currently not supported by the meson_vclk
code as it limits the PLL OD (output divider) to a minimum of 2. The
formula to calculate the clock internally is (ignoring fractional
dividers):
  319.750MHz * 10 * od = 24MHz * m

With od = 2 this results in m = 266, which is outside the supported
range of the PLL on G12A SoCs (the driver limits m to 106..247).
Using od = 2 results in m = 133, which is supported.

Allow the driver to pick OD = 1 to gain support for modes such as
3440x1440@60Hz.

Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Re-send of [0] which seems to have slipped through.


[0] https://lore.kernel.org/linux-amlogic/20260109204836.790096-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..c0be0b7655bf 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 				       unsigned int *frac,
 				       unsigned int *od)
 {
-	/* Cycle from /16 to /2 */
-	for (*od = 16 ; *od > 1 ; *od >>= 1) {
+	/* Cycle from /16 to /1 */
+	for (*od = 16 ; *od > 0 ; *od >>= 1) {
 		*m = meson_hdmi_pll_get_m(priv, freq * *od);
 		if (!*m)
 			continue;
@@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
 		od3 = 1;
 		if (od < 4) {
-			od1 = 2;
+			od1 = od;
 			od2 = 1;
 		} else {
 			od2 = od / 4;
-- 
2.56.0


