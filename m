Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6C606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i7HyB6Pu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztaGjGHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=; b=i7HyB6PuVL+btam9hauC6dNOyO
	ySGLrauopDAaRppwe6CCIcDnqrMi2S+/uXVYXXs4rHm7D63euzSsymQgTguLmL7Ig4rzXh/vqBkvO
	HJcJ6MNb/BbqZAQZ2uZ7wN1hNrpQlqxoRI+noKdwwwitAq6X2yrrwH8CaXSuYAm1OwagZdJ5Jrr69
	UWKPZO2cea5hWQGflUIcjJGtPzrs7FiapbVMF+GzOLrIpHQ9YErxvvyW/PnX8pF1b0XJUpLpRXPVX
	owxHelJ74QfaVLIW0cgQPM1u6va+JzHjVePxbxmc8ZqCguoZn7L7Ks8AGYixomYrIIGJxFI9LKkLV
	DwM4M48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAj-00000006UAA-2ba0;
	Wed, 04 Nov 2026 18:57:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAX-00000006Th5-0Qh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:57:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so961645f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818627; x=1794423427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
        b=ztaGjGHsqUPrree6ltK6FoyDutXRyZTeKJCHNdxUwcMhH+rtFTwTDqmYcuxdiz0iQ3
         /HH+xDk+eONDe0+XAZZvTkw5JC1jhQfVtdQD8kdE+xHF1edqoOSJGLphZU3S/XqU238C
         1WV5BTZcDhR/fLZSKgSpFLGMnuQ/8SXG1GyfK8sFgGoRPDI7aYIYygmfSZmjgIGvKZ48
         NE3XeE1k3HZweKbl0mOBK65eSKzgWCsYiwOPbfQ8/Z2DnXxfSwuEQ9D8Nbhe9fDQ5fRa
         cvcQUVOfTL3/Lx7GaQ48oFWepQUL0mi5spr/A+QzNcAjMw8fbqbs9AUAsYbnfdMaKiB9
         RJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818627; x=1794423427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
        b=kBbXecK0C/MuFBlFuzQOd9J5D0ZPr0QvWfBZRBbnt/L472f+JjoYV0L1vyzBd6nh5S
         sAA2grN1KrFujbGRM6kMrlUYz4TCvDcsy10gjVZCtJL8qB3Ulnyw/WhL6TxW/20WnTXQ
         LzFZEkzTWMgfJgAuYdFNwcV2xCZp7UFz8Mb8GhplnwdaG7VDxqgKN0SN9vsIBdiNjJ9j
         tUb2htY88IME5m8ue9vExFDzXB2xBGr4OB+Q1MtgcsxEexUqrjo04uxXPmk4lyqZN0rV
         N0M0BFV7A/u/PizfeeTrPkBCiB+4+vT7qwJr+3EWsBqFWuHqx8oeo04qb0m62hKivrTR
         x2KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGWggSmWJnfttX+J3qU03WHE8Vqxii/wN4Mp/JhYL98dAI3l7V4LyHkMvdIEVekZsJRnwAejwal7M7eglVLqL7@lists.infradead.org
X-Gm-Message-State: APuU4Z9//B4t1F+SmNRhD/m7t1+1pV9qjCNkz2OMExvQActb5BZNGQGy
	14WooLtOgBg6jnu80Y/xjubpUQ/t14r5cOLbzFaVwB3xcH/8IaGHLOWp
X-Gm-Gg: AYBFou0y+G1xzptfq+cIkKhd0b6kfcYZuLaSm7mxkXa6wNxzxmyADoFRFmWoyfrVc5w
	8Sb1VIkjzdXrAa+ma1u6hOg6dQEVdxntu91W5x2NPPeIippYVi4Bw4+1cnFvwRtEM8kcLNa7Fvf
	E0FAslKGy3mK78XdAH/P9nr3/Canwku8jgmsoD35MSXuLtXmcpmVSw6lextGs36SGMRQ00EtRZo
	in42HEDCTM1OaSpCmnk5MoCuy84+AeM4kVMfI6JLEmGu/rIK7MO9ONIMOjXkP8StZC+ihmy9jmJ
	koBvXqiJPmIPSNCrhrOfHsIidMFGw0ypCCcQL177V8Hyg1J2g+l4v23KD2Dic+tMr6HnY1sZgmK
	vwI78m4Cb6c/FHcxuIHZI/OxPn4f+IGNh8doJ7TuoC2MACrXFdxB33FdzKTSQvJ1pI2Vkb9VmKs
	wJjskR8/FXrAO3HgLMoRu/4E3qQujDzAqwuykNoFu82K2HiHCtmEYmQ18SNTe0HSN8cbjIicUiz
	Ua3FY1ozgoZmSLokH66ipdhMAteXxPBuT0IuXb8hJc+MdvttgqRe+tgcTfrQenx8ntblJGdfh/S
	dvo23+1TOmSQHG2WorRsBv/eYtDIwVbQys8B5cma22puMIoUWApBZ7w7xnQ7/VcDIm+B/+DRb8V
	hN+Kze0aZBGxJCbhivbKwwj/ZRGqRW5QMFGCu+LXHcwCH5dvVtzHQmfj3NZQBta+tBdRv8N/tHx
	dAtT2AodPt79gTeIQXMFFyDK/c5+k5EvIrsGrET0kUj5isO5rSwSSFub9PKc4JTta0ndosJKqz1
	YPKTV88cx5Kzbltul2GFy94/dR0CYESn2sTMvkwAdqrE7Zzr3iE5OOzfrVdttoP6a4=
X-Received: by 2002:a05:6000:160b:b0:48e:7476:9205 with SMTP id ffacd0b85a97d-48e74769219mr22849870f8f.31.1793818626772;
        Wed, 04 Nov 2026 10:57:06 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08343dsm5463560f8f.30.2026.11.04.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:57:06 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
Date: Wed,  4 Nov 2026 19:56:59 +0100
Message-ID: <20261104185659.884455-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105709_196857_36322A45 
X-CRM114-Status: GOOD (  10.62  )
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

sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
undo that, so the clocks stay enabled and every further bind attempt
enables them once more.

Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.

Fixes: c64c8e04a12e ("drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index bd3923ef5a41..983826001f12 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -209,6 +209,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 cleanup_encoder:
 	drm_encoder_cleanup(encoder);
+	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


