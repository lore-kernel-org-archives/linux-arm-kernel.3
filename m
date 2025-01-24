Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8406C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vj1NaMTUsVA57ckq/QD9h243Rs/TkZbkHkyDFlhTqVQ=; b=SjWWIaDtmRf1Fduk/fNtWYvMie
	hzT4km6v6WTNcUeD5n/VNSRKhgRoGrOHM68PnspArWhZ+Kj3iarvfLo1GtibmVvy4hN0Zx1ZRtfku
	3NF+hEEBbjfA9DhcFvARBFBEVUkMkA1V42SpTWjXrJHRaerp7y5mK9PNuiJ6cbwP1qrLEsRsMQM3L
	xxYZ3P2+wd/H/8VgbLhYOLhrjaqxXokruFJMXycUvvmYz6fyZ20mKAa6kWrpsDnRSEVGAjohGLIza
	ZteBfGLMMfh8kOYMdO2jxgwWrJDT2KhNRLq9VJ/qoB1Ve7ALdnQS0AdOre3B+fat4aYQfDKdwd+nI
	cjktGmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAzT-0000000DrUP-3TP6;
	Fri, 24 Jan 2025 04:08:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAy5-0000000DrOy-0ZAw;
	Fri, 24 Jan 2025 04:06:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-215770613dbso21056855ad.2;
        Thu, 23 Jan 2025 20:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737691612; x=1738296412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj1NaMTUsVA57ckq/QD9h243Rs/TkZbkHkyDFlhTqVQ=;
        b=RACbIuDq11FpuGjt5Y8HWY/zu5LSoss+5R/9g7JHkyyitLU00MLU2/oIefu+FXW6Oj
         Tx6ztan3/BiRJTggRfZiI4lTmdQR98hQXuv7NbZFHb8r+UFMJkTcos7Usg8puqTaddCT
         7z2p20WFFEWiMnMQBilLVJBUsMw/5ROU0v8ADatH/Q+mHzru4XN6L4oKNPFPb9ZkX8pt
         IDTD7+8f9C4+xX8r+mkqqSAfBMguX6cDbTWdyWeqwgmo97wAyq3SCW3zkM5VPt8S90AR
         zOPdcuxox/7MbyfeTbdzrO+Ns3lJr8psV+zAS+7udLgXAYmgOpwvs2vpMHdlMKIRauI2
         AKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691612; x=1738296412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vj1NaMTUsVA57ckq/QD9h243Rs/TkZbkHkyDFlhTqVQ=;
        b=Z/F7oPrSeBRWdejY6R0fh7fxtwWwADJEevuYypMi4HVqBkE9Iye6CJepsoPMCA2POT
         yS/tfmQbOMWkMlH9JakJIcfj11+voA/Nk3NS/gKWxLF4aJylFBC1e09n/H/m0SKR1VQt
         GIcBhWq3Zfd/aV+/tBCD+IYCg2Sjh4dRXgx4mWjkeLtawErgrxu7ES18V1MwVecNY2Ko
         yjOupxqLcCaVDk4knX2o56SATue1XOPCENj3PL4laNhhocse/BT6YOVhufNR/EqghHn/
         vxbqFUBWXUDUdCsMDEhqQnRfyzfQ2IzwvKAmcVRNSs8nh8w9uC4joXa/yqeLr5kl+Moi
         aJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCJo8eI4rbCFzM+IT5vLWFb4NnceNzryEETzx6g8wJrsGDkTWLsfvUN15xVNoSa4Zji7cP7ZTl+4Bs5ktX3gLe@lists.infradead.org, AJvYcCXbzZAFk9Cp9HqsQ1NL/NljNofT3qHWRPVc9nGr/sV50dWIN/FY4G23pukhV5UhSfO5T6jNmtMDNCMH5/uA4YY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8x4ehKNnJ1R5zELSVfD24XUkd3/IjXDwYiq5cqWq2UqdLE4+E
	vFbWVojOnhmyTW1EV6LCbcQs352+nEJ7VID8cIGEnijn0b0QUW19
X-Gm-Gg: ASbGncsKXNh3H/n7x8kgpx4Pe3jRIdwt7f/bZVuqHQ4g1qOchEWhwlddQ40BewQD7Vo
	etuOn1iDe4n7iuZwl01nn1iBIXDzPf/6iTdzkMZVu1GN24534Zvyyei0dB8Ddj6bfyXmyEspEj/
	xGHMr5sYzoq00RRflaYoQaHfZa9Fb5VscfxF5BAcNczyInhQCToYqpzBLxxgkS3G+WEkF8XFDgP
	qT9PBjCBGX3cctUfm4/ZHERJExquMtXbs0YQmeAOyGfsUtKtgwzsVaBqODrw6vtG/NHttr10E+w
	RRr9EZ9DyZe80EnL0DUI1JcHAdsQoA==
X-Google-Smtp-Source: AGHT+IF3SHS7uGw6j2HUHGRc2o6x9hUUGZICmg9DQKSnpjYz1OzyDi2k9jgSfX5GniU24Huia3n0zA==
X-Received: by 2002:a05:6a00:a2a:b0:72d:8af9:bc64 with SMTP id d2e1a72fcca58-72daf9ec17dmr31990363b3a.9.1737691611690;
        Thu, 23 Jan 2025 20:06:51 -0800 (PST)
Received: from jren-d3.localdomain ([221.222.59.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78f145sm795398b3a.167.2025.01.23.20.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 20:06:51 -0800 (PST)
From: Imkanmod Khan <imkanmodkhan@gmail.com>
To: stable@vger.kernel.org
Cc: patches@lists.linux.dev,
	mchehab@kernel.org,
	fullwaywang@outlook.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Imkanmod Khan <imkanmodkhan@gmail.com>
Subject: [PATCH 6.1.y] media: mtk-vcodec: potential null pointer deference in SCP
Date: Fri, 24 Jan 2025 12:06:41 +0800
Message-ID: <20250124040641.7431-1-imkanmodkhan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_200653_182715_96BE6BEE 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 53dbe08504442dc7ba4865c09b3bbf5fe849681b ]

The return value of devm_kzalloc() needs to be checked to avoid
NULL pointer deference. This is similar to CVE-2022-3113.

Link: https://lore.kernel.org/linux-media/PH7PR20MB5925094DAE3FD750C7E39E01BF712@PH7PR20MB5925.namprd20.prod.outlook.com
Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
[ To fix CVE: CVE-2024-40973, modified the file path from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c and minor conflict resolution ]
Signed-off-by: Imkanmod Khan <imkanmodkhan@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..27f08b1d34d1 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


