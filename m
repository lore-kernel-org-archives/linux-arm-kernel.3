Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98847CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OaA3ZM2Zqnd6U5xNasrJ5HhecqWu3+FpjPtc7vgz6NU=; b=ZkaxHzREMMSI6lBesIlw1aTEpb
	JpohvECceF6L1L2ecMvnSTBcT2tuXAdMfIqgsBYTEFvXq3OwEmxCQXVbYsloWa37+WztUAmof1WjP
	W2OhW0+zvAvGAiJ5M0Foc8qDp7pac0Uxq+Wy527YlRQCR+HeGku2DsL58bLdynMgKKNmVQnhxwvoi
	enGbmy1FRjjHuBz1NogTrAu23twwwV0anUoT2t1ER7ux4BZ3KnuEEjkV3DfhCp2SdzkQN2YGIHs/T
	5kThOMqpW+0TiRb/9sR3aUZzfWoDjN9/sxDbUINBfzckGNlUU2RJHt79sy7cypOkZxUuYi7kceloh
	4oOURX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Px-0000000GN55-0Ngv;
	Mon, 18 May 2026 17:06:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Pu-0000000GN4C-15QM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:06:12 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c80148ae949so960656a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779123968; x=1779728768; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaA3ZM2Zqnd6U5xNasrJ5HhecqWu3+FpjPtc7vgz6NU=;
        b=RwkXxUtyRNk0CK1CbgCGSPXXOKpNIOYi2XduWW8R4tO/2suxI7m6ZXK2iJYH++ZKpD
         LfT84Ig2jY4GdjrhoykaNZ1an1c/Dw22v21ryWY68snDzAMcW6jFHq+Pfx0uOLoiHv25
         saU7OxYvZObRkBrgCL11v7YVlE/i5Q8F4XcmfACXYS6ZdBy4bioeCzLDQ85NEQGUN+LG
         t8cYeawkVo5C64jz279ZUM3MJuPwsuPJxgRj0QxBBXYMuxN0B98COraWMqqzUkGZ3OGw
         09MxXdDucyrYWnZs3PapsohWqJgjQiOV0uPO49AlxF0PFC0nmO7EAdQG5n+VElr+LyNb
         F21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123968; x=1779728768;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaA3ZM2Zqnd6U5xNasrJ5HhecqWu3+FpjPtc7vgz6NU=;
        b=bqeFNgQ2SNJFhF9/5mB5lFT30NK6qjKsU/ooG67LzkdU2SmwAFUsSzRt5UYWUStnRo
         pH4D9UnMPcSFSbHu2uoS0IUSb3maDHiJyIJQiopCQbgeAPZwt1W6ra6ux/+v/wJ4Tuxk
         k24UYPc5wsqlPfqV8hwR49uQwtBq2rat8TC7jlTubqio7rrTK2n5PBvTRMcntb70MFS2
         yxOhOwYnT17xywqyb7hWuqWxQPFjlBenIV6MyHRmXnoGnyaKKWsk7HIQfwvkKTuiTrIJ
         rsGKwYw/sjJen8rF96IByq5zdENNrpVGVKopd4/1F+GhY2YH7S5E5QzreG00nOEjf8vk
         kUng==
X-Forwarded-Encrypted: i=1; AFNElJ91xow0/VUsimc728rRqXovP4hUjxZBXEGCzgLR5xn+LM1mJHB49FPo9ckzq2UumyTibT5w9wgAzG/2dDfEja80@lists.infradead.org
X-Gm-Message-State: AOJu0YwVorHEb3t4tMBEccK/9GuyV4EHd88YwzGedG7J+FmOH3qoANwj
	nIE6VZo4MKukkUPDUow4OkprFjTOxBWCBoduc0aMr30w1lkupwhuzOr+
X-Gm-Gg: Acq92OGGCcIdVTXH91TpjPo/eKGw3NxdVaEVZx9tEDKhxKtwFyU9VY/ewcepBJOLgi9
	jZqEqrYOSHagV2O+//UOQx9RYPBWyRX/ihufYf9O7hjc4o+lOMRRmN8aQzM/6uJ3fT+KCB4hvH9
	AXoRL9Gvd+pPD3lURbHOfH+wLDXDm/bmQcEke3tzYxzTaO/IqIxdE/OXaSUlOU5sR1CyHe7W66o
	ykMH1jlbArDfxa0Y92kw28vO+ZJL6RDAR456vrBz2LDACQzquDQukrd/oN/y099rGjbUYrZwigp
	7UUky8tC8HRzAJKMIZfOfMKmo8+AvddyzShn8LOWfLPGG++Em70Ki4gZSe8/Lq8e5pOVxLHhhCT
	UduK4K+P8K2H8cXoiN1CrXeX1uiMPvqOzu6aefmwYQIolMOvAAPehEEZ4HPmXsDFKYyFJylwoS1
	vuiR8EOmkzxbgTvdxjfhIIP5oEq1QOhOXGOCFmI7ZWL9+N6Wq1Q3GvWGTbs5yqk2KCDdTWtZWyH
	5+MERIfHwUB8vUekQ==
X-Received: by 2002:a05:6a21:6d94:b0:3a2:dafd:3c02 with SMTP id adf61e73a8af0-3b22ea861a4mr18190165637.19.1779123968468;
        Mon, 18 May 2026 10:06:08 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([110.44.115.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm14932377b3a.45.2026.05.18.10.06.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2026 10:06:08 -0700 (PDT)
Message-ID: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Mon, 18 May 2026 22:44:17 +0545
Subject: [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
To: Jingoo Han <jingoohan1@gmail.com>,
    Manivannan Sadhasivam <mani@kernel.org>,
    Lorenzo Pieralisi <lpieralisi@kernel.org>,
    =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
    Bjorn Helgaas <bhelgaas@google.com>,
    Yue Wang <yue.wang@Amlogic.com>,
    Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
    Kevin Hilman <khilman@baylibre.com>,
    Jerome Brunet <jbrunet@baylibre.com>,
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
    Fan Ni <fan.ni@samsung.com>,
    Shradha Todi <shradha.t@samsung.com>,
    Hanjie Lin <hanjie.lin@amlogic.com>,
    linux-pci@vger.kernel.org,
    linux-amlogic@lists.infradead.org,
    linux-arm-kernel@lists.infradead.org,
    linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_100610_300741_7559542A 
X-CRM114-Status: UNSURE (   9.75  )
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

dwc_pcie_rasdes_debugfs_init() returns success when the controller has
no RAS DES capability, leaving pci->debugfs->rasdes_info unset. The
common debugfs teardown path still calls
dwc_pcie_rasdes_debugfs_deinit(), which dereferences rasdes_info
unconditionally.

Return early when no RAS DES state was allocated. In that case no RAS DES
mutex was initialized, so there is nothing to destroy.

Fixes: 4fbfa17f9a07 ("PCI: dwc: Add debugfs based Silicon Debug support for DWC")
Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 drivers/pci/controller/dwc/pcie-designware-debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index d0884253b..c3671cb2f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -557,6 +557,9 @@ static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
 {
 	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
 
+	if (!rinfo)
+		return;
+
 	mutex_destroy(&rinfo->reg_event_lock);
 }
 
-- 
2.50.1 (Apple Git-155)


