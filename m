Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YupbMVYXxMvjjgfwExWIPKVAr8Cj5B0ZTeNSIN8z7UA=; b=yZUunBSv4n3vSbWIUYF1u3i7dK
	lnRynHc3NgvIY+KOchWvwZHLR2uuHak3hMXgTuNsGi7Kr9+V3pkmUMBCTnyn/I3vVXfSjUVkeWa1j
	WAnFhK+Vkrd4V6hRdpjJawLdf0kidAxQgskQkaCQbr2rIlkojFHWTrjtzl6LgY67uWkrJQauIItKY
	mLJLNMfiJ8t0oRnNTXaFbHZEXcefh+lk0YmNegDoJ5T+byGIfkSjvzJhAc3iHs0kL7Kjg9e2V1QZK
	cLgKugCFoBtDObXamLs8Nrbd1pV9uWNYCauRQXMQyvwBGtprpkPkCVbGuwKSlOPHSX53vkf1oX/wI
	Tfk8alFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNLh-00000005rp6-2Kq1;
	Mon, 13 Jan 2025 16:31:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN4X-00000005nvZ-3Ox3;
	Mon, 13 Jan 2025 16:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736784827;
	bh=oaAGQ568bKAM7Z2+xhPlm70Wbt56wvyrqJjRYLt6xdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cvJI6stmXnOtQ8OJCoAGQG4BEEyNPDIy5pp+2H93edL8MLDZF7N12TZ5m4uQnjGYW
	 2ALrpNXfPKchd3sNRab1Erg1T0dtq4ZwnJ90COW7CPc1n+Jkmb9RGf/fsC7qbCNzLZ
	 aVBWIxCgr0A1dIak3zMFLWnmIFeR0Z7SpdwwtxVZdw9tZevwJHayZORfo3UpS2alCB
	 +9EDIS+tuOplwx6uhgv9Lh/wgOIcsaGE97hO/cDjtdBcJGc8ZyJMR392grlWzfB7pC
	 tX3YVcwyY+Waf0x1UiFRK9+dNpOktTB+lIcoimk8gD9/z6thHPfhy3+U/WVX5ho3PP
	 IG2OsPlFwtz7g==
Received: from device-327.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7858E17E0ECD;
	Mon, 13 Jan 2025 17:13:47 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 13 Jan 2025 17:13:24 +0100
Subject: [PATCH 2/2] soc: mediatek: mtk-socinfo: Add entry for MT8390AV/AZA
 Genio 700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-mtk-socinfo_genio-510-700-v1-2-cf5112b325b7@collabora.com>
References: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
In-Reply-To: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736784826; l=1025;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=oaAGQ568bKAM7Z2+xhPlm70Wbt56wvyrqJjRYLt6xdw=;
 b=jWYmADJDqvZD19u8Xd9kAsNR12TfTtOpr8rT1pCDwUwujpLZCrz5zSZbpBnJ6bmKXNCWoEQ5N
 C38hwFPT6Z4BSgUrl2Je+zxpNOC+LtR46dFTMeA4locV/fBgz86UuQq
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_081350_007171_EE3DBDC2 
X-CRM114-Status: UNSURE (   8.48  )
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

Add an entry for the MT8390 SoC with commercial name Genio 700.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 060e39cc8407dc85a8cd2a6020d187acce73106d..bf3dcd92ab979bdde9ebaf8634d5397c014691b0 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -57,6 +57,7 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EZA", "Kompanio 1380", 0x81950400, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8370", "MT8370AV/AZA", "Genio 510", 0x83700000, 0x00000081),
+	MTK_SOCINFO_ENTRY("MT8390", "MT8390AV/AZA", "Genio 700", 0x83900000, 0x00000080),
 	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950100, CELL_NOT_USED),
 };
 

-- 
2.47.1


