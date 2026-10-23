Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5D60A2607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BH7YSlea;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZQ3+MG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=; b=BH7YSleawiJwgo1L4uhqM2iSNH
	RS1rGnZtN+CJCdGMkhPwHxQ6Jca9GsEmHxMrx6TlMxfxYdkh+UjqFCEBSEzJcEW3xp4SV9NrofMmw
	MWEA8nJcwPbodZyC+9TqGSI0awGc9l3j+n+rX8vDx1GruECiGfwmmkTTPYTLHuclqeRpYwWnGI1G3
	hkLdFr1DfPeZfNgX+JspzMP/UcPLU7iS9kJp/nHn+9dwK5aoZj7vhGdJ4gZBg3luP/NxuXtbBeS/p
	DlkuV9MqisyJuAH9gvoDbk9fMKSu56QQmqFB9CdZZrH/NcWBDiobFd53qia73JC7aZUByAnTFsU4H
	4iMcU6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqI-0000000HBHb-1Wer;
	Fri, 23 Oct 2026 23:38:34 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqG-0000000HBGq-0knz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:33 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-4a75171af39so512219fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798711; x=1793403511; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
        b=QZQ3+MG5H9Lc4KLzW+y61Ja0ClyuFos/uIoP94Ja/VZ3DxOIrVnQVWN9cKHg+hZvpd
         waXxctehUN2sPMPSm85xR1wWnqExrOUX90hEHx0O+CybbuMhEKeP0lpnZZznw/IKRFxt
         zPcf68TfI65yo0P7vDskWl35dyFcBhJc4elRqv68hPwR4cpmk0NMjVtitZEaEEf3qFjy
         g71nWAyHqs8edfxhai6iPGDJduJdK4d6+4SBRj0Rd6lUN4iWnVS/3k/MjWTdDQAC5BI7
         xRlqT3vcd0R3nk2oZh/OdkvyeoMhxgUk7YqJGrNi9eOVQJ+Ny7SUbl0Htz9zgmCbZFWn
         TqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798711; x=1793403511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
        b=AVkpWrwvpf8p+HObNnVXHai2gCYSCwWG8+VyGTyj8VwyB9EJQGMVrXoOTWgyb8nrro
         GG0ekwMq0f0HpbUvz5CI4yPCFX/aoo1G6Q2LYy9ZcjuSOyPU3DFpGvNOpWkv/ZAmV3l0
         d1e/y/30wy6OPuI9q6jgBVg+G3DVyGlkpZN55I6oTyrd35UabSlRn3ETlMhxz1T3LOTh
         sEjmrJQwhC4zZVo4t5KCL52JdvTHEC06vCIr0txxcvhRbbaEJjH/6uHv0QT5+S7mk1U5
         Rv5lL4l1Bbr61m7QtLwcL7J83ek3v70646fgYL7DXZVfVFdJLi7s+7AW5rX+JAM3xOJI
         l8RA==
X-Forwarded-Encrypted: i=1; AKwUvBxlV+7w+eq6o1GihCIQfVmb958pFF1+wt0Ybzd4RDeXKixY7gcg4fAZbbcOqJ7+3YG5UK9Yft/EvgzaYemaBFG/@lists.infradead.org
X-Gm-Message-State: AFq9FYJDDjX/b26GOhfnBnXj+0SxhMduxXwpdy3BDUc3rKYtZg75FXrZ
	kRV5dR0+//IQEbPsE6mL+dTkz5/KlA7c+4yR6NFBgHDXH/rdc9buf18P
X-Gm-Gg: AYBFou09SztjnP4BMXVbXYAth5CgExwEbjRj/1ETmUIP2t8GJ6hmlpd3AgUOoK1Qmmw
	MDnA7C1pluVjYnJp0PE25GoEmPksycQGytPbzrYVzdVVWziBPVuHIZdpweiUEkYxgMc477fBdOa
	Wxe6DXmivCIiFzKrjmcaFxt6sYg7ky9frSB7ZPwmX8XvH0qYcgLI/aEBCf+Y2eWjB5HRW1IOP+0
	/+P5Cx8ALN2tzD7uKayJH6YIT8LUNMMJfgCj49czlullYs/mRlP6R8B5Q0d3wKN0GEoIqj4/C94
	Lp518ksJrhUs+mqApE+FdeOxE+6zstQhx9E+qIpoRmF34+ZBnvjXNYBo0GB+9iMC69qlcfotgj7
	hS1tVnSD+8B+Fti/H370T5IlFOuKNma9AlwvBBPbCAUd4HkFX43y8Vta6Qeq2xBKk2F/AwHfezM
	GcuUqOLWdga4dfzZXRR6aZrkXOu+XLzVevd6BWOsU+3Hc/dthidJsCUks8H+gSYGc45ZaWTPD3i
	SaouW1E2Fq/K4kjWVmOC3pfCfXTO6SEtkzxCfWDmrlpQqndf58yZ4bXp/idnzDqJRECZtKnvMSh
	gySQEMOjxbT4acbxzCkMCZI+HatefiRY1V8/DDX+TMdmVlylXT9nWsEimRKVn5quv00HOm5YcsV
	jXuBWXiY/qnaNKJz+oK057euhhi5J+tMe0yG/wKKC+sBBjxpPgW6TZyNM0UwhBg8pLEO3Dh+mMF
	fGb8cP
X-Received: by 2002:a05:6870:71c5:b0:494:a88e:3ec7 with SMTP id 586e51a60fabf-4a83f5ecc73mr613357fac.39.1792798711052;
        Fri, 23 Oct 2026 16:38:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/9] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 17:38:19 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQzW4CMQyEXwXtuany4zhZTn2PqofEsSFVd2l3F
 0SFePcG6AFurRQpGsn+xjOnbuap8tytV6du4kOd625swj2tOtqmccOqlqY7qy0aba2a93moS/t
 GrKoMSX1U4aUOrEY+LupglHfkjI8CEUzXOJ8TSz1ePV7fbrpB3pmWC/h3YuKvfTNfbmNdTjMr2
 g3Nar1KIp4xhSCEfQoEvbaAgL4HXUwEa0sgdDeztNC23bxeFXR9BAgIISVdctba58YphDn1yAi
 WJUV83BIMZCSWWHrWBojQa7HiGiYiWnCaXA4hP25Fb20MsQgwFZBmFUiKa5UZ53tGzj4mw9Jd8
 m/rvOym72vlB3ON+49229NKGx29YATq5WUzpPrx3Mq60g/2nuj+QrSNSC1uIALIEu+J5/P5ByH
 21fMkAgAA
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163832_616954_0161C9E7 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The ownership work is split into lock ordering, physical-channel locking,
completed-descriptor retirement and interrupt cleanup. Pause bookkeeping,
callback synchronization and per-descriptor cyclic state follow separately.

Based on DMAengine next at aff5e6a77fc6, which includes A733 support, with
the posted IRQ-safe locking fix [1], channel pause-bit fix [2], and the
virt-dma synchronization helper from [3] applied first. The synchronization
patch uses that shared helper for the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Split the ownership patch into four commits covering lock ordering,
  physical-channel locking, completed-descriptor retirement and interrupt
  cleanup, following Frank Li's review.
- Document why virt-dma still takes vc.lock independently of sdev->lock.
- Check pending interrupt status first in the per-bank loop condition.
- Link to v2: https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (8):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: take the device lock before the virtual channel lock
      dmaengine: sun6i: serialize physical channel ownership
      dmaengine: sun6i: detach completed descriptors before invoking callbacks
      dmaengine: sun6i: retire interrupt state before reusing physical channels
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 183 ++++++++++++++++++++++++++++--------------------
 1 file changed, 106 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


