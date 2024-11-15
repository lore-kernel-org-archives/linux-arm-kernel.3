Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B5AD6DDED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KtoZGAEyQBCnhyYoL/bdON4aQAbKow6V3dd3ML98XEo=; b=Tx66JGFTTXoUePfhPO5/A6Irlp
	Pq3UOv6/bPVYl5IWd9CgTp8NszGYjugtGmUWmPttajbC7cvGjjBt1RAtPdSXfGL4DY2InaZN6uQd+
	dWrc0JijyY8lJ7KuVPpdae1MlHgm5FzC8k105YhwJGg4aCnBhd0gdkR0MZuiPmPVO0W9q58tiySCF
	Ye7DrUhUcYrGqHJZWK9eoYeh/xXG18YAJchCWomDRGIPtSfasEULw1oITj49FiM43q2Jj3X6HmbJJ
	7tR98dOkA7Az6jss8Ew4tN+lAPleaH1EZFqpKdsw/1E/XBI37JHsql0NhWqjBYHwiJ8lTuncA+poJ
	aAtRaAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuqN-00000002ZnM-3VDG;
	Fri, 15 Nov 2024 11:50:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBupS-00000002Zan-3kre;
	Fri, 15 Nov 2024 11:49:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c6f492d2dso19275295ad.0;
        Fri, 15 Nov 2024 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731671373; x=1732276173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KtoZGAEyQBCnhyYoL/bdON4aQAbKow6V3dd3ML98XEo=;
        b=Z3tYLOvYpWoeiw+i0ljr29ZDpuBnruqGUUV1JnnRN0hKfJ0pYvYf7c32QyTBIbj9Qn
         R0mNNidD2MEXJtpFUdUbf1Z9y05QfEkTNAUzd+PJC1MhCjbviTKZ1gORxX6pyIKaTt/a
         iZQ7G2o7XubeAJjAJvSOBz/NGvamwu0hzfmdScjt40YwNDZSjW6926qSWEm+BA/7zLt2
         x3yWJiGMZJU5mhu2tvGRuyC5DWp9TpBErYKxJLHI0zrMWoXz6ys6Cflqa0ag68i5/n6z
         LJw1HI1SjLVjBvhFsAC+jViU2FEF2pY5LpMIDW7iOgJs9XmzYGQfKsENVKyBB5eV6crG
         Gxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671373; x=1732276173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtoZGAEyQBCnhyYoL/bdON4aQAbKow6V3dd3ML98XEo=;
        b=JziX3yO28o+i9CKShdO6elzbq0AHDOpRppOToFxZsn9TtVi9627DcbBjVRtWg8cBxq
         jGx/dGE/oIVZi4vbf3y0lNHbxvuZ9iUhlbpEDBCEU7hRUtth4AGzn53ZwP6DPsfoXUAr
         fwc0+qVfiYtX8lQ8jpxQS6OB7JXs2memQZDj29Jto6OgGsxoEiKYz2HNFBqRjp3Rk8nU
         F2rKygB84mpWNJ01pPh3mKerhjTShZcvxOFn3Jy9nGvAn69VvHKw3vPC3hI+OSnMoBYo
         hvaUakUuYXmkWLAhraIZunGPBvk0Wco7y/3l2FxWdXrx8Bz9z2PCE/iq4bm1kicP4Rmf
         vOBA==
X-Forwarded-Encrypted: i=1; AJvYcCWMp7/SSWN2W7N1EBeCqjdO+NBICMivsxVKtOeFt/GhAyGuI2XVAHTaq3Sg0uVQPZr3CHEVQlmd/KOhSMGU9Ly+@lists.infradead.org, AJvYcCWc/T5H5sNG5ldJmKl3ujkYMh3E+KBvYWD/fMx6/SWEU9CT4WqajoSnvugoQbTPt2huNtLarpUuIQsjXyx0f5s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpFk06kAHoDqw51YCXYmk1v60FcNtUGE49RzpxfYIFXIKOOUuJ
	uuPaKV8Ezr3UI8JKzIqNgpF3ySsUxOgaZSf4fOpAxRW211+5f8nt
X-Google-Smtp-Source: AGHT+IE5sTGzwQKuTH0On3cSqtf2nsawCLjUF0bcqmiQ/aTjp84Xc+l7NZt2tv8FVSZSvOI7ACAIyQ==
X-Received: by 2002:a17:902:d50a:b0:20c:8331:cb6e with SMTP id d9443c01a7336-211d0d818c6mr34430995ad.19.1731671373536;
        Fri, 15 Nov 2024 03:49:33 -0800 (PST)
Received: from HOME-PC ([223.185.134.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47b2csm10469315ad.219.2024.11.15.03.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:49:33 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: frattaroli.nicolas@gmail.com,
	linux-rockchip@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH sound-next] ASoC: rockchip: i2s-tdm: Fix a useless call issue
Date: Fri, 15 Nov 2024 17:19:24 +0530
Message-Id: <20241115114924.23843-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_034934_936673_E91E8847 
X-CRM114-Status: UNSURE (   9.89  )
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

This commit fixes a useless call issue detected by Coverity
(CID 1507978). The call to rockchip_i2s_ch_to_io is unnecessary as its
return value is never checked or used.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index d1f28699652f..10f46fbe5175 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -577,7 +577,6 @@ static int rockchip_i2s_io_multiplex(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		rockchip_i2s_ch_to_io(val, true);
 	} else {
 		struct snd_pcm_str *capture_str =
 			&substream->pcm->streams[SNDRV_PCM_STREAM_CAPTURE];
-- 
2.34.1


