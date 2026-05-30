Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11161CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T+c+usL06YdXGQD2wlM+jbeU/8sQ6SgTc25rVC+XGKE=; b=cmUknKOm9+9ut4L3aMOcfUUk5m
	Vsbjw2+l/k2F6op5yQ7QgDHjcDsZE8PtRSTkpb0lnk9Tl2mkeaD8WBHg8DUMyJApxWo4lkn+h4e5r
	2reH1f7n0DKKS6BoBKO1F16ShKjiX10c6LbtKxXsikGCMsc3X4cbdWwAODmbekhYT4RVO/Mdh6oBS
	K07N0L6lKzqD5TJR/QETqbJx9BtF/ZjRNzkRW6xlvOvqHyJxDX3WKxmAoLgWWWDwgYqK2+oeLEFiM
	cS0Nvq5NdWowT3FVpMwyD+ylwPDQsz8odQj/6FStFB69OAjbTqOixbyLQZSPKbsf7hpg4LM/8vV+t
	Qidy800w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPPv-000000091aY-18xD;
	Sat, 30 May 2026 19:32:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPPt-000000091aR-34VI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 19:32:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D95CF60126
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 19:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955811F00893;
	Sat, 30 May 2026 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780169536;
	bh=T+c+usL06YdXGQD2wlM+jbeU/8sQ6SgTc25rVC+XGKE=;
	h=From:To:Cc:Subject:Date;
	b=E1kx1UDBsEyG0XFs/Q3PX6AwKj8ignz71omvZRF+hA9TjOKkPxrK7tKyvkFmEnPse
	 CDMu7zfqQs7t21pJdv4pw6cPofVq1918ccFP2vQNvuD7irR3GaKzDpM5mYNl+w0QlS
	 ph6dcH83Pdvg6PXTBGra/QLexXerrW6x+Z3rUvK5ECgdGGGmAwy3Ij+p60LYrHge/q
	 +LIoDtEc91PUP55pG5nmh2VgeY7hw7HDgdtUl6RzObMe0OQmfli2WnkMagaOJQ5CDM
	 4hwBt9OkjPTPiCwTD0+gJiz3K8Fw7r+KjWT5r3NFqbMF1DKJ5qijbPoYSGYk6gCnpl
	 c1e5ZP1dyv5dQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: fix for v7.1
Date: Sat, 30 May 2026 14:32:13 -0500
Message-ID: <20260530193213.158229-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.1

for you to fetch changes up to 63838c323924fe4a78b2323bd45aa1030f72ca60:

  ARM: socfpga: Fix OF node refcount leak in SMP setup (2026-05-26 09:53:20 -0500)

----------------------------------------------------------------
SoCFPGA dts fix for v7.1
- Fix OF node refcount leak

----------------------------------------------------------------
Yuho Choi (1):
      ARM: socfpga: Fix OF node refcount leak in SMP setup

 arch/arm/mach-socfpga/platsmp.c | 1 +
 1 file changed, 1 insertion(+)

