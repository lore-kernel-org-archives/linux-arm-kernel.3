Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B41C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=; b=sRtQmDl9RadQQjs2+jNqFa0/HR
	j61olltz/iCoQIhOMwHaFC2WZovtewf8wVxTpim4TRQOhHDJvftBG5yiW7xjZwrcDudZX7Mw4QK5s
	HOZr9usspVvqrZ6bjbY4Jd4v9LJ7WD5JuLBy9VvkZfTzkOcWWdgEjUADUcxAm7x4ABDSnX1zzyyxY
	MYqOYey1XCd1qAuQNEn0Vmc+Vu9Poll8hYV5/vfnV5+GsizWy7Px1yryv1NkKsZF87zk0RVCa6aix
	4JLKD16jgG/V8ApFhuFTgXY87hfIQXYfsUjTu/I2PFDfjdRE0AoxrDjvPbRblZgt8n1haR5xYo0Ee
	fzdPU+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qKk-0000000Ad8k-3XMv;
	Tue, 29 Apr 2025 19:09:34 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qIp-0000000Ad1A-2kPG;
	Tue, 29 Apr 2025 19:07:37 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b0da25f5216so4108606a12.1;
        Tue, 29 Apr 2025 12:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953654; x=1746558454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=;
        b=mJbjb9QYGpJNCy+bGnplR/ASC3NaOXwbFnVW94rvsMXxfmG84IFZ/nWOFWxAljNOSO
         I/45l6lyLstx2XBfKxmV79b1UtarJ3otqH4iRRC5n42DZZNgUcxdvSJv9nmEjBw2vClV
         KzIHekJWnOBb1HNmwCifzFgwFaXW3twzXDMXugM8GNgNYTD+li3hDKGpfDNsnLBNEO4W
         IFjYhpH52AlwWtmLSsnUjCEDAeSIwT/bj7ZlK8+TVzrAWu6liMXMj6OajG/ExIQIcBHZ
         At+BNb9bmyxVJhhp/JU9rk8DD60yrDybL95mICs9CYpR0G96/YzJNug25utvP2zmlHEY
         qXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953654; x=1746558454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=;
        b=ppndNfiGq1vx9lC+FKgbUXzdhJC969WJRwYVyg2msvWt3LkEaVRg8UbG6LWnDXsDp6
         y7MJsSwDysO6f6vM2nrjE1kqHPHx63vYK0V+5za73Nod/3AKxcS3Mac0kjYndiCZ5IkL
         iOXkKsDnnPTSsfevTCvhHvLo+IimBx36mYBWVxlcCc+6dhNVVpGoNc5ycdIb+9onsSa8
         XFmuUylvKXmwipRYBs2PH3Sjnha+kEkc25IK8m1EfCI1LgYJocr9APzKyg8bRgcHxypB
         D9sxvIZPIjDf4wtQv6WSNagcF/hMqjRhVSCV1MTbbwmwDbsEfZBm/JnUPBbH6FMNlORo
         G1hw==
X-Forwarded-Encrypted: i=1; AJvYcCV6FH1g6I1X9VfRYtY4ntUQloR6DSkndr4WlG6NwWaGZZLWfGcDE6Zgfn4xLKrO6meC0xQ9mLn11CBMFGOd@lists.infradead.org, AJvYcCWiuvPSNN0w2X7IUV5y0bhdWnO8BzqlEYMyBBNjRqHJnHP0r8U8HebLCkjNlTAtmXpTmJEDO8sXgFCCoQbfj8XMgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVkPPWaHQLOqi8QeN3Crj8bOPEM5iKfKbeGHcC/W8Cg8Hyz3D/
	9zbCw7BOK/PfvfYrMmZF8aARnnkr1ptyDzSq+h81QEb3UhpFjUeK
X-Gm-Gg: ASbGncuppuT5UHS2m/7llPUZ2VDzMMZ+WVBfMELWrUMyvxr6UHAVqtibMA5P2P73iVm
	P2POy7+2tAZYMD4oVS1u+mUTfsTQ5308apaazLmlNN3e94HT+/YDMpNP7LDJxBeM3KQSV4iND0o
	lpyBWeYrBxBqTqYJBrcd/+Ad+hpBiBzYkYF+GW0d8Ok+1IlDAJ5n0mr0xUAzoIjvXdVa55r8tmU
	Nc5ijN63fJ3JDlSgwyo/NXlCtzbdnI2kjbE9DELxB4i0edIQBmNaSp1/4y+hMR7bUOdKsAdenQ7
	c/7Fy7lnILPl+7GO5uXJFeRSRhRy+kr+QhMO9k/UTWy1Q51gmLLoGado3SUP8EWELfe/C+zomqR
	d/U//
X-Google-Smtp-Source: AGHT+IF2ts+XG616nJO7RIcanOzyRNljW8qvmYtbI5nighVo0d3L81pz0OXCcq1V+31tmdYRgsHXjw==
X-Received: by 2002:a05:6a20:3956:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-20a8754d547mr149066637.5.1745953653871;
        Tue, 29 Apr 2025 12:07:33 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:bc46:d693:1404:6ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5ea3bsm15101b3a.135.2025.04.29.12.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:07:33 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] drm/meson: Cast mode->clock to unsigned long long
Date: Wed, 30 Apr 2025 03:07:24 +0800
Message-ID: <20250429190724.330883-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_120735_690263_42764C0A 
X-CRM114-Status: GOOD (  10.19  )
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

Coverity scan reported the usage of "mode->clock * 1000" may lead to
integer overflow. Cast the type of "mode->clock" to "unsigned long long"
when utilizing it to avoid potential integer overflow issue.

Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7752d8ac85f0..fe3d3ff7c432 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	unsigned long long venc_freq;
 	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock * 1000;
+	vclk_freq = (unsigned long long) mode->clock * 1000;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned long long clock = mode->clock * 1000;
+	unsigned long long clock = (unsigned long long) mode->clock * 1000;
 	unsigned long long phy_freq;
 	unsigned long long vclk_freq;
 	unsigned long long venc_freq;
-- 
2.43.0


