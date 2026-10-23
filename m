Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F790606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p+JpENJu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/oMxZwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=; b=p+JpENJuaXO+aw+cERh3YmE79p
	7tDvn7PVHHNDjvaWpMwyxkwOFqW/CcJKHgOKiC2TyONX+twg84X2SVk9W+Bsd4XM6K1VBTLzGjBHA
	jrVFNX2//s9ZeO6pS2Ov9SVETdffbSVHQwkW8dC+kaOnIDjkv0xwiiCnw8qkWFcJx9T6Kl0Bd/TuJ
	3bgXBK55iEJWxPB0MstpJE5zppx01RUCyDunUS+fcfDuJCLSlSw6oA89ZWX1+oaNR1fej4q1gH7J1
	FS6yBDNBCMd2Ow9nQ6lQu5M8cWSGJaoiFWQsegyXDQ6Ik5U+5WXM9G4/RXHxTkE5qYvBMWzEjtf/b
	ns1UWTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE8-0000000GnUD-3yL7;
	Fri, 23 Oct 2026 18:42:52 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKDz-0000000GnQZ-1wOV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:45 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-845788309b4so591061a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780962; x=1793385762; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=I/oMxZwHUjpDmavJ4NxW8q1O2/k5JV4pdKQXY5CAXjfKBYMy1jtEaIG2pWo1MN4mtl
         NAL+nnbYjYlvZlobZpccpNNzkIhKiW6yXUTAYmKJH0uNHNKYJFP1ZK1zEaY3Odfb6DNd
         9Cz3KkDIoB9ruyyYIbPamO0hbw+qIrjApwole/vFkE5fAjSAMRiTIrLF8OxDCxzMTa94
         +agECpRNPVU7gEpCzSUIU3Uc8xlelUW6l5o9PweIKQ6+hbWsE3u9Rv918s4wbzKDwn/e
         Gel7EkVnFOgeCNKGM7gQgbvx0dqHd8Jx1ZrSFl7h6f0gZ/Iz/0wsZ1L6BSIKghqWqfWv
         xH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780962; x=1793385762;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=1O4YJTt+E6HMDo4AySuoenpB2h+e6QxbddH9ATiUbloVIO6t5Uxdye3DelAfut1ZeA
         wJ/vAU1wJhJH5hje3YFuSjxmJyfu3tz7JXdCWL2nuLiV3hicX1jeL/Mk4FrqXw7T+Yto
         yOQvB8Rr/cn39/oQVdjUz3358S4UyR7puZ363QOgtuYXoPfWtcN70YwX3qziveeb4sq0
         4XJlvUB9xyHCz5ps8yiXHASdFieQ7VOBGIWDDKPMv5kxCm3OnI4I0rkbRFOcKgeJdPVC
         yRGGDOqkobh2EGKayKMQisginq94jGNsRqdnTerN9Nbp7tIu7IZlxFejcfRr+WdEf9Pa
         KrJg==
X-Forwarded-Encrypted: i=1; AKwUvBxGBlwAGmis3soNG8mugdBFPhWz+wD73/kZ0CaIV+C60iNcCif2+9WIOJbhEY5dQtmPNvfgDasXJ42gaXASUIyP@lists.infradead.org
X-Gm-Message-State: AFq9FYJyKNcTbOCMW8/czFgMA+1Rb0eur2ZxHcqRGWsj+s7/7su/tnQP
	e+OkqfEbkAokVBXJZkMdqo5KGPqFl3sLJz/3dS2uxao0iNHQAMiLC0JT
X-Gm-Gg: AYBFou2faHyBvRuwKBtEWFkkYdP3sD4GUGDaBvcW9XWGrKb3IeC5lDrJ5crKlsvtEWH
	MA+J4fuB/yQKcj+sEGK1K9tRVYMttHuM0fsPgH33jmjvQ9kfH0JL1etV8IktrTTCRUFjKkLzuQe
	Je1dUkptW+UtYCESZKdPtobKZ9kLrEc8UR9aKabq+ihLzODfEySkzWvCmoxMWY6PWI/5Ec2jZzF
	GA/7F4nZL3dIeqNa5tLvjtCfFkWgbFWbjnthiZXDWQhC9B64e9CjYDMwD4aigISXKTwMPE6D9i5
	5+VVCIo60mFJNU4gaFM5J2heO4IXr9L1w/ABW/HZhTT73ZL+HWTj+Gv9Y92fP99Vn+XXCKvp3w6
	itzsAJeeCUv+wFrq0u2nHRT18LxkVrSge/bjmb3Q9vvB/rrxGIfGA9JP5peU76tnTpMUFVSm05X
	XQvwgteahX9nGLt2zqyKse1n1x8jRVu3Eu2aqbK1wKT+NypocjsSF00VxI54M2MtV3saZ5HV+Yq
	SlGK/0kBB5/GtcxLMo2ltiOd32tuiUuDdYA22irszaYM72nxjGQXgk/n5ZbkaLc4YhY1cybxP+G
	iRuLPsPfGvvZYA7Ot4ZmtDhDQbUkKCKTDYrh/DKxK5VkNN/4Y+wzgVlORScj3+fnVeM7lckSRIc
	dpnhaIRXI+DFZ3NpK9v64TyWJoe8Dc+0TjHYrIk/FVkbQ6Luzh+r6+C+ciQZIvuGzKn7lW5aQMN
	3g8w==
X-Received: by 2002:a05:6808:138c:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-55c00426714mr42788b6e.67.1792780962175;
        Fri, 23 Oct 2026 11:42:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 12:42:34 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQy24CMQxFf2WUdVPl4TgJq/5HxSIPG1J1hnZmQ
 FSIf2+AblhWsmRdyT7Xvhex0NxoEZvhImY6taUdpi7MyyDKPk07kq12LYwyqJUxcjnmsa29Tdh
 kHZP8bExrG0lOdF7lSUtni9UuMATQonO+ZuJ2vnu8bx+6Qz6orDfw38RM38duvj7GRE4LyXIYu
 9VmSMyOMHnPBWPyBaIygIAugqo6gDHVF7QPs7SWfb95M1S0MQB4BJ+Sqjkr5XLn1II5RSQEQ5w
 CPm8x+qI51FAjKQ2loFNs2HZMQDRgVbHZ+/y8FZwxwYfKQKUCdytfuNoembYuElJ2IWlicft/3
 5b1MP/cIz/p+7v/SLeXkkqr4BgDlMhvuzG1z9celther9dfuW0aOdIBAAA=
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
X-CRM114-CacheID: sfid-20261023_114243_612528_DED89EEE 
X-CRM114-Status: UNSURE (   9.65  )
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

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 180 +++++++++++++++++++++++++++---------------------
 1 file changed, 103 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


