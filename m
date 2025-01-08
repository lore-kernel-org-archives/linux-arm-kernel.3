Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C57E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD/DE8NIn/ayeZ5Uk7GGnjbmNCvr6K8FNetSTwQWuWo=; b=ZErF3BqjAuFyqBoDw9T+3IAoVr
	PpK97w0ztmAq5FOkvJ42KDDfx+aCo4IlQxIrwyQNaUvl0tIYaABqJ6CiiEOYI6AqvHmAzB+6Uv66l
	ij/o3Q46UfLBCzv1uXJ4hNa7rck4eWOx4kZsDKqxslFB3NdDvf4emXxrUQlfCzpj9GWjnwWPkrF6v
	84kTDkfu/Llxm1jWIakJ7NjVuwI/oM2XbXWZ8FtYBoQf4YBp8uvzSc/1Y/QmWDsaQxq84ZmdGB89n
	i4cK6WlhKJUhadmsBVrFaS5HwuuiOaS8PYne+buHoXRRYmFwYH8isdVdEjeZFXMAhaRmFXPPc+5ER
	0HSj3SyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT5t-00000007wIm-2TkT;
	Wed, 08 Jan 2025 10:15:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSzO-00000007uky-2NuB;
	Wed, 08 Jan 2025 10:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736330916;
	bh=qUE6a1s/T1/9RfaxklpsWiTkF/AvmrQ9PTOphkSNPPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoTVEh57RI8ExPBsxJKK8lVChF5lUPOTTzpcJAswONzCbwnzr2ZeKWhBK0CFoRKFa
	 LvHvTyreUWL3FtVKvIDZQd2hz71n0FZ5EFhlq80n7KSsscobl3LGGNgqIIRRCXHgMU
	 eZ7VJOaW2N//pk1k8R8oL/18anIoi8+vejCT/rcPc3Z9byI9Kom2JzZGJvhGgpeVB4
	 LTkLrocupac3DrCs+fqfAIRPbRn4CPpwVmjbC4Q47ji6j/QjYZ4gEZN3JcgOyqLj4m
	 WchdHHgw7/c7XW8QaFVJJcJZjsGHsR6rOiZ/9CVWtGCYBBuf+9bHRRFgKWCFzYWmHW
	 l5gzrY4Nm9ovQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8618117E1553;
	Wed,  8 Jan 2025 11:08:36 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek driver updates for v6.14
Date: Wed,  8 Jan 2025 11:08:23 +0100
Message-ID: <20250108100826.32458-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
References: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_020838_779288_35153715 
X-CRM114-Status: UNSURE (   6.53  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.14

for you to fetch changes up to c9c0036c1990da8d2dd33563e327e05a775fcf10:

  soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove (2025-01-07 13:13:57 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.14

This adds fixes avoiding iomap leaks on error paths in
the MediaTek devapc driver.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
      soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove

 drivers/soc/mediatek/mtk-devapc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

