Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA472CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=; b=LaRC2DJsBhLi8nmJs4gRCKxYjW
	Rh7AF+K/Koqae6MHCtZyUbrRL179ZG/fqh3TzIFrpg88xANCmNtqTnHAFhs/Xl84ZLH9vImERU02k
	FQQ4Sijn2uTUsiE+Ob5vme6ZcrTH1P7uZ3OetpJrnFBP63mG1Tf6/+uVwJkXDQEGdqCA5SM7bgZgR
	2MDDC3kc/WGcma+JFyoD1aWOv4fH/AM/t7GHrHNeQ9suzP774XHka8XcEkh1JM8S0APf7oA84jMUV
	WVoKZDn21W1XTqs5FPhohaBoUDZsfR0dqajt0CROAN7MNQ7wfnpNXYnKU2FGp0r69GjMx7WKfub2F
	OyA58h4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIp7-0000000DNkZ-2acR;
	Mon, 27 Oct 2025 08:43:29 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIou-0000000DNZC-1qFs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:43:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b6cf1a95273so3187932a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554595; x=1762159395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=;
        b=V0t9NVOU760H4pMnLqRm1uGe8VHoaSBF4coo2wF4cG2vFTlHhYZ8VqPOQYUEy6LNCY
         fP0jOnoE5JJS1Yi/z1lUs1gQhwD15LR4v55/fFH/w8QohrOslGsnzHprnmuS/OaPu+w8
         /YXjO9cyQur+xTB44aaFOoewTGyB68/WVSz5RaMqkIT33OwiEgPckSwEG9ZKJ2jWznhM
         v5nRezPOFtDSHGajHZn7G9NY2Yy1B03A6yNnn5q/XkM5kcqkxzjVWtXoLJsydvZDiAkg
         z9H1+KDqqZOcKVf5+noX9bDYtRXyJUA2k6jOiCzSTmH2vhcwx1FbrvX/bbAYBGpNCN2z
         wmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554595; x=1762159395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=;
        b=eOBsI6iTIMyPVIufHPYgA14ZqfeWcakonK+0cBwJJBegEQMTtxWE0rVd5cnn+WMYD6
         YqZLarhrHhNMPNjMVHBzcuk5Hlg5A56OWHpp3LFR52RgFM/k+yyRknkGf5z9VQoAulOn
         LMInLu0ncNIgNPOk6KhnVxNzC9C/YMklzp7R2O8AZfF5gok1nRzsD125kYP+62kiTG9Q
         93xgnQDoD2xKweP4eRFQPecYck9YKAIWvL+cp59c2xDVWFKhKhEs5MghFZkmJdbsmYqI
         xAzvKsske6VYZayljGdNSRAfBkMHfEDdDRqVnusdKFf1uFWfbw5uKffJnmoIcUIMu7c5
         r6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyrDZX4VnzbzR/jA2A0CFi7qzLL6ylJseAt/Hp7wKIh3jqeEGmTeKKzt36JIVEa6R7spLQvhA+EtgQeUqHv+tV@lists.infradead.org
X-Gm-Message-State: AOJu0YxaP5f/qO3LBFhE7+wfVkriSEP7A+p7HQymqXWnI+dwiIr6PzD0
	TVlE3bcl3CqYhAd8jTGUJex+oLjHqFH5iHNbD/V6BY24UNwupK1wO7zN
X-Gm-Gg: ASbGncswUuJPe+N+wxk9zsCFXdgRxcyR0AnUuWAyNLRZ5R5WZEriD0HyAxLGMB3ShKY
	KiYxpf/rnGCONxFGuXkbUOcOAX5B4rBISLrwIYOlSHWShckJhjfhBDcfSZE0Ktk/aUiX9yESSJV
	x0+R+K/UURkjMbu4LHOUtz23YmeewiMAlGocYuepQTbFLJavrix2eIzEnUOkCitnWDspNV8jWcI
	0mkP6HkFhNpxpXAkirfXKn0UxGdvtKQrPxjax6nt1n4HvaL6Cs7ppCOaF/1Yd7HpXV4+nEwQQSZ
	R9KTMCjFMGdXQHccE9PLsy8mA6aW0rDCAQ5W69sRszgCqZ8GEToN/5gj1VuQol9i1r31/Uiv/y+
	lYDL0B+ad0iYMd0WmnOff99BV0WF1JuSWYmglcP0mxl2Un6H06EJQoxrYy426WYZEx+qqT4H6dS
	udSlKdupSwE02PxgFNS5vhT3kerJiyvzKzh73Y/WRw94o=
X-Google-Smtp-Source: AGHT+IHwgVcslq+1mjD8C6Vh5GqRLux2tDGUe1R/TUV71B2G9ynp6h0rzEeVb0xZxIg7lRsdj6RNXQ==
X-Received: by 2002:a17:903:247:b0:294:c189:68dd with SMTP id d9443c01a7336-294c1896977mr7969545ad.44.1761554595286;
        Mon, 27 Oct 2025 01:43:15 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498e3d2aasm75349815ad.88.2025.10.27.01.43.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 01:43:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nicolas Belin <nbelin@baylibre.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/meson: Fix reference count leak in meson_encoder_dsi_probe
Date: Mon, 27 Oct 2025 16:42:58 +0800
Message-Id: <20251027084258.79180-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014316_552602_286D9516 
X-CRM114-Status: UNSURE (   9.90  )
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

The of_graph_get_remote_node() function returns a device node with its
reference count incremented. The caller is responsible for calling
of_node_put() to release this reference when done.

Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 6c6624f9ba24..01edf46e30d0 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -121,6 +121,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_dsi->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
-- 
2.39.5 (Apple Git-154)


