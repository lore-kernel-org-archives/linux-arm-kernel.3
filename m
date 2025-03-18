Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF532C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zpMoor3dBxgu172XtLCnpvR9tyAyuKLKTcHfjZ0A4I4=; b=ULX21n+9Lmkcun0qkGd8D+L7Lf
	IBnIT+oan31eNFp9RcOmN2fD3swGq7ekFUH2ixedvuHxLE7/+l4mHEo2nREb+uZ0tK2Y8r5Kum0yE
	fOk3BXCX95nYMBfG6HFYRcVCt54gwq7zETIPzaxWKYgeaMVpBjniCfkVBOLW6n/PLb/F+kOUYukfC
	OoySSGU6XD4Hf+/l+PSPX/zpgbV0a2U3abmvKFEg1qdB2pJ3si0+cqtiMOj9M0oQJiHiUbY668+Kw
	GxCaVV3xgHwWxM9B5lGi2BdRbMAvuaIVeEnMwUJ96vbjkd1bIk4ZfTA2Jz/jhRllnpGk3hSQj0Zrj
	kUQaRr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUug-00000005fnf-3ULu;
	Tue, 18 Mar 2025 11:15:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUlq-00000005dw7-2aIZ;
	Tue, 18 Mar 2025 11:06:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso5683220a91.1;
        Tue, 18 Mar 2025 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742295965; x=1742900765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpMoor3dBxgu172XtLCnpvR9tyAyuKLKTcHfjZ0A4I4=;
        b=ESLQnkYDvKxdLFsHDsPd1os0llDS6a5uk/JANz7ZsRgriTFGf3ss5BcEtiZ7ZRxntC
         pxgEo+4oi7nTekEPtnSa886m61MAP84QETywJL9Zl737IVexteizST8DpNxhlSadS9Tr
         sCFGp83UpR0e5DM4xWOREQSuYbsux/tPScGF2jtIk0/TZefBdOXfVW1cD5YeB+GXwLRZ
         7uvwbJlVQD9ILntXx2JCSvxfNK+8Eu6AlTxjWQJsEu8iZT1ulfBlqzoLaIlLBEfr9OUs
         wCsIuF+QqjbBQuGae4eB9ifcqiw/IYR6WEoy+emwuib6dkVXvfnxssmPzTFwiJ8iwfHR
         iaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742295965; x=1742900765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpMoor3dBxgu172XtLCnpvR9tyAyuKLKTcHfjZ0A4I4=;
        b=qvqDLsabB3uwRG3lzWGuSmJfH/ZxZXqVD9aUuwE3nvVd77vtf1xM+Zgj8CmZi0V5h7
         hD5nWfAXAOZgEhQJEDPWmQ7h02cIZW/fWw1xo/F8511svHMP/eCMD/Dw3yHv0Ne6jmm1
         2Cqto3o+DGec3EelTRBpyjEPRo5tUzh70VzUkY92IgIrKeCPIsKPwHphZ02q0E4JAkeG
         Y3ced3FXUfZLG1MZ50cLy+xrERfZIGamR8rtmAdWsS0IqBmI0UtILjxzjyNZCzKlPuAw
         8TnzgHRLxRrSMJpUj+6JcTYZRG9h9L14abO96+0OGDeRJJ5hyNd/ZVw0WMoZOs3bO1wZ
         tcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCLrfqoUz/K7umC7qYIj5NUg0XnnLSyEJTdHBUn2ivNMKXKu7lCWHa0CbucUInmVayfAdGe+KJGzyz+6UcIUFb@lists.infradead.org, AJvYcCVnU+O59MLsHdrS2Vp9AlQ5y7bdtLmTK8HK29ZS3wlnDwiT7Eel+zBjWi3SWZ+gtmu4YzozOKRNwXNd5aVahFw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJR78hpBgrRxq/Kgu5csTZP9h2EJBg6LPDeVcf1IrWm9P8Zb8b
	/pSDng882CvxWcwKDxCU0Hbas5kMEiVhzWxwD+YR0TqJKF0dyxKr
X-Gm-Gg: ASbGncsNeKPn3BCn6RdEtKxQLzBqlGpDu68jbirW+XE4P28wyG0yCLBuVGOiL0XyG1e
	o8DjtCfW/u0gdcT7pyhwJsLRlhbnnPrXR6VBsiqqYx8H18Nnbi9RPDByPtRRLurPBRS+qLLu9ac
	DocI4xhtue7axLyp2DpNLPWpSqjwScNgyrcjUeWFttNzDUzP5v0tz8C7eq88n3/sccXYOTqNi39
	/+R/xFI/pMcvc1/AI6d0FkGcRUZ3F/3CD0XAfyYMIh/xbBu4mwc5kFDa7NuNaVuzw+6Mm0lknX7
	cQvWRbAK5E9jKtF9W5Cu4fSjk2OsDMRf0+y1nmnbXlPfbiSZ2h01ZuZPZ0XVfiSvYcg4Md2B9eD
	SLrM=
X-Google-Smtp-Source: AGHT+IERa90JABWCDbih4/KSJyahmNphPCQsBv4vNHzGIf8QKc+5jhhkS4+jqZA/ZsgnGvidqB83cA==
X-Received: by 2002:a17:90a:e7c4:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-301a5bde7f8mr2666252a91.11.1742295965236;
        Tue, 18 Mar 2025 04:06:05 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-301539ed283sm8775205a91.18.2025.03.18.04.06.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 04:06:04 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fullway Wang <fullwaywang@outlook.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: linmq006@gmail.com
Subject: [PATCH] media: mtk-vcodec: Fix reference count leak in mtk_vcodec_fw_scp_init
Date: Tue, 18 Mar 2025 19:05:53 +0800
Message-Id: <20250318110556.903-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_040606_651279_4C281901 
X-CRM114-Status: GOOD (  11.21  )
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

scp_get() returns a reference that needs to be released with scp_put().
Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init().

Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index ff23b225db70..11ab3bc60217 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
 		return ERR_PTR(-EINVAL);
 	}
-
 	scp = scp_get(plat_dev);
 	if (!scp) {
 		dev_err(&plat_dev->dev, "could not get vdec scp handle");
@@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		scp_put(scp);
 		return ERR_PTR(-ENOMEM);
+	}
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.39.5 (Apple Git-154)


