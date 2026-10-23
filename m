Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78080606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MCS2x2Jo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ffqrxkz2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m6NACu8GwCde3sJ9HWwodKjqPsu0GwIqcYBIIRb4XxU=; b=MCS2x2JoJbpELD8+LV5gPUZ4/q
	mTIGjF3vgXobTMUwek7qPLgL+U6MWFRAj74PJqOE7vnBxXkkKRP/OpIdI9MKlUiBf+NZmiGFaqyJj
	7QD6F9QuTT7z3IVPoHjMFiKx+2i7DGnjTsXwGVT2UHzumX5Jt2HN6z0qlZVQ8PZ62cH837dFasw9Y
	iktd/R5PBLG114mMwLaVWBOtpqn8qFDW2TL5SiDhST/CAv9bWPC4//AzOnmkFEuODBwYHAKstpY76
	TpxTl5Lv8Ggwe9/PGINuVaoNtp/HSeWPCTaptXlgIIWhC6roD4dSGBlS60774QwnqrPDXWeMGXNlS
	UT+S7vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5D-0000000Fo9k-3jcT;
	Fri, 23 Oct 2026 07:52:59 +0000
Received: from mail-dl2-x0a.google.com ([2607:f8b0:4864:38::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5C-0000000Fo92-06s9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:52:59 +0000
Received: by mail-dl2-x0a.google.com with SMTP id a92af1059eb24-175ec8c4efeso16396c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741977; x=1793346777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6NACu8GwCde3sJ9HWwodKjqPsu0GwIqcYBIIRb4XxU=;
        b=Ffqrxkz2hseCPRApamMOU2vgMpPTzeF84kaxM/bGUhxclwfkT1S6rKGXE6bvuCS5Us
         zC4Sw6xNXSiLTD70WAppxajxqgVG+3J4j2MQqUWN+aof1k6OZAV8J/itAac0dT47A5I9
         WgbTRBleDownFDeSZ9YZixcNJrFKQOmJga6+sQA4puDCLIpgjgcbFwjNb7VJZOvi8Ybc
         WHSk5GfmHhlT4akyM7Z+40CgUC00bH4XDxwLdE/r2wFl26Pe1TpM5dultvZkVT8tMW6K
         2YdyjTitDNPcoZ3mC883DIsBSWNhP7YF7UhxhPcIkuthnYFP6RoiNw6woiDjiUhzoomL
         kZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741977; x=1793346777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6NACu8GwCde3sJ9HWwodKjqPsu0GwIqcYBIIRb4XxU=;
        b=NNxu0RF+NHj7vUxsSLSTj6BQ8W2RZ4VwDpDX3XRtGL3KnaXCEMnbUM7vwe/lhRQPHI
         VB3kFLL71a7Nlh60b6zcc9nunHsNkM5hNIgU0tnfk24QACEx3IkXfYE33PIwpub+1WzI
         eyjiHA26rHXNH2+R2RPhCDwiRAGxLrrVf0Bdp223wzx0M4N2FBbZu1ZJ+uiXV+9PpWWr
         Q5eQLty1m7donQGgcciJS5qWjxV0h9oikkrlzr7JwPeZXKnBGH3MFTQUv+YrKhN550na
         IThdnJgWly6351FcwhJsKcJDTeku+3xBPiYStauBLhXw6VvwiHE0xLIdMN/8g6fXWs5E
         y4nA==
X-Forwarded-Encrypted: i=1; AKwUvBy42OU2WB+uJbnhFPwF/1fbr9luBD6Dzs8Rfh5KEpf48amHtdgbTTsSC1LfLJKn3m35bE0vLB3cZv8uwlwnCxjs@lists.infradead.org
X-Gm-Message-State: AFq9FYL44d/iYjlkbjyN/taSD9Rzj5rwlTAEhwhjC/0b+Kz5Epm5iHFR
	5BCQNwUDGjVpq4Ntpu2/UDCnKScN647uOrvf/3mEqNALsmkgIUp96EgW
X-Gm-Gg: AYBFou3AOoS0gCXqUU/cqg9CB12df++7wtaUTfoT92Yc/mpegsXHK5nMGmtdt6Xg49I
	CoMO2taJS2VOrkb7aZSl0p23jNnnHmWSRdRzOkkpErqvADx8ZJRHvLQqldvb4w8T+OKmtL1rePg
	80lS7a8Gjc0OfdOtsuyGckfR2voju6CLEznrRIjcKrIbUF4nBAcUd67PyZtnu4cyxQwaj1SEcOa
	p+Wbn777VlW8z8ewbVK8R8pBXmWo1wGGeZEPuA1mCfp/Gmu4p6YbDu2HAk5+uTrs317Q/yZzBiM
	2SBVb4PCqlK7vpqhirRBwti3isGkSX7Td7TZMJDqrbOR7oc6g6iWvHUxyjO4XSPRO7MnIkrMj4t
	haPMnWeYHUsrAOJwzksB13WUQqBeoqFoh7ksP/r8yh4HGLGoW9ktPdZEcjido55wMxhTvp9m6Pw
	0kyohed8Bj62vbJxG8VI3k1oNkVo/DOTxqVa7aAGBHctLUyBk1/pXyrE0V8K/3zCNE7UyrRFPhe
	0GyFdptyjgJ2b1w0VDk24KKyHp4CdRniqNP0VM/2HBgLPyWf4dNeg==
X-Received: by 2002:a05:701b:2302:b0:143:2968:564c with SMTP id a92af1059eb24-195c627d93fmr1822085c88.26.1792741976804;
        Fri, 23 Oct 2026 00:52:56 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:52:56 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/4] net: pcs: xpcs: fix runtime PM and clock lifecycle
Date: Fri, 23 Oct 2026 15:52:11 +0800
Message-ID: <20261023075214.1793922-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005258_067641_F40844FD 
X-CRM114-Status: GOOD (  19.82  )
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

This series fixes the runtime PM and CSR clock lifecycle in the DW XPCS
platform driver, a misleading error message in the Rockchip glue driver,
and the MAINTAINERS coverage for the platform driver and its binding.

The issue was found while using pcs-xpcs-plat.c as a reference for the
Rockchip XPCS glue driver (pcs-xpcs-rk.c). On Rockchip the CSR clock
(PCLK_XPCS) is required for register access, which exposed two problems
in the generic platform driver:

  - it calls pm_runtime_set_active() before runtime PM is enabled and
    before the clock is prepared/enabled, so a later suspend tries to
    disable a clock that was never enabled;

  - with CONFIG_PM disabled, the runtime resume path is compiled out
    and the CSR clock is never enabled at all.

Patch 1 fixes the initial runtime PM status and registers a devm action
that force-suspends the device on teardown, so the clock does not leak
when the driver is removed while runtime-active.

Patch 2 handles !CONFIG_PM builds by preparing/enabling the CSR clock
manually and disabling it in the cleanup action. It also switches to
RUNTIME_PM_OPS() and pm_ptr(), which are no-ops when CONFIG_PM is
enabled, so that the runtime callbacks stay referenced and .pm is NULL
in !CONFIG_PM builds. Because the CSR clock is optional and both cases
are handled in the driver, Kconfig is left untouched and no PM
dependency is added.

Patch 3 rewords the cleanup action error message in the Rockchip glue
driver, which was merged into mainline today and currently mentions only
the EEE clock even though the action also tears down runtime PM.

Patch 4 lists pcs-xpcs-plat.c and its DT binding under the DW XPCS
entry. pcs-xpcs-plat.c currently only matches the ETHERNET PHY LIBRARY
entry, and the binding is only matched by the generic DT and networking
rules, so the entry does not cover the whole driver.

No upstream platform currently enables pcs-xpcs-plat with a real CSR
clock dependency, so neither runtime issue is reachable in mainline
today. Because of that, no Fixes: or Cc: stable tags are included, as
discussed in the v1 thread.

The patches touch code that is already in mainline: the platform driver
has been there since f6bb3e9d98c2, and the Rockchip glue driver was
merged today. They are fixes to existing code, not new drivers or new
features.

Changes in v2:
  - drop Fixes: and Cc: stable, and state in the commit messages that
    no upstream platform can trigger the issue;
  - add a note on Kconfig: the CSR clock is optional, so there is no
    need to select or depend on PM for all platforms;
  - add a fix for the Rockchip glue driver error message;
  - add MAINTAINERS coverage for pcs-xpcs-plat.c and its binding.

Thread v1: https://lore.kernel.org/all/20260704214808.1566710-1-coiaprant@gmail.com/
---
Coia Prant (4):
  net: pcs: xpcs-plat: fix runtime PM initialization
  net: pcs: xpcs-plat: fix clock lifecycle for !CONFIG_PM builds
  net: pcs: xpcs-rk: fix cleanup action error message
  MAINTAINERS: list DW XPCS platform driver and binding under XPCS entry

 MAINTAINERS                     |  2 ++
 drivers/net/pcs/pcs-xpcs-plat.c | 62 ++++++++++++++++++++++++++++-----
 drivers/net/pcs/pcs-xpcs-rk.c   |  2 +-
 3 files changed, 56 insertions(+), 10 deletions(-)

-- 
2.47.3


