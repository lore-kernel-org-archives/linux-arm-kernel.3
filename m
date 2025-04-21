Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F14C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 05:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=; b=pvrVBJEhspLx/Bs5sv8+GpJMEv
	6avagays0v6GuZtLqdWdtaQA1OHGRD2oBBsnLnAo+mxrQo9q7ZFi57JKJMq/lju9OZz6lCG5rqW0p
	dPuLEt6FVbmLyOL24aKxXGDKY8XYoMl1B8p65ejxd9ia4hILFMYb0JPWEFo0h3BONPdkI2dubefZx
	8koq1Ms0ID0Xs//zEau2koTEHK+TFNrv+BBxtWXW4SloSK+vq+n1FweA9ZDDovzSViYr/60JSvsH0
	d1ghH3i9vdd92iu5VHw36e487/TDAT/lLb1PuCwT3A2jgRpkHMB919yY9sd7TYBipH9cabv7uUjq9
	zXmohL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6juH-00000003e2t-31wY;
	Mon, 21 Apr 2025 05:41:25 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jpw-00000003dg7-3fOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 05:36:58 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-22435603572so37048025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 22:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213816; x=1745818616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=;
        b=HXR+u8LxP0g4ghQ1M9iIehLF06cbUDX3FQToSkWQuoo8+R/ZQhj1YD1s07PG1SB2Dd
         BCi+DWm0lrKcQcSvYGHWpxsBj/gcblHNIib1g5xkKTfaWmjAdFEi09map+g9py4FFNb6
         ve95q92Z04VoxpBS7tiHOPWBWvJr78EsTXmiF3Ijnd+chaRluTve8Q73OejEtmDVWGPX
         Ih/vaqqyRRd16czYAS2UI11rTrtcc0lhLOac7yofa0X/oHI2I+FdQcWJFslMZ82zqqtF
         K4+J0Oo43QBfyBJyCH4Tp3VZL8lu0p3EpXAoIM4zvgvDSN9wZPdojhd0o8qrYtIVvp1+
         QlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213816; x=1745818616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=;
        b=keJaz+XxHUwOiwLSYMMZSOMRCAn3wryWc1he/gjlbbGsgNYIN8wXZ0AIZhLs5BrTR1
         +oMq4IrAKj10Uh3CtnhbF+s50zpNK+EchjU1bswR+fFvsjSlcnmm3+kdy8zPoE037n+M
         pX8LY0t1b1YYSaHiFBH17kmmLlOUvFaZtms4xZhvhMif2tswieLqpZe0YnpexphjwXm2
         CY1Rmf4rn1Ibtebv5glYgHxTwgWfEGfU79MMdwyfaPZxPHjB6S2jQfjUOFsNUZwSSWfu
         9iYO9jDY8tih5TgbdhHvmogdU0bsPqNIn0VKvREt37mM8WmyFB978SQ0a3686OpOms7C
         WXiA==
X-Forwarded-Encrypted: i=1; AJvYcCVarI/V1sbyFZdDkZ3V24A2SyDJFEoEK+6Bz4c2yvgYVsQMxEHpQj4wv6E+jhndLphOtNsBQHp6+gP28DrKO7OC@lists.infradead.org
X-Gm-Message-State: AOJu0YwuvKArZrOrh5wGCjBUngi3Z7DRIHQ7zHWqBFwSoquzDINKdyS7
	JHuUUxlqRupoZ6x3FIhTmcLR9+Dq0+1fiet22zTtDw5/P2G49hucTwAVs9e3AXlOgWMI
X-Gm-Gg: ASbGncv+zNcFOJ+BimwtA1RURvSlqt9UaWQ5B9uRW1eJ9lwVKpip8LPsoOZPDSaLHPJ
	5AJAKBl3MQzSZg3I8+QmjtFrTjrH/t3fzPVmHdUF4XwoUpWZPAr43Dlr4HSmez7tuj1bVf+Le5f
	I93WXJL4CJ5HPAOIRvZqoQBfCAs3SoIyAYzazQp4SKwMli17v0T9FkjrijT2RICepGVVW7ZaHlQ
	QICGnvoiLzhGLtSJuBrYBUqM6w9ziHLB1zR+/MMFKpYUj+DPpvEHMHJscmeiJhf25PkCkr7AwJb
	Tb/ulUx8G5ruU6VxH1fJgvccTRrHkeeDII4=
X-Google-Smtp-Source: AGHT+IFdvPVdGt6bGKOTEAZd0BvJShuSbJm+7EE2v5LaJ6enDyDnKAh0CiwtMffaCxTIlWx67pF8CQ==
X-Received: by 2002:a17:902:cf07:b0:220:f140:f7be with SMTP id d9443c01a7336-22c53601243mr174775625ad.41.1745213815840;
        Sun, 20 Apr 2025 22:36:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:36:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 21 Apr 2025 13:36:38 +0800
Subject: [PATCH 1/2] i2c: imx: use guard to take spinlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
In-Reply-To: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=2404;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Set1fjuf1biaf2SuWAgg0znD5Dkrjnd4oyOs91sYddk=;
 b=tEP6aUtRbhbNcn6p9VRzN+spiIyigQUd5XmgAGlJJju83zFNFwP1FbHiog/EELaoE+7jIMtv1
 HzZyFy6JtjXCJNVtNJGJRHL3XnOMgmh10UhQYJf2EgpnP3gz+4xhOf0
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_223656_915793_8BB1D676 
X-CRM114-Status: GOOD (  13.63  )
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

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..cb96a57df4a0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -23,6 +23,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -891,13 +892,13 @@ static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
 	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
 						      slave_timer);
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	i2c_imx_slave_handle(i2c_imx, status, ctl);
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 	return HRTIMER_NORESTART;
 }
 
@@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 
 	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
+
 		if (i2c_imx->slave) {
 			if (!(ctl & I2CR_MSTA)) {
 				irqreturn_t ret;
 
-				ret = i2c_imx_slave_handle(i2c_imx,
-							   status, ctl);
-				spin_unlock_irqrestore(&i2c_imx->slave_lock,
-						       flags);
-				return ret;
+				return i2c_imx_slave_handle(i2c_imx,
+							    status, ctl);
 			}
 			i2c_imx_slave_finish_op(i2c_imx);
 		}
-		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 		return i2c_imx_master_isr(i2c_imx, status);
 	}
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
 	return IRQ_NONE;
 }

-- 
2.34.1


