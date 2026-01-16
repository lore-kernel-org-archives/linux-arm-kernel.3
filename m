Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1C2D47CD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD3cJI77oDAVpO2sxDq8xYpdJ7xdu1XPSlpOJ/tCeT0=; b=jvaTkSMDFmo+GjWxGq0Q92d6VR
	eKor/EVOJ+5rEsin5viXDR4mMjTtakSw1lMjL1JQvffhMkVJAOoNZhudp8YVgafQANL9ejM2kiO+E
	XE51dRuUaibJoDgnQmGBiuzY8zWClyTc5c3LgLd4FGxHNuiogxXol5osZwMw9YPKHB+4FdkZvr89u
	rZNWl3BLD2AvuVgdgcQKbFnbGHnfH5K4mJyvO2dLeO0mo+9YPUwy8qNdODDQbz3DfL1nY0kqGGP5g
	7mat+wfxuQOL9+f8ZeP2X/u7BAKeijvTFycHPvUA7AVI4oBELz+weVJ2DAgkXEz11sX9IhidZBSOS
	ZI3fktsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghPT-0000000DzMA-10Yb;
	Fri, 16 Jan 2026 10:50:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghPR-0000000DzLK-1L2K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7342E601D9;
	Fri, 16 Jan 2026 10:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A538C19423;
	Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.20
Date: Fri, 16 Jan 2026 11:50:17 +0100
Message-ID: <cover.1768559767.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768559762.git.geert+renesas@glider.be>
References: <cover.1768559762.git.geert+renesas@glider.be>
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1

for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:

  dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.20

  - Document the RZ/N1 GPIO Interrupt Multiplexer.

----------------------------------------------------------------
Herve Codina (Schneider Electric) (1):
      dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer

 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml       | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml

