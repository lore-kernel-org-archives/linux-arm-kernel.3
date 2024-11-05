Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6922ED31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZsBpzkk5eIxxCoFTUQlG8fOz3VfVWVw0fc2odhFnds=; b=yO0rZh0CLuOCc8/Cnx3inWf6ZF
	7LCuu4XryD2Rxwzsw/jslz8dF37pMsWxNBlK+WI0WpBzpgmncI1rrB8kRkGWSiyR21uTKKZVpVaUy
	s15E2jctfGh9O12rkqxq1pK8a3cbvuqe40MT1IHdy5pseaMQs41Tk37fJETYfwVnPLIh2HGMo/STz
	WdkdSfs4nSrX/1ifHUodha6n2Ye7iHBBbGS2Ow12cvZIg9DOzwBPj12SjIsA/OdHflvHIdoAkJOXx
	AHBCl6SE9bHvNGsBs3EZid0puCr/hezfmvMrtI4ThNHaxm1qUMRLP5gMHEgzVE9+MaFrq0tONmxYU
	+tX0WSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mw7-000000008pn-2RVi;
	Tue, 05 Nov 2024 17:01:47 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MGD-0000000015J-2EAF;
	Tue, 05 Nov 2024 16:18:30 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b1507c42faso490831085a.0;
        Tue, 05 Nov 2024 08:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823508; x=1731428308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZsBpzkk5eIxxCoFTUQlG8fOz3VfVWVw0fc2odhFnds=;
        b=LNEErJAtLAoY5YI1Btc1xEedaxEaZu/IpsL708Dl5kbLb6R9yDaKL3I3Tmq3eltvcR
         mlQujkAlVNjDi5qoHjechkt+6VkcbYFn1bgaSr7A5LULoVca4wjXNLRi25vhFTYT7FZ4
         cZS/aF/I9xXUlguUsvBjBJZUI7Q3z0KEIo2n0fzBA069PMxbYkwZCDO/JAcAJbVqOPbV
         AXi7ouJGRzaBUAfcDZgD65bx/BDFzSZRcLngZx1KOSvRN2Ag1RLOqVIWZNDE28+xqFfN
         fLXkCkJH4zY6DWLrRv7xLI2E7rg+KmRU4nD6irmNGjs5flkGUgxXjYc6LW+52d/2snUA
         H6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823508; x=1731428308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZsBpzkk5eIxxCoFTUQlG8fOz3VfVWVw0fc2odhFnds=;
        b=XO6biJgPyWk8M7FxwAgcZc+wpKplg1MWnEXn6sCDai4KAyA1n58gLrHyQTPtyskCyY
         8jLCdhbeMlfb0WBSX5/oe9DfrD5hW6XmR4jNhrfN7eVja5Ff16OknYSNuFluOhySNDUw
         aSUjHc8UwHBlIxIgdnGJuTGXaIxRfKKrFVx8VuA0JdBmdSFeeldarE7zyAgy1xHfvaOt
         B5o89q5FqIOlxG+oHtExwspDJaiyhLu7q+qKGCkKJqNySRXkHBZ+qL0EmYLMNxrOQwSX
         H9JAPuCy58AAtu3am+tG0V74LTmI6reFU2ifPOM1bx7dkylMGayEbglceSTxIWt0bb76
         bmBg==
X-Forwarded-Encrypted: i=1; AJvYcCVlomGeIqrgUN6qPhlEy0BfrjCoPVxhYKoVQkLjQLrSauofXm5xJPnpeGep88/gLPBMN2HDvoB/7C5Bfi3nQFA=@lists.infradead.org, AJvYcCVsVXlkEqnYivtq0OY9DhPKTf4rysFvMgJw8Iv8uZjj+Je23jP5wxgs1YJHJq2oKb4kpO4/FBLObQfNRudI1Ufj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+rf8JHU7Lsr3hEVNvsp8lB/P+P/+uXDW4Er1Wc2or0g1LgcdT
	jk3hVqdaNVTA1/AJM2myu1eUVhYlsCjKbdqlZeWbzJ0dAs9v38Gi
X-Google-Smtp-Source: AGHT+IGQEeuVCyhghtqvJgTQQUezecC0Efl6QzEbppiW669eVn4FBMz1WOBfVXc/9kFFbFVBKkX7wg==
X-Received: by 2002:a05:620a:284b:b0:7a9:c129:504f with SMTP id af79cd13be357-7b2f3d3999emr2948846985a.23.1730823507790;
        Tue, 05 Nov 2024 08:18:27 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39eb14fsm538010885a.7.2024.11.05.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:18:27 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
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
Subject: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
Date: Tue,  5 Nov 2024 16:18:20 +0000
Message-Id: <20241105161820.32512-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081829_592809_9DA4067A 
X-CRM114-Status: GOOD (  17.03  )
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

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..57c2d37fc7c3 100644
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
@@ -883,7 +883,9 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	ret = i2c->soc_data->calc_timings(clk_rate, t, &calc);
 	WARN_ONCE(ret != 0, "Could not reach SCL freq %u", t->bus_freq_hz);
 
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
+	if (ret)
+		return dev_err_probe(i2c->dev, ret, "Can't enable bus clk for rk3399: %d\n", ret);
 
 	spin_lock_irqsave(&i2c->lock, flags);
 	val = i2c_readl(i2c, REG_CON);
@@ -904,6 +906,8 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		clk_rate / 1000,
 		1000000000 / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
+
+	return 0;
 }
 
 /**
@@ -942,19 +946,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
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
@@ -1068,8 +1080,18 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 	spin_lock_irqsave(&i2c->lock, flags);
 
-	clk_enable(i2c->clk);
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return dev_err_probe(i2c->dev, ret, "Can't enable bus clk: %d\n", ret);
+	}
+
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		clk_disable(i2c->clk);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return dev_err_probe(i2c->dev, ret, "Can't enable bus clk for rk3399: %d\n", ret);
+	}
 
 	i2c->is_last_msg = false;
 
@@ -1149,9 +1171,7 @@ static __maybe_unused int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
 
-	rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
-
-	return 0;
+	return rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
 }
 
 static u32 rk3x_i2c_func(struct i2c_adapter *adap)
@@ -1365,9 +1385,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
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


