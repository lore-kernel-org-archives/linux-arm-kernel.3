Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B7DD5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOo8kzEPRGUvbYhKweLQJeBsbVaNvGh932XZf4KLPhQ=; b=bxGSsry9spNfG6wIRD0BUhMEyB
	Bzsn3vbab2WSof0Lay5xZfdwbRZkn62FxLNXqo3Qtb0kxWDTMZRzDoU59tGIdM9ZMwaEfEOvh1yGn
	CyIA1f5ekxUGLwOOEMsckQWqlOox7B3LO94Qbs2HzgC66SywDzqada4b2wVOVXxtCZ/Qd+bi09p3r
	D04bm8VH+gjIy1otPf47l1I6jmpkT7kWnmhAUI2HNqUw51FVUFlDLuX4Gig9wbeTjRPbCAKaeSKwv
	xfR5THJc+s4nDpdu5Iml1wB/h4GXuLhAOJo1rz1oRtmvAs+pnfsBQSREdDDU/R/Vums25XZP2ZlAi
	ByUoLFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99uj-00000008O5B-30Ws;
	Thu, 07 Nov 2024 21:19:37 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t99ps-00000008NNk-0aW5;
	Thu, 07 Nov 2024 21:14:37 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5ec1ee25504so754116eaf.3;
        Thu, 07 Nov 2024 13:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731014075; x=1731618875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOo8kzEPRGUvbYhKweLQJeBsbVaNvGh932XZf4KLPhQ=;
        b=bq4rlyACnFa0Xe7tUIx9ou8SGXOSOt8nhtczOstpPYT0e6ygFbQf8AeNs6uMAw8d1p
         z+7LkqW6unWF3NQDWmawizpQM+DIHbeL4v/sWrUKfrP70w9WVoFZSZkrcNWv5pCLcaS7
         9bP/i/wOTWVvNWRLUJd5K4XZaZ9a5fPa9PgIoP8+nqCEsCM7krx+Uc89SITh/7Que10m
         RBjG7AuvZekvq+FDNtnXvIXif+APLL+PcYAAc1yPuQfK1Hvd1Tq8uKfx2OQ07107/Xmp
         IAxrHcA4XhLDmgSJiRPHUmsKgjcznjhD9GBeeNrPkdpVA5N+v75ZTD9hKZdqKjlGRMOF
         uVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014075; x=1731618875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOo8kzEPRGUvbYhKweLQJeBsbVaNvGh932XZf4KLPhQ=;
        b=EG5dc+bjaPPGYy2ZSVFKdyfAMZuGKUPDPUQS/xnlhGzNm3JWuKTiZHIQS+R4JI6UgI
         pxat7xZTUsl2htRYtuErX3hThw4bJRl0BRc4qNJ/Z6UC/5jykNmJkE5mtk5GzcZPi4tv
         yvUucjuWvPiSitQZL0cerMWRQBLL13akBSASNqw9Dje4i7N1HgP8VD21ux2HRqCXUISy
         YQWeH4EyUWu+E9OomasRLakEREtkxHKznPhLPnOmQaysLf3eAW9qCab9VZsrMCcGpZdl
         gtFpcaXF5dulGL7dKMlcoo23DHW2puZ0cKOPW16jMoyE6ewdq9o7pUPx5NejwrFrEOi6
         eXXg==
X-Forwarded-Encrypted: i=1; AJvYcCWBrRWL3Z7KA3kP4V5pvMaM3VqEuI7JeMggGGgRZxjVkFyQocRCFVWwLLZ9/Mz/vJaqkEQ/wMu9m698aYf0oj2n@lists.infradead.org, AJvYcCWy1S6vQBQmJKiLkmDvDOQFdQ9p+MU0kVNDVESjnYPQbfcPPX27nvrUEYOmo59FdYq/TIfIFETkeNXWUPHuV28=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlzTCXzxXgki4pbC3Qs4GOhYG55qJhm5vudsZNwbNevpZ0oCas
	U8EPhJIIYb5cq631ARD8wxmJXropCAQC2NMR5+xLBPUS5MN42egf
X-Google-Smtp-Source: AGHT+IGhY1N2hk3DoCWVBqOOz8Mayrp7EeXL93lHogS0TvaItsDXtOLZPyJv421K0nsnaCchGhGTMg==
X-Received: by 2002:a05:6359:428d:b0:1b8:203b:db84 with SMTP id e5c5f4694b2df-1c641e749e9mr92914155d.4.1731014074581;
        Thu, 07 Nov 2024 13:14:34 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3962089fesm11486116d6.61.2024.11.07.13.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:14:34 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: dianders@chromium.org,
	rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	wsa@kernel.org,
	manabian@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v3 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
Date: Thu,  7 Nov 2024 21:14:27 +0000
Message-Id: <20241107211428.32273-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_131436_220737_3E6A046F 
X-CRM114-Status: GOOD (  12.91  )
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

Add check for the return values of clk_enable() and clk_prepare_enable()
in order to catch the potential exceptions.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Roll back unsuitable dev_err_probe() to dev_err()
2. Correct the usage of dev_err_probe()

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-pxa.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..4a92c5386df6 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,9 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret, "failed to enable clock\n");
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
@@ -1560,8 +1562,14 @@ static int i2c_pxa_suspend_noirq(struct device *dev)
 static int i2c_pxa_resume_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_pxa_reset(i2c);
 
 	return 0;
-- 
2.25.1


