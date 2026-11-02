Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C76075293
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PAbpqkmH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krSPh2Dp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=; b=PAbpqkmHKhBczRXJWg9dgG7zri
	ZvKsGGoZUyCS9ZdIK04v3PVdbExj/xL6AHyBuOM4A5c9W7rizofUDYdhKh/4Rqo5g2ic3MvA9cSKg
	92tk09dBC2khPCKZcHwl+pOXj29ueS5FFBmN0Hmq00T0QDg7ZBm0ch4z+sJSkA0hleofwqOHBkH8W
	42yqPUxmmNzWs4vGwSemSHE78Imy9RkL86KjPebRXUjlMRKCutDZ0vAKS7D8201iaB2RcXzjbE+jr
	dbwJ1ZRa50k03kqQpYUlLgzcblZZKEOVmRfMu0xEXJkgNOcDyA3RNIviAqDCIE4K8z4EqOF2I5ID1
	KP9UHMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRI-0000000HO8K-3bPC;
	Mon, 02 Nov 2026 17:03:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRG-0000000HO6z-1Tkr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:19 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c40f29667e6so500384466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638994; x=1794243794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=krSPh2DpaL3K8LKH8nQmXdTewZuIXljowvyFZe3hqoeKF5m9uahKKsM4JMNqee5HnR
         KSqNEOVs13r0W8yYWutnrt5qFlVwpO+Xp2NCtP+AFf2eIsTkZpDqZDP8MeGZ3yVB7hu2
         aG/J0Uj5W5D1yOtBHz5gCna6Excw2BoyldVd0JUSoc31nJZj4oLIlQNApemTOhYJto5D
         zbIZmgKlAtZlxRfiV7/AZOPvgLAt5Va8qjCMJgaQTITGUHDEBBi1A2oPDCs1x0Foq9Bq
         Cl+3bNtGDa+q+DbbA0nMlFZkEWOSblr69b0T+4mT9+ghFDULygax+QO6xlAuFZ5z/w92
         p7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638994; x=1794243794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=z0e8i4CrTiZVzEyV+pwT661j/5wU2ZCu2sYg2qpQyhaezuGxnsdU6NvnOhq1Jxpv1u
         NJV5NYLUi6F0F8Sm7191SmRlcuDZhAplVMD0mXQ7Zb/qYniysBBTLA4a7HCcfQKnhv+q
         9KbW6TKdqSFTSrZ0+R+2cf8BjMSRCZKLrzsbRIKrcM/Kmh4G73X/lKCM8yXRdYa8YOts
         oNlXvqveOKNGdD96A6wrW2XZHU3JBkX59TG4Hiy+RNsStr/AcXFZv513yfxBNQGjFE9W
         RBo/v552etskhYy5FIR89Flj8NiREfz1ReyoiZv2wRDX4VeL62WJihIrK3EbYfgtSeGq
         ZJvg==
X-Forwarded-Encrypted: i=1; AKwUvBxCZ8wYWJzOh2Sue6s4U+/+I87Ad8yntGTiFnfTUy1TMg9ImQ5I93QmpRwNFmFP6XzrWmpTHgx5tObg8DJsLX4s@lists.infradead.org
X-Gm-Message-State: AFq9FYK/LB1Lo6u+AdbS+rfkb7fouJyHPj7GQXP8u8eqp3g7Pf2nvK/H
	QY/06I4MkRMN6VUf4uDX37MpwlG+h3dmrxQWalKSnODAFnKDOefBTUVa
X-Gm-Gg: AYBFou1aBpZjLuIy0RtIZjO4yV1bJowym20pcmxk0k0QB1GK1WctiFpQZZmlNir2LPX
	tC2tHcfimOt1JtLvegyIgQoQEXIGxr55yK6HeDpOqxBigkuiXgYWeJ0h0ABDVHQeubiCPKKRu2Q
	etkSFrXSZKlBAZOXFIgrsJc4TZTWDydMoY7kkoXs0dBfQbdaqDLUXo+rBNCFqsn3cZ51oBWk89b
	CD+iCwy9iw+l5WbwIU74vS9J26hf3FPaHqKJ2omyuxE8FMzebo+OQsyYPYNd2bt4LonhWhJYnmi
	dpirUluxKBGol9w1Rst6goBQEkBJnWuHm2Z76JjwaT+HOwvXVy752qRxEg6hvEsZqdfvRwRBE0f
	G/uQ8vJV94R4Cusfb0loCGAWTDwVTobFz/s1Uukm6U0IRNgKFWlXfQ4CYzUKjkhyl1BUIzmpk8A
	8HfdKONj7g7Uye3kkfhpq9+DhN/QBch3+6V7brQYBAxwGy+bgzVzHnl/Ah3mGu7nqgT2GCVdv7M
	uqocsndxlrFefYwapVoXJyH5yfYaXU6lQFQYaY+MpnBtylWQ7eO8cPEREGSSIhzi1TW60u1am9B
	OH5ifunM1JUL3rLjiSwRzF7G/4wMzxWh/rz17bjOEZhC4F14XqA+miJ0zZOczs0EUecXZMFHASj
	5h/bz8ofB1BZu232g8hmEoaYqZgkoTKLalQ5aovA5zZ256eZQGrusQd9RD0zD6sFVjxkAWVSzZR
	axV4Z29rF+sATyevhWGOxthiP6pwKNW/RtONUra8WeceBJF8NN7wqbEdrrztO93yRW4CWHF9Phw
	aeVTeo4+/CmU0koEouDJp/62PBPmjAnJ9oN66/jrITBVHSq3g==
X-Received: by 2002:a17:907:e8f:b0:c41:64c1:cc2d with SMTP id a640c23a62f3a-c4ca79353a4mr832997366b.2.1793638993799;
        Mon, 02 Nov 2026 09:03:13 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/10] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  2 Nov 2026 18:02:53 +0100
Message-ID: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090318_407907_32FEC362 
X-CRM114-Status: GOOD (  12.69  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-9 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 validate H.264/HEVC SPS and VP8 frame size against
  the hardware limits and allocated capture buffers, preventing memory
  overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8.

Patch 10 is new functionality: VP8 decoding of frames wider than 2048
pixels.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (10):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 60 +++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 15 ++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 40 +++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 ++++----
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 ++--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 72 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 66 ++++++++++++++++-
 10 files changed, 276 insertions(+), 47 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0


