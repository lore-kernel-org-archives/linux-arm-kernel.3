Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CDhq+dL3nsk8UzP0eKcBvfKq2XVVSyPMvowS6K5DvSY=; b=kgneOgmWbSihRzmCeD4QYlrIWg
	nS2E37hGQ9xX1yaeyV6bg2RJnHkDWWdZfdc+H0SbY400MHiUAhwoL8Z0Mc+jQVyrJLaaMRwkIXFLk
	kguAi0jVVCd1WeidBFG+veupNKQD556xet0pnQoAUk1yrM/KjIny3Krb2+DEiJWT6ibrJzega/ndi
	GaCOh5GHbYZlkU0HIE7vIkMIdKG/L9XdeyNTI3hmHI3iWC94rlE87imQ7VBLcJEcMHdeFj4GDRejN
	RJVpLgjHezYJjmgi/k9lIx3g8mXEB3OjpnURzChkHa8AS2Xt4yW1VXlEh3VOGcDpaLKDL7od9TqC4
	Hqu8Vh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6W4-00000001Qpd-34iE;
	Wed, 29 Oct 2025 13:47:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6W1-00000001QoO-3nYJ;
	Wed, 29 Oct 2025 13:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761745622;
	bh=FtGL6BrEe7pDieRhJuh9tsTJUGfEYnMY7qjoVKYV4Xs=;
	h=From:Date:Subject:To:Cc:From;
	b=mEBS/OCd6+czSbU6MfkLaxnvg5HB/ZP8tfOySjoSQRx7oW/DrF8RKppXelv6vvwzL
	 oNde605UdshGGj3IMvONoZI0Ux/7Z16qZtZcdSklRmd1ABCwkQtJhJISOZQ5R9oTgB
	 bexGd9auLlTo6wZerFq4fJdbBHEnCvnEKfp6Hc3d4meeFt1nn7Q+bqUWzrpd1hk3U+
	 c6TfkQjqrQeIu6NeKiIPdUCid2dbyIsVySNfEEwBVvNr/r6tKxsrKXtjU/vQW+hgVG
	 iy/LvlSAWGywDTLneKSar/kNqcKRe3dwJNCAko1wEraVvV+lwgjoY6dI4IGk+yzV6b
	 786rOvlU5Hkdg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3179817E12D5;
	Wed, 29 Oct 2025 14:47:02 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Oct 2025 14:46:43 +0100
Subject: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA
 Genio 720
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mtk-socinfo-mt8391-v1-1-61412dcd9938@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMIaAmkC/zWMQQrDIBBFryKz7oBaIjVXKVlYM7ZDUVs1JRBy9
 0pDd/99eG+DSoWpwig2KPThyjl1UCcB/uHSnZDnzqClHpTUFmN7Ys2eU8h9X85WoTbSkfXeBKO
 gi69Cgddf9DodXOi99HY7Tri5SuhzjNxGkWht+O/DtO9flhuDxZUAAAA=
X-Change-ID: 20251029-mtk-socinfo-mt8391-260ae9cc6f61
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761745622; l=1281;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=FtGL6BrEe7pDieRhJuh9tsTJUGfEYnMY7qjoVKYV4Xs=;
 b=zvrumaYasVrWd2Rjr0Owt3Swl5wyMzZhnnRllIfhdZGv6sG/Lm651b6aOn6iMJYDWvcHnyhZ9
 PNZkjFi2CNsDL63RZYuvBwK3tjZ2NNJ3jD21Hb/x/g9qGz6r9viLaHP
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_064706_115786_F8506B5E 
X-CRM114-Status: UNSURE (   8.79  )
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

Add an entry for the MT8391 SoC with commercial name Genio 720.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index c697a0398d917c0944661a75667824369373ba2c..44a21e91d159b93ed1540b5754f5512d2d9c3fc0 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -58,6 +58,7 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8370", "MT8370AV/AZA", "Genio 510", 0x83700000, 0x00000081),
 	MTK_SOCINFO_ENTRY("MT8390", "MT8390AV/AZA", "Genio 700", 0x83900000, 0x00000080),
+	MTK_SOCINFO_ENTRY("MT8391", "MT8391AV/AZA", "Genio 720", 0x83910000, 0x00000080),
 	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950100, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950800, CELL_NOT_USED),
 };

---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20251029-mtk-socinfo-mt8391-260ae9cc6f61

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


