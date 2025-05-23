Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230DC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=; b=zZTWU1iXdPps9RC/EmXmqCzHzk
	vq620W5Y6uuvp706Mexj5us+5hBfqV2Gatg19Jn0hDYjDJq1BGNxe6SHNpdIvNlSipdx1a5nLbdzt
	WWj5Ne8WBvdfyPX/q5UwKiP9r2CaUrhokPqeUZdhLswbk0jrgLgpvbyqDdfI2y/E/eDJ9dcL1jUa+
	0Qr+aUobzsatobwweBquElbzm2UM1YeqOHXTYxcY/xzvIge+AZTWNSp+I4iT1S2yD8xu1tFEDWYZD
	ClVANElogThy7+G4j6feQWIMVOSAciw6HTcpquVjVzL0wYHxdVeQP2+YiTxsKj6M1K3sPgVnpS8x2
	2ZQKQVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVip-00000004TNV-28ur;
	Fri, 23 May 2025 16:58:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUpp-00000004Kig-1Cx3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:01:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-44a57d08bbfso16366995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016084; x=1748620884; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=;
        b=GSVKmstZJ46BTEwJ8LMrZWpKTaS7VKoQ7x0FW3hIhNkixbBLpwvtiTwwJJZfW5+lL7
         qZt4A7tcnYpZbD6ayTh1uk8g38vIpcmjYLSslw7bWEmbW/Eqk6vmt89Fe5CY/3bW4o/Y
         nRJ5Raes4UCfAWyfczSqZf9JNSw0Si7ZdDyMmmsSUl3/pUWCiEihD2PTtYzgMtwATdc+
         j0E8uqUvcKD9U9O16hFUfw1ukRT7EXBlBrB1zf/M0P9cQ5J+YWBFEsRFlcuIczBA75rF
         /Kwq+Z/xO5NZ+X7M07KpRgrhXlWhsl8UnnPOLw+5RbzbDDUGgnf/zi0sW8p+GMxRI1TK
         JSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016084; x=1748620884;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=;
        b=YrKToCA9A5hpiMLxsfgl0ihmBUy2D3+NLfzwLBqTdhAkkfZ2hDNf4DJj0oXlTdtHOg
         emAw7QyEwunE+SrQY1HqBoD5oz/wCGjPlY68MKjMIDZkiMYFFCF+YPebY94leNoiDTHe
         KkNzxu4UId9aJjG/JgexJQvEmwTyVsybkndCPIDZip6l5ld9HVqHmzY8X+kN03Iow+OS
         QLMEssxaqNUwD9leMB7CI5Bq68Bzq9G1x/mHMZcrLNOusxiR+3XFrxuby65gxJ0PQxYu
         8SmuNbxgjlZBGCRI4V0TO5vkF9ePfSphrGfuZrJhagqzlMhdQdFzkbgKg7MOttdtScee
         NH8w==
X-Forwarded-Encrypted: i=1; AJvYcCUmjMJuuI9CW1ZOdnuysDo1QivRI+SZ9LkVgUnxCF2v5TchB2BxB69XjP/rplb5jKqz2unUaVTZ/CW2Z31qlVTZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt05fxkd/LcQneXyssjtf7hTHN5LJMoqOw5sVL8PEF9Nm1Gt95
	yIcd9+YgIVPpYEeRywblCroweft1QsUyZHkFXdFo3vOea1MvNEnVaDdBzTHPjBLCjN0=
X-Gm-Gg: ASbGnctrl4h44WH/OsQTlerPoANwpuKM86lfL1F1tMom+SrRNYswjRftWLzxrDCm9JK
	mplCCf050ynyjSh0gyptxRwlH88o2YYnpSp4fKJ4mjYTNGJE+AguZ+yk74HS+T7XMr2nOcFHW9r
	mA8SC6UHm+RqVjGeXPEsHoTqeth0Fx/5ItlLbHhZikIE/VTY5aTTnZN9TfLgjBjUZhXpNS5ph5n
	F/AecE2I8SxH6bLs8IKbUftxd2jp346/UkLgxpbZUH2OXyGknVpXibvTheNstM/hs/ljx8i5Tjr
	kq51uEu6aUs8wfXSiMaATNlI3gko2nVDeS8HWQy0tDOIX6dygHti9pbp
X-Google-Smtp-Source: AGHT+IF/THP6E9ZS/GCIatMYe54LeoFTYKNGEZBFtW+dbZFIBIbOWxAiwtQRKvPBgXMHhn/LPjXNiQ==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr331857925e9.15.1748016083583;
        Fri, 23 May 2025 09:01:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a364d2636bsm24546310f8f.99.2025.05.23.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:01:23 -0700 (PDT)
Date: Fri, 23 May 2025 19:01:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] coresight: fix indenting in
 cscfg_remove_owned_csdev_configs()
Message-ID: <aDCbz3J5wibnW60S@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_090125_323519_D352DE10 
X-CRM114-Status: GOOD (  11.22  )
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

Use a tab to indent this line.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 83dad24e0116..6836b05986e8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;
 
-  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
 
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
-- 
2.47.2


