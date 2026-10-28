Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1D60A5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z665kbaz;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OkWs7cdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=; b=z665kbazGGW/QXbgzYRiPQ1fXL
	MCh7w2uMe8iasinbGRl6O2GhJ7AuFEDh06OjwgWpz+sj7v+eEVY2cv0C0tstkHQkLHjQJ4No+qzIm
	nwzFvGkAKmob1Xdtc/sW5mo8MVyhNNIk9GfsH9AVgfdRFNHcT+pagNsMIPYdODVN4QWuWxxb4bAQU
	lPgCfU1xEFtdXN4JidtONlldbBDpy7MeTQc0XPFnUb6irg5SO84iTTWOyfWaUsGVJPDeQTLyJQUP8
	LuEmlOjlUiC7msBG87oADtvAgN6Zlivof+4AFDuxHXXr4upC3QMDfN1Yox0o8Uwgzfb7QDKLiqrOL
	C5Tsv3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AX-00000007UNY-2q79;
	Wed, 28 Oct 2026 16:06:29 +0000
Received: from mail-wm2-x06.google.com ([2a00:1450:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AV-00000007UM5-0WcS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:28 +0000
Received: by mail-wm2-x06.google.com with SMTP id 5b1f17b1804b1-4a77811be24so6931665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203584; x=1793808384; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
        b=OkWs7cdNnNMp9TjHdhZhNlO7Nd0QdIcNDlhHdzcRzL6803bpzfMsB9uuMxDghdH6cg
         GGFpaWWkFOc8cyXCvGK51pzgAYUSgg6w5pK7WWEzUgkodHQqS6oRwOl0hzt/iENM8u+n
         UB1SCyovZjDJO/Iw9z6HUogiHm62jfUg9DiSWIAESHWmJf9e3oHm092Fv9NScQ9P4ThZ
         kd0BFVx+hRDKpq4nOWtfmEGaqOf3IgVkuUAfiedts843pkeCctKVrNqOyuUIBFqM8ePI
         QkDekhy8bbTGXQAdrb60a7bHhO9DeSU8Qdaa+BYWnnPnpXI2gzU7nDppdAmGtS7MfYvI
         zDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203584; x=1793808384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
        b=puAgMyemuHH2NnvqoKIVQQw1ptwgDSrZt5IvLrtm55E49100CtYKI4PUw8GzCkBpli
         ec8AzcSzAHsVNBkAENjM6diNfMv0XJM7XfWk0MZb5jF3tp8B5iAbMvNl2vXj4/LCVog/
         BMAI+qP+lqst2P2sMwDNMd2iMiHZcKUaohRmAqzq/YG1OQ2Bg52Ll5U/ktrGWoUXolAV
         VMasw0CgLEhi50KmXVGh5CKiJGdnAuh+lusCdjKkyCXLD88Hi/rKo563zreKl7tRiwLy
         NJgztA9Hrb344kTRaMBlJpy7l5zw1f8JnK+bIcJfScV2yMvPfLFkWAFh5F5Ri7cawQvS
         Uc4g==
X-Forwarded-Encrypted: i=1; AKwUvBz9GVqmDClak7PL+KW7Cp3RhIoU0BZt0TPFOWtGjFFrX5OFxiKEXdiMRim4ZGxGWaESlLVmrr0VR6ITzPemQcal@lists.infradead.org
X-Gm-Message-State: AFq9FYIeM1ZCI1tDa1APn+WCIl+C7IVfN6liYxyjUOyTtwx8Cljq2MyN
	Zx+TXM8vf6cfhjm5YQOHcPCt0UP8yXI+XIOQ8IvW7zdVmi6YnzhrXF9Vy++QG9O3LP4=
X-Gm-Gg: AYBFou2VklcLz++hWJoUC9sSQK4GgfWDXhd2S0Bwgp6D/DC8q3pkfS8qN8AxaPSdYKs
	Js+sgHY0VzYERqRgnBtuLfubn2EXC7cVfZLBBB7FdxHsoS2U4mb60iOOO1DcyFSDAQQnwkWKvB3
	d9rsnL/6lPp8SaAY2+EMqDqdZ/HiyQ8PeaiFdraVXzpV/Z1OZ+7iORrixhUfWM5o6asoxns6Ebz
	GZ85+rrX9qoBJTiJtCm2Y1WhIMnXA/uZbpGC0Vk8mz9TOrTsqp49IXcQrmLewtKFdU2aN8JFZez
	e4aRbBQnzIgCY87EqzBPT4q5jb32NQTEK+9ilvIJvISboV8OPuC6tX5xJ3+yhQ8vUgB0FOk/cfd
	GE832zX66/SVdmRO9CoEuI5ahPiH+a2oXdfiHIs67cNP96/sJfxL0QC4chzZFG6P0fZVnp3Omep
	b5PGqx2TaMzBoVr3tSEpdl1Q7apRF7PTqf5qsNMofzb7cPcDiTBKSJ8Xxr/0BDYo6Yf+10wDXbg
	C5HHwdWgT+aiVC3ld8uiMBFHPFzXJmQgDDTmhcHHscLk2HPNsVv0KEMdWKATGGrtQV/AnFyI/QH
	wlStAFvFvPZDt84LvPt+I9IML4+k1xrwGt0FvxnMHHVhy/oEWwwL31d2oKyi/+IcQR/qkjztAyC
	n3wYjjeuMU7SMjdHqXxPVfjYUWQE=
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr66989745e9.15.1793203583947;
        Wed, 28 Oct 2026 09:06:23 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:23 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v2 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Date: Wed, 28 Oct 2026 17:06:01 +0100
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V07ZhOgVpd+R+GBZQB6qMlbSUaw
 r9bMC5dnuTec2YWyBsK7JTNzNNkgnE2gdhlTA+17QlMm5gJLiRyLGGsox6AbtH5EtqHQqmgjQF
 E0eSlVhyPnWTpPXrqzGszX6ovh2dzJR1X3boYTEiS95aecN39KvJvZULg0BSaci7wwIU6342tv
 ds737NqWZYP2kByONEAAAA=
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2377;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=KPWUh12AlBMdTgY4W9Vvurzty1N3jd/W9TyN0OVcNqk=;
 b=jpFHpzmJ+Cs/Ugc/qNMlaeTbGp1SvOlBHHccwaTTgEAOwYwXAs/JkeskmNRK2Vi0n1/UsSoTt
 DbD9bv6fgUtDCFT+bcF24gpHTQ8QDlVsw8iFEUuBvKbSIFJmGbjIMuk
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090627_207285_4F2EE4AA 
X-CRM114-Status: GOOD (  11.71  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Clocks: Correct sysclk5 frequency definition in DT.
- Storage (MMC): Update MMC node settings.
- USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Tested NAND on DM8168-EVM, seems the pinmuxing is working fine.
GPMC_WAIT is left with the pull-down enabled where a pull-up would be
preferable, and GPMC_WPn is not muxed (reset default). Neither causes a
functional problem.

Changes in v2:
- Removed useless "Prevent USB being put into idle" patch.
- Dropped "Match up capability flags for USB" patch.
- Refactored USB node patch to use ti-sysc instead of usb_otg_hs.
- Added "Remove hwmod code for USB" patch to complete the ti-sysc
  porting.
- Using DT include instead of dt-bindings header, dropped patch.
- Link to v1: https://patch.msgid.link/20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org

---
Andrew Goodbody (6):
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Correct speed for sysclk5
      ARM: dts: omap: dm816x: Update USB node
      ARM: dts: omap: dm816x: Remove hwmod code for USB
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (2):
      ARM: dts: omap: dm816x: Add specific pinctrl config defines
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts     | 17 +++---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h   | 20 +++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi        | 81 +++++++++++++++++++---------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c   | 21 --------
 5 files changed, 83 insertions(+), 58 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>


