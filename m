Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DCB6083623
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jtiWMrY7;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mOs6qwne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=jtiWMrY7nwaxHH
	9s6wVobSKv1OVxOB0hkEPF9vCnXVrCPgcnGgKkCXNZ0NMYOHDpsEhSN6ytYy1oTbpWblS2ko9L2Zp
	fwg8ZdH01MZAJDqAM6hJa+VXHMkpYKZteWTLSIv/7J8WauwRgVMrHyetht6z5BODrzokbIGSgfUgk
	EBOMFHbz9oe2q+KS9DRBtOnO972BiJONlB6rAqjbKO/G4liQ+L3bHwgBLD1hMpHpWyI+MLat30PNf
	165DWcOvycUoXkI3GrJrsunbMm7ftRY4z1D2SGzsxI7M2cFpssUi5Mw9c/px4EG/CtviKwjo2EWQ6
	U7nkWGddcEwfQibMS8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6U-000000034PK-0rDt;
	Tue, 03 Nov 2026 16:11:18 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6Q-000000034NB-1JjR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:15 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53aa0802881so2184198b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722273; x=1794327073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=mOs6qwneRSKkpVo21J85q0z7y0AHYN2XBbmLGhdPDqh6wi1tFfACBDJjYvHoiIUXNM
         xXkVrVPIjrJ51qc4ijQ99g9sKgvXr0mPYvTa2bbE25QJ6g+xANyG4FLvglrnSntpxMOf
         XkNC9L3pyFXlCOzTmJXBdwO+VuR5VE0QVjBHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722273; x=1794327073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=J2Bf3sgKSSc+SFF6i+rIqzdhijXwUuICQLEU6neC37YcAhdGH6EICwHMImHuYYkzEo
         d57oxWqWizO3I3IUgkZ0mr4nHvyNVoP8W329M9mlYELRvqyPztj9mmM8AImJil3reaGM
         iCngCdkRAZGMdX4nuvR7jTIaBCPtRazduL8w4Vo9y3EvrIYs0m8LA9NtUEC12PFSlS4j
         en3dI6zNXErIRGiAyKm3AZHXU4+1T68qyBOGBe9Sg+4eTLI27jDqO9Ytj7VM/L9uZObq
         5IxEw6I3CxrZlcvCTcpyyH8+ZvHvlUDCBbDlZHq6FTwVsxM/79HQjZ/e+KwcM0lAycd4
         nu2w==
X-Forwarded-Encrypted: i=1; AKwUvBxjj/FaWqp+v8TKZVc5HoaYpqZlQOdFg7rkd9KpP7b84pT8CYgYKz3AAtQ3Y1H4vgMrBZQ2WJ/pYNhqKj+tVY5C@lists.infradead.org
X-Gm-Message-State: APuU4Z/w9dq5e4FfJCPW2obdCrK4EZzy4jaxID5/OcdExg6uAnbZPZLd
	CrRYupcsA4sUUdeqEGBCYRg2Wvm9OqaUFw+DfbI+ErCYIEwUHwsloYjCv/pj0wgQZw==
X-Gm-Gg: AYBFou1B6WfdWtBtYww3bqwYNIhjlmi3qwvew+A3S7iPhsArpEfaapHcHgbglhWpxAQ
	nAR18wLZZKGic38nVBir1hR6Ka4A8iAALA3ANDMm/YcPhYvYxOxYAlt95ZW+FsUn6JZK3HPDyiU
	N5P4KyBMujyc7spXuoRCN0kWydV0ZvivfBdcXA+ksu2BGjBWM4dPHiWpE0ih++2YWnNC9wsi5TT
	pf4O+iumOu+LVjug/iYRxVuXsu9+p6MrFXHk46Op4d9x6qYGz1pr5697YMjf/KnL6UFTSZDY9gK
	8+msc2Sx/ZK7+1QOiLmqkWNbm80lfPJwmjM9GIjm5Of4nEFVhBWEvyaUf/E8nl9aqafdlSbD0Li
	I+gmSJEswwsnNEHHHnbuphFwnXbba5fzXBv21sL2bV9OKP0NtzIvyWFtE1s/ptucHdZAyQAY/O9
	a1A4JQAEWc06Cwd9RozhqxP/UMKvnKv22tPE1M8fEU9K5q+34oEHq1HnTDMDBluWIp0Hb07ZEMx
	lScAyVKWLUktFTEWN5WG4rfZ1Ol/rYXO4KatbAzWkpRvCxJJ43PKAZOIMuE9zAv7tO0yWIs55Ps
	tFBUj8M7q0OEOKgxw7SPvC/d5F9DLHQOtnk384XIHa366YaAu11APPUUSGXLQr/lINOPScSQ9dR
	VTVL6dvLx74WcF85m
X-Received: by 2002:a05:6808:3a0d:b0:4b9:e6ab:d085 with SMTP id 5614622812f47-5640dd277b1mr9216799b6e.37.1793722273221;
        Tue, 03 Nov 2026 08:11:13 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:12 -0800 (PST)
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
Subject: Re: [PATCH v9 2/8] serial: serialize asynchronous write wakeups with the port lock
Date: Tue,  3 Nov 2026 09:10:58 -0700
Message-ID: <20261103161104.2449407-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081114_347978_DFAF2F8E 
X-CRM114-Status: UNSURE (   6.68  )
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

