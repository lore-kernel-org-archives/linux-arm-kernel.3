Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81907C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=; b=MexVYOt5bW1M0NTwDY6oFmDlte
	XZDlw8vYgjgYMD/wWCJ764CnGxBDx8+5zxkqXuAYCBwxtCN/mgSfP3bgVZHFz68fxuM+u0uc3EKl9
	nPgtmuLR16zMU4a11pBnZuKuKBQ45K3ln5UWwe6uZdnN6q5sJrD9lc3HKXYSTFDjPcLrKhgs69NqL
	bCygoNlVWeRvglWj60U9wexjVIDprTANvj2DiMCDL/WhTvjQ0D/x8LwA4z4/sI5nxqgCHpdtUTUWb
	C/Gl9A+MW5up9r1W7bUGpKc/+H9YFOLFjQq1lo1GdUKPUmXvDb9w8EZobUsHdGZ4VhTLjk4U8hCEF
	RUEh7SJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7avA-0000000EwJ6-2WR0;
	Fri, 18 Sep 2026 15:54:40 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7av8-0000000EwI7-0AbS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:54:39 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-86b90133ae8so718991b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789746877; x=1790351677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=;
        b=pWrkFAawnNbbNY7Qy3dRJwqkip8qaFai1tt5p8zKXtajNgkEGOMvxsNv9ilScI6PFw
         t45mn5aJIMHSb39AXjmiW4dj/YpAeXCul63Ldb9wXtbKFGE8dNv1wdCwvv3Ffdz/wQ1G
         7BSJuwn7pUBgfZ9bcrO6iVmG9ZMrZRoJ5sTsyTXQdZLt6PYToBSSkb5dOK1abswisDBx
         Qp62rVMnQzG/VzjmStrKbU9IANRIoJOvfbd7c0y/ByfTJVYWuMul3QSQHeiS3Q+KHUT/
         F2UbLkw3BpwjEwBd6CN5Yby8wA6cgI8EUtkEkONe7XyhjjeZGYudLrDneU/suSRHcW0c
         9ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746877; x=1790351677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=;
        b=y0SdNlwyTZuAhwuKPl1BDYILFgojah3RppejMP7XFXJBQfClL/+GtM0dhgYsRA3d9y
         con/sPqtoT+1B3fibkFCTshBBwvYe5hgm5rb0Uwu7P77qwP//fD4FCSOQMSmprMMMBsB
         Q9HMI+RE5Y3D2PcYcZHLecRmFtgv9yBby2W5H7sNLshrQgnNv8F62gFX2PASSqQdGPsB
         nN4MHbQaqzWL7/5x6JLzXGHsumb7MR1LHU3wJeWC8Gp5LZuSLgYm8Snp4aj3klDaHp3I
         ysoPX5gaqdpJRpTh5Kw2cg2Lnc9nbTy5j+3+egBpf49sB7pCDieAv1Y/h/BbrM8MNwX0
         9F5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYc+zVLOFhIz0tcXERNxxxJMnJtHcspjGRKaniTyFhkiPeoYj6KE8T0HUb0Jx8FK1+rkaMjKtZpdj0GlMMimJ8@lists.infradead.org
X-Gm-Message-State: AFuF++k8rNdtzF30SY9nlZvZTX6sW6ulNkdKarP5J6eYUPs2jr2AgfFS
	xnx+YB5O+eU+abCPHiv6CdbdPyBtBavRmLtZVQNg3ogzUnuIC1Rtc0cK
X-Gm-Gg: AYBFou0risO8NayQ4UXchjdwCd6QfQ1wFLvdVLJ1Izo3sHm0QpUVYwtEa3uVJ2kc7EL
	fxpesM6DvZRsXCHYS+Zg6jj5zhL7ZOgKk5VQzUa4m1kyAasKwS0VVbxunhC2Lv5PUirlwq51NVZ
	I5S9o6p5UOXsIGGMhgxHvZUMcVfuEguPXqEPdH32y/jMwMFNRKgSHhW1p4+ZYs/LGceT/zgbMUG
	E5Fj6oA47tlJ5xKlqzi3boVESUJ2+2kEFZ0c0YrD9VwT0tvciLBDRo2eX9ZeV3zA7oJr3XEdKFJ
	/UV30eFIoQ4jRYbkRWBPquMqR6+R5My/XVT3jhoMBC3poyawQwG7n9XdIOjlys7NfHt2GagArsw
	VpV/avOSLvfGF09ani7cH9HLCBtnMbKGX4exYglqD7LDh8vUvIVMai03WiWND/SB0EZ3CAbaSFv
	2w0ueQ0Mo7YSydCSwVowB5VwxeklGIjPD6iMSImCj4oVlX1okaXsZRfF1lNzbyrTcnKUo6f4PV/
	gUSFJQgPXU2x1Pg
X-Received: by 2002:a05:6a00:90a9:b0:874:705d:f64a with SMTP id d2e1a72fcca58-874decf71f5mr5476461b3a.44.1789746876763;
        Fri, 18 Sep 2026 08:54:36 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd8dfa1csm1091058b3a.46.2026.09.18.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:54:36 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix wake IRQ leak on probe failure and remove()
Date: Fri, 18 Sep 2026 22:54:29 +0700
Message-Id: <20260918155429.2549137-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_085438_076220_FE82B4AD 
X-CRM114-Status: GOOD (  11.90  )
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

dev_pm_set_wake_irq() in probe has no matching dev_pm_clear_wake_irq()
anywhere -- not on later probe-failure paths, not in remove(). Switch
to devm_pm_set_wake_irq(), which registers the clear automatically on
every exit path.

Fixes: fbc5ee9a6955 ("rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914134826.EC26D1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..7080aaf9ffa0 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -302,7 +302,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 		return pdata->irq;
 
 	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.25.1


