Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6367CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyhtrgUl91lDu8t83AeqgjUXFN0xPavBjbeVdqHjXo8=; b=omlnSc0DCmymd7f+mOEmMiC60r
	9ZGCy+ZR6apzL3v8x8aCCAgpIjILbwCvIN3wfIdT70BISf0aZv7zU77oQ87OFFkw4jQuJ8wN4gylf
	m5W/+oGmMeGzR+ZWXEwe4yBvKe6Kvk94lEGYuolHJWJ7jVUKx4oQK76UG2/WSZmA07sL0qOqqLh+/
	yx+3GQs+/QI+u9MwP/6yW/s59Wm+yFtMtYDVEWjL72f52eVdIe1V5s4SelhBBGhmKKvx4GtsvJ9cd
	xMY9Zh2aMQwEnUV4NxMRLAB9ly00zd46VFNHu96j7bRa9sNgxUx/TX0QCEQTo/K2S4qvHvPHcUgi0
	tFs6ohMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceFa-00000008kJu-0QwC;
	Thu, 25 Jun 2026 07:11:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceFX-00000008kJD-0eIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:11:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c7f3148705so7358795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371505; x=1782976305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyhtrgUl91lDu8t83AeqgjUXFN0xPavBjbeVdqHjXo8=;
        b=O7mTlVYJCG54lef+UAf0gQaPoaZSqij/roaLggyFqrB2AaJq5wxb680jF6ElUkz1YU
         rFIOZk+2SGbu3zlNXv8flChSl4QyaeiUZKyeFSlgi1RrIddxkB2IuCsKGxfHe55rOEEF
         +7aLgSfpsJuLFSz48i4OKOshuPJLJWZ2+/UtcZaqCjmCxeoj4noQtRjAlAuetrycDS95
         1VbZluqid2IJQ7kv+vpJif1ll78QXyC2EPpAzpd/8iHCIcKRAkxh3ycAPL06euHp6kGA
         vaNpWSxefQV7Rkvov7KteTwlakIjgXGnxGo7cHoVv0VANpbSFIq1yDyr1IjFmejnuHCl
         ud9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371505; x=1782976305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyhtrgUl91lDu8t83AeqgjUXFN0xPavBjbeVdqHjXo8=;
        b=Tlfg/Z36/TlzWmMwFOcfUY3fOF833kk0vsLHzvyo58wlo7TftJwFfxvGtPc5pxUV+U
         Fslen9KLXJp+uqniU4yeUDGINX0f+LwnMSjRWU1xobNovvtC5YbfW2ps+gRYUQcQOwTS
         inwHWBzIb/LCYs66htzkcyOwpEsTCc2fdb46zcYVmjZA7hOtdQt61MRQNSNo6XDJitsU
         048Q8VAucmhriXoARDBV0BPsEXlnVDe3YIqjDMFsM6Bed5aDz/li/T3z++7IS5BKV1CP
         I6q+maMYisw7GKiERpcku5eWu8ewHZiqEFgnQyRvm5Pq38lK4RvfliHPKv4dte7eeDVe
         ufmg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr36CFcvWCq+n54KaaQGTescExAkjSGExJX1FDx9Auk8SNvwAYvJ3Jp+1HmHeZoucEoGep6nZFE+LpYqsCfABp@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5OA/93c9m079nNrUVnXZ5OAbgiuVhz9niTRhIgwkKgmq+ABT
	YVHFFXMv0W8lzgQkA6N4J/fk44Ho2QvxvF/f5F2jS9uaWjkod1Ips4Rs
X-Gm-Gg: AfdE7cldhSe2wizd8zCAwMgKzpd4cr90MZFhxZV/KQh2DpwoJXzUCvSPNFqLUzEdzM0
	3GLJObVaA0P+rKnHyiz1n0YK3tRsdll/1FixPbijaQ+IrdZd+OMSjUajsH6jPUQZ9fCIBqw6pJY
	UUufLPrbmS4S4QuZqlwn6ENIAKL5vdRbHkFKjNQD1CMnd4ZsPWy4ouOyxSrKkjt7FqLEg0jLypn
	8weattGBa6XyVPXb1U9hw8cr9o6oYAhgj7BbV/RTBq2ynXNb7naVq2DCtLjnUq+JLvWVD7Wn5aY
	9+vL63rY2VereE7hS0arXxGhFQVJQZx+XBV5zDRivxLpbnOB0MEbmpQSQOqr5jwevlo5RAp3brL
	KNMIFEceke4x0SFWYoGhB2I/WGgRTJRP0Ehe/aELvdDRKNk2VfhUr7ZPn1w18XzntRjkmxzNgqz
	ixZqBvvq/X1rk=
X-Received: by 2002:a17:902:da92:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c7fc9bfd9cmr15548495ad.1.1782371505585;
        Thu, 25 Jun 2026 00:11:45 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f58cbe35sm14624385ad.0.2026.06.25.00.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:11:45 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Biwen Li <biwen.li@nxp.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Liem <liem16213@gmail.com>
Subject: [PATCH] i2c: imx: Fix slave registration error path and missing NULL check
Date: Thu, 25 Jun 2026 15:11:30 +0800
Message-Id: <20260625071130.93544-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_001147_196130_C1C63571 
X-CRM114-Status: GOOD (  15.24  )
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

There are two issues that affect the i2c-imx slave handling:

1. In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
   and the function returns -EBUSY if it is non-NULL.  If
   pm_runtime_resume_and_get() fails later, the error path returns
   without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
   attempts to register a slave will then immediately fail with
   -EBUSY, making it impossible to register the slave again.  Fix
   by setting i2c_imx->slave = NULL on the error path.

2. In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
   disabling interrupts.  However, a pending interrupt might already
   have started a timer (e.g. for slave event processing) before
   the pointer was cleared.  The timer callback
   i2c_imx_slave_event() dereferences i2c_imx->slave without a
   NULL check, which results in a use-after-free / NULL pointer
   dereference.  Prevent this by checking that i2c_imx->slave is
   valid before calling i2c_slave_event() and updating the
   last_slave_event field.

Both issues can trigger a kernel oops or permanent slave
registration failure under certain race conditions.  Add the
missing NULL assignment and the missing NULL check to harden
the slave path.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..4f7bcbeecfd0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -775,8 +775,10 @@ static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
 static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
 				enum i2c_slave_event event, u8 *val)
 {
-	i2c_slave_event(i2c_imx->slave, event, val);
-	i2c_imx->last_slave_event = event;
+	if (i2c_imx->slave) {
+		i2c_slave_event(i2c_imx->slave, event, val);
+		i2c_imx->last_slave_event = event;
+	}
 }
 
 static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
@@ -936,6 +938,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
+		i2c_imx->slave = NULL;
 		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
 		return ret;
 	}
-- 
2.34.1


