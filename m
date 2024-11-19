Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5791ED591A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOil3dDH7JITIShOoBOkpe10yL+drWis3x4DtHVQ2HM=; b=mAep415AiWFk7O92MzDBTzjAqQ
	DcdY5Q8aDnrlCYi53Zq599TGin0y+TXgkneRgXMqw+gIYaR41kAel3mt3tT3m+Sm4fcSjmVDWRdPY
	vpVey04HulIUBy35GpzTrxT7GXW5u1m6Kh7hRciHaH5j2x5DcK5XBvxIjh6tN8z0pzhaz9QIC/nKV
	BHTDo96LJqLxGDY2rmy1izw2P2+W+dPNZtfXXrcatQnj4PaF7U1Qu77pekDnyLm45S+P8RFxNC1Zl
	XKs+iXL230NS8Z6cf1vQfHFny41wwPs9lacfpboybNbVb3kdr95e2pKZsylWGlOH+QhdblMD540WZ
	/Xx8vXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHKj-0000000BTl1-1P34;
	Tue, 19 Nov 2024 06:03:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHJn-0000000BTbB-2o63;
	Tue, 19 Nov 2024 06:02:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21210eaa803so20364295ad.2;
        Mon, 18 Nov 2024 22:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731996150; x=1732600950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOil3dDH7JITIShOoBOkpe10yL+drWis3x4DtHVQ2HM=;
        b=lomJKPo7U/suoBzHkfEtFDHbMLiNnsJO8DVdO8yDCBBeBHbDQ52ZzDwK1ccvnFE9ny
         z1oMrdf5o6LUxiHbPdzwhN3lVCOWFE6d4RO0scb0WqVrM/z/cJwgGqXPTSN2sr4nQCwh
         +VyF6FNTL1KdTCeOi4CqTr9/qpXRWoEjLB+w/pq7UdsTOGB2UQ4GrriIGZKv4yM6qGkG
         Xz9c+zlaG4CtCq6Iqz+6BGeARxyWA86Du2pUZb7xHkDT4rNOtMmLEv40T2pwQUtN8jrV
         X1ARk+M8n0bFZ9KQDhVBIvusm44cMqn+EMMGAcuF7CDF09OsQlQpoD26Y98HECxIap1r
         qEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731996150; x=1732600950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOil3dDH7JITIShOoBOkpe10yL+drWis3x4DtHVQ2HM=;
        b=vKz6hHOBCPURxJ3WRdOZp9kW6S7U717siWonFQRJ81oOTW3sOwCLAQCCG/QIc6s5U0
         9xkpVs9zHZ8QxQMgkb9M3p22cVYBBGwaVva9zqSwf3uCI64G2/Tf0j3hdLa1PxlaEHzk
         ZwJlYfrY4f211GsDy1PloN5Vu9xDoC2rMTSKfGxFDtGtiwRc0sJMsAXuDy+JzOILF4DQ
         bWm4WZK/mgKW6VW+33OnATwYscVJcurffKTpBWpenlMwDewAeqw0Dw2IDB+dS5DFl7nL
         y8n4v8axcVBKFwcsNGtRNW89Qmc5t77P0QL6X7s19CLfxDvSvZa+tjcap1ERFg0U7aqz
         /hlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5fW9n2xxTlLLa0mgjhrMz9rtBmZs69ZFS6i64w1i5q+s2ZTitLiOEvEj2/Gzns1wlEQU5NA0wQj43aQxR8Xy0@lists.infradead.org, AJvYcCXHZ168pSprXy+x4EQJWbe9bpe6EdNF4+tPgtyL0/PFOnbAiklgw1v/lmb638aoR/WBOBntbOpmgTdMeTlEjlU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZfAK6IWQCrNI+7PfptZjAtw6MupasMPUcA3lfQv/AF8CT2vwN
	211LvwhhmnrxHGNnCejkcVz6l9jVqNhPNEERqK9hMkL8GGn2cuE5
X-Google-Smtp-Source: AGHT+IE5jczlNszr/hQVgAIIjjWV07/Qlwho1T5W1FaBWG5/rSEd2Kg3I1/DhgwJESlr9Ah1FPEpJA==
X-Received: by 2002:a17:90b:3c0c:b0:2ea:4150:3f82 with SMTP id 98e67ed59e1d1-2ea415044a0mr10785886a91.22.1731996150372;
        Mon, 18 Nov 2024 22:02:30 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2124e973ecasm6588835ad.14.2024.11.18.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 22:02:30 -0800 (PST)
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
Subject: [PATCH v3 media-next] media: rkisp1: Fix unused value issue
Date: Tue, 19 Nov 2024 11:32:20 +0530
Message-Id: <20241119060220.70124-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_220231_706782_1F898ED9 
X-CRM114-Status: GOOD (  11.31  )
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
1519008). The error condition for the invalid MIPI CSI-2 is not
properly handled as the break statement would only exit the switch block
and not the entire loop. Fixed this by returning the error immediately
after the switch block.

Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
optional")

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


