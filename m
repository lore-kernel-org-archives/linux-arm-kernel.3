Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089BEC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nsBQ15KPAbNgDIj2dwTdXPvw6ebbg9GOZ64wqvoRjZM=; b=DmPR1VXZV1h2/5Jnki4NbjZKbd
	KaxxoHxzm4x6s8SizY+ZN6MVSOkdvk0D1UBxHRp9MK8keoaHIrvAl/zpoqzqRNUePbsdsBXtcrf5N
	kvOxZOZh2PQ53o1OUp2bkHISOPAECen2C0hzsE9HOH/Om3OG1BGIAVPpiDH04wh9m+x7JuFZ6LJEe
	l9Jl+BLSE7iluukj2Lkc2V6RPsBNmV0q+YLFd1U2ZBfmpbFD2o3wI3ByLpBuOmiIxxuvC/mxDXJ4v
	o7YenLdKYibytGopu9F1y1lxBIML1fLm/25sgLXfD4fy2XR+syyY50h3dGOL/mY9XBxZgbvvD7e+b
	zeiqsFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfr5-00000009tpM-2W7h;
	Fri, 31 Jan 2025 01:29:59 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfpj-00000009tkp-10tf;
	Fri, 31 Jan 2025 01:28:36 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so13238506d6.2;
        Thu, 30 Jan 2025 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738286914; x=1738891714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nsBQ15KPAbNgDIj2dwTdXPvw6ebbg9GOZ64wqvoRjZM=;
        b=UODF0KbmvlHbVJZWGk3Z1rc0dm0P+T7ApXMxXtj0czXpMWCYfNpICigEEqoknm9L0L
         57W8RPC93iuWxUFls62IdP5LmpCfczAPvKfWCcoCeJc5DL4f8AgWn12J2au9K+WIF10s
         GxYv1ZGxT7LGyXos6HuJhe5FtsLZNX5LugC/7HHMISBjhUSpwOw+dxb/8aKuk17L4zVr
         0aLielrINZYvKpum905yrkGEWOmh0TnHVP3yoE5O1NErSfv+vq+vD3flBJ9MC7QV4BVw
         jrOt+LXuQaIIOyt8yxDEITkuUEd7owUWE9UTUv2HOrMBBTZLG74znjMoNNQvQq8u4lDq
         We/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738286914; x=1738891714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsBQ15KPAbNgDIj2dwTdXPvw6ebbg9GOZ64wqvoRjZM=;
        b=uuRdpXflr2rjcfZRTiq4fp0cgKjk8C/LWtOCEYGurHz0j6Jj0nsDrAS1Tj8q1E/U9h
         cgqXE9zC9DB1JB+cdsvY1h7KYK/z27DMSA7pJ1Lep8hGJmhYr2gmZf4tt80DfiZmQ9eQ
         syoEaAHekUwz+sAJbb0qNTUJIMEoh9QuSG67/d/5zyYlePKAHLjmzfrGqD1f2ECqn3sr
         oZLs2LtA0MZJ/P2c1LSjMGvaWt8q+4qBg4Qhz1mvNl7zvuzJBn6sIXrClcqNVUgm+3Aj
         Kj73VTW1B8QJCRscg3rhZkENCkCEK+U443jHauFnSXOjc7RS8Zfm4BYZ9t26iaevjXzy
         do0g==
X-Forwarded-Encrypted: i=1; AJvYcCUUUlsB+jBY3fUE3hqQTbeUbIjD5GteasifBwT9Wi7IE8Lm+dfaXwyxRaPehmMo753IVjoAGWFobfQ3LVgqWtg=@lists.infradead.org, AJvYcCUkO8tlCNJNODL7bNeOS9KiQH5d2UnmWoN0PeUeX7vPXiPFvnUZiJ4FfkBQsEfnNlKnZaNsG6+Hb1KeNgJtldAX@lists.infradead.org
X-Gm-Message-State: AOJu0YyaXOJkCJXm0mSKOBVYRVft2hKW3KuD3IKsnYatJNOO3Zb56l72
	zFuJ1x9j2aHfSUXFiUnjLLkI4WjHxTG45mbUFbPJN3FFCsa7WtmV
X-Gm-Gg: ASbGnctN4064uE/4p37XsyC1mUpFP/oZmMp2Sc1YH/s5ae6iWbMcERMxD5da7IGciWt
	/kHAyj6daa6UzuvIkn3Mee+G6C3TPxyji8F+FKcN6wwKgEVhiptclN6fzHpRAdUX3JjSYUha5aY
	fEiME5zmxz2rArI1ZCP7auA1EOaNrVEDDsrqbBacC+jm+wo1Kynnmd5TG3up6F+KS3RI6QXxN71
	126GIdsiRvGxGGYf+sb8ucwmU/zo7e0XK3sQbbU+gpZpxhq6VUtWhgM8Jmw2h4fXhYXtq7Stp4V
	9OPz05UCw3t6ydISfL0YrgWkgyJ4z8lGyBylAQ==
X-Google-Smtp-Source: AGHT+IEDTGGykK3VT3IFwkV7jiAPCUT4mQR5DWO7oY08yzO1EcFsGxxZjoFcYEQky+5HouyGEl7YYQ==
X-Received: by 2002:a05:6214:430a:b0:6d8:aeda:dd93 with SMTP id 6a1803df08f44-6e243c8fe49mr147890246d6.39.1738286913646;
        Thu, 30 Jan 2025 17:28:33 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254818bb7sm12366476d6.47.2025.01.30.17.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:28:33 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fullwaywang@outlook.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] media: mediatek: vcodec: Add scp_put() to free the scp
Date: Fri, 31 Jan 2025 01:28:30 +0000
Message-Id: <20250131012830.22394-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_172835_276889_5587E80D 
X-CRM114-Status: GOOD (  10.47  )
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

Add scp_put() to free the scp if devm_kzalloc() fails to avoid memory
leak.

Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index ff23b225db70..1b0bc47355c0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		scp_put(scp);
 		return ERR_PTR(-ENOMEM);
+	}
+
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


