Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9933ACA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRC7sv/ntCQli2SqA31OFgYH6Rektc4dv0GKEnAAlk8=; b=v+KuDEmGJD45Yq3XQPCG/Kym3n
	c8D/OB7+XNj4pNDEHdVolYM6YJbmVJHf+9rONLJnaMteJh6PA8XoMitDLmbKlduJBrJ4lpy3h/sgd
	7FXsZh76HP8VVt7rhtzpv1j7iqfYfo4s75nWSUvs/gikYhviwVSB3i9KbpCxemzd95nV3173eqWdx
	AirxXzgCkZfTqxrQB0FyaTSIf6hZY6r/GV6E+I+qdLS8eJmmpi3NnBxRTl+NOsDj8L1qXiRr5g1nV
	jvdObvXPcDJQOAKJ+R024WHZMUQfr5b2xRpptuTc5qxmtKDkNoNX4mW0gVw7TP9rTy/Bts01nxgjB
	Oj2S/dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWi-0000000DJdp-3nqK;
	Sat, 03 Oct 2026 09:59:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWg-0000000DJcb-2tHn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30A374016B;
	Sat,  3 Oct 2026 09:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5861F0089B;
	Sat,  3 Oct 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021570;
	bh=gRC7sv/ntCQli2SqA31OFgYH6Rektc4dv0GKEnAAlk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QiDaTlWZShXnzTqnNufBr7CVhLkaVn/W5gc40FBXeMD41bkT7g/JVWnfpA+BejnVA
	 vCZ2iiLmhMddzlIaAPMPs49P94sJD8M+gv7UAulJOgJ7Fkv2xINieVmZBWK3ndPQEG
	 ICtUlBTtUMzgrSgXZoYldW3gjeI5t781H9SJThJ/jp1emMz+GgWy0R2U8DfUKg0bLV
	 UIWzQK7g3mLVSPIYPSsam6etmH+hnxvSYm787f/UTm7q7iMLUxXaxR9J5PHAOmy4iZ
	 DtJUyIJIsfsslJaQZnynX8j0GUNm0x2fW0DmCMFWIMZC7j3vg1nl6fu2uyOazyKDZZ
	 81Lv74xgnG8KQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] ARM: Core changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:17 +0200
Message-ID: <20261003095924.1370238-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm-core

for you to fetch changes up to 7b6c372ee6f28435e9c793808933258dd9938bf0:

  ARM: tegra: Fix Trun -> Turn typo (2026-10-03 00:06:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: Core changes for v7.4-rc1

Not much to see here, just a single trivial typofix.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Fix Trun -> Turn typo

 arch/arm/mach-tegra/sleep.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

