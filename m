Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7303C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9yE51MTO1wGbtpFHeDVZ3hHLhbhq0aaeAvNWmsU08Oc=; b=k6V5FqTA58SxvCKZcaSaOa0712
	ooA11gVgAsAxwntK/e++fv8j8nKWb1rfOPA4bUoYu/63io1AHOpR6BdSeUjAMUxKA7K2/H4YH2KgC
	U2aXO2ic3CsBZBOFoLLkujCfJMpHaOFqnUEpXrde3RzUPMRGt3C/TpsI0kG9GWmb9BeLSGyaEUu0C
	mTWvgmm6XFt/H9HTOhyrit/nOX5Nk/G5wrC5SVgv2hHB5FFOQ2o6rZ59Fc0fblbYpHadY6++dfeGZ
	osGVdMYOpZFSLWk8b7YoA/A6CKKwhj+IA6n6mZU6Cj73mAFnLKOn6MOD2pUEl/3+6JVsPHMLLzM7l
	U8k7oMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZl5-00000002m27-0sPT;
	Tue, 01 Apr 2025 11:26:19 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZjG-00000002lt9-3JXg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:24:28 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZRlyC1683z8R040;
	Tue,  1 Apr 2025 19:24:19 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 531BOGUt076517;
	Tue, 1 Apr 2025 19:24:16 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 1 Apr 2025 19:24:20 +0800 (CST)
Date: Tue, 1 Apr 2025 19:24:20 +0800 (CST)
X-Zmail-TransId: 2af967ebcce402b-8dfac
X-Mailer: Zmail v1.0
Message-ID: <20250401192420169tLRsDis5R0RrVmdFnFuS9@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <alim.akhtar@samsung.com>
Cc: <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <krzk@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <jiang.peng9@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSB0dHk6IHNlcmlhbDogc2Ftc3VuZzogRml4IHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cgaW7CoGNsa25hbWU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 531BOGUt076517
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EBCCE3.000/4ZRlyC1683z8R040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_042427_136447_DB6832F8 
X-CRM114-Status: GOOD (  12.71  )
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

From: Peng Jiang <jiang.peng9@zte.com.cn>

Compiling the kernel with gcc12.3 W=1 produces a warning:
/drivers/tty/serial/samsung_tty.c: In function
's3c24xx_serial_set_termios':

/drivers/tty/serial/samsung_tty.c:1392:48:
warning: '%d' directive writing between 1 and 3 bytes
into a region of size 2 [-Wformat-overflow=]
 1392 |  sprintf(clkname, "clk_uart_baud%d", cnt);
      |                    ^~

In function 's3c24xx_serial_getclk',
    inlined from 's3c24xx_serial_set_termios'
at ./drivers/tty/serial/samsung_tty.c:1493:9:

/drivers/tty/serial/samsung_tty.c:1392:34:
note: directive argument in the range [0, 254]
 1392 |  sprintf(clkname, "clk_uart_baud%d", cnt);
      |                    ^~~~~~~~~~~~~~~~~

/drivers/tty/serial/samsung_tty.c:1392:17:
note: 'sprintf' output between 15 and 17 bytes
into a destination of size 15

 1392 |  sprintf(clkname, "clk_uart_baud%d", cnt);
      |                   ^~~~~~~~~~~~~~~~~

The compiler warned about a potential buffer overflow in the
`s3c24xx_serial_set_termios` function due to the use of `sprintf` which
could write more bytes than the allocated size of the `clkname` buffer.
This could lead to undefined behavior and potential security risks.

To reproduce the issue before applying the patch:
CONFIG_SERIAL_SAMSUNG=y
make vmlinux ARCH=arm64 CROSS_COMPILE=aarch64-linux- W=1

To resolve this issue, we have increased the buffer size for `clkname`
to ensure it can accommodate the longest possible string generated by
the formatting operation. Additionally, we have replaced `sprintf` with
`snprintf` to ensure that the function does not write beyond the end of
the buffer, thus preventing any potential overflow.

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/tty/serial/samsung_tty.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 210fff7164c1..5a0005033afa 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1339,7 +1339,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
  *
  */

-#define MAX_CLK_NAME_LENGTH 15
+#define MAX_CLK_NAME_LENGTH 18

 static inline u8 s3c24xx_serial_getsource(struct uart_port *port)
 {
@@ -1389,7 +1389,7 @@ static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
 			!(ourport->cfg->clk_sel & (1 << cnt)))
 			continue;

-		sprintf(clkname, "clk_uart_baud%d", cnt);
+		snprintf(clkname, sizeof(clkname), "clk_uart_baud%d", cnt);
 		clk = clk_get(ourport->port.dev, clkname);
 		if (IS_ERR(clk))
 			continue;
@@ -1787,7 +1787,7 @@ static int s3c24xx_serial_enable_baudclk(struct s3c24xx_uart_port *ourport)
 		if (!(clk_sel & (1 << clk_num)))
 			continue;

-		sprintf(clk_name, "clk_uart_baud%d", clk_num);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%d", clk_num);
 		clk = clk_get(dev, clk_name);
 		if (IS_ERR(clk))
 			continue;
@@ -2335,7 +2335,7 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 		/* now calculate the baud rate */

 		clk_sel = s3c24xx_serial_getsource(port);
-		sprintf(clk_name, "clk_uart_baud%d", clk_sel);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%d", clk_sel);

 		clk = clk_get(port->dev, clk_name);
 		if (!IS_ERR(clk))
-- 
2.25.1

