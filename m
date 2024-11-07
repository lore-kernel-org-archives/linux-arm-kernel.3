Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8676FD5D68A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtYJat2vwne5+4WJO2r1NKcoNFx7A4N4AD7ayp8QtCI=; b=I3GWGofi81TduZqSvTFwGJ3yFG
	cVPXEsiGKufLERhJEMlqE5MFkWiXkNZfpBhkhO/ciAL22sWXyoEdyLMVG8rcBJ6NXGZEKOlXYkq0x
	pCxpfdKl1AeEhYZnzQRfKxuY++O6KDCBGUmtT31+fuRMXpg09pKjwU/b5HoOeYOUUFAlFU/RM2Jnc
	CSaTEZuw+23Hzkw6H38iqoS96N9TIg0j4w/OQ2NugFJW5GbO4faDWct6AvEAvSjoIMQEFNKVNp6L+
	h1qUT1qRB+wCzXKFLNjhiXMD77K86cn3/k7jLHJx8jjR9Jj/MzVmUHIEvdh7XveLS8sJFQdMqURQC
	D+Cd7p2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99wS-00000008OLR-3oPa;
	Thu, 07 Nov 2024 21:21:25 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t99pt-00000008NOM-2nOK;
	Thu, 07 Nov 2024 21:14:39 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3e5fa17a79dso1017299b6e.1;
        Thu, 07 Nov 2024 13:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731014076; x=1731618876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtYJat2vwne5+4WJO2r1NKcoNFx7A4N4AD7ayp8QtCI=;
        b=JB6sxk9Eju0xlJS8F+q1Hfn2/UdU10Ghi2NQbtVKYU0/0cR+Ic1P6RkAY7PjZa3vDL
         ueoKnLneL5WLaTC92bsaKRpR8SUbkXXQgz0bn7mdcHTgSXelDesKOPlvPVuciXPc4x5D
         AFLA58Y+bbtZ5Z6Jy1QlQpiyW5Ujj/t9ajjkgt7YjYzJiJlL45dHSwh/HXEJk04phnhv
         Zoovc+tDwlnV2/iec/2bg5xunLK2NhkUBcKuvDZtpcga9oeuDu1syUsV8abYFUI+zvrI
         YYx4zOEDioKveOvtNv+Rdq+KBhkcPPLbObVIkgchX0W7TWvmljWIahqiWCBH86mijLF7
         fxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014076; x=1731618876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtYJat2vwne5+4WJO2r1NKcoNFx7A4N4AD7ayp8QtCI=;
        b=uBpDOyGAPzwp5MF0NjvPveh6ggZvmd/3HLUCWpL1csW5Kqxadxu/KyazVJl++R66vi
         DcLmETzQVHf06fUB8cJ+dG148J6xqX9bBowkc/VQwPZeyAjMtKGhFMqOGsQGciNXhr4T
         kt+ZOzUecM0TVS7YsDGZniJbs11ufR7E6yQioZazact2hRqDd1loHzHQTm6kTGMTxrc+
         VxIB3kl8JXsei4TKfeBMzIk6EhYM/uY5seLnHUsVbxLjwi4G14aIVdboUgu16kmmB+Z1
         G8XrNW14BTtH4HF2IQBH+NcMEnW1Ex/F5BdDaP3tCKoi7zd26+0FMdHFchR/fqkIrKJK
         0KNw==
X-Forwarded-Encrypted: i=1; AJvYcCVVlVukAECnLYzJ1D1b7QAblhbEjUxwvSsDbDWcsS3GWerwkDokEtF0Zp9PIKM4Bee4XuycbyiLEC/ba5UhnEk=@lists.infradead.org, AJvYcCVw6fSZX4+K7TPii7w+DGcBHlkyEi4jJ+EF6D5dGZaokywW2qVtPtqvzbLQtjOjpkNe6EuHkGZfKdGIyq1UsapZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYNlFM8ouG9xKI03mX8/T5Q5tS+/N9yTENT++fEK585x96JIJQ
	hsp7y22E/8RcofgJbUnIXnALbZnAyADcz5YP7mLLHVvIR/tSGgZR
X-Google-Smtp-Source: AGHT+IGHP0pu9JWTZVGvNEWya7gP+rkzPi0pM59LG1R+OZu7lEwHGebIcNHfjBTkDrWb+2m5YeySdQ==
X-Received: by 2002:a05:6358:790:b0:1c6:12aa:a50d with SMTP id e5c5f4694b2df-1c641f81b71mr65221955d.25.1731014076286;
        Thu, 07 Nov 2024 13:14:36 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3962089fesm11486116d6.61.2024.11.07.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:14:36 -0800 (PST)
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
Subject: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
Date: Thu,  7 Nov 2024 21:14:28 +0000
Message-Id: <20241107211428.32273-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_131437_782448_C8A51058 
X-CRM114-Status: GOOD (  16.87  )
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
potential exception. Moreover, convert the return type of
rk3x_i2c_adapt_div() into int and add the check.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Roll back unsuitable dev_err_probe() to dev_err()

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-rk3x.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..0263ee0e0470 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -871,7 +871,7 @@ static int rk3x_i2c_v1_calc_timings(unsigned long clk_rate,
 	return ret;
 }
 
-static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
+static int rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
@@ -883,7 +883,11 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	ret = i2c->soc_data->calc_timings(clk_rate, t, &calc);
 	WARN_ONCE(ret != 0, "Could not reach SCL freq %u", t->bus_freq_hz);
 
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		return ret;
+	}
 
 	spin_lock_irqsave(&i2c->lock, flags);
 	val = i2c_readl(i2c, REG_CON);
@@ -904,6 +908,8 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		clk_rate / 1000,
 		1000000000 / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
+
+	return 0;
 }
 
 /**
@@ -942,19 +948,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
 			return NOTIFY_STOP;
 
 		/* scale up */
-		if (ndata->new_rate > ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->new_rate);
+		if (ndata->new_rate > ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
+				return NOTIFY_STOP;
+		}
 
 		return NOTIFY_OK;
 	case POST_RATE_CHANGE:
 		/* scale down */
-		if (ndata->new_rate < ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->new_rate);
+		if (ndata->new_rate < ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
+				return NOTIFY_STOP;
+		}
+
 		return NOTIFY_OK;
 	case ABORT_RATE_CHANGE:
 		/* scale up */
-		if (ndata->new_rate > ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->old_rate);
+		if (ndata->new_rate > ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->old_rate))
+				return NOTIFY_STOP;
+		}
+
 		return NOTIFY_OK;
 	default:
 		return NOTIFY_DONE;
@@ -1068,8 +1082,20 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 	spin_lock_irqsave(&i2c->lock, flags);
 
-	clk_enable(i2c->clk);
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		dev_err(i2c->dev, "Can't enable bus clk: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		clk_disable(i2c->clk);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		return ret;
+	}
 
 	i2c->is_last_msg = false;
 
@@ -1149,9 +1175,7 @@ static __maybe_unused int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
 
-	rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
-
-	return 0;
+	return rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
 }
 
 static u32 rk3x_i2c_func(struct i2c_adapter *adap)
@@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	}
 
 	clk_rate = clk_get_rate(i2c->clk);
-	rk3x_i2c_adapt_div(i2c, clk_rate);
+	ret = rk3x_i2c_adapt_div(i2c, clk_rate);
 	clk_disable(i2c->clk);
 
+	if (ret)
+		goto err_clk_notifier;
+
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
 		goto err_clk_notifier;
-- 
2.25.1


