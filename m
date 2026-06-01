Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC6CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQHXnv+zTI6JRHEdJGtJjegFX1lIGlI0OuTgX9tK2C4=; b=BTDrK9lOeuEC5BsMlRdzP55CQ6
	u22xmtyeWpdKaSZs9s1D0jN09Av6H7NRfJV3oGctZc901QXHQj9XFwJoIfuKbthhuqTqncIE1KwMy
	P+ta4MVAv/Oz/2g8y1vLRvGz/02LIO3dyZoas+GrzkArt/mvqusyKTYDPtcQmqMJswB6JejMYagpd
	gEVF5pHObgsJw6xehn2MbchKwwZgm9MJY8u33tn9mZ6uPfOMX6KPU+vIFj5kIYRMy5nTO9SP/cPcT
	JuK9cJVGFtU4pL/tRWJlpgBYxu5xsxUmQFnluJeab3SbmnHDX98lFSGpOfFWiXszkpinMuhURP/wY
	A/8NOmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhN-0000000ASjb-1VQo;
	Mon, 01 Jun 2026 09:12:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhM-0000000AShz-2HQs;
	Mon, 01 Jun 2026 09:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pQHXnv+zTI6JRHEdJGtJjegFX1lIGlI0OuTgX9tK2C4=; b=dJnbk4uoRSPx4w4A1bLgV+Qo3m
	s6RF40XtnXthUlZaBW2eDRGryPdQIvHgck/dFxZtA0W3neBzEszwq8C9xDgBH7yCay379//+YiNFU
	jybBki/7Of8xTAfmbj8ClVbszJV/EwmCVgWt39JzZ0gcXxPTgy9D0JN8djeV4PbBjNt+mkAqOLsXB
	/am9ZghczeS9EKXwQIOXpuoUFA8wD3olCl9bQTxtkXKtavSJvLcCoUYs8a4sFhP9TUKpMC1E7PmIb
	p7Y5vyHNhjtthlQV8mmdk2UnDbn93t8UYfr2v4T6cPoABTs1HxsOxokCIY/agljURbRFTsMo8H10G
	QHFROa9w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhJ-00000006BiH-0Ypz;
	Mon, 01 Jun 2026 09:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780305151;
	bh=ZMQig1G0kI/9KDHbMpaDNt380R1SRF5p144eDOFLNgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxmwyCIXwbzWqHXCNEbgl0y5hr9CjXFyBXtIj/H/oV4FHhjUM1WulsHn6MEI8CFc/
	 Zx3ykqnlb3qTd6FbYQVnrRXFV2030kvf82xnh28iiVIfrqK3ow/QeZn9TP4Ii+RXxu
	 47Sy/H7x3qjAa01qBwINyQqrvuptKd4VJOhoGjEF62QNQkzjtUu/W32JoYIE0U/Pxn
	 S2qQMEEcG+mPW6jj7S23ZmWw+eIFeAdyrTxOX1/t9uN36SKvoC6C0l7oPY5bW70EsF
	 eb2Nz4BY/fbSw1lYIK19Tl7TSliK/efZKnUTJ8SGdtcONzmsHKocV+hmGOQUEkIJyI
	 94NZQsDmkxVFg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3148717E0B66;
	Mon,  1 Jun 2026 11:12:31 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	matthias.bgg@kernel.org
Subject: [GIT,PULL,2/3] MediaTek SoC driver updates for v7.2
Date: Mon,  1 Jun 2026 11:12:22 +0200
Message-ID: <20260601091225.5223-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_101237_580580_65E8EC41 
X-CRM114-Status: UNSURE (   7.52  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.2

for you to fetch changes up to 7d462de9f65b002b439b1b168bf3b5579b0de48b:

  soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge (2026-05-11 11:20:48 +0200)

----------------------------------------------------------------
MediaTek SoC driver updates

This adds subsys ID compatibility in MediaTek CMDQ, paving
the way for adding support for the MT8196 SoC, and fixes
the Multimedia System (MMSYS) routing masks for the MT8167
SoC.

----------------------------------------------------------------
Jason-JH Lin (2):
      soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa

Luca Leonardo Scorcia (1):
      soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge

 drivers/soc/mediatek/mt8167-mmsys.h   | 11 ++++++++---
 drivers/soc/mediatek/mtk-mmsys.c      |  8 +++++---
 drivers/soc/mediatek/mtk-mutex.c      |  5 +++--
 include/linux/soc/mediatek/mtk-cmdq.h | 24 ++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 8 deletions(-)

