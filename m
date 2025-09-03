Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F00CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o7SdCGQ3OtPL4C8i+CiT/i+Gun3C1uxaqDOYUaITvFM=; b=scP1BfuPxLLng17jtL06Cvxc9B
	5nH/KByqYrEBCZTJt+vkksowulDBenpNkjyE2tM9IXccpArmxYpekcCaDtFaSsTnwlZSJheQkp3qb
	GZUatgd4B8luinvSWjdYvMRLFy7Ch1DBFmjVPSrHb+PnxiVHvNUY/SgSY3j8vCqBDTdLgMfy88Zd4
	ybh48jDvjLiamseO0vRexkqI5i/dvzNDhh4oB9XP+CjxJJlDpBSy5ijKEbIEjN5Gz2xm0FxvH3hD+
	FdtlLicCUqAWoVSsS2XaWkH5IveUoCK5AuH4ojQ6eUiTM/ErETDqbVl5+/5yXIwdJef8zA65I9dkc
	iBIzof9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRH-00000008Flw-1dJy;
	Thu, 04 Sep 2025 02:11:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwNh-00000007qR0-3khm;
	Wed, 03 Sep 2025 22:55:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24a9cc916b3so5093545ad.0;
        Wed, 03 Sep 2025 15:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756940109; x=1757544909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7SdCGQ3OtPL4C8i+CiT/i+Gun3C1uxaqDOYUaITvFM=;
        b=H8TZJ+ygEdRK51QY+YkGOFMfGSdsryx9YeLeGIUQj3Mjt3R2rw4A4fIOei7U2dLoCD
         8OXSAOgj2zynrqnaIp6vZCg8jIbu/o/6b04tSSiw4XU0GOuZepMrOycTsYzbgDMCucKQ
         sQmVyED+PbPUwptnCCK8NhT15MegOQrRp421Bbm1ODbfu3F/oXQXUKRUFPjPPhpQf0xk
         1DMdyf0DKsnCkCKfM7HPJ5HBFTUHCZVRc274IIQdPqvuCep0v9zElPuzZVY/1OTll7mY
         vMHwRvHc32ImkpTsH71vUrnQeLHrYZ5Xh69iTl/Z68FsnoqvnyO8T/s8SE5vnBgmoU3Z
         UW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756940109; x=1757544909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7SdCGQ3OtPL4C8i+CiT/i+Gun3C1uxaqDOYUaITvFM=;
        b=Pj9oH1DKO/6nTKSO7dBSSP4XV4ApH8C+c3B0K1wzmdoLKL99izl9Mulw6+w/lt98QH
         5yTBiuDy5ASZSKO//JGXLYR/mT5HTk9ny7JKabXbA752KNyze1tvJlTAhh7Yl5xDu3E9
         Z0XT6awDH2H3g/b+afqPOVmWjIMdPbOKLB0yAsWb9CzGrkJgedcYaFzTALkxMGazAjbt
         WBe7fYpp3NUEK3ObkR1iaa4r1rXA0RkkO36jZVmQhcQBG5/ZBF5EF2Hi5sDvZavkNOV5
         138pI2pDUXySOyUSyuEi8UbfsNWwo0lYhZwfRolfYrGSLz2sSwXeRk/j+lytAUZlGiGU
         Bzag==
X-Forwarded-Encrypted: i=1; AJvYcCURqZYj5UJG4ovg91+FZ768u64KtAKmOFu1zdJZL7oMnP+iYhHxNF3bEntnOtXc7ohBHgr3IgAbT1oihaXari4w@lists.infradead.org, AJvYcCVwx9QoFK8W2geoj5gTS/V1mAMxJuzguD0+a3PJCnhi25h4DqWfpkwnxMnVvrY8U1gVhDF2CO2RZ+JnjpI1mC4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLNXuH8WzkbBEZUHGL2W3DBdskS2ihpUAELWRDPNlUNys7eWpL
	UO+llbYzcd/kh3wE/VTPliRbaqRxyJcVVIA4zHHFIFMK1xLUhbAgDn7A
X-Gm-Gg: ASbGncs24PpvIPEwRtCMqEXZ6dNxNCcCaFpTTRhWs6FmLkCglBHOt7mqMR30YB3XH0r
	Zejg+nQs2SCgdl6Cmg/eqWcS6C3cDDs3N+Z8dHdj/YN9F5r0f6T/+ebkfSHLwisOIKgAAbcW/cX
	gdAq9C6m6PaO61Gu7edeHkncjGsUz3/E6EFlkxLop+/6xMBfHICUMS2a/084vpeSpj82dXmtDEa
	UJusk45sPuXE81y54gL92JV1y+438LxgokuwW60udcfXckP1P0BasZxdJmo9ClF5JElmGMgawdI
	m/KQS9I+MUewDWDsdjzrWXOwizYGhUaDRgUTVw36M0lZzz1MRD/v3hTztt0wlZ8i8yKGHIVPQOi
	GHydNsj60fua4J3uhH01yVpWJ3nFvsTgHt1BdNHK0tD9JAUQgduwdGJTajyy5BZqNvv7aPeI9Nl
	evNgyQ4b8Cpg==
X-Google-Smtp-Source: AGHT+IEhFktIMvpmJbrvjWFLTT5A3+FgRNJriwkj5RePnhU8700uH0+euhIJE/haVIpx1TPUCmOLqw==
X-Received: by 2002:a17:902:e848:b0:246:a90e:9179 with SMTP id d9443c01a7336-24944ab7df2mr226213595ad.28.1756940108651;
        Wed, 03 Sep 2025 15:55:08 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com. [34.125.3.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24a92f897d8sm131162215ad.24.2025.09.03.15.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 15:55:08 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 0/2] drm/panthor: initial mt8196 support
Date: Wed,  3 Sep 2025 15:55:02 -0700
Message-ID: <20250903225504.542268-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_155509_940656_F21C3F33 
X-CRM114-Status: GOOD (  13.38  )
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

MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
support recently. But the soc also requires custom ASN hash to be
enabled. This series introduces panthor_soc_data for per-soc data and
uses it to enable custom ASN hash on MT8196.

The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
be cleaned up and upstreamed separately.

This initial support also lacks support for some hw configs. On some
configs, panthor is expected to query a mask from efuse to mask out
unavailable shader cores from ptdev->gpu_info.shader_present. This
requires extending panthor_soc_data with a callback to read the mask.

This is an RFC because the dependent drivers are not ready yet. But I
would like to gather opinions on having panthor_soc_data for
soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
soc-specific code.

[1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54b32872c59cf5c77779

Chia-I Wu (2):
  dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
  drm/panthor: add initial mt8196 support

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
 drivers/gpu/drm/panthor/Kconfig               |  6 +++++
 drivers/gpu/drm/panthor/Makefile              |  2 ++
 drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h      |  4 +++
 drivers/gpu/drm/panthor/panthor_drv.c         |  4 +++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 26 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
 drivers/gpu/drm/panthor/panthor_soc.h         | 26 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_soc_mt8196.c  |  9 +++++++
 10 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_soc.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_soc_mt8196.c

-- 
2.51.0.338.gd7d06c2dae-goog


