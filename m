Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743DDD10F37
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 04:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIzb7uKmpBMgFz+tDnGmizcbHL7RIhkfCyBnVkIL8Ew=; b=wEhuimhLnhc7pwk9gEUoPys85Y
	kE5JfJaQ5ajp2gYU192Bp7KWXf01hFCl3F5pIjk/Pny5ZPAaf3p2R1DJ2xhWMpLX8QXVkJPHNMCMj
	4uRyph+Pf+so4iuOovoQwl4sOFmmyyuSraP0eIUFGT2U39TjMMJtFti1XDNTFKngsuOJ8xnLgsNDz
	6eMoLXpDYs9IuxYa57kGrm1a1y31QVWzbs84sW6mDFdVrDHG8q1YffpAXpEZCGF/4Rcqlr+rA6tIN
	AT5Bk3uloA8oGjwZBsKxQbn+iz2r/kUezA5b8HVi9OUETdTcsJd3eaZvmFfp1syHM3sMy//rFZZ+0
	LQpeoe6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCtpA-00000008LRt-3HIl;
	Mon, 18 Nov 2024 04:57:20 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCtoF-00000008LMp-29Yl;
	Mon, 18 Nov 2024 04:56:24 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7f450f7f11dso1076793a12.2;
        Sun, 17 Nov 2024 20:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731905782; x=1732510582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIzb7uKmpBMgFz+tDnGmizcbHL7RIhkfCyBnVkIL8Ew=;
        b=HRwTJWjY8ybbzrlLg4XR/RS6if18yOj92fuS4DmVr32pc4tDKPdxZmRzTouVGhCabX
         Cl/yDouWqG1LX/zpaTFRV/0/IoRxnwGeKyl+nu2tEfprhPJ86hNNPo+NCQNZ7g3fUTm0
         5E6NxsfHT+x2ab2bhWLCgLK98XwHpZNREs5kbpf7YRFQVPxcieStyfm4fZfM+dsSIUAJ
         w8eDscw8MlCO15Zdxu9PfE/yCU4iEc9Yw/Qo4NnbBG0n5LRXEJQq7Bi6vp8GINCjKYeM
         zJKuQuT78JQeki+j/1qdsVtWlPW77SGwoHcwibZ6wZJ3HU1UODUdxRNmYKnwmxsQee7O
         ylkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731905782; x=1732510582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIzb7uKmpBMgFz+tDnGmizcbHL7RIhkfCyBnVkIL8Ew=;
        b=Msvhez4t4fcmkNSn+bJlkWsgI4WGo9jOLys34DD1tc291AQIhMR9+ifIZSOnITlp3x
         SSBT53WrhwrBIOG3/tPuN0FisxB7jELkoHWKdZCQWszaCjJYVPMaCDoR7SdZlPDWx8Wf
         UzcMUwY29lyPoFEBEVC1TINRDuOoLDz81VaRFdAmMIWn079WFWOCUaYUglgnfROeJzMr
         MWRMPrLlLR6bWtXQCYIfsE3h6MUSk3pLzRMmK4CnsWsP9OfXOHysQWU+NLX0X+vUSZuG
         sbut+wff1QccaUeQLDLQpqw6xE1aT28mvetU+05Gpw6f1NWKHWX/Byn5JXC9w8+WJH3K
         50QQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+8WE+ZoNmW0VKSv4co98FPZZaIxEvAsS2CJyL9Bwj/K9+HxyspEgN791SjOcQCizps0AduaF+vVKPA7kduEc=@lists.infradead.org, AJvYcCWcHAaoGvh2Ay/jToBfrKK0Lf4kZG8C9jBuGHedsByF/ADdb2D2U5i/PC01LiWVP4RS4ZUEkf6n/Ml3ChcrgXAC@lists.infradead.org
X-Gm-Message-State: AOJu0YybQl9iyhtq8jOaFHzCPZpyF7IFxQWBQ+fh2yOZXRc+zC2Uh9D5
	oOMzMV+9wSQoCJYESsmg07DiGAEZRdN5MzI+MZR9AKlwzePYDHmzxsYVPWgg
X-Google-Smtp-Source: AGHT+IGM5q/XQhELTyhomnrivxdQ/jJhyyr8CxujelNS3o0So9Pf9jvqU/iscpoImttt0BHLahuDBw==
X-Received: by 2002:a05:6a21:7e85:b0:1d4:fc66:30e8 with SMTP id adf61e73a8af0-1dc90b225a2mr11710103637.10.1731905782118;
        Sun, 17 Nov 2024 20:56:22 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c644b1sm5009044a12.42.2024.11.17.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 20:56:21 -0800 (PST)
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
Subject: [PATCHv2,sound-next] ASoC: rockchip: i2s-tdm: Fix a useless call issue
Date: Mon, 18 Nov 2024 10:26:05 +0530
Message-Id: <20241118045605.48440-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_205623_552356_588315B6 
X-CRM114-Status: UNSURE (   9.59  )
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
return value is never checked or used. As a result, the function
definition and call is removed.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 28 ---------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index d1f28699652f..bd0dc586e24a 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -514,33 +514,6 @@ static void rockchip_i2s_tdm_xfer_resume(struct snd_pcm_substream *substream,
 			   I2S_XFER_RXS_START);
 }
 
-static int rockchip_i2s_ch_to_io(unsigned int ch, bool substream_capture)
-{
-	if (substream_capture) {
-		switch (ch) {
-		case I2S_CHN_4:
-			return I2S_IO_6CH_OUT_4CH_IN;
-		case I2S_CHN_6:
-			return I2S_IO_4CH_OUT_6CH_IN;
-		case I2S_CHN_8:
-			return I2S_IO_2CH_OUT_8CH_IN;
-		default:
-			return I2S_IO_8CH_OUT_2CH_IN;
-		}
-	} else {
-		switch (ch) {
-		case I2S_CHN_4:
-			return I2S_IO_4CH_OUT_6CH_IN;
-		case I2S_CHN_6:
-			return I2S_IO_6CH_OUT_4CH_IN;
-		case I2S_CHN_8:
-			return I2S_IO_8CH_OUT_2CH_IN;
-		default:
-			return I2S_IO_2CH_OUT_8CH_IN;
-		}
-	}
-}
-
 static int rockchip_i2s_io_multiplex(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
@@ -577,7 +550,6 @@ static int rockchip_i2s_io_multiplex(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		rockchip_i2s_ch_to_io(val, true);
 	} else {
 		struct snd_pcm_str *capture_str =
 			&substream->pcm->streams[SNDRV_PCM_STREAM_CAPTURE];
-- 
2.34.1


