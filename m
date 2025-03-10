Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA14C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0gVa+47vgpIskiaBk5o99cR3lWwJb6rgWAQDG1BpiA=; b=plG9eZEoHFwIdrI6xC9WM1/qZe
	rl6O9fV/RNFiuTI3jsgM5Ard+Yuua4URlFMPzeA8RKClqCBrc9XWqX7fhq772zfI2Zue3t3SBWsoG
	B08hoTaeezM8W7aGoQDALbfz4g1zXtIx8JX1iU2dVqkKmxwH/YvV9vbUUsmpVPxNfVTbVWi9nv3Ec
	KNlqQRQURux2q4oOhlhskCwQx4FqPWh9buUdKpPBYTwUsWRK5l3kr74zQseGdZHWMmUFUBOEETvhN
	4muH5G2JF/bWx5r4WGtitRwdiHuiwzOb5RGOFa6zM4YrErEifhtgkh1+7KxfoT4WZi008VR2+ens3
	v32ij/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trd9Y-00000002n7g-1i1c;
	Mon, 10 Mar 2025 13:26:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcEX-00000002cPG-0qTX;
	Mon, 10 Mar 2025 12:27:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso12840445e9.2;
        Mon, 10 Mar 2025 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741609667; x=1742214467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0gVa+47vgpIskiaBk5o99cR3lWwJb6rgWAQDG1BpiA=;
        b=erOWeGrvRCg6dSeLTTJnELlpnWX/i6Rm2kwosA8SjbL9X/W6LNnK/PiL2sjBhwUbEO
         gjAiOZb/TvCt6m9LGm9z4tC9f8yVIAMbmCufw7ODyTU5vPRaE1Du7ENM4QsMZYC+Nvv7
         FXGqFOfEESAntDUeWiFR7R8haSWIU+74HzlJuUrkXO+p9sSM8ElASCHY7N0tifbjvpKI
         KjNgxb2X9ATSgD1OC3kEiBDx327OzXr6DhRU2C5vh9dWcUKnur+Ilqi01Kp0owzzzXgB
         UwZsUamSC5D3as7f5DnvzdQLLuK11CHIrQJRcGM5cS/jxs7ByPjsDWaliZakPUfAApd5
         9z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609667; x=1742214467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0gVa+47vgpIskiaBk5o99cR3lWwJb6rgWAQDG1BpiA=;
        b=s5lLwUV5SS2nUXc6e3xBeu5zLE6ox8vkbOdtCOakJiYbpT8O+umimm6gH9WWUVau/6
         tgM8ogTqcwcYD+RDplqndssdjRpUKnfQy2mgEXjiIMH4z4CiyEDT2M5+pcoQadv5rFGS
         vrymsgrR+qlKx8Z+A2QMDVCHyR6sznKjGgzLYX9HheFMPKcUpYiltKUXVHMzuNV+yIf5
         /TOukbwQ2G8JxhJIZogPapALg+uXb79brnnrcP+EknZOBr4bc1ZxjiEbikGIYZ16a2mB
         WvK9mG1i9Cih5fbew8sMFe0k5gSOkSkCMPvT07DqX7tM+gCnxAzdoJ38CptfKi7SSZ6I
         l1PA==
X-Forwarded-Encrypted: i=1; AJvYcCXu9FouqZNfIYNXWDpD/YU7bS/TSWDscRl75tfcoL8/Nxot7/bmCarJBG1Q+aAmD54cIUBr0XKdek8IbqVXeWqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyRlC7JOmXvVwxAO/2WxH54opBNKmRxAV4kH19ot57y1daubV9I
	Fu6uxOBtvSOu6DfoLebFj/sb65rALMfOVa2tF35zODGEyKOCGUuE
X-Gm-Gg: ASbGnctxsebIlDRjRkXjAmCx21lD8upskVMl/QkqUKxe0IiTdmhfpXUG/FwwtTtJnB7
	Frav2oigCDXv30qHZsa1Y8PUuXcFSSD9wWDPmZXdcVdd9t9RyPtPcizFoXE5BuKYTPaeuTuc5v+
	/Qa9SNpQ8LtncMLt2tNRfgVBuLPDvXfDTO2jUV8FTVSgL/7NaYro13uJioYr18NWhuJBiTahhzz
	e4oQ8eLWp3V/0dShg2qOYHScY/ModUvLLktGl2LuO/qEEP/o3AL5iQENmDHgScucI1uDMs7RG1J
	Ei2Ufu6QfWiIkeIh/jYZlYqYo12FjsYJic80tuwNzaZWvdlv0NtLYdO2Wbmzh5nSLRrQRQWTlsO
	1t0yyXBo2unvNcJ6G2Wtipx8lxzk=
X-Google-Smtp-Source: AGHT+IHnfkFyUH7zwhO3UJXB4ON9kY20gf9Xj9a8RVVLTh0OxFR3WRoI6eW5/kVQ7doqUEWryYXkVw==
X-Received: by 2002:a05:600c:4e91:b0:43b:d116:6483 with SMTP id 5b1f17b1804b1-43c6021f13cmr85331995e9.27.1741609667099;
        Mon, 10 Mar 2025 05:27:47 -0700 (PDT)
Received: from eichest-laptop.toradex.int (85-195-230-40.fiber7.init7.net. [85.195.230.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm171963245e9.4.2025.03.10.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:27:46 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	hongxing.zhu@nxp.com,
	tharvey@gateworks.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Date: Mon, 10 Mar 2025 13:27:02 +0100
Message-ID: <20250310122745.34947-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052749_235490_33213F92 
X-CRM114-Status: UNSURE (   7.64  )
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

The imx8m-pcie PHY PLL fails to lock under certain conditions when
returning from suspend. This is resolved by asserting the PHY reset when
powering off the PHY during suspend. This ensures that the PHY is
properly reset when powering on again in resume.

Changes in v3:
- Update commit message of cleanup patch (Frank)
- Add Reviewd-by and Acked-by (Frank and Richard)

Changes in v2:
- Remove unnecessary check if perst is not null (Philipp)

Stefan Eichenberger (2):
  phy: freescale: imx8m-pcie: cleanup reset logic
  phy: freescale: imx8m-pcie: assert phy reset and perst in power off

 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.45.2


