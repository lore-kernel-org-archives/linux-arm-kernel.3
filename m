Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8583AD49206
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW2IfhgsXhjkhuWBMY7B99CaNdpS5A7CGa3sZv7P9ac=; b=NEB8hOO1zd4KWPJW+6HSfkaA5K
	WwSVQ8hGiTboc72Z/R86Gmj4f+8RPc0NNHUJSxok5liOCTORbKU/fThKhC7AXwzYSkFQt7gh5Gx+D
	umJtVOwzz5sdjJHDIkBsytdASn4zkPMaXmmghOX7Cf8xSsQy/qwHPenzjRE6meCRU1l7PvKWFvfz5
	GttKV+WUvCJ1NkWwJpsYFfZh4dznRQ3EOkijMBMq0ZoCB7j2MjKabLx9vZ9aAFStc2v2mXAq187CY
	LNnyWfwGAs5tn/j3i+nZB4IR6CxOwET/mNHeSVV5CC+9rB/XjyMuML+EHoQjiLTmoqjw4aR//6gmi
	VSVEHb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyDF-00000008wLe-0QUY;
	Mon, 18 Nov 2024 09:38:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyCI-00000008w8u-3F5A;
	Mon, 18 Nov 2024 09:37:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so2896444b3a.1;
        Mon, 18 Nov 2024 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731922650; x=1732527450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW2IfhgsXhjkhuWBMY7B99CaNdpS5A7CGa3sZv7P9ac=;
        b=OwaBArFn1QgYXqzfBi8l1BXLmITOH7BYyGZ13Kbb0Ii+S8jVMmxx4AF9rVPg0W3rm/
         ZzUqHO20tWqomsKBJ6GdTphd/i6z6BtCYh1UGv1CvelhMI6IW1euJM1tWOPTzL1KWuL8
         AfL+VmNIujvODI+jo3gLwmJy/3OOafE3R39cnPCp3p5DS2h6YyBJlejSVEQlzzGMJPTX
         6nLRFQLmsoC/EksMZkYQ3LQohjnzOsMMvnDby89xivso4Czy+5Ek2YPjM0jxppoGiR8j
         z+wAyHFeXIMM7+1Upm+69t3cV6qObRe9c7IJfkKW15cGKxGZVQmyLTwjU3lEOmTrJUO/
         1RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922650; x=1732527450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QW2IfhgsXhjkhuWBMY7B99CaNdpS5A7CGa3sZv7P9ac=;
        b=CP+iTTufLEakLPNiHsmEoFFs4X26cxYJFZW7WWr584Mxzh9W7F/+t7JbLvl0oPOB+D
         oyY/VJfwddwKNfmZnwcTyHzFaZSUQbvl2e+om0l3t1zJhHg98Pmk+5zNaxrlgPRw9CFC
         2q/glJPDSEccXtsBwCpbE6Bhk4COWBCi0LZKMj59JezxRh8BUpDxo5gVcjDaLRR55svK
         5/cyh5AXlxsUHTKIPTx5srCC7E+gZzXsK/CQfK5/Uwzy082H+Icb2Zj3qO/dbaEA9X1N
         3A6FyTiGWV1vz1vA0OQPUsREYskaHaMLmOjmDDhRJ4OO4vSMw3E+Kw9N69gyfCyWifRD
         0rfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/TyOTmvULURXH0Jj4QTkPqpkVkcI18maoqRDhEYSdJNu/b2QPMzkZdbnpgn6aS5BjIxiryCrApxsRrnPHSLc=@lists.infradead.org, AJvYcCXNXRqdiIN5bBpS4cs0p1TPMUZW5y76GjPwWedd0l/FwVqVFbzX2vsHBx+XbgBv1Kj/C7YZd2xQDgF5piTDx8qe@lists.infradead.org
X-Gm-Message-State: AOJu0Yysx16R7nreLYrdr5VJTUIBxE6tbMEN7e939B2hxgvZiErPmcUV
	tfSgqconfQNVRjCFjwVQKJax1DQ4HbTm4iwat1blWfDTQy9iBjqN
X-Google-Smtp-Source: AGHT+IFnG8Al6NvOlovgTgrF7vExh8IbHZLAN5WSBXRN88bM7aNfyvAEiT0oobaDYvExVOElAobNIg==
X-Received: by 2002:a05:6a00:4f8e:b0:71e:7887:81ac with SMTP id d2e1a72fcca58-72476d1764cmr13964427b3a.16.1731922649762;
        Mon, 18 Nov 2024 01:37:29 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724772010f6sm5716632b3a.195.2024.11.18.01.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:37:29 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Date: Mon, 18 Nov 2024 15:07:21 +0530
Message-Id: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_013730_809221_897B7E80 
X-CRM114-Status: GOOD (  10.57  )
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

This commit fixes an unused value issue detected by Coverity (CID
1519008). If ret is set to an error value in the switch statement, it is
not handled before being overwritten later.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..9ad5026ab10a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			break;
 		}
 
+		if (ret)
+			break;
+
 		/* Parse the endpoint and validate the bus type. */
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (ret) {
-- 
2.34.1


