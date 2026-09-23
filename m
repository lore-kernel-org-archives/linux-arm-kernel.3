Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473BBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ONYe/7w2EXW8py/4ztuf5woebx//EOScMOnkClgYt0=; b=wkDKZYhN7W//4SqrFCGR0peiBB
	eLcaGVUDTYbMWavLwqPXDex0Umo6l9dKhR219b+pKlvcc1NQpcsDnmEw62tfGWX8xc7f/0dkJeftT
	dwiXxQpT5vt3+GasEzEmrS1fK6STlRyluxdLg1KLuUnsd+psgtCQJmtqy2nyqDwmGeB1SyVGT3WPP
	3abT1cqDTvob1UwjNpfD64RhQi1ywlhdBaIZb5UW3z6UfpgtGb5bfuf/9ikYDuh7wdSMaU+Y4KuLx
	vrqTCOdZkHyU+CzrE11202ZvaT1dV79Uj96jjzNSlX2SWp70s4bIujOot3PpdX9wfDpNXP9Kuu7Iz
	x7qcMcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D31-00000006z8m-2tGC;
	Wed, 23 Sep 2026 02:49:27 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D2z-00000006z8V-1gRL;
	Wed, 23 Sep 2026 02:49:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/ABI: testing: aspeed-uart-routing: use literal block for console commands
Date: Tue, 22 Sep 2026 19:49:18 -0700
Message-ID: <20260923024918.840039-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use a literal block for console I/O so that the lines aren't merged
together in the produced output.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20260921.orig/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
+++ linux-next-20260921/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -8,9 +8,10 @@ Description:	Selects the RX source of th
 		selected option marked by brackets "[]". The list of available options
 		depends on the selected file.
 
-		e.g.
-		cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
-		[io1] io2 io3 io4 uart2 uart3 uart4 io6
+		E.g.::
+
+		  cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
+		  [io1] io2 io3 io4 uart2 uart3 uart4 io6
 
 		In this case, UART1 gets its input from IO1 (physical serial port 1).
 

