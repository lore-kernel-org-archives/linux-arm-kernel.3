Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E692F3D5FB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAHpgXQGoIDfPZ1wMNYzasLiJZgdYcOnZokpJLwLjA8=; b=S/WlBFTH7bFH5yCynNPXP2P+Cm
	fRRgWG7rQHDZjSuXJjlyVRL+HBO+rzyi1s7ljQ9yMUCWr2BoJlOZtj117gnhfYZZKIHMVMrZAZK5l
	/mjF1du39N8Ri2c8k4+LvGZyrEqlPY/J6CUHIa+7hYMWrFpwl3ywWH2lg8+xJwsxbmGnwvIZUIKgR
	uYtzxinYOuvc0lxp5v7HL/kJkiITrw9+3piO08nGiUaa3FdXbHJlBAAJYrOYo9EeVvj8iKcOPwPkc
	/hacL/3qM9/zzaWW2tl3oOvZ59IkSuOjaGFJysUpSS/2fxtmzFWJRXGlwnif/4wK6uussMPqugO4L
	EdqF/fuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn4-0000000A313-1DE0;
	Sun, 29 Mar 2026 15:11:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn2-0000000A30L-3Ky4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDB73600CB;
	Sun, 29 Mar 2026 15:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78735C116C6;
	Sun, 29 Mar 2026 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797058;
	bh=kFoVyTMkyFn4pbXMTMOvST6cf5WTQ/PPBbZDBHunAIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3YmLtxdwDDgWlDbmWBKnqV4hnQyybEDJMveoOKUIqNFkYFC3nqXvRHGTuiR7nofh
	 VRQGWpFLEjdVgrVUfqXQfB1NV/a41GVmTmHB54w8+MCK4RE439Q37M1OKI4KT6GrFn
	 DgvEDEJGLy64D5mPOPczZ/aNdrFLFlW2EX+H2ztm+SQIYdjt0ulCXu6/mSx3ZRoM9A
	 0Fe7eoxknTOU8udloLkBUSQO6ZjH6OrQfXWIAYLYVIrbMGOeoq0FhzxiKkOJxjYRZG
	 JfmD2nMPoHNJ6qVR75MXR+fYNau3ERP/809Q1gmuOeUF/ow8GrDA4ffDKZTL2Ylx4O
	 zHb2ia9AX0B2g==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] firmware: tegra: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:40 +0200
Message-ID: <20260329151045.1443133-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-firmware

for you to fetch changes up to e68d494b8946e9060e60427f365107194f90ba0d:

  soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP (2026-03-27 16:30:54 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v7.1-rc1

This introduces a new API for the BPMP to be pass along a specifier from
DT when getting a reference from a phandle. This is used to reference
specific instances of the PCI controller on Tegra264. The ABI header for
BPMP is updated to the latest version and BPMP APIs now use the more
intuitive ENODEV instead of the non SUSV4 ENOTSUPP error code for stub
implementations.

----------------------------------------------------------------
Thierry Reding (4):
      firmware: tegra: bpmp: Rename Tegra239 to Tegra238
      soc/tegra: Update BPMP ABI header
      firmware: tegra: bpmp: Add tegra_bpmp_get_with_id() function
      soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP

 drivers/firmware/tegra/bpmp.c |   34 +
 include/soc/tegra/bpmp-abi.h  | 4573 +++++++++++++++++++++++++++++++++--------
 include/soc/tegra/bpmp.h      |   20 +-
 3 files changed, 3725 insertions(+), 902 deletions(-)

