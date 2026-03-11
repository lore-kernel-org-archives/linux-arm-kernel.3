Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7891049523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3c+qlxblsTBEXvZcg0JlOjOHrwtZ50FEnfrmL02pXEs=; b=phXrbRsGuEN/LvuHt8UGiFShnp
	I2s8wNRD/R92J53nFw3qFY1vktiXauaFIFehkgiiPfzcYCoPSo4GBlu2Vzz6C75r9WUleP2gUqYu0
	sDVIry5kgYc/IswytPkvUSxcsloAZ4RaoHENFnYPoY5eqF4Ztp8GVH1hATh+9MKLgmCcDDJNPOrBv
	/vrUd+0pF08RydHpzjQT4L7nkYPny4o0Dpa8JxYk6QVJX/HS9ie1LPEGhIx71Geg+YXf2gXgHXoV9
	QD0dNhLEc5OgEsJssRzIymTvqlww1O67biyhKmp0qOlJKRIFbFtGJi3xjKPpWCrf+lfVmULLrkHwp
	e+WTBkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCW-0000000BJhP-1GE9;
	Wed, 11 Mar 2026 09:50:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCV-0000000BJgo-0qhW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3c+qlxblsTBEXvZcg0JlOjOHrwtZ50FEnfrmL02pXEs=; b=ATCWUik+RUNuKyjBG95+Fi+CCY
	+7JpbK4DXDTQlHPaY6EC4Una+i05ud/SOakq2b4jgpHarXGfoRP5DM/Jg6exYXtxHn6mlOmosRKWX
	XNRkv5GKpDRVtQ01J2I3cv4s82ZDglSo5f5ORw3PV+UacBGZO+blaPNr1RhXktIBpnmZVQKfjwpsf
	Q5iLldb2N2hxEnc6XhjeGFEcB+3iEly07ykwvxpIhMWuM/UcGJZQYFZF4MUeyCUDIpiFe37DtnuhL
	58NkjsOUr9YYKny2zMucOvAFA8gL/xom9IffeqVn2/hXta+nb+1O4iWFPW+r15fB32SGIfkOAXusE
	UxLPJvsA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCR-0000000Gbe0-2GMv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:49:58 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8297c035d28so2461958b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222593; x=1773827393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3c+qlxblsTBEXvZcg0JlOjOHrwtZ50FEnfrmL02pXEs=;
        b=PEmnW+xqLdGD02mB3EJcUa5cyJwfbHhkjlQ0OfzajYKWZmY1EWf8og1RWWnrVOHuuK
         X8kepyg3SkJr0spQ6AYas242eDlRnvRjvfwWOzRP7fkzRkqj2HXaIYyX9+FdZPj7/bF4
         YVI1oVVZkYUyQm1Nqr8os8fAifOhoXvVv5LN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222593; x=1773827393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c+qlxblsTBEXvZcg0JlOjOHrwtZ50FEnfrmL02pXEs=;
        b=hRWnIqf66VgJ4LVF2SXREzdvAQp4PU/7pHmGPC0PZZUFqlgmMAOuAKzHxuEFKgSdJO
         e82e0C7XhyANtOnG5BRQ+RX4/9Og2spHDRB349QGnTgs0ip/T5qMppWoE5nMMkuNw5GW
         uSYSnpswzSS8diq5tfReKgtdUo6bTmUMkNJamtQhRl/Yj6ggwgzxzNNDYMfabz1gTf0I
         cfvX88YAVVG012lMynBUKlAP0FcLHhHvenWz74PmntbGxglNeTiSOdDYIU/gPiNRBO58
         1qwPp3kTfsF8J0DpBzq3s5T0XDb2GFaNtxVlRexXGihKqBjopEuqCrJAmYQtDLczFZZl
         80DA==
X-Forwarded-Encrypted: i=1; AJvYcCUVRuqMZTy/tz4m2OUdgpMgaSWHErW9jA8+cuH6ANdK/dmX4zS/QlbfqqmSfTx19N6iJ0ciznjQSJfwmdSiucGH@lists.infradead.org
X-Gm-Message-State: AOJu0YwOoiuAs0UYti5gzAylTXTm3pekFLY91mihT78vObJ29YZkirht
	9i7EcFZWgIXrPq4DDZV8QQYQaZHvF8q2yzInew6Gyt4PIEm8ItjdPHWJ8vyXBPg83g==
X-Gm-Gg: ATEYQzx2/TEzw/MmijNlK32yvsqzOxWuCKo0rytmQX0i0qLVfMpmniunKMsX4r0j11+
	SZBTqi96PP9Igk0ALrJPIZCyb6BfvXKFAd0E5jRvCRTMv3/Rh2gz2i1Vxr+h4IxQ2nHQxhv6Kze
	XnlmIlLAvZ7iWRXA4nBiPTPQsFoqP7Rcn0ZsOcCvxp+DM8oXxIJtzl0PCJIo7s813IrNbbvxcVR
	HRoyVJ0ON3K2+2tSGzHQ8wrVvKh/Xi3YNkF1RDjhBRHlcySSGnUaL4eGo20xkgMcXaj/WqFQ+WM
	EdzdyPfETM2DyJpuKW18j5iX6SSp9WUdr8be2VextBOvde4MZlCL0v+0/FsByeMW8UfPIe63VHk
	ZmUo6v2AisvGWXCtbgp5KpbLnhp/N4Gjgr4NM/vq8218z069SwwxCptt7kfo7loO1CUj/vTbfPW
	t6D/6FKNrkg6ISFPFD761OcvL1Y4FBGHlYpAyiDPRo394jxznzK04Ruok6hlVENKP1sHX9/oJXa
	N4FIE/V
X-Received: by 2002:a05:6a00:7095:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-829f706cc42mr1683975b3a.31.1773222593454;
        Wed, 11 Mar 2026 02:49:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:49:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/gem-dma: Support dedicated DMA device for allocation
Date: Wed, 11 Mar 2026 17:49:24 +0800
Message-ID: <20260311094929.3393338-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_094956_233283_11D2C832 
X-CRM114-Status: GOOD (  20.89  )
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

Hi folks,

This is v2 of my "support dedicated DMA device for allocation and mmap
in GEM DMA helpers" series.

Changes since v1:
- Link to v1: https://lore.kernel.org/all/20260310032511.2545500-1-wenst@chromium.org/
- Collected tags
- Removed reference to mtk_gem.c from the Makefile

This series expands the "dedicated DMA device" support in DRM to the GEM
DMA helpers, and converts the MediaTek DRM driver to setting the DMA
device and dropping the custom GEM helpers that implemented this
function.

Various display drivers implement the "dedicated DMA device" support
with custom GEM helpers. These include Exynos, MediaTek, and Rockchip
to name a few. Allwinner does something entirely different, calling
of_dma_configure() on the virtual display device using the OF node of
the actual DMA device. Recently this causes a warning if IOMMUs are
involved.

The dedicated DMA device is set by calling drm_dev_set_dma_dev(). Any
code that does DMA related actions should use drm_dev_dma_dev() to get
the DMA device. If a dedicated device was not set, then it shall fall
back to the DRM device's underlying device.

This series intends to allow the core helpers to deal with it, and not
have every driver implement it in slightly different ways, duplicating
code.

Patch 1 adds dedicated DMA device support to drm_prime_pages_to_sg().
I believe this was missing from the original change that added dedicated
DMA devices for PRIME.

Patch 2 adds support for dedicated DMA device to the GEM DMA helpers
for GEM buffer allocation and mmap.

Patch 3 converts the MediaTek DRM driver to use the dedicated DMA device
support, and drop all the remaining custom GEM callbacks that deal with
it.

Patch 4 converts the Allwinner sun4i DRM driver to use the dedicated DMA
device support, instead of the of_dma_configure() hack it currently has.

The series should be merged through drm-misc-next so that other drivers
can take advantage of the change.

I also intend to try to convert the Exynos and Rockchip drivers, however
both also have options to set DMA_ATTR_NO_KERNEL_MAPPING when using
dma_alloc_attrs() to allocate memory for the buffers. I intend to
resurrect the DRM_MODE_DUMB_KERNEL_MAP work from Rob Herring [1]
to handle this. The Rockchip driver also has custom IOMMU attachment
that I'm still trying to understand.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/prime: Limit scatter list size with dedicated DMA device
  drm/gem-dma: Support dedicated DMA device for allocation and mapping
  drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
  drm/sun4i: Use backend/mixer as dedicated DMA device

 drivers/gpu/drm/drm_gem_dma_helper.c   |  21 ++-
 drivers/gpu/drm/drm_prime.c            |   2 +-
 drivers/gpu/drm/mediatek/Makefile      |   1 -
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 drivers/gpu/drm/sun4i/sun4i_backend.c  |  27 +--
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  27 +--
 10 files changed, 46 insertions(+), 303 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

-- 
2.53.0.473.g4a7958ca14-goog


