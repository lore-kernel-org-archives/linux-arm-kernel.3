Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE34FD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FxOGfWAcvu8utBdn+O1zmIsYuW7wtW7N4+J3Xi+kwB8=; b=4tCwrP/JIMJoNRpBZcgiHe1BxK
	Sl/x4jP03ksGZvLnc9ceviy6K8HlwaZbvzcf2gia5OQsImSpoksHUWvlEEKUAeOY5IY0fhUaxR3FX
	lWI26FVkHhJd68kWnOZKvQNU17nT8JhamxHnsBnNoyKgUT767Ns5tOl04B0z0d6MOJEXNjrKiex8s
	eSk6fagRV6YX9JcCO2Ma4C4bGOC/RIaa/X7TjizHJWUE3U38jOsxNRNfBNvrCQ6iQ/H/qPmiqlOdQ
	jycTCAbeFlp9BbCXMS6KoJp9kRejlc4e73ISyFjcuH/Aq0PBRu8BixKo+F6vwNBSvGYUkQDjIk54s
	pMeelutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjZS-0000000BeaR-12Zl;
	Sun, 01 Mar 2026 16:23:06 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjZP-0000000Bea6-3b3z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772382181; bh=FxOGfWAcvu8utBdn+O1zmIsYuW7wtW7N4+J3Xi+kwB8=;
	h=From:To:Cc:Subject:Date;
	b=QU6r7CSUbVF/5S0Tfw1HcXWelo6RXRdYCLc/ughPRD1MPVx8nYC3dtq0EuaBFoNv4
	 bdgI5ctxjobZnY6d7Mgni6weI0PjWVIa9mjhln1ZBzIfU14hE7jEqA02OU2DBjIXlu
	 t7ps+I7kwem4z+7YJcXC1n7+pKvHAINuA+OyiwwI=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 5BA3884F; Mon, 02 Mar 2026 00:22:58 +0800
X-QQ-mid: xmsmtpt1772382178th2l0aroy
Message-ID: <tencent_AB29FADF1FAD67D818283B6BB4FDF66F2F08@qq.com>
X-QQ-XMAILINFO: M8SslFiB5g9ISFL2SGn5VXSgyojemWtaTJZt6q3a5EITqt9Wcfx11YnIWPWNwP
	 KXelWv8ze0gJz2zuC/q/Pm6AIfGBtRPy9LWM1xlThmm+e/OFWZvMvxT+hULDo5wv4eJy1Lxtb3d5
	 +GUlgHABoxg5bWfL/7OwhBgeGjl3WOYKsmscJr8G2RuVgnQTP6JX18h/mUtu9lgCKvpXlb0OVqD2
	 FLbre00Psevvm9fbLzjxvL07WdKnaddkrbqn9vBpdU+Q75rnQnJMlDiuiRo6JRJAi1Pen/Y6216C
	 paxiZsem16YMFhub/r4O2hj8gZqqqFGPObHgUXiGR6Mog8EkSm9WLKNESOWK9TUWTMKaajQAbTXr
	 2TB1IEbZxNnjTspJqWCMm8Cu3PiZM3JyxbLT65iGKhXD0Ir7aEmklZOsS99jKRaA/AwpVgQ41xoF
	 kDT4VFhJFbm+9V+zcYSmF6ZuWTIFfKXrI5eV+AlDpvTN5/tHt5gjPZ0N+bSs2SqYNMpwkG1XywVj
	 0l+9Gw0/s+Ar0r9qlod4AHsnmbfsiUgsS5Tp1b7wiJzcLjbZBymiKpHL+gPF8wBiiiDO2D+JBjpa
	 xIr62Qnob3O66nZYADBWoWgMpYSW+IoLRu9fmm27Okovr03KMtRihFJx9feRYureRyuLh5rLOrEx
	 QZ0iGHTsnAY2QAwP3XO1AoxJAHSu/eqVGqU60Uyiq/tWSW7YSpo5qFzYRwSPZ3RgXbngdTR5QAFt
	 ywd4ByM+vHJr/op4mQ4NwrmKSvPp2XxRjQD/gUvVdPxFPgfFR82gzk6+wPBsU7lrIpzM0Uu2pvdO
	 62WYWfrhs5+k94+bVSvk1+yFiJo39GPKOWecJpSsTZ4kc/LucPDcrfj6S4OXdGzy++jQWyMb7nO4
	 wghKzBS55LgL8wNrRRW52NfM93v8hFvgtcydHrkTtb05h2mbgWFMnce/toT/1t4VyNFwUa7tAjrT
	 LIstUpUwap2XLs5pLq1x6xC0a53+SHIqsRhGoaa5ckdsjC2anJMBSLW5b66h5CnTEspOBOxSkxvr
	 y6RZ4/sCaP5+ATul4SzoYeolRS7WNY6GJGsPuvOVS7yE6gT80vVafhtyKdOPAM95NDMtwHX5RFRQ
	 ZPxNbH
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhaoyang Yu <2426767509@qq.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] serial: auart: check clk_enable() return in console write
Date: Sun,  1 Mar 2026 16:22:56 +0000
X-OQ-MSGID: <20260301162256.267212-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_082304_231956_A41EFD2D 
X-CRM114-Status: UNSURE (   8.84  )
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

Add a check for clk_enable() in auart_console_write(). If
clk_enable() fails, return immediately to avoid accessing
hardware registers while the clock is not enabled.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/tty/serial/mxs-auart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index cc65c9fb6446..693b491f1e75 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1318,7 +1318,8 @@ auart_console_write(struct console *co, const char *str, unsigned int count)
 	s = auart_port[co->index];
 	port = &s->port;
 
-	clk_enable(s->clk);
+	if (clk_enable(s->clk))
+		return;
 
 	/* First save the CR then disable the interrupts */
 	old_ctrl2 = mxs_read(s, REG_CTRL2);
-- 
2.34.1


