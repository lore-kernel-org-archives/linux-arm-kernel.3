Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667A8D3B7F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rgg+jq7kDqKzY5lnrRAJ7C6+UUhoNLLG657lAlnhZnE=; b=AAXT8AdHY7Jy/WmCOw573GAyrt
	uxtoCQRYvf1HGskPndDPf4uYrcaN8053odeGKPwWldu54WtRvGUVRrOzFK3t2OxuwNyAS7XF3t9u5
	l+/c0t2t4TI/ii3x7JlxJjrZlXHIKIW4YOYYLNi6IBmdMNSiXTEuSQyQVxdPhkswXwYaiyCjy5CHk
	hPRSU78UUJQC+nW7njwUnrRPnXubWarIZncBmAMBKBOs702P0y23UwCjqNPjYtTrBYau8wiQEF+P4
	X/goLV5MHVzqKpc3T/hZzNBL/81o24uLXbn0p4wddP+rhdN15axVthnCXmx4ycGsOy0LVDkKSUhkM
	kXoqB2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu6W-0000000E3gi-12XB;
	Tue, 09 Dec 2025 09:33:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu6T-0000000E3ft-3yFI;
	Tue, 09 Dec 2025 09:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765272828;
	bh=zHV6QQ/hhwmy5wEhNJDurUi/RvuoqFAap/NtJmo3Wxc=;
	h=From:Date:Subject:To:Cc:From;
	b=U7qJqpCNm7bvSghvtokThwrH7bFUlcP+gNGd9SrvYE+mbVGi6wHR1DpfwouvpVGgW
	 cpo3csDp1h+4I0m0ao5K9MisEb+2oVRm/+lXJPC3JVQ6HxBmGu3zV9whebQMEyFak/
	 xRHAwAQ7Zm84Pr5eJaV+wgr9ZVVGtqiCVKzHeGKMxv/xYOOfxkrlH6nemmk+4YVDW2
	 DnI5KdTWhXLENQ6VUbmcEtPOs/8+TA//6/SIZeUVb+K2Sc5Bx4GCyXn02VdJcbjdJy
	 TCqK+UbFlZ3dRQ0MmvAs92mJEyHu9WPkxnygvDA+VUtb2zUSrBe5OZ2TCq6ORWeSVD
	 UVQ+f7h2s8cGg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9517417E1216;
	Tue,  9 Dec 2025 10:33:48 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 10:33:20 +0100
Subject: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA
 Genio 520
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-socinfo-mt8371-v1-1-155a9df851d0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWMQQrCMBREr1L+2g9JpNX2KtJFjRP9SBJNUimU3
 t1gcTdv4L2VMpIg09CslPCRLDFU0IeG7GMKd7DcKpNRptVG9ezLk3O0Elys+3w8aYbr4YxC16G
 lKr4SnCy/6GXcOeE913bZT7pOGWyj91KGJmAp/O/TuG1fgeeWdpUAAAA=
X-Change-ID: 20251209-mtk-socinfo-mt8371-ef9ef20e66e5
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765272828; l=1365;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=zHV6QQ/hhwmy5wEhNJDurUi/RvuoqFAap/NtJmo3Wxc=;
 b=vcVWi4G+6nAuTi3AZ92W5WKBhvSMKFtmUP0E6NaaoTczDRVpr7dUmt7xgm2PwdKPDSJGp8GOh
 Pk4z7dFTFOAAhcmR6+ad1DBO2tU5ppK/EwK2/Pn3ZdeHuIzocP/AWnh
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013354_171884_268555DA 
X-CRM114-Status: UNSURE (   8.25  )
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

Add an entry for the MT8371 SoC with commercial name Genio 520.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 978c43e9115ab29b20703621c60f1b8ef4d6f851..424a1eb82c20fa5226bd70ec0145f437560b40cf 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -59,6 +59,7 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EZA", "Kompanio 1380", 0x81950400, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8370", "MT8370AV/AZA", "Genio 510", 0x83700000, 0x00000081),
+	MTK_SOCINFO_ENTRY("MT8371", "MT8371AV/AZA", "Genio 520", 0x83710000, 0x00000081),
 	MTK_SOCINFO_ENTRY("MT8390", "MT8390AV/AZA", "Genio 700", 0x83900000, 0x00000080),
 	MTK_SOCINFO_ENTRY("MT8391", "MT8391AV/AZA", "Genio 720", 0x83910000, 0x00000080),
 	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950100, CELL_NOT_USED),

---
base-commit: 8ebfd5290c6162d65f83f9a8acdbbf243b49a586
change-id: 20251209-mtk-socinfo-mt8371-ef9ef20e66e5

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


