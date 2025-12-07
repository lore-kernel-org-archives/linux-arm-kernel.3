Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6496BD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/EEIG21HgNJz0UJ1AA5wtG6iy/331f17scAhitLn5o=; b=He1SM0ddiWpYklJ7oKevPDNyJj
	BdDCBbRYDgjJn+DEbeIzxxCVgkO9ngKxaZWMzLkbf22M1dlaDwxphz+R9Tz75NvbnwnwMEmMc3P14
	zZLdSJrvJVMP9roxHqACJgKV66H/OOftzBj92bJhS6Enh8R9/hcEndcqizO/tHLa7JEM+1zqi9oZN
	xUCRcNe0y9Gk890B3G2XQ9qe7R4SBLaKaQzaBkyEFVVaeqVJZE4p2c3D9CGfRRk8cVBKoMyPSI+0f
	eXS+WZHsiO0bQQ6CcWTt70atf3UEmuyAIPcYc2ORklLF997D+rWhc2SdOwlcf3T04T34FjXnrZ0gK
	WOJzpPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSDyk-0000000BvWi-1gg4;
	Sun, 07 Dec 2025 12:35:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSDyh-0000000BvW6-2ses
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 12:35:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-343ff854297so3832495a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765110902; x=1765715702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/EEIG21HgNJz0UJ1AA5wtG6iy/331f17scAhitLn5o=;
        b=XbqrzHRkGGCdrGKb5SKKdgxmn5bw2hGfaNfQImAjEH1JQ28/QmSpi3r+SnXF/DFJdi
         dapfySrrIAVCLZmga5j+O9l8i1ooEgGLiJTbJm+5S85IhoFW/9BZjfw/6qSsjujRlMyA
         TorzZlsOT5ktkON4P6H/UTD5rZ5LC0DQuNOcATO3pocovJ1J39fjCnsShaDqKizkwWr5
         5GkW1L0uoxq3E61CeLU0r9r52F9ByMZzY3ANqWMoomPt0H1WOvBPtZANlAeZX2oqtGV1
         qM2h8uU+WJUITQcVKkxZDpeJVuENtBKLnjkIhWp4dKeGDA8sirENJAGUqzoCOoets2Q6
         Fy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765110902; x=1765715702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/EEIG21HgNJz0UJ1AA5wtG6iy/331f17scAhitLn5o=;
        b=IUEfgZONZhUh69df2cu1APNXkXT3lcI9zncaKRE5QEBaCDseNBHaw7WmUdUDpAGKci
         YM9bmGBfqwUMeqnJuzTFDXDOXWngXiVDH62/33WX9GKbBJYqgirJzbJpbrYD5i6as81Y
         YZ/DW8LyZ1ZCVHg0GXvt/MxiQktifBLTL8VepNZoy6alFkcztdDZP2+6D0NN/+vxA2ph
         eDQdkT8ashirUx8/+JfqdDCTfu8FLf8LjPzjMJElnTT27fzCns79UU5P1WsaIe0DGO8+
         DPeBFJvV55YXMsc0TUnZxKrZ9eyZXZS+ZM9YZd7mY5UfxdsowL1R3EOnZPVOuyQzPhIW
         8OFw==
X-Forwarded-Encrypted: i=1; AJvYcCVmRvjXwirTPHgXkkAo6e3efzaMpgPRpqfSrQ3ili8ASJeewmSnkPCwotveSbhxOb9dCE+jvIKTQN8VT91lHdPD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4XEeAPdRSDUIW6SsmWRDHVX5AXOWcNLqmgLYwKyg3ZHpd0vvm
	EAd0UsJMsr0acieMxm3WCPl9cfhv/Bt8GCwQxIXTM+6yEasoJA5XHCKO
X-Gm-Gg: ASbGncsKJDkocBhUSCiwUJTKkxlfejcPve0CsCcS8wB2k/Q3yEpAzcRqh6gm4l9OXkM
	+HtjdmMz03PAGLmfQ6omjVnt0j173iMCIPGymuu68LOuOPcajCh4VRHBmCxWpMxS5QW7cZaoV/C
	13c6kJ3UJhy+pIGu6FBt8ub/5ZbP42CSR07uOrktnUjym0zsdyvhGrUX/PQ5a0fakDAcVQueVgC
	GFuzAYkBT0MQWGQ1uDft1oznUcL7BCWEKeqit0T2ci7+Otsf06gn/CTCP1KsCvZuXsc5Qw0tKs5
	nKVadPfjl23TTZ7+y5BxKmOYzi2CHadouddUGB/crH1IdZbWhH89ljH++VHNFsRwOWdEPnpyOQp
	HGWTuVQQG5Vts4FOED2MsV9l2CzARCqup6itRMPH+5wnqejn7xI73K5mh5QPTdIxUmT7lcGlvwv
	EAe9uuJJdDcKJ+lZSu
X-Google-Smtp-Source: AGHT+IFzu5EseF38E19GJggjBQNJ0c5DSWKeJaFT7L7ltbpOuzF8rj9ayEDgLA8p8R58T9CgSYJ4NA==
X-Received: by 2002:a17:90b:3d92:b0:349:8184:af8b with SMTP id 98e67ed59e1d1-349a24b0974mr4020138a91.7.1765110901873;
        Sun, 07 Dec 2025 04:35:01 -0800 (PST)
Received: from archlinux ([205.254.184.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494ea7dabcsm9090852a91.16.2025.12.07.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:35:01 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.or,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.co
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drivers: net: wireless: Replace deprecated PCI function
Date: Sun,  7 Dec 2025 18:04:47 +0530
Message-ID: <20251207123447.93233-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_043503_816109_7CC22E83 
X-CRM114-Status: UNSURE (   9.77  )
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

pcim_iomap_table() and pcim_iomap_regions() have been
deprecated.
Replace them with pcim_iomap_region().

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index ec9686183251..5a82c3bf471f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -284,10 +284,6 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-	if (ret)
-		return ret;
-
 	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 	if (!(cmd & PCI_COMMAND_MEMORY)) {
 		cmd |= PCI_COMMAND_MEMORY;
@@ -325,7 +321,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->fw_features = features;
 	dev->hif_ops = &mt7921_pcie_ops;
 	dev->irq_map = &irq_map;
-	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
+	mt76_mmio_init(&dev->mt76, pcim_iomap_region(pdev, 0, pci_name(pdev)));
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
 	dev->phy.dev = dev;
-- 
2.52.0


