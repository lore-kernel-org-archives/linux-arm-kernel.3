Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78128E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dBMHQYmMXJ7lB9Z4PaJ6sEfnNyaEfTGGCxqhDsBmvk=; b=NFJMNDcrg4Yce/ZMNfPHDuhUKi
	wZ/PVnxN3e3cbdIkihM8HO3grxI1XIIjnPBdGv9WiFFroTsRME6oxEAD9eD2jZ+cyfVjBOauzaaot
	jhcj2s/X4vZE2F6AXG9YSi/Mmn/A3/xp0fOipB562YPfAku8fQcQGQECVm7RxdgKvpFTMqt7lZKP9
	bC++t9ysIA4LJcvAP7zN2gJhR5rvgpyiTR+aO6g5v7ftuavF8UrP7NyScqZzGHeI6tWpCHee3Fj+x
	ZhEGEuh2wdrIOtBz1uoUGeM7HftUaYmuaAY9oOEsBCyPpl4dDJQHPbCOsmwcxMtyQooVvmgCfll2T
	82IscIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhyk-00000005q8h-1nKC;
	Fri, 20 Dec 2024 18:44:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhxa-00000005q0h-0pvX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B32515C681E;
	Fri, 20 Dec 2024 18:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3CCC4CECD;
	Fri, 20 Dec 2024 18:42:48 +0000 (UTC)
Date: Fri, 20 Dec 2024 18:42:46 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fix for 6.13-rc4
Message-ID: <Z2W6puapTlYMGeyx@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_104250_276954_A8D07DDA 
X-CRM114-Status: UNSURE (   7.31  )
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

Hi Linus,

That's hopefully the last pull request of the year - a minor sparse
warning fix for the recently merged GCS support (arm's shadow stack).
Thanks.

Merry Christmas!

The following changes since commit ce03573a1917532da06057da9f8e74a2ee9e2ac9:

  kselftest/arm64: abi: fix SVCR detection (2024-12-13 14:59:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 926e862058978a8f81872845715d67ad21c30f65:

  arm64/signal: Silence sparse warning storing GCSPR_EL0 (2024-12-20 14:12:04 +0000)

----------------------------------------------------------------
Fix a sparse warning in the arm64 signal code dealing with the user
shadow stack register, GCSPR_EL0.

----------------------------------------------------------------
Mark Brown (1):
      arm64/signal: Silence sparse warning storing GCSPR_EL0

 arch/arm64/kernel/signal.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

-- 
Catalin

