Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C8F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sxfRRTWf;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f8Tt73tR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BH2WnjXWwsl9S26zTcVnDiXysm6ntQCEcJClsDwXCEM=; b=sxfRRTWfueWQib
	y3pbgpcUsNoE1JqLm/NktuLSVa6IOkefpW5GnjSESmhfTQPVGNldD1h0RBWva4kRO0eIgUMVq97eJ
	sG4sb2z7gctM3gD5gWDX7kaULw2l9jYST5sXaUfF0Q7tHYDW/RkCBLpaWeVNyf8Xij7hW2rxWDYls
	q3+laL5ozSffAoNdVDd2seEiKNzm52kLjJXG09EPnBK0c4dQnvI48Wp3dvHyMGzbYsJRjgGJE5rbV
	/RWSLeRFrcN/mDUtWuy2+W0guJY7bPKPT9Ro6Y+7VDHjIs+O6/MX2mko+F5TRiaMF+0fkdy2HUWfg
	MY097sRDTqqSTRHlVcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAZs-00000007wtE-19Qd;
	Wed, 28 Oct 2026 20:48:56 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAZp-00000007wrU-2uWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:48:55 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4e4a4d77e5bso63875b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220531; x=1793825331; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BH2WnjXWwsl9S26zTcVnDiXysm6ntQCEcJClsDwXCEM=;
        b=f8Tt73tRhXwJZ+vV4kNYFBQtl+mvbmFjHuDy18wrpKLt3lsLrKitim/yXaT3nj68Jm
         df7eF5EWVt9h6dpYQwSDNdtV5FXfO6GtyGnjWHroV+cCpEnKiGh2kpMvAMlTgFhbkJ/q
         O7zc/WH49kcz63+mrpimb8Mdg/J3VQkUOH9Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220531; x=1793825331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH2WnjXWwsl9S26zTcVnDiXysm6ntQCEcJClsDwXCEM=;
        b=FrolJIfCpco0fbRmERME4veU8+gLpo7TZSMMLdIAR5gOcoMFQsKLUuL3dWfUporgVl
         bsgraBaXzYectfy4IflMQC7KhVSpn4BJVGd+eU2AMxYLY+0lfdlhnogk0e/M4YvaJ4yC
         15niM4eIoRZxfDK/rP1chGeWgGmFEP+BSuuo6Mexf0+8gyuIsnAht0LHU8XsrmUuDTDQ
         jCqyTqYUytC+VQjG+ZWyrAllYd5+EQ4/Cvlxgi5GleU+wOr9I0QFl4Zi4Wh0upQPq7LF
         +OzI0Gpx/PMjQc75bWExOkmiyi0Ze/AcjPSUbEXjEQyUKBHrzJv52Gdzxm9Xaq6aVzlE
         vg/A==
X-Forwarded-Encrypted: i=1; AKwUvBxQGnY2LvNlGgV/LwPxkCJYL32c96Li+Sv7z5XvuXik4J/HCWvJdOAGowPE0HTNmVwaQj1AGG2cL8hKZRCXw4Gp@lists.infradead.org
X-Gm-Message-State: AFq9FYKh9dNomXfB5fhe7eRhpKPG1V6BPi35XJDpm/06epOeCywix40s
	jkkAEixXhYQ9hf11GrBxWsrgr3e+8H8tf/IKoSbqDks/8Z6J3halF1vPluZKkgJcW1LO5XnIF63
	VEhg=
X-Gm-Gg: AYBFou2nTyA5O/HjHBwSxeJcIhDfX1mZF51NMMBQtCxgkudpTXmyCuQUJyLcZ2gMG8S
	zl9JY/QTFm6ykofbafO67bdAicfA/mgXxkJ3NKfEy9b9ljcLqxVZCqnfEXZw0BD1YXO/nibS50m
	M4ZocxNIFCTXJYQwF//JjtBQp24X7kUdvkEeCKKlNlugaz7mXd42u8kTkHdDBUdvthxwYoEpHFD
	+GhPSjyy5aV82R48210guwMZH7Y44i6bp0jyECnNaQtX+EJgVIUhGoqx5UVicBdAyctcS4BYV/P
	f1h3+sSViipAMRkkUydzWVzNV2a3KnkwKN5t+O+zHjjcnCU8IUyMnhpa0r5gA8y/RRsdVMuoBse
	qbz8PEsh/F+n1SttA9sE3NCOlq1Ke5MEXptN1dX1ATpzGq0RDDxS8qYUxec/FtXNb9hsN6P4x+n
	vElsyP/xzgenm9dplvBCN02BvbQqRP/Cuh0bL8rFjFwqynoIKklkYqukG+Tn5DcA0SAayihpAnl
	0tCXgcrExMmtHu1EogufIL+VNoLWtNaCjdT71oduOLexJn0dlCbgZ7oCF5EAfNWSh4H3KigUga0
	2pSXRnqz1nH++Rd3FYmE/MdJap8C0co0/aMIU9z9TuXeWjWuXHRToFX6zXSn/SPYxnCJDrZ+rC+
	BNJKveEJctjjcrVGjtKoYkeKFOtYYH+3bcNA0amQ=
X-Received: by 2002:a05:6808:bca:b0:4b8:4703:db97 with SMTP id 5614622812f47-563efb4d666mr411105b6e.32.1793220530793;
        Wed, 28 Oct 2026 13:48:50 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:50 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 2/5] serial: serialize asynchronous write wakeups with the port lock
Date: Wed, 28 Oct 2026 14:48:45 -0600
Message-ID: <20261028204847.3471382-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-2-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-2-985a023ba4b4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_134854_020621_3AEC8AAF 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

A few issues in this patch across the serial drivers:

1. Recursive self-deadlock on ltq_port->lock in drivers/tty/serial/lantiq.c:

> @@ -239,7 +239,8 @@ lqasc_tx_int(int irq, void *_port)
>  	spin_lock_irqsave(&ltq_port->lock, flags);
>  	__raw_writel(ASC_IRNCR_TIR, port->membase + LTQ_ASC_IRNCR);
>  	spin_unlock_irqrestore(&ltq_port->lock, flags);
> -	lqasc_start_tx(port);
> +	scoped_guard(uart_port_lock_irqsave, port)
> +		lqasc_start_tx(port);
>  	return IRQ_HANDLED;
>  }

Inside lqasc_start_tx():

	spin_lock_irqsave(&ltq_port->lock, flags);
	uart_port_tx(port, ch,
		lqasc_tx_ready(port),
		writeb(ch, port->membase + LTQ_ASC_TBUF));
	spin_unlock_irqrestore(&ltq_port->lock, flags);

uart_port_tx() invokes uart_write_wakeup(port) while ltq_port->lock is still
held (nested inside port->lock). If anything in the wakeup path or printk()
invokes lqasc_console_write() (which takes spin_lock_irqsave(&ltq_port->lock,
flags) at line 612), the CPU will immediately self-deadlock on ltq_port->lock.
ltq_port->lock should not be held across uart_write_wakeup(port).

2. Missed unlocked callers in drivers/tty/serial/dz.c, drivers/tty/serial/zs.c,
and drivers/tty/serial/jsm/jsm_cls.c:

The commit description states:
"Ensure every driver caller of uart_write_wakeup(), directly or through
uart_port_tx*() and uart_handle_cts_change(), holds the port lock first."

However:
- In drivers/tty/serial/dz.c: dz_transmit_chars() (lines 266-288) only locks
  &dport->port around dz_stop_tx(), calling uart_fifo_get(&dport->port, &tmp)
  at line 267 and uart_write_wakeup(&dport->port) at line 281 without holding
  dport->port.lock.
- In drivers/tty/serial/zs.c: zs_transmit_chars() (line 641) only acquires
  &scc->zlock, so zs_raw_transmit_chars() calls uart_fifo_get(&zport->port, &ch)
  (line 621) and uart_write_wakeup(&zport->port) (line 630) without holding
  zport->port.lock. In addition, zs_status_handle() (lines 673-680) drops
  &scc->zlock and calls uart_handle_cts_change(uport, ...) and
  uart_handle_dcd_change(uport, ...) with no lock held at all, which triggers
  lockdep_assert_held_once(&uport->lock) in serial_core.c.
- In drivers/tty/serial/jsm/jsm_cls.c: while jsm_neo.c wrapped
  neo_parse_modem() in scoped_guard(uart_port_lock_irqsave, &ch->uart_port),
  cls_parse_isr() in jsm_cls.c (line 585) still calls cls_parse_modem() ->
  uart_handle_dcd_change(&ch->uart_port, ...) without holding ch->uart_port.lock.

Also, in Patch 3/5, adding lockdep_assert_held_once(&port->lock); to
uart_write_wakeup() alongside uart_xmit_block() / uart_xmit_unblock() would
help catch any unlocked callers automatically.

Thanks,
Raul

