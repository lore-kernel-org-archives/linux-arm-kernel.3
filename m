Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B2CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4fmK2IFe+fh1XGVBCh9dw/6nJ72mkqtroySmjWMxwgI=; b=YE0waWG1whJKmxeUUtV7p0jzez
	zH9N/p+iuXeEz8JJJ1OvkSpGqT75s+IhRl/tBbtF22AuMiLbdIy1NWBofSxLijAwnw/er/qL1jZ7m
	BsHANNVQUHQw5BdkwDo/M4OrjptqEDRwPGEPEUEOreyPBPz568yRHck0m7ievSdadlQwJVFtkHG/R
	qJ+TEjqRLBf+ch2g/lKuTty2bgfm1Jt1jbTChYbtXz/SjoMUYb5/OmI3Zmvq4E/km3nhC2iO0YGR4
	vcgiLFWQjp/zXjNxHN26SMzg4ETGQwXxi90u6p63gHu4P45SiMXvptPoC1Kqob6OQLXS/xem6cW98
	zctU1DMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1d7U-0000000GGF5-3WbY;
	Mon, 07 Apr 2025 03:25:56 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1d5k-0000000GGA8-0E0Q;
	Mon, 07 Apr 2025 03:24:09 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-224341bbc1dso32513855ad.3;
        Sun, 06 Apr 2025 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743996247; x=1744601047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fmK2IFe+fh1XGVBCh9dw/6nJ72mkqtroySmjWMxwgI=;
        b=NXGy/+qTW4gtCeDE83qIOzm12MP22PrtZLa+5Fe6LoEG/DYJsSiCuLvy618DYqYAvR
         60/ZciD5z4jdODsoUBSb3fU6W2OmEvWfNetlGZ8PcZgep7V9s2Slx/mMx6aicNCYFMGf
         4weGi8We7Q1y5TdSW7a+X8sN6tAHZl6c9pUZewNrhZea7gz/uOvXRK3+/ZvcTWurxdxf
         yN5SQZYTBn47u9lOOEOmHpPbgbPlr+dTUJ7hCqOwRgRje/WTQGoFYxW7QjLffg1HfuwO
         9iiw/HXGEEHBBY553AVozScD3sXDU913qz6h1RKtezCf/Pvn8EPpSjbMdj//BXaZA4A0
         Jl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743996247; x=1744601047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fmK2IFe+fh1XGVBCh9dw/6nJ72mkqtroySmjWMxwgI=;
        b=UrthGVOFDRURV/PsidDhdMVmDghsLsD6Q1fhL1+1Q9h0WHKSha9nryAMsREBmPkyB+
         MXz4Rk3rByzDJTfDHDzUK8Wge+ZTsLIQwPy1sFmMilDJKJPPnTsj4vAqPmRl0KPLEZ8q
         vhDeCqVa/E0B+LYBLZX9Dq2IUttv0fmlNilfUfDzURiA4+4Jba3v8fC+Z6/ndb9+MJKg
         dr2xxQcbn3/s8OyOTXKb+HgfGkBdMqL7VRrP3pZfQP45ogc6E9qhpNchbet33ZT9FKk9
         e2o9wmdLeQr3faRYIWCmc2TPlOtT7ktF3W3grQpeFAGxoaQscYADBORvPPrUruu81Xt3
         Bvwg==
X-Forwarded-Encrypted: i=1; AJvYcCUXmOkLGtTRK3L8cj/MFZZ8tIqtC2JyVrf5N+azmH5kO83fBLAtMDGmA89uBfmdulD/3Dg6VNPITJ5X+580tvVR@lists.infradead.org, AJvYcCXRhdUdWZ1UOgvhberzvFMbYy674YdAS6sJOtCYVlMl1wh8V7j+tdgB8pngsUNDnsc4U+9e1hb2tY6y5LczRbw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPhfw/puvU7TtrvuGaYTcn47UJ/lQRoLp8ymAmNm+1an421XxC
	tle0LGJ5VBFjHFiglFl3FVwBzVnOZLypzh3TADtUmyFmJ6AF0AlV
X-Gm-Gg: ASbGnctEzL3vlUJ4QdFZw0UVtd1nvtONEZ0TLBPs7TTbCuBYqTx4xFSlH2S5IPyg0Xy
	8hLZZ2dsc1UTCAZJopbm+fyM0YtMUEjzdg/s3FpE9ycXFgvjOR5muv41uarnsa62+ueM4nirfxX
	vFGNBTrsb4LpGJse0Eif6+wAcRTBqY4NjGM0Ta4+P3qHjl8YyYXMLO5ImajVzJaZu4GoTSeMXB9
	1qeI8qVCwSozWCbtKuF7/LEfWuvYbpMfQOQ8PXkLpkh38ugEItEUb4/f9oBPpf+YHhHbsQWZi9R
	4TVArDO0h8mBi8detlVDoYXPdvEju+g7ikA+WaLVKVxgfut8iGTfjN2iPX1rp7/eDADQRZ0=
X-Google-Smtp-Source: AGHT+IGiiOhCXltCwB7LH7Uukc7MXJILMdaUq06pKBBwQ/EOPL92BM5re8lzHelAZXPlHg/PFyG3ew==
X-Received: by 2002:a17:902:d485:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-22a95529550mr123048075ad.12.1743996247046;
        Sun, 06 Apr 2025 20:24:07 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978772ee4sm70065505ad.233.2025.04.06.20.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 20:24:06 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	bsdhenrymartin@gmail.com,
	rex.lu@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] wifi: mt76: mt7996: Fix null-ptr-deref in mt7996_mmio_wed_init()
Date: Mon,  7 Apr 2025 11:23:49 +0800
Message-Id: <20250407032349.83360-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_202408_094635_CAC50BF6 
X-CRM114-Status: UNSURE (   8.47  )
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

devm_ioremap() returns NULL on error. Currently, mt7996_mmio_wed_init()
does not check for this case, which results in a NULL pointer
dereference.

Prevent null pointer dereference in mt7996_mmio_wed_init()

Fixes: 83eafc9251d6 ("wifi: mt76: mt7996: add wed tx support")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Add a blank after the check and correct the summary.

 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 13b188e281bd..af9169030bad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -323,6 +323,9 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, void *pdev_ptr,
 	wed->wlan.base = devm_ioremap(dev->mt76.dev,
 				      pci_resource_start(pci_dev, 0),
 				      pci_resource_len(pci_dev, 0));
+	if (!wed->wlan.base)
+		return -ENOMEM;
+
 	wed->wlan.phy_base = pci_resource_start(pci_dev, 0);
 
 	if (hif2) {
-- 
2.34.1


