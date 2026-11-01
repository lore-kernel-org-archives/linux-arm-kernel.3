Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32364606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ne3qhhwu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7Tr25R3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=; b=ne3qhhwuuSSBUJfv8sqYOeKB1T
	7subd5gbdi2mJq1E+reD34NctT4ZBLrsj1LCBnlEHSlJYOMzMSfwKZ88SlAGZsdkI1ReLoQT94TQi
	I6EODxmD+60N1FoiK/6Q5apxJ/eOJ46nSa1wSzVCcrbYEWgdbrNRiGkmHwF2RoBf4S/P8dNs7GdUg
	lkPhqaFS8DRPJMLxvFNrhs7AcjQxDOuM/ncrmEDm3FTuD0qoyrr6jIKNhKsI/CZ4Kvx1WSY0rz3iq
	w2Pz7gtI/J2g8GMOwWLeFFn+Q/8o9xnxHX/8OVRoZYHQVgQ3/LRd8+2UseUBlJfoVlvMbc4RPf6ja
	pM2Vz4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNSIW-0000000E4Lz-2DO3;
	Sun, 01 Nov 2026 09:56:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNSIT-0000000E4LG-2dPy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 09:56:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so3769745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793526974; x=1794131774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
        b=q7Tr25R3eKCLHyChv8XJqrzRIu3JxM59ORNFyOLE2JPitUiJ+kYBoY+0CW09gYCDS3
         CSjEnyMenFsapCzhrvLpY/+dsHYH3ewz8KMAc4aN/O7WC+UeD9g7k32oUyY6dou9x7yv
         HSKxG/NA9Wvo/T5D9mG3KYNRvdT+27rcgOJvKZMGskOohvBIgai/WBJfTlJ0DaIwJ5Ri
         v7SXiBKjuTGDVE+6mq1Gu+IBSbnd78Ccd1VOllCIxq5BzCAsY6NBNALzseLRL4h4QC5x
         9Ct5lTgzXjYVrwH6SD9zOYge7ikUi8eTQbIiyGOXVZDARVnVvVTM4qO0jGErjy/CbVvR
         5RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793526974; x=1794131774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NH5p8XFReWk5OnsBbt0kkc9aNsHf1J+jU8MERKjpPV8=;
        b=ntAVLNAbBRL7fICvN+AnqcpPLu1oVEIwWS3OyziJqp7Qzqy1JxisVk+ECj+3BFCef6
         HMxqvPVRqCCkB7jZY0eXcBI0r3sTzhIhi0Swho8wRksuC9SlHuMlnh6aebbeKJWtqC3j
         In+mOhxzBeaBOpaEY4gHrtJT5hcQ1oZJoIX2cZodrzu94ADfGABKvdXgODu7xPTGRlus
         HPj7pkakDEOCzz+cUeDhAGKERQj4Ou9231VbTCJxv6s5SHEjzRyleww9dWZxKlNA8DaN
         q7jMEx5ZjXDqaIRwsZ8jYMrI6v6/yEasHIKntlSfF/FdfjA7PSZ9/QPzcyEbzr09cNjq
         Xe4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNYYjCb+qq/Tcvxl/hfkEA0DDXiXpsBjqnk33ni1Utg3yx7MiZ45DwxCqAyZ9Lr/KCdHZq/nkHpuQdGf6i8jlt@lists.infradead.org
X-Gm-Message-State: AFq9FYLwl63BvFQTmRUwlDxP0Wua64q1Uq/XEDs4Hw8MhhiKMln5cZUJ
	JVVzIUEYz46gpbBGfCTRoZO+JUA+0cnT9BgIg5Gpzhbn0XfOPjQ6pA+o
X-Gm-Gg: AYBFou2xedyWWBx0RlChh0FcITyIRbieeZpAWwFk7hea376XxLy0rsmxUEH0BA0kpOh
	Y4kHK2uxfzW2K5q2K6G/mXiiMIfIdsxXeHxPymA8YOXI/ufAjQvUafzGHzndCmsL88XtXlX9AeN
	bvfDy3xkvn0S7ArSfpp1orRpAfG3uGTY+g+ZVpHR55385WUW1Gy5EIZUT7jq5V1Lvo0K8GVzxYF
	lzK6ow9NhDpfVMGk9xT0tC1l0kM6kwwZw6un2ZpD7qU3rnSQ91sdJQO3d+KMW9bdt96D8kYfq4k
	08skdGnhT12+rA8Pofmi35ooDafJ83RYCdYmc2uyzJAL1GA98tHqboTJCOI0hM3aAbZ07oWAKJ5
	y0m5AIsODzL77XXvswjnpUCWVhONgksOnVZ7Fev47s3n7jCSDjf74SLAKVidyR0NQ7mXSwpQJGf
	Zf1ZXvq2YEvQgnmG3PdUdr1hdr3o64mRDy95SYBY82xk7o+WqEL+XHsQxTaHwj9hby7xAu7AwKb
	+R76zvDvBWy7/wsB0Cmwu9DzgFpgQ1Sj2UL25JlQhbJwl7ZttdEtOyGRWvtux5vIvmgslew8Guz
	WIGZUymQ3iTC2PLI7aQ5G/Wy
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr174291005e9.21.1793526973501;
        Sun, 01 Nov 2026 01:56:13 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm179893505e9.8.2026.11.01.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:56:13 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] clocksource/drivers/timer-mediatek: Fix "no-cfi indirect call" warning
Date: Sun,  1 Nov 2026 10:55:31 +0100
Message-ID: <20261101095538.1046918-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_015617_765655_9ADDC27A 
X-CRM114-Status: GOOD (  12.48  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After converting the driver to OF probing, kernel-test-robot reported the
following new warning:

vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!

This occurs because of_device_get_match_data() returns NULL when
CONFIG_OF is disabled, which results in LLVM dropping the kCFI setup
since it knows that there is no valid target for this call. Adding a
check for a NULL timer_init avoids the warning and it makes the probe
more robust since of_device_get_match_data() could return NULL even
when CONFIG_OF=y.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..e772f5fe8742 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -353,6 +353,9 @@ static int mtk_timer_probe(struct platform_device *pdev)
 	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
+	if (!timer_init)
+		return -ENODEV;
+
 	return timer_init(pdev);
 }
 
-- 
2.43.0


