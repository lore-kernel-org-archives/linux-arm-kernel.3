Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC5FD778BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cdvhFGrpLb0eX0ZIKo3tsTxvGo8f9JzZDSsQW3iE9P4=; b=ik7FbLE/F+L62gyCxEmgsunzg/
	fyoVfzjzYJdO1yzyEHIHAUTb7EYEOQCjNxLb9srly7Xc5BoFP+oQ8bl5A3br6BHGLC1s5LcrMCQMQ
	V0UyOIkZMvIyQ6Gx4hzt6BB4X2dDUUqFiHfTGQYQZ7OvD0jdULvsn3rWtGtQ9FRk2uEPkCj0UYg0g
	w2mnS44gCYC706ZjXWGWz/AkshIvU3F2RB7Vhv6JN0C73JAKxHB0dUvg757be/ffKQobU+OfHQLBl
	YUdH9URMwvOde75P/wDFXF7UxIpcfqx4vfNIxMzCQ3ESHMfUR/qHFh7c2KctjbCBdNLOjXrc4myqx
	9D0pvWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkBXl-0000000Bksb-05tK;
	Mon, 26 Jan 2026 01:37:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkBXi-0000000BksT-3qwi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 01:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2121C600C3;
	Mon, 26 Jan 2026 01:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36757C4CEF1;
	Mon, 26 Jan 2026 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769391443;
	bh=7pk/lskPODQz/Z9FXM3zs3HPJR4HlRI4IYSCBskmIb8=;
	h=Date:From:To:Cc:Subject:From;
	b=GUX4TorCIi1Jbbm7gM6u155i4pDxUjW/WiHj15Y5lGryS1TasqCwR7gZ4ZrPt7ANS
	 qTlzyxIMXMXBhKd2JFo/3Pz7SuvrneINNOHIih38ju9GrAcQ0QHLhjqJAaChiVa3YV
	 4WDn2cWRhmfD+7hyPttVt93dJBXz060fgWa29F9DWebevymdmm/cIxD5JjBVq6j+72
	 ruFx74IO9QrYj0jB8aO6sRinDXnjHclA+TbPRFc+Qa5CGE/hSsG3tYkkeqCTMC1a8H
	 v/Zp6vpjt4XM2MifZtdNX2O7tlKSc58AsCkr+2vEaOuvwAEjejYOI4IGPbHpKEjwDi
	 fRUt3T60l9cZg==
Date: Mon, 26 Jan 2026 09:37:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX MAINTAINERS changes for 6.20
Message-ID: <aXbFT9N4bZ22wxcb@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-maintainers-6.20

for you to fetch changes up to 473dd9ecb3fd139ffebd6f7a9f73fb73d85fe2aa:

  MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer (2026-01-26 09:24:50 +0800)

----------------------------------------------------------------
i.MX MAINTAINERS changes for 6.20:

- Shawn Guo steps down and Frank Li steps up as i.MX platform
  maintainer

----------------------------------------------------------------
Shawn Guo (1):
      MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer

 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

