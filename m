Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5474C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c2fIO+Uh5lMfJ0TQG1bXbVsEM8un3Gt2zARsM5wCiBw=; b=FAfgz58Ja1H2YcSHGlnH5suYj8
	qNQldbXBHGEZgztT7nKsBeRzg7sl8nstQk4UE0gCEzNX3QBy/zhJARcHZmwDXDv7W6UBld3N/Drs2
	enRdfQ1xkiAlSHnYI0RxMy8n+iQ8kzg+W3wBVbG4lLHsQEZlVY4JsfvjtqdZio8kDmwtu48u2CzDS
	VhTTZEGq9kt+o8dLmbupEuxO7hSNQoBiaZtrfYdowfMHORkl5JcPeJZFYsrtoVC09xgHuT9JV228t
	3beJXIkz5eXcAm5i31MdAhTJWZkHiVJ3Sdek0Jv6ivMoHVdJ/jBkIqKI+w4WYp9CAPmdvJC5hJIta
	URabOs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJbp-0000000810o-3lki;
	Tue, 18 Aug 2026 13:12:05 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJbn-000000080zV-02tw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787058720; bh=c2fIO+Uh5lMfJ0TQG1bXbVsEM8un3Gt2zARsM5wCiBw=;
	h=From:Subject:To:Cc:Date;
	b=ti8G52xAXRbFVyXyz7uNPB666UClNNWdX+IJr8Bnd8/MTpTwjRyW/4PNJpC5veWjz
	 Vn/ZsiiEkiPhj2AU/Sif+zUHeOO0lN6LBtOj01hWkJ923+rqBw587n0sTb2g56crRN
	 uJQgeFa0VxEE6RJMKZ5sckkwUr35fr5Hao4ryWQE=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787058627t25s38j6k
Message-ID: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G3eqbtrbTrgpSgA9Ra87BwxRtPtbh3cRgEgFB8YusHM55t4oyMC
	 83ljhbN1E/dVTyneR0eJWsOVMC1HugibIBYUvhn8gSZ48kQIpRpathDCLt+x71cxbDhACG65heRU
	 X+nbWBDc6Fg3oaFr7hIElV8ZYe0SHg5zpsKlu9YK0N2TvZMbEiF312g6HLcb3ujABwetTsae2NcC
	 BEecL0hUgmmjdIQZel5Nyn1Jp+A6YSNJHDLhRtMioa2WEm2iV5PXCGmGZ9dXbpUAuEUkgDD3xHf6
	 HU+CJ8StlkmE0312wqER7kRjDp9pQMPPB4sYIU/rC9DEh4Agnzd2vtXKHb4ZK2XluMTxwqRwO4UD
	 t4c0nnqG9tScB+k1L/lV5j6GpyI7M5gRzhUjpfg936bb0yb8OE7te63RYNu7TSk/7GHTyHPQg9TL
	 tTw8yFPt8BPu0s48UvfCje0yhUBqbmjC+5OLCDvQX2Gs6iGigvqbeTaSro6jTMKMEKr2D+VtzVvx
	 x1NR5xl4rve+UwhVPW+jHTDKNdzk8CMbmROlU1StxouM9gzki0MJ1qhAzmxraNIYvrXhCb8+wiJ8
	 N0Uiou7iEGHDiSdSj5DfzWNNVDrNd2RkY2CcB7IZiu7vwitqGXUk6H89KKcHorrJLkIbyETV1kAQ
	 kB/7NobQlK92MFK0mg/2VIKfnBOdEs0WJ+lKfqjFxtLBx3gVPExNBmqqqb5i3Lom0ub45eVHaELX
	 JunnYFyzmE9uKu1ZMo4g5eciiskBwmO1Ax7ucyS7R6t+XHDXcsvddEDw/sylP5mxelGpq9To0w05
	 MqYOGKDoHgCY2qbR/0QkXHonG39QA5zED05sEFaat+BhTRuC+27U7yb8agKAHb6QTyZyXJ7s44V1
	 2UEygr2Eivdb+ZCp9+AQk83uTkNpiQxPwGsJqbryQ4VWTqMItOzIG5jjtCyAFqG2001EPSfijJR6
	 Rsq3jR5newlaa2vHXlUoKxv4/KsTsYorgMNr8E7NxUGWZPlSLPCLYnKbXgbceHd6VANdtuI0sP87
	 SNHE/y5f4DjsSDesAZXJwSYAxRDjvwyokHeRvnNoA+/0qa8IIDZfSLULl/hZnabNX0YoJD5w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] i2c: i2c-s3c2410: fix runtime PM cleanup
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Date: Tue, 18 Aug 2026 17:11:57 +0400
X-OQ-MSGID: <178705871733.291840.2722309413893899384@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_061203_361128_D6D77D3A 
X-CRM114-Status: UNSURE (   5.38  )
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

Keep clock enabled until adapter teardown.

The remove path disables the controller clock before unregistering the
I2C adapter, so adapter teardown can run after the hardware clock has
already been turned off.

Move I2C teardown before clock release (pm_runtime_disable,
clk_unprepare) in s3c24xx_i2c_remove.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1136,11 +1136,9 @@
 {
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
+	i2c_del_adapter(&i2c->adap);
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(i2c->clk);
-
-	pm_runtime_disable(&pdev->dev);
-
-	i2c_del_adapter(&i2c->adap);
 }
 
 static int s3c24xx_i2c_suspend_noirq(struct device *dev)


