Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A4C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fRntsYs4E9fYKlkmoCACm9WTNuzTjissMMGr/xymIOY=; b=yXff0QhPzUs4NK2oEegkQyxhqO
	q0CfqZg0FIOKjT52Ok1o4N8AgiWc4nnhVp1ovZeaWCRq9XEj0NoczKDserbSGlZ4I4owufYpdEfiC
	D8XNM3eU9HBxodY/voP+k2zbRq9+k2sW4SM4RUtkBvJtvolhn/BenT5etVZ87p8TySPM7inL6nZ2N
	l8guxgVhIDes5/MqLABgJ7AGqt/5ITSZi0ZqVTo3i82Z9+hhyUEpA8NAcbDNg/Ujhyjs/BRKglIBO
	XoWPZqV8wd9KVbeGOfB7enJua8rGoLNDebwVnU2k5BMcs94PSCmjRNR7l2VyTnbD6WpnTrZn47iKj
	3w1Ij5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xbu-000000011nH-2EeP;
	Mon, 21 Sep 2026 06:34:42 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xbp-000000011km-23rd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:34:41 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2db18fe459dso14916845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789972476; x=1790577276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fRntsYs4E9fYKlkmoCACm9WTNuzTjissMMGr/xymIOY=;
        b=H+W3UZCkpplKtALmoi9QwsarRoserzEQi2Jx6GhAnkvhtGwGmRdYRuI2Ep9lWku67u
         OK3FTOGUvuRtAJpqX+3QgImydae/JU6ZujM/HF6FZen9COEFqHQmNbE9GCkuGvdI63qV
         VUFkagTEgLidb93hGgOstMoqKrTPSVY+fcdCrGpnkJYSjRo+A9a/2czSUi184hFFqzX7
         JygXEFl1MHUELMqu84fyMnQm6DrfOsf7bjtl6hzj8BV3wkxCL1mOYM5L8y8Qud0rnJHC
         feLIBvp/aiSh4TWGX1Z4LVnJaRUSZqUg7pw+4CdYzSVx7eWhPF9ZqIkRyEieVxphEaox
         B4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972476; x=1790577276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRntsYs4E9fYKlkmoCACm9WTNuzTjissMMGr/xymIOY=;
        b=JavhpSftYUfirskIs45wABodR/M7/eXEBuhCDetJ6d6+GZbqod8sZ/aFDrbbRIN44s
         hIlRpavrBUtKOM+4vSxUbcx5CU5CuuvZtAi1623GCvODvdlPbpJf96BGCyN8b/M3Ndc5
         kMF3uaNvBy84We5CXdFNVy+gECzlBZqFuJYALc1ZlNMy0ogZ5cgTjtjzS0W0U1t8JxAs
         3UHLwHhMx7ZBYWQBXEzkVOeUIl0N1lQxQelJjBn3J9yJsaGrg/y+ulH44XyL9CVHOYwP
         bXepEMIpzmmndZx0ufTDgraxMJ4uxY9c318JiSGPzAAGaQTereFzVldouht9FBP1zEMd
         n62Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvpbHHqD5SJVWBYPsgrbBhEuxDJKms6XFzo2WyT/z1fi2A9/l3wuIJkMVJkiH2AKAlIcrIO0ZK8tIKc2cV35GL@lists.infradead.org
X-Gm-Message-State: AFuF++kXjI70tUsqi1K/Su0HPnNCDbxFmzJvo/vFTdsE8TjQbuZvUMeg
	BmzCN/omJjHoaqRn1u7EF4PCkrh0+yWlkbAPfBXPxWzb7j1TCuv55ltq
X-Gm-Gg: AYBFou1Ag5OVbsCV0o3SvLsPjaz58p4WvgQWEhZwt52sbcPgl0CSNA4/FAtKyXGdfdJ
	ainQuLBLiDQVhGKQU8328+bk+Dljn8DHhf4sSPhGjlDdTdo2lu+pihjDmODl0s+kBEjuzImAmRE
	wnE83CT+WGD2t+MEptp4RV4oWqi9J9dYKSwevVqafHN+w0moqIT4kRx5A/NegBmvSBKIxw/3FlG
	lIiiz2UfZs/aMCrG09TWJ23eNFoaVC1EIyIHGG3QD94f54q6rrFs5eYsL6Hj5TR5jvkCdZg9aE+
	/hleVCm+EIvIqnOrpuuzxb9Dm3nEWvwT3kdXLARG0j10fKe1VeTmTRPQVNG4ep0GBm0pzs8yKsv
	Nn++Bd9HZzlHtjpTZoJDQr3geHp16Qa4HevUjh+5AZfn+2BzVmhA9ITY59wFO9o56NvNtLvyHVe
	pFIlKRKHmZmcBwXR91Wb3PKOcoXt2SbwBwX97C1XOuOt8oyp4G/4O3+BZU4QEWevifUOoklXkRx
	DZKASeUZFU=
X-Received: by 2002:a17:903:1107:b0:2dd:c100:4b7e with SMTP id d9443c01a7336-2ddc1005f33mr91679605ad.53.1789972476407;
        Sun, 20 Sep 2026 23:34:36 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm28173565ad.39.2026.09.20.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:34:36 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: dts: rockchip: fix audio on Firefly-RK3399
Date: Mon, 21 Sep 2026 14:34:27 +0800
Message-ID: <20260921063431.103-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233438_273772_6A8D1FBB 
X-CRM114-Status: GOOD (  14.60  )
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

This supersedes my earlier two-patch series [1].

Patch 1/2 there dropped the &i2s0 override outright. That is wrong: the
i2s0 pin groups also list GPIO4_A0, which carries SCLK_I2S_8CH_OUT, the
codec MCLK. Dropping the override unmuxes that pin and leaves analog
audio dead. I have asked for that series to be dropped. The HDMI patch
depended on it, so it is not resent on its own but as 3/3 here.

1/3 is independent of the other two and fixes a separate bug: the GPIO
that gates the headphone output is muxed by the board file but never
claimed or driven, so the jack has never worked with a mainline kernel.

2/3 and 3/3 have to stay in this order; 3/3 needs the pl330 channels
that 2/3 frees.

Changes in v2:
- 1/3 is new: model the headphone output enable GPIO as a
  simple-audio-amplifier aux device, the way rk3399-roc-pc-plus.dts
  does.
- 2/3 replaces the old 1/2. It now splits GPIO4_A0 into its own pinctrl
  group and gives it to i2s1 before disabling i2s0, instead of just
  removing the override.
- 3/3 is the old 2/2, unchanged apart from the commit message.

Tested on a Firefly-RK3399 running 6.18. What was not done: the patched
tree was not built as a full kernel, and the DTS was compiled and the
resulting DTB inspected instead; the changes were exercised on the board
through an equivalent DTB rather than a kernel built from this tree. I
have no schematic for the board, so 1/3 relies on measurement rather
than on knowing what the GPIO switches.

[1] https://lore.kernel.org/all/20260903082713.192-1-yaozhonguwl@gmail.com/

Yaozhong Li (3):
  arm64: dts: rockchip: fix analog headphone output on rk3399-firefly
  arm64: dts: rockchip: disable unused i2s0 on rk3399-firefly
  arm64: dts: rockchip: enable HDMI audio on rk3399-firefly

 .../boot/dts/rockchip/rk3399-firefly.dts      | 36 +++++++++++++------
 1 file changed, 26 insertions(+), 10 deletions(-)

-- 
2.55.0.windows.3


