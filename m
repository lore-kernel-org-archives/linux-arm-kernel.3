Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F297606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ddG7LugC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hu6NJJBY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=; b=ddG7LugCtz0bp7OqGVWr9QNLc9
	QjHCMBbVvQowXjjA6QPlfv40YuTz91KfefLu0L1gyDzODvtfQdDZ5aaytI2bpt1I3A3FuG5Mc0+wN
	CfqTBfPk0gB0Y2tZ9T3MUA1REzU1kzmn9+6OYNvNUldqGWm2gCLYnLmi3cKn2QZPO7F8EHKqeMGu1
	tDbgZ6tbeuh2vnHdYUlkg26X+hY+O0+1qRT1xOrIkQne0POTS25Y47vG5BLuzxMysPno9xjnEGqY5
	f24BAV6CJipR9NhyBnRiW/lRJnUPbsUSw5lRSB740owlY77fAmKUuthCGlq1GuyqtYvxoUBkUsqCA
	k2f9d5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kE-0000000FNIh-18dK;
	Fri, 23 Oct 2026 03:15:02 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kA-0000000FNHQ-1Qf6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 03:15:00 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-8470d7d430fso147955a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725297; x=1793330097; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=hu6NJJBYhtLYqosHiC26FUfTgPESvgJU09Xx9tOJRN3hOwuekr1J1qJel6tiAJbjmF
         cOWnyQnfPCrfoT1YMXN3KSGPxUzHmF+WJPANc+giCfRGOraZ9ZJzEaCSMheX9tp5cD4S
         sGWYtd5VxRkTSuo8cdk91MUMCyX+YBZxZqQ6gW3H3cwjPmnQxOoXEsVyaoeJ5Baogpfi
         xSOMFwC9v9VJIM++uAFBh94LMMdjjqKQalHYB/Af74fr1v8cgDXDoITmfJTuOpTdTH1v
         9p1tNlt6/c8joLM4DJsSyThL2Kc9xLj3I7WIPTgqbeREtUlK1IsB+sCPemBdGJXQa8mx
         B+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725297; x=1793330097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=HGIv1FNfpijgZeKYLpAC83qx94V/zmpMzn+Lz4mKW5Kv0r5lUi4VLvqRF6fWfEtTZt
         14z+6Ax5KoAQGsxIDn0iQuN8FGzkg3pA2xYIYN3GcPfq/Gm2Byhw8KGApz5O73GvnX/S
         6rEMVIOmMtwWFHp0Y2LuL7f1DorsY7PzpAOEYdJG88C86ZWBS9xn3LBr+JFDuSWp/6ov
         pJi9kNQz5/MSLBLOibsJpx4QLUdo3yyk0sgKK8wB/IEIE4739W6FVGKRgwtuwdrdcLoz
         HabgTL95JdGlNKVKuQQh2YUtubyUwgXC3XPYhpgd2pPEDTvkauDIur/QonwKNHcSQGNl
         Yhyw==
X-Forwarded-Encrypted: i=1; AKwUvBxfkEbHpPYiz8OboSsryT4G7v4xcv5m3YvaGXotGn5oMDO7HF/rfW9lOoWRLWCuS9ioSh7yAqrjgquIY0UMkUN2@lists.infradead.org
X-Gm-Message-State: AFq9FYIbK8OkWVlEiCaXb4C+Ksiu67wQaHA0u6EOOOHoDXps5MerxN6o
	E2MWqveJNIFU1zyoN24DM17qBOuOrTutewbT/f2fRbIGAvuvs7uAiN4a
X-Gm-Gg: AYBFou3smkc2wlVR9ONlEJkZ1c1hMQ3d/xO4FZkuuVdwGxPmymSnG6pk8Rtod3rd3ss
	q4Hu71TIyTZPB0i5e1dNWGT7WWdLyX2Xx4emRTOn3jycw4N3GTa/XmckamYv9zSlOdmp+F2me7E
	PTrs65yrTyzM05qUjWZHrEBCFJW2OxVygdl0bH8WcD8nXK23nQIi9OgcLkZtq554kIfXF4SBz5a
	tfxP4rDD6Rb+DLPJRgfAADyKvJqftBEEgP0SeqsXx5kNBmUVC3qKeP8tluLHmWx4tkT+s+zNQZa
	MjPShJGSMuvMFsDWxSG6EEbzRR7IuiUeeEDGEH67PuAiglTrZ0ez/cBcjkDqrKkm6tEBQP7I7MO
	APQ7hdJ5wwZu1KfQ2KhPybShocd/k/rD0vCyQiyN7JRCV52RO8aXPmZ3iyvUpx42fBP9aYHb167
	fJNi/vkHhWym9V5pJ6snvwxRJAgNKpNarwVd29FFLD5ylm0XXflSl2qNxm/YawElBzdtoUUZ840
	oXrV8IEIOETlyI9DWulXwCjx6qfVTsSgXLPNMheqk0IEJ9GsdQW4W6hRd64RdfuZaJC8C+bzU7A
	4W6MAUdzoQTe++RoOqTJXeFhIsYv/T8k2zizgddXnaktUCvXlrdt16K54kNJEE+6KD6gnfxYgUz
	oIC8eiku98a4aAck+KpsUYwLMZkZIUkx3Ti4mH+gxf3RCS/zEE3AJj8OFyhUc/xpC3dITU8K8zH
	Gtdog=
X-Received: by 2002:a05:6830:412a:b0:821:94d2:83cd with SMTP id 46e09a7af769-84fafc689dfmr760717a34.9.1792725297222;
        Thu, 22 Oct 2026 20:14:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Thu, 22 Oct 2026 21:14:51 -0600
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WQy2oDMQxFf2XwugY/ZNnOr5QsbFlqXDrTdmYSA
 iH/XrfpJitxQfccoZvaeO28qcN0Uytf+tY/lxHsy6ToVJY31r2NrJxxaI1zejvXue9jLNh1m4v
 +6MJ7n1kvfN31xergyduQBBJYNThfK0u//jlej488IO9M+y/4f2Pl7/OQ7481VcvGmj7noTpMR
 SQwlhiFMJdIkI0DBAwZTLMJnGuR0D9kZafTuPkwNfQ5AUSEWIpptRoT6uA0wloyMoJjKQmfW4K
 RrKSWWmZjgQiDESd+YBKiA2/I1xjrcysF51JMTYCpgQxVJGl+vMz6kBm5hlQsizre7z+Uy8BEc
 wEAAA==
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
X-CRM114-CacheID: sfid-20261022_201458_387969_B64D272E 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
The remaining patches establish the ownership locking, pause bookkeeping,
callback retirement and per-descriptor cyclic state in that order.

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
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 153 ++++++++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 64 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


