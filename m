Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+x95Rh0;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SqfMAHgA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=; b=g+x95Rh0taMg1u
	nREIiCiA9S1r2Hlev2ckTZEYJyL8WS8ld0Z88B8xyZtFtRyTPGjAiCv7y4t173+i5szxEgPJwctL2
	nV8QQ8k+FCtl6RsYh0NOQakxdrSbhyUyM3X5jhnMAhgt9EuUfPoA3LapDKkOqMnnQzKfhkXDD4VEG
	inksmit2wdTULVW88Pz+HTBIRqo2YTutGFbNx6UPKRJAZnurtR78rC698xfx2NEuqCVK45ncb5A20
	5l+2+w2rcyShgdZW/pF4vPam4Xf26iAP8gnkm5KGWN6pORNc3EhgZAtySKn64CpeNyxaUEpMcVCLH
	W8Yhq8ia1iukxz9rRsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAZy-00000007wv3-22H3;
	Wed, 28 Oct 2026 20:49:02 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAZq-00000007wrY-1J9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:48:55 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8446af403b5so905367a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220533; x=1793825333; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
        b=SqfMAHgAJrKvXy1lJPLSLR6FS7o1KZKHAkBJFiJvgShx0o06E83E4bKM+nM1ydkgJa
         GeNthBleytBF72DGHZYymbzx8Kl5JL4Xf+uK9L5tVPM0q9O0m2DEZTHI6HV5qFzfBUES
         l2uC/Sp0OXe6BhpN3nZTgGTU96GZJsMSo6HX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220533; x=1793825333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
        b=aFEmYK0eApDZtkQc0OntqKDpLRKsHdQFzVCrS0+oKMFfsRWvg6s+ytXGlS/f8mKpgU
         tIRi9dOwpLdp/Pl746Tu8sYClx22ohI/pQJHo1kMnAmRfwT8p0V+cs6d3knG42bLMQ4p
         Cdhbe06VXlemnv7PmRyJ2NI1lYOxO3NhQvGOS+YIo4/0pfw9V9h5fmppfQ4t7fYT61Cv
         0mtCcli3JwEGIJ3uTXSuokt7taU64C3LBub4VZu2sHU2xd0avhWih4Sdtn3Vllf5KCa/
         2S8iYnk97Kmy0Yfr+zpisJuAa5QaYsPi7DXt/fP3u+YzQF7XCrYyHJLH/aD3ihi8UCUX
         22qA==
X-Forwarded-Encrypted: i=1; AKwUvBwCNlgzefusXXGctDflpfsQboc04QwHRvwED8xpt2Izzknaug3/TCv18RNXE1jjZ+uHvrhyTwugZUay10rK8bF4@lists.infradead.org
X-Gm-Message-State: AFq9FYJHPwUn4eEWENQm9xbBzSgW++oKgzH6900v1TsQuAZT9+LNCO4S
	U7324jmdRmQ0/nZ49+t9dXig4ojTKUfChXiHDJojL1hIIA57jJKyU0oFFBU4ycuAcw==
X-Gm-Gg: AYBFou1pJ0SvjhlB6FLihloLLeKQlO+blcW9cakb3U/wpRzgYG9EHqjinJ4ZxMhTyWo
	Edud2ztjb5MpZMvf4jf0yDc3tM2Pp/Q/84suMalVALQXfIdLt9VlFEGMqmsKpcvpOs+/sVCZro1
	4M9AWFM79Mny1QHDEdfEz90BYGjKcIEkfcTMDmV3Ycr20Gb5KFsi2jlEse1Nb/HHCKvvVuVysOb
	ptITnjY+/S8c18p/NiyghZeYr5/KwhDpHqc/OawZUk2ZkQunMxWcCvyXgWzyOPsdPcYgWmUeplc
	yL7ou020fn19MTeQpOGJvo8/LDJWk7G2FSKMRLprj+odYBvikPcRjTZzRLO0PwRQNyz/e1LbUqq
	UbLBDO77M2mG/pm/W00Cj91yUa6qIwQlso/JgHNtPOWV9GaZo863LUjsbBeomtWxgHHfkizS879
	3/BT6PB4UwJHUM6tF1Oofb4GPPJNiNwV+eBAWF96Cl+uhcmzEXe6lvgtfGOfwx8P7R0UpcsT1zS
	bkypbmrADHZunFZ9lFDIxPlbaDoVgkXZvLiPzALmo5E0RjPwzIMdV5pDtYuOwR83Rh5mMG1fQA7
	az6IdRg/Rp6T9d2epNrk/cvQUo75Wlo91mNLzukjc9NGbG9AOliakd7Qeo6DFS8putu2Imo0xbb
	tOS8EJLr/XQVs8GbCxA==
X-Received: by 2002:a05:6808:4fe6:b0:4d6:90d3:e18b with SMTP id 5614622812f47-56383e93e14mr3396274b6e.52.1793220532771;
        Wed, 28 Oct 2026 13:48:52 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:52 -0700 (PDT)
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
Subject: Re: [PATCH v7 4/5] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Wed, 28 Oct 2026 14:48:46 -0600
Message-ID: <20261028204847.3471382-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_134854_376712_C8F8FDEA 
X-CRM114-Status: GOOD (  13.96  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

> @@ -37,26 +40,35 @@ static void __dma_tx_complete(void *param)
>  	struct uart_8250_port *p = param;
>  	struct uart_8250_dma *dma = p->dma;
>  
>  	guard(uart_port_lock_irqsave)(&p->port);
>  
> -	if (dma->shutting_down)
> +	if (serial8250_tx_dma_blocked(dma))
>  		return;
> -
> -	if (!dma->tx_running)
> -		return;
> -
>  	serial8250_tx_dma_complete(p);
>  }

Removing `if (!dma->tx_running) return;` and relying solely on
dmaengine_synchronize(dma->txchan) to drain completion callbacks breaks on
DMAengine drivers used with 8250 UARTs that do not implement
.device_synchronize (where dmaengine_synchronize() is a no-op), including:
- drivers/dma/sun6i-dma.c (Allwinner H616, cited in the commit message)
- drivers/dma/dw/core.c (dw_dmac)
- drivers/dma/pl330.c
- drivers/dma/mediatek/mtk-uart-apdma.c

On those controllers, if Transfer #1's completion tasklet (vchan_complete,
dw_dma_tasklet, or pl330_tasklet) has already dequeued the completed descriptor
on another CPU, dropped the channel lock, and is waiting on port->lock at the
start of __dma_tx_complete() when uart_flush_buffer() ->
serial8250_tx_dma_flush() runs:
1. serial8250_tx_dma_flush_work() calls dmaengine_synchronize() (which returns
   immediately because .device_synchronize is NULL), acquires port->lock,
   clears dma->tx_terminating = false, and calls serial8250_tx_dma_complete(p)
   -> uart_xmit_unblock(&p->port).
2. If no new transfer has started yet (dma->tx_running == 0), Transfer #1's
   in-flight callback acquires port->lock, sees !serial8250_tx_dma_blocked(dma),
   and runs serial8250_tx_dma_complete(p) a second time even though
   dma->tx_running is 0.
3. If a writer has already started Transfer #2 (dma->tx_running == 1,
   dma->tx_flushed == false), Transfer #1's stale callback runs
   serial8250_tx_dma_complete(p) while Transfer #2 is still active in hardware,
   syncing tx_addr for CPU, advancing xmit_fifo by Transfer #2's tx_size, and
   submitting Transfer #3 concurrently with Transfer #2.

In addition to implementing .device_synchronize in the affected DMAengine
drivers, __dma_tx_complete() (and omap_8250_dma_tx_complete() for symmetry)
should keep `if (!dma->tx_running) return;` and check
`dmaengine_tx_status(dma->txchan, dma->tx_cookie, NULL) == DMA_COMPLETE`
(matching dma_rx_complete()).

We modeled the v7 TX and RX DMA cancellation state machines in TLA+ to verify
both the counterexample traces above and the fix:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul

