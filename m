Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3AA106F313
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8lf5f+G0S/Ym9PSzIEzaYi3iHD/hBsSPQKrLmQgNjdI=; b=r6byrWzHLSd7hjH1aa8Gs5H15n
	/OzPFaaMStxtch4ksxPuZ0pWG5FAfMP6zVtApz88+AwxBCGuX5tnb5caWJGQM/B47dWgu6FSi3VKE
	ffg1WQ+Rc9uwZ8jE+Ue/4u7moXGO2wP5mZL+djeBZMmB8Jk33SDPU7DhrkI7SoyVgollXNGSluxWp
	Noellqz1O6287Ne/ke/SmB+EIIDbIk7x/K+f9frNVZng2YFTVNM3Jkc3cUfnFST7F8NN+ew6IsT8W
	s7cxYKO8ekLw87RmkLmdIBaATTHZOuTmgsmivALpmllogHa7ExwszMYIbOmsvpqD3EOjAME8Rl4Uq
	nbacL/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFR-00000005Adg-1axm;
	Thu, 26 Mar 2026 09:43:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFM-00000005AbW-2AZz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8lf5f+G0S/Ym9PSzIEzaYi3iHD/hBsSPQKrLmQgNjdI=; b=nontbJTA+q8+/wW3/9AO5CalQs
	OZ1GBhTBY+MUk/LO3vql+4Qo+0v8X4m6MuMUYStLPr8hyhDKxgpLCiAI0MTVAvLla7bLR098zgBqX
	XPolIGHepdhqHOtfBgCKmOMpOFCADWoRFq5Rb7B0XooYF392cL7+BnkCyZE5a/rPbK0G1E8N4I29R
	fNPK6HyXrvAbq+QuPi00ky71p9YQkDmlwu+x54uc977CKESzE86RNfG+48YhCBR53XyPVIm97kff3
	M7ntupqLvXHzClGkqII6f5SmQdHlDGUj69FsV9R2dAdukjHSfwqfEeDigRZiFlTAF9tKYpvn4ZJJu
	FzH39F1g==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFJ-00000007umF-2oCg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:43:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so592057a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518198; x=1775122998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lf5f+G0S/Ym9PSzIEzaYi3iHD/hBsSPQKrLmQgNjdI=;
        b=MfDsGFNnk34FWaKOmEdpGXlCpLCdNCkmnPHDvjJzJRnyUmXDttBeBrauZLbVkErktz
         8aH637b60AiCNiwhrp4Wthpyw4hD+pnpgDktUxgkglHzh6cBl7zNeHxXEoJgLCi79Zg9
         pvHDM1Dyx8xIVqJDWjJx32kF7mJHxr71iHFXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518198; x=1775122998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lf5f+G0S/Ym9PSzIEzaYi3iHD/hBsSPQKrLmQgNjdI=;
        b=I63/+Ewy7G8LMZJa3C4zSLG6UM0gWfT0C6VkGQfheks2ReP+eEKotEB2pMULnFqLBl
         zZ2WW1MXyuMpKi0XqFAi8c4kvWs71aes1SN/UEqraMXVeFr5u3CKv1jKcaKPJjBzvp1d
         rV7ALQk2eXyVahjKH5sTd3qmGMxu3arL5WJKoAObDS/k1gEX7AOGqI1UCPlUbuLYqNk7
         yYQwHanHPyWieGruONOleRbwZu95i8nO9HbYEsKOhE7JsNw9tgYIU298ogMMObjnjM6K
         Xfx22MbrZSe6jn7dCAk5KgXCvVNy+Dmbfqji3MB6dUvlTlNZ/WG+lXGsQfn5Hu6XTjlc
         JKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Nf4sStH8/Q4ui/qGyfIn9tCrCwbV4E2fL0Z4+Vua5LqW8H9cO1SJDmtEYnu4CtaSeSSYovI+JmWkvFikyKa/@lists.infradead.org
X-Gm-Message-State: AOJu0YzqIFPZ2f61m397yRfbxjOSimm+Yo4XsIzQ6qbIozoh/cCOzn3p
	g24TdABdw63bYSHoE6VkQOQPbWZJfp8nUnBQ7BHz7FDhL5patn+QvVbd4QJFTH9mTw==
X-Gm-Gg: ATEYQzwGmaamoBnXQaGaWO/3Xcj0sqQWoRjbF1NwiUniipDY/738C72EbX3AEDmwaKw
	uSRfJDndiRso/G9y001AGA6ErHGmSjG8/L2vPIGkDN3qIhexmOsqj+f8XXjrwTCOXRJ7QkKMzVD
	QbNHkfQl2HxMncnIM0zI1/He9mtKnO+SoULwDnDMpu7K7w4lMxrUaVzCCbYywLN/KLX2n7BCCh3
	HKJlWeeGNp+4Qgx2BATjDvQghWUumYKV+y2o0tuN13PYocZlHd6zBghJovC9d+kY+uPbYM7Z7dU
	rZTr4UxqY/pi+39/3fkTsvTlojArsQfefscxD9tTs+RyPtyJf08WX7cppnthaXl+S+2kBgCcp//
	FA3cDO/jAlAjQrcFiQ47xnhl8OEnuGvMIC3ABRttMj04wYHS8IunVQ3aN0IP1vwmW9whSQNd0NW
	Wstz1ED9kM1fT6MqNaq/D9hfEa2ngzHxKnFdiFmIQVFxaC383TO/kAIXxnyIKYxvfEptplleSgk
	J2fYvnudYuTll+uWpQ=
X-Received: by 2002:a05:6a20:258a:b0:39b:862e:634d with SMTP id adf61e73a8af0-39c4ad52456mr7291868637.39.1774518197965;
        Thu, 26 Mar 2026 02:43:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/exynos: Random cleanups
Date: Thu, 26 Mar 2026 17:43:02 +0800
Message-ID: <20260326094308.1161335-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094321_852708_D2683378 
X-CRM114-Status: GOOD (  12.85  )
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

Hi,

Here are some cleanups for the exynos drm driver. This was done as part
of the conversion of the driver to GEM DMA helpers. These patches have
no dependency, unlike the actual conversion, so I am sending them
separately for inclusion now.

Please take a look.


Thanks
ChenYu

Chen-Yu Tsai (4):
  drm/exynos: Internalize exynos_drm_gem_free_object()
  drm/exynos: Use DRM core dedicated DMA device tracking facility
  drm/exynos: Drop exynos_drm_gem.size field
  drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES

 drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  9 -----
 drivers/gpu/drm/exynos/exynos_drm_fb.c  |  6 +--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 13 ++++---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 50 +++++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  8 ----
 drivers/gpu/drm/exynos/exynos_drm_ipp.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |  4 +-
 9 files changed, 41 insertions(+), 63 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


