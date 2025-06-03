Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2209C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyerjqJWeMkiU3JFd0PuWL/CwiYER2qHnJinnhBcrJE=; b=sCrpx0Un5l0lh7peoYCHD0Zr8k
	HwSwVr0rNrsXutOrPNPeYY745CqanuT22rQR0aeP4JCTY2FVmzTq+ALOeFgZNzxhNZVMjntJ7VGVe
	mjYoWguRYDShVjutmEPOq+AfnqcZgv5fH6ML2Trbejuju1OJs3zpllCKy5yR4hq574u59Dlh6ao+q
	5XxzWPQHRFqbnWogJz4CVbqwAy8Bh0pcXwWwpx3fedn+363PmNdxOjXJjI5H8rku4VLN6eGUMCLzM
	sg8tguymBB9X85y5tKBl3/G2YxhMhwYSA5o858R0Vl2xjTSB6qCjz2hMmFYwh4cQDyJIWw6dhLMFq
	SZP5GNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBW-0000000Ahbr-1Du8;
	Tue, 03 Jun 2025 10:47:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMP8R-0000000Ah1d-2og3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 10:44:48 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748947485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qyerjqJWeMkiU3JFd0PuWL/CwiYER2qHnJinnhBcrJE=;
	b=wlzLbfwLHjpswLCvW1kkayxbHDXig57HNT37SNWboCbiDaDeZYhzPLmZ/DrZw4CxEWOJPz
	1s8HcczWfbGYkaQgYvgr6BfIOqkdR/aIhXv4R/Nf2TFMfhrmq9Y9OwKWrQOpnmVUIPd+xh
	pL5U6vd5FGmN2JOkAnxK7IXm20C0442/yp/qsiSxWeRRzZv9PTQ4EIUqZ/IfZW7N9H1O8+
	F8b1K+2j64BBypXlJos2NQY5jy003Y4YgD2XhoTLBnALSAdZCWMyqj/3E4XhjfgC0gn/F0
	3Td1V+UQECIXpSp9CQyi6+EwMzzELbLFHXlcvGfFLCBi0knI7sLtqPDzInJw3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748947485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qyerjqJWeMkiU3JFd0PuWL/CwiYER2qHnJinnhBcrJE=;
	b=k1gR3bXODmtwnAo31Z4DtIGO9CBdeclvJrlw+1wVoOFu3E76stL6fOXgqB61E629HPI9a3
	bAi5ika9rvkNeWCw==
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>, 'Michael Kelley'
 <mhklinux@outlook.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, 'Ryo Takakura'
 <ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <84y0u95e0j.fsf@jogness.linutronix.de>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
Date: Tue, 03 Jun 2025 12:50:45 +0206
Message-ID: <84sekh5cki.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_034447_860245_EE5BF98C 
X-CRM114-Status: GOOD (  13.44  )
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

On 2025-06-03, Michael Kelley <mhklinux@outlook.com> wrote:
> The problem is the failure to stop secondary CPU 2.  (The CPU # that fails
> to stop varies from run-to-run.) It is mostly reproducible, but not always. I
> bisected to commit 2eb2608618ce ("serial: amba-pl011: Implement nbcon
> console") in the 6.15 kernel.

Unrelated to this particular report, I am looking at commit 2eb2608618ce
("serial: amba-pl011: Implement nbcon console") and I do not think it
implements atomic printing correctly.

pl011_console_write_atomic() assumes uap->clk is disabled when it is
called. However, if it took over ownership from the printing kthread,
the uap->clk is already enabled. And then after printing its line it
disables uap->clk, even though the interrupted printing kthread expects
uap->clk to still be enabled once it regains ownership.

The atomic printing needs to track if the clock is enabled or disabled
and act accordingly. I suppose something like this:

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 11d65097578cd..914449b46b95b 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2520,11 +2520,14 @@ pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt
 {
 	struct uart_amba_port *uap = amba_ports[co->index];
 	unsigned int old_cr = 0;
+	bool old_enabled;
 
 	if (!nbcon_enter_unsafe(wctxt))
 		return;
 
-	clk_enable(uap->clk);
+	old_enabled = __clk_is_enabled(uap->clk);
+	if (!old_enabled)
+		clk_enable(uap->clk);
 
 	if (!uap->vendor->always_enabled) {
 		old_cr = pl011_read(uap, REG_CR);
@@ -2542,7 +2545,8 @@ pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt
 	if (!uap->vendor->always_enabled)
 		pl011_write(old_cr, uap, REG_CR);
 
-	clk_disable(uap->clk);
+	if (!old_enabled)
+		clk_disable(uap->clk);
 
 	nbcon_exit_unsafe(wctxt);
 }

I am guessing that it is allowed to use __clk_is_enabled() for this
purpose. Otherwise it can be tracked as a bool in struct uart_amba_port.

John Ogness

