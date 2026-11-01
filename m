Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22815606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZlUuWJJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1ZSkH1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=; b=RZlUuWJJJTw+Bt0x4bEOzmjDHN
	FJ37gN8nxNeqST7s5pRPra0mSDE/nAS7Y+Nu5uxrZqgDJhA73fhdULiriaCDQwEghtMVTLVZ5K7In
	F8kQu7S17TscRelwWgm5udVGQJ/X+nj48fuyPoopCIwhvoXzVyfNznH8Id43bI9JNOn8UaABxy4CG
	+qPLFPkDFPaF4DgsW/PdmXMG6SAr8n/vbwSJ6yf/whiVP5lgsYpbxbeRzxIszKzzyc3ZLQOa3pDG7
	nk9sVbia1nVskbY4vGMv9X2VKuGHkpLOD/BPvLjivWL8DE5Z6/mjA8sqvxhm83p3LLLh8qW6oxIk4
	ptpcsIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNPZu-0000000DwFI-3hMk;
	Sun, 01 Nov 2026 07:02:06 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNPZs-0000000DwET-0227
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 07:02:05 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1aefd1bf74aso826987c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793516523; x=1794121323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
        b=W1ZSkH1o1jglCLbJ5EGnmfC1FoeAV+jiXaFA7O63kH4BAxCDT69G8Q8RBpb81cjLEv
         MiishLt362aeAeVxQ1L9ABXwkWa/1gDXIKNxIwOMUCVM+PXo7L5K/CIa4ZWPZ2AOCdPG
         nnOzd0TftZCJyn10Fhc6Hst2he01TCJJ8iGzOGjKq+2lJzLX0sy2O+P3I6QzsD0JzFgv
         7G28Lzvk8DeQPkjziaBCLUjot4sYM6VcaIBnEr+EO2QLrBHs+XMj3nxh6C8udmNBGvlD
         EM7XxcKK+bYxXNzv48Mnje2dJVtDk6dOGKPVRXWq+6eP3+IJIf+3dP1GI06d+/W4CeQC
         4o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793516523; x=1794121323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoA8ZatI3XBB1U2/SoghhJIwCX1MF+HDGH5+WILuFZE=;
        b=zlN3+WIG+QmxEnSAd2i1c6kf2XftFCYBENrZRSfNEA005LzrheRZ7kETe7+VA7Rav8
         k6Sbdq9jpM6cdG7AFrHRznidzPh2EvnM6VC7+1SiCSIB5YoULszjwd5pKD6by51ekpUu
         UrUBN94yOVy1ugadwaws6TnUFDWQeoPB1X3GY2zFju3WyfKov8DcWfZ/brxKw5fTC1Fv
         NYxbHbR+TAYtJKXNb5CJh3/QdIUW4n1Vea9R/RIe4WiUYm1Eiv2W8uQSxzJ3pnH0x/sq
         q7/D/qC6xdVXziaHFjyucmN+aG4hutKyPP21ACEqmKO1Ocb0tWg8bXJlfhJazo85o85N
         U7Qw==
X-Forwarded-Encrypted: i=1; AKwUvBwN6bFE38EGhbpiZPNlfwMzHEp5nIwCJBwV5qV0SrpqJKBAwBc/4gIWMjIArYWq0+B91301jbyjLfdqoFrJQ8J6@lists.infradead.org
X-Gm-Message-State: AFq9FYKMGqDnVn2sNpetEFP1nR4Gyn1qzYeJU9iVCyQELEFg/jjLpoE0
	xZ6rOfEd810a5TwC8UNVOFlP3su1rxTnHfp6MGfvzmsVXXrSZWyi5I9z
X-Gm-Gg: AYBFou08Hte284KcftGzLbH6D7rtUGGkpfF6oBr5XiCbJIVWUZvILRRRsq4LEwdk1nE
	nQsCA/YhM04oAkCUbAkwFPm0ACydu6ShBgug5h2eDb657n6SGkI8U0whYFJ+TIU6qfsUtr5yj2n
	o3p8epBvVeb74i6+26ryHwQDzh4vRQ9CFsDOCeBhHnubvTewolojx786ZDt1+iDIxtRNPQ1wCT1
	S009oeMSCRLch0M+XpW/uRYQ7/PypM9+PpZkSnczywp69JY1KhBg8mQMubX+YHR3Xd+b+nWPKfo
	bBOWpqQDlqVUtJLFJFEk55hFxbK8dgsTncWjw5ieUm6b9MYmq4s0XWF0vZwejBAS6dw3IktiGvY
	5PmoMHY+Sbea3BxgQR1s3qWJUVn80gxM/KoV/c1BAZPg7VkAeri87K1Uw7/zsDs4J3yclj8bOGf
	wTow5NnYeRKmxcKpG+V5d8hAVH+uwFEAWabWLET0y8rqkcAISxxcdTclnddgsGNq9NiQg5Nhk6e
	BZtZaG8MnTpTP0SF9gC6SlpXnu1x3wRJOuBiw03YmB5XrqheNUjoP3rz9nEcQAo/tylQPr7ncFh
	MdVckIxnyv8hF28/xFkRWK48ex/ojhNGgJO6bfkQX8HkbD7oquQ9vw==
X-Received: by 2002:a05:7022:7f02:b0:156:d588:c881 with SMTP id a92af1059eb24-1a9420e36c4mr14043652c88.2.1793516522423;
        Sun, 01 Nov 2026 00:02:02 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm38735421c88.7.2026.11.01.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:02:01 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sergio.paracuellos@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
Date: Sun,  1 Nov 2026 07:01:21 +0000
Message-ID: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_000204_080333_A1255DD8 
X-CRM114-Status: GOOD (  12.70  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCIe port initialization code acquires a reset control handle using
of_reset_control_get_exclusive(). However, when PHY initialization or
power-on fails, the port is removed from the PCIe port list without
releasing the acquired reset control handle.

Since the reset control cleanup iterates over the remaining ports in
the list, the removed port's reset control handle is never released.

Call reset_control_put() before removing the failed port from the list
to ensure that the reset control resource is properly released.

Fixes a resource leak on PCIe PHY initialization failure.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 01ead2f92e87..1dcaa2829609 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -361,6 +361,7 @@ static int mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 		err = mt7621_pcie_init_port(port);
 		if (err) {
 			dev_err(dev, "initializing port %d failed\n", slot);
+			reset_control_put(port->pcie_rst);
 			list_del(&port->list);
 		}
 	}
-- 
2.55.0


