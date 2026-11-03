Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E914606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EiAeEtRk;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XReCw4w6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=EiAeEtRkG/a8yy
	1mAWEn/gs35wh2ijs1KVQp/RhceUi0ox4eeiFPfRjb/3E4Q2pejWSuDy+2U65MgTUgkMDnnUk+kfH
	vQQy5mvclyZNR8WGawCR9o0/DnfQg22DPgb0arCqsEuELIVEdi+hs/P9+QHbS8UkP+YCIHO+2TDGY
	lylvaOx/7pmD1Pv//6a1Tpz1cXOiJ2jX13DZkhOLOiDYox0daKC7fiRrrFJ2oWs78X2+6J+YRvBZ8
	eb8M2MWMtKzV2UAUQv0w8SFJP0r4Rvk0cylGbdUqVF7lF0Dsw3ihJNOBU/aQmWMfoDTbfxHjY2gWV
	Uk9jpXhZYw4L4Wc2UFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6e-000000034X5-1WGW;
	Tue, 03 Nov 2026 16:11:28 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6W-000000034Ql-2Dkf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:26 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4a76f63b243so711531fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722279; x=1794327079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=XReCw4w67kp6C4VpZV0q1JDuCBz3cJoYXOey0Pjge9yoVSOBsl4EaWwBwVwhI8l1Rb
         xTOFWHOqFAarROnPEpWT/OTjBgc2WzOstOq+3391JdGPTtqa/S9iE0PofyIyTGnsVnzk
         CSuCtBjy7lv+e3DJenWK44Sfs7ifRD8kV4nUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722279; x=1794327079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=oT5Oc7Q3UY6WOVTIuUXmx0q1U78cGTRiSHh32ODPp38MRDfLxxgpClQfciegUJr5n/
         fXQDWbyBXTXItdD1KRsfOwtxYrutWBJCbx2BFiRQl3Qs4GQQluNs0kAzBQ8ZNamVsFkc
         3mriuW6OwxAwj3l8jlnKbg6gh/syCQ5bJ0t825ZUqEY0cfqflYTiglMB9uJyUkjc40QV
         A3jfIqa/uvmcFYqM3P1xhRRO9pICE+VsGw4elQ0vqwebISbhhgHTlB+CD24BEedvHLfU
         kCQ9657AWwbaXeuPdzyMzfBP8VGbBfsOJ/jvaRXcgKaFzchQh+V1MdpIB4NCaD7+JmYJ
         moJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPTKShJNrPgbuleeCAxar3+mT7mbvV94WGfNfRXVGrL7vNnZFV5KjwL+/Nsb/GtoH6Qi+1DX/Bkl+o4LKXtU1L@lists.infradead.org
X-Gm-Message-State: APuU4Z/blSTqAZ23QHkl0fIbPDA/v3y0thNx5Pc74twOrJjjwxMYTQix
	zuh2VjHnN/J7B98jKolaDz1ExGH1U2rErt4F9vAr13Qw9SQQIsAWdyl00zBl3wngqQ==
X-Gm-Gg: AYBFou16Z+TMp1KrxLH9CIZoTTf/+gf45RooVlBBQQuVad8t7WhvN5O4+wbzis6vKHz
	0gaCEvHg4oRYbGKrWCat9hG1KMilrR9PHfCbLasOVj0f8oJGD1/YRldeEh/SfluW3GJ5bwC9Slt
	Jhgo3vhTPiRg3qQp7mj/IjYL7vwL9gE91bzFYphAoh+dgDrJ48zaB0SNerwADQ7XgeLD47TPqA9
	E3EvUjq8dqq2Y01vousslS3XTc6Rz8gfPHGdgBW1rnrEk0NNxDjQdQXWS2/JEMhM6+R82YRconj
	u1YvsEBn8jbS0ZnBZkNuEY2fSvelwIwA4zzaukRaKo9ld83bpGw+6P299CUEbjgtPBGFFt1yfdU
	GqM97o8boitp/G0g9htfNHtXjD+EgJt65NvCKnd+Rcqs1BjttRZy6+OkyLwJx4NNPXn5CtSpXLD
	8PIE7uF6xVAObwdZ+YU39SbFVZrk4yj5ZMYaaUtPjKFPruwMo5UOzUmt+MwJcNxsVtAN1nh2FVU
	VBEOKceI/rZ/s4dnG29+Fqz/3bY8Pz37vdM2R5xbj3qrCyRJEnP5zouFUsch1YXLvGmtBCa+22t
	Z2L+MeuileH21T9wwQp3y8fpjQeDnCeeLxEBDT5V4tiGy9p49g4S9pMqI9SvCnDEQjxDnBjvLt8
	yhxuPYARTSVISE24=
X-Received: by 2002:a05:6808:10ce:b0:4b8:46e3:e220 with SMTP id 5614622812f47-5640de87067mr5635130b6e.12.1793722279518;
        Tue, 03 Nov 2026 08:11:19 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:18 -0800 (PST)
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
Subject: Re: [PATCH v9 6/8] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Tue,  3 Nov 2026 09:11:02 -0700
Message-ID: <20261103161104.2449407-6-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081120_598309_737A402A 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

