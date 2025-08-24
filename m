Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=; b=K3vme1UnV9eLahm+kaSJjUKvru
	ZOxtXekT5BhALwQ++c5A/9UNIZlZ41uC7d+gGajRSJ25h/LZZ9kYIYZLX+A63x+VftsLtnzT1vhan
	0xS+MEjbWXxond1yxf2L4EPzxO9zEcebXOTDHC36pYZCofuggWRhR6dMAgj06/D91imsD0eofTqBX
	L58EwB2EABxPB8Uug7mvF4FTD0hePTWETi2gIekR7ml9pm11UZSHoGbUwIkX5ogH09oycSJF02Ot6
	RsFbc6cYQ9rg3yTmumIlOQAQW2dA2zk7ge9eZaGXRKhInvy8uR3c4nGgyTNEmLcQ+3QZXc9MSvpmU
	PgCq+szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq42Z-00000005lNY-2THn;
	Sun, 24 Aug 2025 06:17:19 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq3zt-00000005l5J-3QME
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 06:14:36 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-770d7dafacdso53391b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016073; x=1756620873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=MNMgUyMLBGrN0GQv6tAC8WdQiufGgsInzVB+br83xlJWUB/MKYZMXGcsJYPCXoBMi3
         AziQKtS6sgib3W0ACSHKreWQ9Ln1GaGEWUH+7IqSOjFsPaHYOxQfTFD0cy78Hs4SGMCC
         cK0Lt2ia+V7p/geIG/GR3zJNur/dC+JwOpsnNS7IgSu2tGmzyjCu+gpa0cnlejwcA5pu
         gVxcITPXRJ8EOkEjc1+PSATKDEET759dctMMUmnZ0Mx0tqEVOqy3vwCq3NJwNu1ugWsr
         VzliOxFFBfjxkxZijiFVMq0MFA6fK9B+7Zu6FnuRGF9cpUsfqJVYNrw+xMsBYcyqSGjv
         W9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016073; x=1756620873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=AToPDLdNGgdCU79LoquhuYi/ik+xR72RsVTzsR2l+O7qG68IsOQ4k143SbfqbklX1e
         cajkEczTVagNX4Qp004wSmI8LWAxgBYiV2/eN4N4+BCjpL8GA9Pq3/+49zGr9YWBqnk0
         XaNJ0u1f+sDE+fn/WofewjPF1XSpDwDBN57dIdPxMXjm3X6+T6bdxi3fyWF7Jd3zgnIY
         8HOa9tHatOA+5hilUEFjixtbsYNr9mrzgDhy/ReBMTWd7zjt+vR2Xwp2KLBin87wXYC2
         DiBEU57Qg8VmL9q8cI54BBN0usd1dFVSloAZ/963MUEPJUMk7PPO7TL/9n3cEY2/qHCj
         wauw==
X-Gm-Message-State: AOJu0YxlzJKPMFWaow39bHYolUoySA5COuIdLKVdsDjBK1huxQQ2x87J
	7kRXqyPlOTwYva2qJUtpsbUaXOb0sNajvFZPzEtiZVv2KvxL+v5FM+6PoKH3LA==
X-Gm-Gg: ASbGnctN9b4iKB+85yhblKe80tg0z2doiFYxtljY2IQPCXxFo/NCmseqTOkphhmC9fY
	h6P5Vnu4lraw3dayiFOs2nqus65UJldyFMoLAsCVNxn8OLyR0S6EFM8ERR9unwjBvJGfWe9CcDL
	8opYWBFRO87fs/44NjJpJcWKJfCXKlskibg3oP2/Z6MDWKBzgP9O0qLEp9jtYeTcgUygPSl4b0n
	HoE0djpl3plEDnLcvOUi5XrhTneJBc4Ls4XNEkI2qxUOUs8UmHZ1Edk148bx8GQO6mr1yaGizDP
	wtJBEYN0VMXF/DK9dacMsv1Kl1/BEQcOK4qqPB12YYm5Zk8ZVWtLl1j5YqQHJcTSp/3riO2Wj5i
	shbtMHbKAhGVl1bo7md3rdfk3NEQ+yOvSh1c4xf2m2cZnbVTgCIet
X-Google-Smtp-Source: AGHT+IHTB0sh55lPsQjkIFNymMCMskciLiGeZrY5LBODEDl6ZzyrY2seKOgvSBVSBIbrFshQ1YI7Zw==
X-Received: by 2002:a05:6a20:6a10:b0:243:78a:82aa with SMTP id adf61e73a8af0-24340d5e73dmr12948421637.50.1756016072582;
        Sat, 23 Aug 2025 23:14:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:32 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Sat, 23 Aug 2025 23:13:59 -0700
Message-Id: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_231433_857509_B0481C87 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Hi all,

This small series makes cosmetic style cleanups in the arm64 kselftests
to improve readability and suppress checkpatch warnings. These changes
are purely cosmetic and do not affect functionality.

Changes in this series:
  * Suppress unnecessary checkpatch warning in a comment
  * Add parentheses around sizeof for clarity
  * Remove redundant blank line

---

Vivek Yadav (3):
  kselftest/arm64: Remove extra blank line
  kselftest/arm64: Supress warning and improve readability
  kselftest/arm64: Add parentheses around sizeof for clarity

 tools/testing/selftests/arm64/abi/hwcap.c       | 1 -
 tools/testing/selftests/arm64/bti/assembler.h   | 1 -
 tools/testing/selftests/arm64/fp/fp-ptrace.c    | 1 -
 tools/testing/selftests/arm64/fp/fp-stress.c    | 4 ++--
 tools/testing/selftests/arm64/fp/sve-ptrace.c   | 2 +-
 tools/testing/selftests/arm64/fp/vec-syscfg.c   | 1 -
 tools/testing/selftests/arm64/fp/zt-ptrace.c    | 1 -
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 1 -
 8 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.25.1


