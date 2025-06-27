Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D36C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODbKZdnsttZqdmiEMYAOhGxZ+Y4d/4LephYVQhpcRzw=; b=XGeoIKjIFlVCVQoYoCI33yT3MU
	rKnzhQgkKErSNWVRLWFvkmepHj8MHFluoupZuLFRctOrPp/QPAh7eZwy9jnJjkDSxPsUOdiGlzJbs
	pjXuNLZallxrAQ2g05tYN46m4PQnIYRzfC8AJ2pQb6yBfO67m1iImizkF/K+ojWqzC75qHuu1wZeB
	uL4gg0RZK7JO2Ww5rO2OkXCMcdhZgpcnVyXviuBS+DnLJnuxVH7N2A3h/6eRxNu2IYdhKJHo2aL07
	qQF+JrFawxFGaPg0lGJFT1ljUcG15EYMRU40JVvMzXgG0z56nNEJdj/nESTuiNpitPJDHMmvKcsSz
	HFsM81xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV90e-0000000El2T-1W5t;
	Fri, 27 Jun 2025 13:20:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8NZ-0000000EfKt-3VGh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46F5E6111F;
	Fri, 27 Jun 2025 12:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC489C4CEE3;
	Fri, 27 Jun 2025 12:40:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.17
Date: Fri, 27 Jun 2025 14:40:18 +0200
Message-ID: <cover.1751026663.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.17-tag1

for you to fetch changes up to 37c78e3a456fc754e6b9aa7d94365017a33de8f8:

  dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number (2025-06-24 10:02:12 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.17

  - Document more board part numbers.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      dt-bindings: soc: renesas: Document RZ/V2H EVK board part number
      dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

