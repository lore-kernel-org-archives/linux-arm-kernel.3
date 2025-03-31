Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF75EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8hC4q30f9UkZjMp/7IensIAT+0r2jKyVixXgW1Ksqww=; b=Dt9WqayBPNI4fTPAIT3sSdTL8U
	MBNQCYddZWJCyJ3ZeIrCyJnLwOwbKprH5a/0uIQc1+0xOkSJbmqO2F6Y+S9g+yu3JQIM6MTuT459n
	tCSdrrIULOusSVfhFzdWJvA7fEQdo1ip4BdE4QbLo989DlcyqS4GqdRTgI41ATEqN+AV9Pu6i/x/Q
	cjSvCRlHGVe/H6z2Xzo8J2t5+liFShc7WFrwjDX+ThibUTbEfebjoK4rK+u2FNHP5MoKFm0rzGG1N
	TOXw9osiggMzkigDWX5r+Hnz7j3K8vQ0nuKa7tC19ZO+QISpHLo2EhfMLjAEofPAO8iud7opHnlK8
	n5Pn8gmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCay-000000006IX-0a2M;
	Mon, 31 Mar 2025 10:42:20 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCV6-000000005He-403l;
	Mon, 31 Mar 2025 10:36:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-227b828de00so73898795ad.1;
        Mon, 31 Mar 2025 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743417376; x=1744022176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8hC4q30f9UkZjMp/7IensIAT+0r2jKyVixXgW1Ksqww=;
        b=GdkFg7CLkwmtHlJIQ1fYiUw56q/7WMV7zcfi7+59Isj20GyEMMdhsshi+TtVO4IBBJ
         zYcqq1GoAQ/j9DAUisUvyP35yZzW5d8sDCBTNf7hZs3XTd0NzqT9onKbfGF6GwWyLUjH
         MKgGqikW6QlZsrceKUW7csCUihH7NaQb+8+fnXPHVeH+RYF01JlOlatruip9EPM5GoZT
         SluZgDpYmgeGrE3j9IsFsCqlGj3kyvK5Wew54gT/zjSN1ibQznpETbOngwtpO7VF2UWW
         IxwqIi9ZdGo9gPq6EHdDrPO3MUKXCj/dZ7X/rw7i+q42Yn4oWuNrip59a8QK+rtOqCFK
         N0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417376; x=1744022176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hC4q30f9UkZjMp/7IensIAT+0r2jKyVixXgW1Ksqww=;
        b=UYq/+a1GNTcs0n/jvjo+TiAFG+j7XioR48Su/2Gg9I4enYg8a3wVhN26GQxWYm/G8R
         MxHFdIynKSUoPe1TLY3JQjQeB1ZfcGdYNoJ4qM3NyHBTKzfhhyxPzSHgrIHiwQXYi5nW
         Yx+XTZgi8vZYM3Fo/NU5iahEV3oTHJ+JXvJ34MN5sAloLgRstew5Yd+TR/EyZ+nVocl7
         UBW+56qs/fLsBayf8d2vEX71z3VHqb2VTaMKOinAkg1m3EoLHoIf60R9KWzzWnUaIDSW
         +/XYCzXBGOumvGWFk2T7le+hXgyqEn6Roqgh1ZyKY0ZLQ01Mevgs5vmJmpJ3LxI0n2K+
         WBSg==
X-Forwarded-Encrypted: i=1; AJvYcCW6bWRAgdXofrUF/bJPgetrBMY0onRnj58v3NJ+VYu6QczTylEEn2q6R7Wht/SyorAW5f4iDWiRNNC8OSZW/WgI@lists.infradead.org, AJvYcCWc4wZ2JyrZfuFHTQaxdLguSVzgiKyR6p3kPS88rBJ4yBf+12BiNBx0Wfey3ym2e8PHBq1Yq9n3F/z93N4wUlM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwEtRZtQEZUvzL1hFqfFgmkKRrb+kNxhBKMc832ISodhXdPlob
	w51PVpqO+kQGntD0kpHaDturLnyr60E54Ttr4294UOzklMu4HOWohU6v5ZrWxTYpyw==
X-Gm-Gg: ASbGncultuqYRnBLvSX1We1WnQ28rMsWKs5ukMqOR25Z9+LKa/2NlJ0WHO6g7dVcrDv
	c3LPHbJ67a0fIO4+Xn+iSUZ0fqbCzo/noZ/xSIV9NqsyKne6VTrnwXCdQeyZdquKvmtcsX3Erzw
	8n6uH3MnCbPnfkJJfAW4r4aH8v2zHNJeyit2eE8r6zuGXbDuIDaFPr/7K3L6FcbHPMvSfQNzEQD
	52jDkwCbkMCoyI6Kipe7hX70d8rH2kl7v5FRDl4+7wunOMYJEtIeD+HFIvku6Wev3ogJf4u/7Ll
	B2PlF0eWYrfGs52McSCOBPNusLQOXr65xGZnqvbuePSAA9imuMgHs7yYGHehHu/hdQ3cSLsHsDI
	JadiV4g==
X-Google-Smtp-Source: AGHT+IEI3i1AQFr0jMC8FT29Lzc8UGqmVmTq4ieOAqus6bXWPKmXMnFF1f9vgpgb+tXlgciOTA5wLg==
X-Received: by 2002:a17:902:ce0b:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-2292f9e62d6mr157774965ad.38.1743417376277;
        Mon, 31 Mar 2025 03:36:16 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7dd8sm66104645ad.226.2025.03.31.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:36:15 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	chui-hao.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] wifi: mt76: mt7996: Add NULL check in mt7996_thermal_init
Date: Mon, 31 Mar 2025 18:35:43 +0800
Message-Id: <20250331103543.9154-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_033616_988643_EAE1AAE6 
X-CRM114-Status: GOOD (  10.13  )
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

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function mt7996_thermal_init.

A NULL check should be added after the devm_kasprintf() to prevent potential NULL pointer dereference error.

Fixes: 69d54ce7491d0 ("switch to single multi-radio wiphy")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 6b660424aedc..702447022f0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -217,6 +217,8 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
 
 	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7996_%s.%d",
 			      wiphy_name(wiphy), phy->mt76->band_idx);
+	if (!name)
+		return -ENOMEM;
 	snprintf(cname, sizeof(cname), "cooling_device%d", phy->mt76->band_idx);
 
 	cdev = thermal_cooling_device_register(name, phy, &mt7996_thermal_ops);
-- 
2.34.1


