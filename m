Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D69606D806
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w4Nxd1RW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLJTDD3H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=; b=w4Nxd1RWDW2a552BGK8T4YnauL
	x3NJ/zPuGuiB2omgMozd+ckaPay5gaR9bwwKIPIXa7iH+y/pDjOnpbchnL3expU5FiH6Wn4Uaw49H
	rrtBLwlAjP3lva6G+Jsy2DkViunoDIzGhtDs+QgLrDW+1q5nkpUJUQea4cC8oyFsy0uA5biulHkJO
	B7yM7pri8IXB+4+niO1PFdQzZx+JNq1eDEqkSdTI43BhjUZ7sde32LmRRRU5PVk3FuZiHqE4LfF6k
	PnytIpiSgqx3/5b/Ib4z4+5GDfIVVk6mZ1LhHgTtyJxg9nw3yd1psI1/qeXwOJnJ7CCdlPDiVks2t
	uaPvh4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPG7e-0000000BgQH-1yyZ;
	Fri, 06 Nov 2026 09:20:34 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPG7b-0000000BgP7-02Lh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:20:32 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-36ff9c9da34so360177eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 01:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956830; x=1794561630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
        b=mLJTDD3H4y+TeUqvZGXDtFf+anfIEvZWWP65fTSnnkPZwBmFrtyamlCK3D3zwLyT22
         C0k6YYqgRQC3+CD9EyV1lAz8huL/ByTceK00Qr9hTyOEYo4NfjstJloDaKFMLXx00wZS
         4FW9JEaKHrvdRMHQRZWaELvf0okkn8FuPUpNtDoxLO/xCsvV9gcTgxi5TvFGyjqI/UR+
         MoVIRu+JeYiwYT6iLTdw4IAIwXXFsOdsFwetI6cEfBGyK3R2GLDncQsj+bbruug3Qld4
         klvucAgB2KBSHwqZMqLUq1UjpbKFXJwVlhqjzXk8ktQ5hgGSCLt36K3wijrEWWojarq4
         0shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956830; x=1794561630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
        b=QTDS7EZKinlh4cnQ92KAO1Htppi7S5uiOoJl+Dv5p8nhJ44DJrdq1kfz/Iivgnj/qq
         bpfOgh77wDEA1GpWfrso7aIvssNWyoSWD8PJQK9/YuY/84JxyVgWa1ImGTW2J1Awyhfe
         ycuaBBlWlRBGNLUJ8J1iv4Xt+ES0VS84xCZwJrDjqBfbwyUS9IXePO5GinnKz+dJUlkE
         GSFOqjLcH+EuxMLnX7BKxR703dyXljL3xsavaGmQWGNwphdxBW6pteznPLIgmcXa5l3T
         pYv9RRK03V7xhNRVYuuituj7yosa55SikJpirzqLEwGNsJs9Yqd6JuZ70Q82qfvyR0ls
         Eddg==
X-Forwarded-Encrypted: i=1; AKwUvBw/Y7x7/BLDXlVCPVI9TWuTxtlwLvoZLgchqDWcyVfH3gFyV8HqmDwyhS7uZLEfy6w7gqojxOV6lTTfi/2dX2fk@lists.infradead.org
X-Gm-Message-State: APuU4Z8UX3onuoiQZLccq4ZEN/sYpYsZqDptj65RSzzEIGHcDs4lA00e
	fQ6sJGwxpwRvEHTjXWhl1a8FIP09gPfeT7bwnt0Sd0uD9wWFzosdABo=
X-Gm-Gg: AYBFou30xC6b2CMNwIcNL4PaP6uarRneuZsnqWuUA5NWHmoStx8LNin1CtK5qZei5+h
	TgwLEOFeVDpG1rzTC8EgaB1E8ntOsCSLV6UMidH6vra0NkFnL0Q54XC1EzED1iyk9sdMj/27Ql/
	uzXBVkiYEDXihymuH3HvwqWqsnjzKsNIhGUQMtf0H0Z9xyFY3Rigt26LeJh1F7nXoJstBtBnfvz
	/wgNEA+3zAk/NMHOleIXZQIEiZ1fBbpeCP3Egq5kJfnXWEww3yb/ioVBcfDFqO3re5CzplWr5VQ
	669vYl8cS/lvcseHcbE4YtREhZwktKtaPuVXDx/fVElxV87SHYtj4H8RR2j6YePtwVXY5vGUDLZ
	kzteNHezoIWeomd5Tjj7OjD9iQ71lsZ1VIAcqpmmdwyS2ZsCg91Uto7exmpmwK5c7nAkBoP95LZ
	JJTI7gNY3CsdVu9ac6W06PbTFv+CpFGKo5ftLufJo8CrLKtZ51S/gc3Tl1OCiZWBf4DSgix+3Z2
	q3GRqoVhj08kNGaTjfRQpBqwFNlCvD5aWfm66rJ3QafZ+AcT8xSB7kUuK9PPiYSfWaqNYbNNpEx
	C4ACcVu0Ea8XDVOdRwruXfvuErDknNXxxuMHMbs4DU6OB+vr2WX3ohOl
X-Received: by 2002:a05:701b:4507:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b25d346c12mr2313612c88.34.1793956829858;
        Fri, 06 Nov 2026 01:20:29 -0800 (PST)
Received: from localhost.localdomain ([155.69.103.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a610fsm3783796c88.11.2026.11.06.01.20.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 01:20:29 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Keep the mutex node reference across deferred binds
Date: Fri,  6 Nov 2026 17:20:23 +0800
Message-ID: <confirmed-20261105-38-2e09963f1b23@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012031_050103_DD369297 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_drm_probe() acquires private->mutex_node and releases that reference
on probe failure or in mtk_drm_remove(). The component bind callback does
not acquire another reference, so it must not put the node when the mutex
platform device is not available.

If this bind failure propagates through component_master_add_with_match(),
the probe error path puts the same reference again. A bind attempted after
probe has returned can also leave the stored node without its reference
for a later bind or remove.

Remove the bind-time put and leave the node reference with its probe/remove
owner.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/gpu/drm/mediatek/mtk_drm_drv.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index dc8e3e917dd771b950167d04c1ab87c14dbabf72..64c912ba95899128bfb1a41765579d9d70979a27 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -630,7 +630,6 @@ static int mtk_drm_bind(struct device *dev)
 	if (!pdev) {
 		dev_err(dev, "Waiting for disp-mutex device %pOF\n",
 			private->mutex_node);
-		of_node_put(private->mutex_node);
 		return -EPROBE_DEFER;
 	}

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

