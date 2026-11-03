Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8747606D805
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NLpl+bFS;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KqcxIuFf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=; b=NLpl+bFSrhryHn
	2MnaW0rZWWpwXGZeL0BMPC1TBULmbb0OHr10JCn35M6f9PV10ZeRLMC6Teobmm74etCZTIwYYvWDx
	Y9r/N0nBhMJ8OpNAxzXQ+nx89eO7YfLIX8VtmhVdJajOtGVq+JhnCvTrxqzTqGGu/rEfEWHgFF1pZ
	wyIwBiOUOnhzm1SrjM3VJ9LplWoXJrpVdRwfIn5ZSFmvMvAijeryRPvrt0G2L5BbQ779hBRuPemrs
	vU5hDK4/PafxCyLBcFgXZDooHHFFBMQmDyx32pF8Bgy92jL03yICaKDWUULXgGR5whg1wGeUyLTrW
	Od9bzJ02y44QvdpVthjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6k-000000034b6-2ioI;
	Tue, 03 Nov 2026 16:11:34 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6b-000000034Uo-0u58
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:28 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4f14642adb4so2514514b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722284; x=1794327084; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
        b=KqcxIuFfYNFNgKUytdYtXIpE7CbZKYnB1T5ShK+J2AFl15G8WLBJSLh/6imYN7yThX
         FycyAe8pDA65y4g+DRtrCRfeD0mISYBqP+oWTkf26BsuTk/bR1r5eKfyNznqeGGJ3BUd
         YNtT35FlsOnGt+7tkUt1iTYMekbioVurTk3Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722284; x=1794327084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
        b=JBhocr26hWQ5nN+zvanEpm/Ls/+ilcKYap+bZuAuBsvilcEAS9ZGdTURP2h5hTeLub
         osHEhnk+185lDyZ7cTawQI59gQJbOyjs+xwcUn+kKf86YFgq4G2UJhRXHWML1V3eBaLY
         nZVvZ9H/ipq+vIypwykOjJSEAzX8qWNIr8kP0d0z8bNbCfujjv9dNeoD/+0aQd0y/SR/
         4C3abwSxlQSh3Wwfsc6Ssv89Og1ENz8RnTxzUcuRHz1VkR7xPzcXU3zunAPYJ60WIDIU
         4cxSr0zdtvqRGc82nihP/lVdkdk4e8ewnVm4MGBLC6eO9rPcmVupdDwxbi7kR8nUDpC/
         WIdQ==
X-Forwarded-Encrypted: i=1; AKwUvBymy9Y6x/hEtNQs0GMPH8/dvhPe4iNPHHduEBgmIx8R6P+wVaSwAhAXzAcHtYF8NL1ecKE6FhwDc2KY+88Jzqfq@lists.infradead.org
X-Gm-Message-State: APuU4Z+QT6BeBB3Rl8XUeczuMFY5wqeGypUpx36Ss0Iq+/Vlm2yz2Y0K
	qqDYD++mclQzvSewFN7OKUx25Mnm15oi3h1PWtEtimr/6CYkOvb0mkFjdwsgjCZY4A==
X-Gm-Gg: AYBFou2mCztpsvtkS/myUlngxtrSItLMszD2868rs02knjRRQJAjOcs1UuAggHA7O3Y
	6tDIyXkPLE2hjgwHaxk2FlbCRksU6fS2TeE0P3xQiNw8f2uQEIEt2Vq2PPzttqZk5jiZID/6M7z
	JwGOQcHVrkEbIw849yPTlztz/W3/eU2mbjY3ke1p6kEuGCNYYARK+7C+IgoGCoR8tTqdTksVzKE
	078bfcCJI2/2uIrU/3m88GByks2l73cBaR7btqlE3Z3xoeFsTbUvKJHvQdg3VtLneWk8QyvWCug
	hVwmW2GypDjFeHTifb2SF5JwjUoPQi4FRCsq9cZN8qhpS1lvZYIUiXvaZz8mmt8QWALyyvGYpLE
	FHQJcCxH0c2olCEr/k2vLxZokCRl3Jhao8PMbUEu1EFp5AGVblyjY2nED3HsZoXt4JoYemYSwnV
	JcKXRy+dnhdtsQaZRWEhRLOBpc4Dq1leCgK0uoTSjjurer0d52lR/VZDryzw0eU/A9TNzpDkIH6
	yM8Db/fXQmMYuRIdbcQwnoWY3P8iNdyBvXmy5smEsPHqvnuIJHw0M/IMvJ8kXfUC3RSNLsTM53l
	EynOC5JDfhKi/H8TEgBS/5UV3D+JOMJhd9TMGuk1LtlgyPFVrha75Xhy1ic7DQgXx9MOCkOE7ku
	xXn24fjU9GvsIvTQ=
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr9137854b6e.14.1793722284423;
        Tue, 03 Nov 2026 08:11:24 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:22 -0800 (PST)
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
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 8/8] serial: 8250: retain DMA resources when termination fails
Date: Tue,  3 Nov 2026 09:11:04 -0700
Message-ID: <20261103161104.2449407-8-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081126_235126_9C65DBDE 
X-CRM114-Status: GOOD (  11.23  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

Thanks for replacing the fixed 100 ms sleep with exponential backoff
(1 ms -> 1 s) and adding the initial/ongoing/recovery diagnostics in v9.

Following up on our v8 discussion regarding blocking in
serial8250_terminate_dma() versus non-blocking resource quarantine:

1. Why non-blocking quarantine cannot be done purely inside 8250_dma:
   I agree with your v8 reply and the updated commit message here that
   serial8250_release_dma() cannot simply return early while leaving
   serial_core to proceed with normal teardown:

   a) Immediately after serial8250_release_dma(up) returns in
      serial8250_do_shutdown() (8250_port.c:2474-2511, and similarly in
      omap_8250_shutdown() at 8250_omap.c:794-803), the 8250 driver itself
      clears the hardware FIFOs (serial8250_clear_fifos()), reads UART_RX,
      frees the IRQ (up->ops->release_irq(up)), and drops runtime PM
      (serial8250_rpm_put_tx(up) / serial8250_rpm_put(up)).
   b) In uart_tty_port_shutdown() (serial_core.c:1841-1853), immediately
      after uart_port_shutdown(port) returns, serial_core unconditionally
      calls uart_free_xmit_buf(port) (line 1850) — freeing the page that
      dma->tx_addr is still DMA-mapped to — and powers down the UART via
      uart_change_pm(state, UART_PM_STATE_OFF) (line 1852). Likewise,
      uart_suspend_port() (serial_core.c:2502-2514) calls ops->shutdown(uport)
      (line 2502) and unconditionally sets UART_PM_STATE_OFF (line 2512).
   c) Even if startup() returns -EIO on reopen when DMA is still active,
      uart_port_startup() (serial_core.c:422-423) has:
        if (retval && capable(CAP_SYS_ADMIN))
                return 1;
      which causes uart_port_activate() (serial_core.c:2060-2062) to set
      tty_port_set_active(port, true) with tty_port_initialized(port) == false
      and allows root open() (serial_core.c:2040-2042) to succeed (0). From
      that state, ioctl(TIOCSSERIAL) -> uart_set_info() (serial_core.c:1068)
      -> uart_shutdown() (serial_core.c:466-511, which calls
      uart_free_xmit_buf() at line 510 outside if (tty_port_initialized))
      or uart_hangup() (serial_core.c:1942-1950) or uart_change_port() ->
      release_port() (serial_core.c:932-933, 1072) can free the TX buffer,
      power down the UART, and release MMIO mappings while DMA is active.

   We modeled these cross-layer paths in Serial8250TxDmaV8.tla
   (QuarantineGuardsShutdown, QuarantineGuardsAdminOpen, and
   NoDmaOnPoweredOffUart in Serial8250TxDmaV8_UnguardedQuarantineHazard.cfg
   and Serial8250TxDmaV8_AdminReopenQuarantineHazard.cfg vs.
   Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg, alongside
   Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg at
   https://github.com/ismell/linux-8250-dma-tla), and TLC confirms that
   quarantine without those serial_core and PM guards violates
   NoDmaOnPoweredOffUart / NoConcurrentFifoAccess (in 6 states) and
   NoUsersAtFree (in 7 states). Given that enforcing non-blocking quarantine
   requires coordinated changes across serial_core.c, runtime PM, and 8250
   shutdown, addressing non-blocking quarantine in a separate follow-up
   series and documenting the limitation here makes sense.

2. What in-tree DMAengine providers actually return from terminate_all:
   For context on when the retry loop in serial8250_terminate_dma() can
   trigger, I audited all 78 .device_terminate_all implementations in
   drivers/dma/:
   - 64 out of 78 unconditionally return 0.
   - Among DMA controllers used with 8250 UARTs, synchronous FIFO-draining
     drivers (drivers/dma/dw/core.c dwc_chan_pause ~40 us,
     drivers/dma/idma64.c idma64_chan_deactivate ~100 us) already poll in
     microseconds inside terminate_all and return 0.
   - The only 8250-paired DMA controllers that can return non-zero are:
     * drivers/dma/tegra186-gpc-dma.c (tegra_dma_terminate_all, lines
       714-743), which already polls readl_relaxed_poll_timeout_atomic()
       for up to 5000 us (5 ms) in tegra_dma_stop_client() / tegra_dma_pause()
       / tegra_dma_pause_noerr() (lines 389-414, 676-712) before returning
       -ETIMEDOUT; and
     * drivers/dma/at_xdmac.c (at_xdmac_device_terminate_all, lines
       1999-2039), which only returns < 0 if pm_runtime_resume_and_get()
       fails.
     (Even across all 14 non-zero .device_terminate_all implementations in
     drivers/dma/, the only one designed around a caller retry loop is
     cppi41_stop_chan() -> cppi41_tear_down_chan() in drivers/dma/ti/cppi41.c:
     652-770, which is a USB MUSB controller used only by musb_cppi41.c.)

Thanks,
Raul

