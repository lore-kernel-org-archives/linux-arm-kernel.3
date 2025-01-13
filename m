Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C6AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t17KFww3k98URDV6DgHl7kCq+BQ/Axs5hT6OmxZzQVQ=; b=Iqst+xKwrAJzGZ
	5UeFv78JorF8HHQBZWMuOyQljxRW0aAV/uV32lZlJn8OOzthchXgPHMaAKVMMqbkHV4J3F/2wz3q8
	3q392v2hoFe1B5dRsi+MWj+FHT72oX/ylSuqU6Ghf9YNJGc0U1cM27nJy2FciUi9no307jfMHRObf
	tLhj5WWp75gt50CJT0M25sy3o3lkr6zcz/TG6kyQPBCHx+iiEgGfuDS96vYVTOYpcfXWr/dTj+4Re
	mvgFR/T0gEPzdRbYoc7+63eYs0AE+QwJVj0ddqsp1NKunNtkpPACUd4vbf3zG91R7nA3CRKk4jIJj
	69J4UNmeTblUWknZ/v6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNJH-00000005r8G-1bjJ;
	Mon, 13 Jan 2025 16:29:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN4X-00000005nvT-30cd;
	Mon, 13 Jan 2025 16:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736784826;
	bh=rPgsrjg0USceZcvBmakV2jbbUbUXjvHx2e3e6KrFKs4=;
	h=From:Subject:Date:To:Cc:From;
	b=N+Zg/H+YOYbO+jvn4TRKbISUTMwbsvfP75XEUHINvaQfIU1nYpfJE/WXeVWWZbAx8
	 prXt/zMTuIH6USd27aYDDmXKDkXDSSJElyNE+7VnLdIHaeR31eAuEYTiLtjFsszB/r
	 9P5PD3J+TuHhUCMV1FLhFbjU/4F/OEufvRYQSOdd3q2XfMKriRRDXpiWcDYBsE3kds
	 s0FMYt1PXlVuWmRHL+pCxPrlSt1+NetWGhrETJR3yFG3vYZZQo8GExSwPRYw95J/zN
	 GQUmAj9nJNBHiiv/CpxV3v6KDoemOpv8ewcMAkwpY6r2yZHPczs9VA4AOuUop5omqA
	 ta+oX+SVflKVA==
Received: from device-327.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D64017E0801;
	Mon, 13 Jan 2025 17:13:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/2] Add entries for Mediatek MT8370 and MT8390 SoC in
 mtk-socinfo
Date: Mon, 13 Jan 2025 17:13:22 +0100
Message-Id: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKI7hWcC/x3MQQqDMBBA0auEWTswMUZpryJSNE7sUJqURIogu
 bvB5Vv8f0LmJJzhqU5I/JcsMVToRoF7z2FjlLUaWmotaW3wu38wRyfBx9fGQSJaTTgQIffLw3h
 nnekGqP0vsZfjfo9TKReg4AT3awAAAA==
X-Change-ID: 20250113-mtk-socinfo_genio-510-700-e6b93fc5c347
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736784826; l=673;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rPgsrjg0USceZcvBmakV2jbbUbUXjvHx2e3e6KrFKs4=;
 b=GPFLGe4xD5stzqVT5L293mJcvpRBr4iiF8G7cpViiVNQXBuJCPiSMmE3hXdDOnUBDHUpcrPDg
 w7jL5ia0Dj/BGQ8644mb4aMDPOFMHl7TJyykGIiEVGUeLQtI23jdg8q
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_081349_923281_8E20EAA2 
X-CRM114-Status: UNSURE (   6.64  )
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

This patchset adds two new entries in the mtk-socinfo driver:
- MT8370AV/AZA (also known as Genio 510)
- MT8390AV/AZA (also known as Genio 700)

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (2):
      soc: mediatek: mtk-socinfo: Add entry for MT8370AV/AZA Genio 510
      soc: mediatek: mtk-socinfo: Add entry for MT8390AV/AZA Genio 700

 drivers/soc/mediatek/mtk-socinfo.c | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-mtk-socinfo_genio-510-700-e6b93fc5c347

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


