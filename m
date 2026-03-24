Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A8FF532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwnzpEmV001Lnwtrm/+xTMEqD/Zl5WTJLxCkJF0RDWM=; b=sovYkV2hQgZX9oFN4uFFDuDKj/
	2EdnOgoUTVf43UfBLOUWiBEh9dxe10gLLhWsCbkfwEeqQv51bylFg9R2CaHE21iwSXUnsvqibRqmc
	1axskhAqrrJBpi8kMZ9Ma8kuFyyr0CGUVpzRgR/880+II/69TTynym1755M2jbyzgAr5yCKlZ8grv
	gglJ1PQwcn/pBRgD0Vl5YQcYFIWXrqNE2gUOeJqpEqF0xuD9pbk50oD86giLRKS/1JeEmf75ZRaW5
	SIw/FfMqM5YqPBCMHWF9ixUCYW5MbxqB3ui/Eh8AldQJixZHOMCKRBZajcRdD3mqHVJUoMHfwYgla
	Fsq9ljAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rqa-00000000QM4-1OqW;
	Tue, 24 Mar 2026 02:50:24 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rqS-00000000QKp-2JrP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 02:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774320549;
	bh=MwnzpEmV001Lnwtrm/+xTMEqD/Zl5WTJLxCkJF0RDWM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=O3s4KoNRQrwGjDgDhTLQebvXygh36CLCgq0u0k6LPMmf+ELsYnhsXvil0xkO7sR4m
	 6QZCa8XvedD9URvEU2jcxqq2IJSkDatqXNwm1tAGjkJ6qUIjVLY4yJrffxTeJSe+Uc
	 TQzsXiKQlk0doC4T6X1V3cOz1kCLA+wtufzxyn94=
X-QQ-mid: zesmtpsz5t1774320541t42f9849a
X-QQ-Originating-IP: GXYWvu8OfDyrTQdsRFvpq2WHWIUNA8jI8zvOen2e8QU=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Mar 2026 10:48:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12893628811713433287
EX-QQ-RecipientCnt: 14
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	richard.genoud@bootlin.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg,
	Kexin Sun <kexinsun@smail.nju.edu.cn>
Subject: [PATCH v2] tty: atmel_serial: update outdated reference to atmel_tasklet_func()
Date: Tue, 24 Mar 2026 10:48:57 +0800
Message-Id: <20260324024857.3244-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3bd295ee-1607-49db-a12e-5a4d4fc81c5c@bootlin.com>
References: <3bd295ee-1607-49db-a12e-5a4d4fc81c5c@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NzSDQCFWCzVTre9l+NVEhEEbNAwc89B80fFz2uIQ6QtXutcK1xClGZmI
	AkU4kIIixzBDU4+/brnj9JmxsijKSz9MfmfCjNudzaA7ZcNQJMwARGoemA/rUpQt68Dc5vT
	5ik6o4d1bZ6pgjmyyGTcvWXeg6mRzQ4loG6VFCaPrIML/W4e5MwIC3qe47KY8hrW7WVu7yB
	z5kC51nqEtSarOWUVjWsWhUatU1hkf5ZkjqR5wujF0mAFjofOuBS5cpudKCjcP7PCgMW4h9
	Dj2DZJTAYoKQwUVEexv2yikjWVd5feaJlGunhDWwukAqbadRKoUKwXYFRZkcRuHpduzSC2J
	viiU6xwLCUl8RLih+Nrmo7qwxjQPzsu3nEy6dlDGOi/BHYMVun5ZwTLUbyM7MDepopuXISw
	YfOVcbR/rdPwRZpfiWDawrHTPOLxVZ31RoxRmQxzSXEd0onGz77+mqpaEvNI0MUrUbB1Q1B
	vuf+6UBt49wvMONwST2WxSAUwawygHRgjjYwHlTKlz4ZKEb1J80i/5OwdGosi4QHjk7Cdft
	i89yKZSO4AbecaIunqtmtdjW6YXtnYJtHj8xMyryWjdEH657hQbOv0GTUwyTnYrzPY9MLXx
	Z4fV2qdPilZwCyy+IV5MnJJzkH8yCBlYWlmO4oMSvsjolsK1HgfaLgi/l4/NZUAPTJ49ls3
	kVPkKhKQ5t9RIIm8MTsvbW+yY+/nWxWhuw5xNjTaNQJbQiUIHMOI2LbUedwGHB3lPa8D02t
	WYS3XBpjm/ox0lzyLI68h8yUbN9b+nSRr99ICJeTU04HOixZ6DaeJsQbflNcBYcmre+41TQ
	1idv+ut1Us03JAHq9FEzqX4oWC/wX/ngH59JcCav7rZWYxjwi3Z/ZV/EWC6fKS+tSBHX32d
	s3/DpbixC/z82pv4cHsxjU9PdR/nPoGtjSb143MGMRJ3BZPhfCX4GF0hHKB04D4c+HfrSJz
	Di/yjoeeHaqdQaFVwfBH6ZnqhMdqrkOhGhpRNGIazswn1T5aUCQBUZgSDBMsZG1wx+3TvT8
	L5x9zRv2VXajiLh6xB
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_195016_966614_3A6684A9 
X-CRM114-Status: GOOD (  10.36  )
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

The modem-status comparison that used irq_status_prev was
moved from atmel_tasklet_func() into atmel_handle_status() in
commit d033e82db9a5 ("tty/serial: at91: handle IRQ status
more safely").  Update the comment accordingly.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/tty/serial/atmel_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 08dd8f887956..5d8c1cfc1c60 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1927,7 +1927,7 @@ static int atmel_startup(struct uart_port *port)
 		atmel_uart_writel(port, ATMEL_US_FMR, fmr);
 	}
 
-	/* Save current CSR for comparison in atmel_tasklet_func() */
+	/* Save current CSR for comparison in atmel_handle_status() */
 	atmel_port->irq_status_prev = atmel_uart_readl(port, ATMEL_US_CSR);
 
 	/*
-- 
2.25.1


