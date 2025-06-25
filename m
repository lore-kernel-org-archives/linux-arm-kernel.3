Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103E9C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oZHCaOLOu0qUkH+czAl5OFp72WAp6qbgZTYA1mrGPYU=; b=psXMyVqQ0DxPyDq1nNB2rzdXyP
	PCdMBEhRpyHWWXKFpeXc1B42hvKTcPzaMuYneam5pcE6gKClQ7pGmHlrm5GR33hu3IFj91P5OL0ML
	xH1/9ofrpwi4ugrwPru7dJtxar2Gm5ahyKDSsczfdmVRdkreh/rdh3ao63MaHf1634T412r/okAPm
	sAjzPeH2bf9l+5x7cAz175IwPIRkHzupBpwpz+3SUIUTMpRvKLdmohxvB2xV4ivWBDCEKr/xeplCD
	KxFDsBZaVu9h6jZMbdF4BCTdcksLZRC481SjQM148bTX95md6ESI1cisvOJL0ttRGo+C1IxmmYFh/
	QxoisouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3B-00000009TDn-1eju;
	Wed, 25 Jun 2025 17:36:45 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPYu-00000008fyh-3CoJ;
	Wed, 25 Jun 2025 12:49:13 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so815378a91.2;
        Wed, 25 Jun 2025 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750855751; x=1751460551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZHCaOLOu0qUkH+czAl5OFp72WAp6qbgZTYA1mrGPYU=;
        b=U/24qKDmKw5dxRjkBhUd+HVywxaHpSZM+tcV6rFrq+biqWIMHd3ptS04ldqYEoWsbV
         sWYTbRbdCFr3i563Y4ljWmyXVLu/YKF+vRTvN70tAFz7WXmC4XrCJY4ePyw/YFjghUmD
         ueYruFP3wO4t0Sg1UsbXc1jkIRwBns9laM6YV4FPUE+QtMPJ7jr2U4m9Hb6yUdkdXAgU
         k6e97rtPxk+eZiskNJoeT/Q8JODWosOMTD1JbgDhpwXu8N6OTe7oX/pWlnwrGcaHVUb2
         BkObBmB6Ota9XfQg6jDEB69d37TaHE2bxdrmZjyxO8j5+KuCzgKh5wHtrptrjEYYze3L
         Pp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855751; x=1751460551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZHCaOLOu0qUkH+czAl5OFp72WAp6qbgZTYA1mrGPYU=;
        b=Ok1JRRrUM6RKTXOUe7hF8zSFUnx0kbFlhwMHfpm4q9XclLYe+JTjJjVXyKU2Zn8cR2
         G/yCMfskoMKBkOgjq99f3PViAULnO+MQ5+2LHjAAHBeEnYxkntzKZ73QgZft5GzeIIcI
         Xa9ls/Dh1/4geTIrdo2mOZaG70ZF+hbEy5NAqsPALjtUOI2xJMicERfEErVbvnUi5p+y
         t7If63okLgJtIJtKXxSc0ZkHth7Yv0iXTgTSfmpUBWLsaAOqXiwYXlENObGPgvDYXsy0
         3vR42WctozILebQcf3v+4moyOKqQYIDjZqoJRl1TluiNYlD5KCkzUdOCC++nV3W7anG8
         BBUg==
X-Forwarded-Encrypted: i=1; AJvYcCV+MOG+xeJcEClvWQ5849+v7ay7wN6Oyev5e08lGOtZ/X9QldH07/H8NsMH1KWbvtPx7Lx5Kw0Xdeb2h2Nlm/0=@lists.infradead.org, AJvYcCW6Zvuk1Se5RiQJfaSUohTVy8jDzswR8ZXrTXowQHbtm4hy/0uuKHe9y/6W1qn8ZEhJXWkLtpDPW1nzGtPmRg6T@lists.infradead.org
X-Gm-Message-State: AOJu0YxUnAIIMYsfzxKdL7o0TQKtzOPnYsaqqr4KGlVdqxBR2Gkc87jg
	mPiY/uqofJQQRiR/9Qz1QdepNeooVwAZpr+TLYjGAvQkKSMtT4cUJ0Zc
X-Gm-Gg: ASbGncv1d/0vbFKUbpenLAyWXd/+cExNC+pgiJQmXDDbbnRwd/lYaqKqM60phgHACN5
	d/n9vqno/jNt1xEImr/IPcA1MOT3MzDRW7nks9fTEmwmEEGuyTSlFeN4gi3z4JanmbcTGoKW6xp
	k4kaQIZRixWZeXORc7BYVwa6cThFdt+jCkt/hEgcmttyd84IxqO5m1J3GitGq3jgYL6GmllzuUc
	v93WwDZSpPBt0x+HBQNxRe5807WwzBpbvTmzKvoIKU+0NPxM3NjqPrBlWdi60XqiWjSQGDih3T3
	/IWmxNAYQGXlZ9hOZYG4C253xXI9OS1eyrmZZDtCynMXuQzCmt6QSOb9Cthi/p3WPq0Criv6ZlO
	uGL+hz1mXrAMpj3edgR05slGX
X-Google-Smtp-Source: AGHT+IFqaQmTqwNghE2Dq9nBvL+YbvMQvWNAHJ2xzUeJUDe3uctj5MwE11BX1968rl1xIYmMD9hj2w==
X-Received: by 2002:a17:90a:d888:b0:311:f2f6:44ff with SMTP id 98e67ed59e1d1-315f26965b3mr4877927a91.17.1750855751204;
        Wed, 25 Jun 2025 05:49:11 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5386edbsm1870741a91.6.2025.06.25.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:49:10 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
X-Google-Original-From: Henry Martin <bsdhenryma@tencent.com>
To: huntazhang@tencent.com,
	jitxie@tencent.com,
	landonsun@tencent.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenryma@tencent.com>
Subject: [PATCH v1] wifi: mt76: mt7925: Fix null-ptr-deref in mt7925_thermal_init()
Date: Wed, 25 Jun 2025 20:49:01 +0800
Message-ID: <20250625124901.1839832-1-bsdhenryma@tencent.com>
X-Mailer: git-send-email 2.41.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_054912_802237_0F7FA1C2 
X-CRM114-Status: UNSURE (   9.67  )
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

devm_kasprintf() returns NULL on error. Currently, mt7925_thermal_init()
does not check for this case, which results in a NULL pointer
dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 396e41a74a88 ("wifi: mt76: mt7925: support temperature sensor")
Signed-off-by: Henry Martin <bsdhenryma@tencent.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 2a83ff59a968..4249bad83c93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -52,6 +52,8 @@ static int mt7925_thermal_init(struct mt792x_phy *phy)
 
 	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7925_%s",
 			      wiphy_name(wiphy));
+	if (!name)
+		return -ENOMEM;
 
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
 						       mt7925_hwmon_groups);
-- 
2.41.3


