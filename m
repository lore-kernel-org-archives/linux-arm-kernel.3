Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22923C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uhSvoJH0XX/OfBAupLeB811heAkQkGDo05cZmoEr3E4=; b=trVaHqby1FFler3TmY6auMfGDq
	gJksnEZzTkAtMaBW6desWDzGR8Ez5b1bfPUFkxzXQ7gugJoaUCKP4X+yjxHTBDDEytDCn4UTgwcWA
	R/Ufuz+38wzTomg3UQzokfbaO+dzSa4IJsgXOnl6jdwl+gE6EIWFWZeAJuMW3Zjk3QWXveboCpFl5
	7jRvGhzhmgilstNtCpWEahUysgAoA1mdICbRUb6MyIsSMFgLaZFmgB4t1MTtwYX64O60A4foYdt4z
	7Mzff//6jZ1Mf8evBX9eDmkCuv6yNZz7uZCTkz86/hmhQksyJB/SD6oyhRgCFfu8Sa/2qJzajisuQ
	7wYBER6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGxZ-0000000HM8z-3sUF;
	Sun, 06 Jul 2025 04:26:37 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvC-0000000HLgO-0Y3L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74931666cbcso1796759b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775849; x=1752380649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhSvoJH0XX/OfBAupLeB811heAkQkGDo05cZmoEr3E4=;
        b=bgeIkOvFoMQQJ5ZD8JdhWlBXlDITESmgB/+ppjvg08Bl/thvK5ZDSH/RyI898IQIJu
         mgbIOfvE6v2QbfiDTffmarZeYHxtyAwVFN7aDN+pB4/R97CO8I9z13JiwiMaWtFVN6G3
         9oSp1lOB8gJk6+1bz5029nyTfPNV06IJZR5lnY3cn188h+tyhEVtwxaLnEaLML6/uBYw
         DPtSnzWAE8sZnM2XRIeOStzjaxP5YGn8nfbAP6/gUuTN+RBTsMjWSrJT3Y4B8FhKQghT
         lqkM7zcxhEzRSnAyPaKGf4FVE5pZtFe+nbIEB7EL6IVqQcO6j87bBcm088+o+kZ1LAnY
         9K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775849; x=1752380649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhSvoJH0XX/OfBAupLeB811heAkQkGDo05cZmoEr3E4=;
        b=OHNdGxC0t7hghwdKHsa6SbOmk0M6loky7Ik235KhpIKDKSmoTAnIJ4u7OFIEJ9Yy9R
         /hz9MZq4QUrUaUpyxkQSpYiiH2Tp/vbgUMQ6fgheC/4sny1I5MaHMqDuch0CWQHwVV8l
         tooobC+r7TOY59Bgz0d+PRvC1vP6nuFUSwGXUcZdpsKDFzR2i0RbW1L9l2iXftWb9dtq
         dW8s/jVP5q08GuPq8vd93hcRQtj1BdnzHIayOQB3U4vdXXZrAGtnSEvrOjT/M0vxkdnl
         UwZjJIRD++Eifo19vwfiKdA9Q7css8LB8BiTbyHqaj3yha8fRUlB3TqSWw5emIgEF3gb
         7GJA==
X-Forwarded-Encrypted: i=1; AJvYcCXLQkiycN07IZdqMCl6X591beXpMrE4yaCNJexbnBeBxB1hBcwmeEmXLQf7IFB06VhpKeyCZQEtyImevwcM30Gg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw71C5XR4chOKQ8k+/+SkPHPhrnunvIat9C4orFPl/NILbGS4+u
	c/jS0OyoaCeRNkvpRvKP5vGwr8bH7zdQNoZyEqPhbCwXp81w8Xfm8I5e
X-Gm-Gg: ASbGnctmvtlBEchSMYPB5lpQgx4jmkqApeTZxmVuXr5KHxXFkacn4eGZwO6O0byJYD4
	WPT8riw6WRBkVWMFlAVnykByt9wIdo8Aqic9+5qCZr7GZAJfraNx/2osiLIAxh6jQjEFXImqOFq
	xsBsgxQY+vA0t4SRj2mvmc17R+Q3uJXplj1XY9iYTvLazpQWCMW/Hze+Ek2IKPyK+8XnuioKV89
	PnpCalLzZX20kf+Fcq/jl/9VSX97YpcklhIUyItBYkGXiaIwMd9qeKFdTMf17NwgPNJufyEADFH
	2dR2t+toMLk5iDk1Vox4ye0qxqHXBuyksSfrfez3RIuCK2oTWlu5/3yA3SUDqSK/S/IjnS3t8uI
	ouW0PLVYjmfRCBa71BY7e3BWs4XOdbWb+GXC5Yuk=
X-Google-Smtp-Source: AGHT+IGtzwJ3JG9jDZq93UShLC20pA1tuJ1i6r+Xx5nA8auWyQabjh+hUgo+LzZaEIr56LDORbmPzw==
X-Received: by 2002:a05:6a00:2315:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74cf6fb8a8emr6019500b3a.19.1751775849273;
        Sat, 05 Jul 2025 21:24:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:08 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 0/9] ARM: dts: aspeed: Add Meta Darwin dts
Date: Sat,  5 Jul 2025 21:23:50 -0700
Message-ID: <20250706042404.138128-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212410_177735_DDB401D8 
X-CRM114-Status: GOOD (  12.07  )
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

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introduces the initial device tree for Meta/Facebook
Darwin AST2600 BMC.

Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
ast2600-facebook-netbmc-common.dtsi.

Patches #4, #5 and #6 introduces a new BMC flash layout to be used by
wedge400 and fuji (and later more Meta Network BMC platforms).

Patch #7 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
each BMC platform because eMMC was removed from future Meta Network BMC
platforms.

Patches #8 and #9 adds Meta Darwin BMC and updates devicetree bindings.

Tao Ren (9):
  ARM: dts: aspeed: wedge400: Fix DTB warnings
  ARM: dts: aspeed: fuji: Fix DTB warnings
  ARM: dts: aspeed: Fix DTB warnings in
    ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
  ARM: dts: aspeed: wedge400: Extend data0 partition to 64MB
  ARM: dts: aspeed: Move flash layout out of Facebook netbmc-common.dtsi
  ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
  dt-bindings: arm: aspeed: add Facebook Darwin board
  ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 78 +++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-elbert.dts | 18 +++++
 .../dts/aspeed/aspeed-bmc-facebook-fuji.dts   | 24 ++++--
 .../aspeed/aspeed-bmc-facebook-wedge400.dts   |  8 +-
 .../ast2600-facebook-netbmc-common.dtsi       | 24 ++----
 .../facebook-bmc-flash-layout-128-data64.dtsi | 60 ++++++++++++++
 8 files changed, 187 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

-- 
2.47.1


