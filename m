Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58C3D5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7uKO2TXaFtTXkQxrGMFy3dzEippfijU9bG+tCuCJOR0=; b=LGl+mJzq3echGyXKZVNG3FTYE3
	ooA8e5TzSFxcBLzBlff9Gn4orjWkuzgfLRvaS220i+IBRSElwLCdrPhbI6LKRVzUyd5eQThKvLt0F
	64CCYez55i/ffzmEkkvSwrjl9ct+/p1oUAW4M7da4U0utgyGAq7ALgAw1qG7b8vqzVPeKThRcaK6F
	K2b4E+a4k/DcscLejueRXxpjZKd4H2/K1QyhXGz2WdluCdz85u7JpBCd2B1XWpVLwgqVnUHq269Fo
	v2lybeshRnC81rOiaLu/g7/J4tDNmsOWrVURcTrRFY4g//RNAmixxLIzdWW+FfaDd4AdU+ieBFb3k
	fm0npcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99t1-00000008Nu7-3Csp;
	Thu, 07 Nov 2024 21:17:51 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t99pr-00000008NNa-3l3A;
	Thu, 07 Nov 2024 21:14:37 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6cbe9914487so9091806d6.1;
        Thu, 07 Nov 2024 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731014072; x=1731618872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uKO2TXaFtTXkQxrGMFy3dzEippfijU9bG+tCuCJOR0=;
        b=Vki3NIlql9oBs2+Bq8SXywpZlj4FnOBm/pZut8Zq4XzN9Vx5Yvy/FJmw/0Y6BKIqZd
         71hIqrcK+Yi/rvupLLNm6YvsxPK5vqTfvkl3WdUjHeXDYH0WocoEkFTzAn565td/1jCf
         vY4Lc27zc2ANQSNXJFCQJNh8FTNljOr2qkGZU4YbPKjVVc+08HMIrnN1aIEMqnrVW2ii
         E0pfHWzzEIO3sH6EMOJVaUg10Rv/EP5JRinL4wmV83le+wt1JhdqpD4Wch14FncUPeGl
         0ias9QW4ewmLI5jdXJFo3pPGbCnA8HiLqHdEvSzDPasN3ewvmrPTMQuNlDHhOXoG1h04
         2CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014072; x=1731618872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uKO2TXaFtTXkQxrGMFy3dzEippfijU9bG+tCuCJOR0=;
        b=Bn4CY3Sm0a0nFUvvcX4vgwawzLDU8et+b2HRxNwAzrcJQJEUvLR7YVUe7A7NMAZHlc
         Cal4MooKhB95H5g+dkXnbjZhOgcoH9rZFzU6X1qlin4Kdxul8vItpCgBWIysCn5qYzBE
         fnXNdqRFS7oYwFmdaoifsEPWTpYPkM2qlInHDnP9pDB3vlcFFnxYV2NRHXOyBP+w+s3W
         leb+d4qEAJq5F2HJ4cPAQADiRHHYQKJ2PLHuO7dNZvj9WXAi5bwgDvUzFlFjqngPuluP
         AIe067x00nwfRpxWMA5vn6CNsH154XjiU1Gl1cw7Qz0Swr66rX7X0bblstTY+MH4RulO
         ZTog==
X-Forwarded-Encrypted: i=1; AJvYcCXh/OFVMOgOogkJgiHwBP7c9ky61daDLYPqylXtIvUWEVgJvBUalsG+o6aGaIDxyDkRRji15R5CPLdnCQUJlCc=@lists.infradead.org, AJvYcCXs5PMcdfmdp/fMltH3BqZbet9ZLcrGr0TcMSGmu4KXfLQRAZ7ONtXRUOvIZS6RRcFMfM/30TzC+2aVUys1TNaN@lists.infradead.org
X-Gm-Message-State: AOJu0YxDuImRCIR5g/KvJPdk+Hlbimm2Y5kTymWRyJcd/Wvt2OcJ9vzd
	DVKnRf4VhI8u9hZ/PeNQgFSA7+c+d6HbfAMoz5gX5lX1PCOsrUVl
X-Google-Smtp-Source: AGHT+IEQO315sJ58AjAImU5jNkUQnktZ/9GnYkEh96OypdQQhSv+PNXvH4Sz82UfLiseFX3Nn+MBsA==
X-Received: by 2002:a05:6214:5348:b0:6d3:5af5:2a58 with SMTP id 6a1803df08f44-6d39e1ee70bmr5395506d6.33.1731014071767;
        Thu, 07 Nov 2024 13:14:31 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3962089fesm11486116d6.61.2024.11.07.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:14:31 -0800 (PST)
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
Subject: [PATCH v3 1/3] i2c: lpc2k: Add check for clk_enable()
Date: Thu,  7 Nov 2024 21:14:26 +0000
Message-Id: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_131435_962079_343B9C57 
X-CRM114-Status: GOOD (  11.92  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Roll back unsuitable dev_err_probe() to dev_err()

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-lpc2k.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 9fb33cbf7419..ea9831f34cd6 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,14 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.25.1


