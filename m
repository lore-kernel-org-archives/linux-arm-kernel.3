Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6076082BE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AC/SjbNP;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NOa5DwWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=AC/SjbNPq2qID/
	w3rzyZ/0P5UbO06mSprVTomkvB4uGwz1eeqBTqPIY64nyyQxntg1Jowhj+7rDA740YY+CpfhFk6ZK
	Bu+V35rE3OAQ7a/exTqB6XMtwzXMOdnDOOK2IqTCuUvD+GOQ9NdUJn19ZWUPcj6HHYrfCCR+dBvqK
	SJy9S4eCSQEImYLbUzNM6pqKy8g0q8NrFl8RGiBbMUFWYyxrqBwk2ea5cpWXgBMy1+uzzUtVp/0BO
	Ugq/W+NQj/q+iKSWVQ/M3+PaSsPF3dLHeOQEib5i6VZlK6OGcJpAsv4TT4EWRQfk02rHX9Okx+Otg
	AbmnCWqKZYvGbqDNoWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6R-000000034NY-0Em4;
	Tue, 03 Nov 2026 16:11:15 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6O-000000034Mg-2N81
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:13 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4f55a53898cso2303038b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722271; x=1794327071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=NOa5DwWhrEAwYynay9ml+OVnS8MKlyBJea3t8U2Jxq9JuLw5RdB35mfzv3NmrY6srX
         z9OHY7B8NxUwm4MZC4rne2SWkSGgxglmm1sIwQneuPc94i2qNNnW31BYl9Umw8ryQrHt
         yXN9dDPsIRw4xIth/fMXuDHWAsX9ZKmSqisqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722271; x=1794327071;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=FwFYy6DQB6/CIS1n0PEHGnQeGHOdMB+lhQro4tdDuCoMnQPL1bnqMEvNk5uPrigJPm
         YOwSkV7xBYAggvTuEsMd1v6KnmcpxHYz9DxjYtffDNC6LGPi13eK7ccdBG+Mxa/oia8O
         0+CUXyi8p3djXtBeLdda+PN21OUCQo8adpzQClANbZJlsJ78dyW5JfTVvSCvViTlBmZj
         Xr9ThwQBiMjb5LMHa3zlh1h5vVFJ0CAWTZ/09b3H52kxct+hGZGd8Pme5ZKVA/oXIn0U
         Jdfvjmwgajvk4zsFaPFjulsQ+qiYJKWx9cunRJw7Z5WgNgAmtDxPF8pAFM0AiEKRpVYb
         xcRQ==
X-Forwarded-Encrypted: i=1; AKwUvByxulznr2Oxdk5xoTFHc17tcxn7/ufwYede2NHshyfRCRuGWyidDU9W4g5StetiQ9TZBCNX5CtXyR47rV+QTgMT@lists.infradead.org
X-Gm-Message-State: APuU4Z/JILZA0OWfnOitMZLpLc4BcjILKsQwYDZKROPj0gdsmMLmcEhq
	PEUK9C5TalJoQWCM76ceVP15x1xJEoC3zoc5Cysxfy6y0aqHUcGdNtmfeYRH6BEW+A==
X-Gm-Gg: AYBFou3FUzRuCtaD5MsBk03w4HRE2pn7yV8Po+bqUQOdfjI57Yt4czJ0DrJa1xpKXI/
	FDM3tufmmAU3eV63UqeBbp7JAfKq6DIxB4p4Om0a5s5inkqdO4ADvEw3+YS4W0SX67VPNmw3Uww
	UQaPpFW6tEDJD54SAy+T8cYlH5elSyRZ8k3CCIqIBOmg7kUE+7GHIs7SSyVDbbtGuPipGd8HPug
	CDZ0J0j0Bmqz7cpHZjuGjtga8kI5BRXW6UmXrnG4ECTlAlg9raqJ7krN/WzfxNM1rg3Ccc5TOT+
	tUl9WqqkyFmSYq/N7ZQrZSEztyQSoanEaQfJfnLGxyfIoN5ZyNO84+GFZ5W1PfNgP+g30aoNH0D
	6MyQAafucdFXZ5+dRTs/7KZJPAIo4O2spcvJtNLhJMs3y6BVTt1eDWWVUGEH21dProdhPaS6o80
	tihT6S6Qdq8xFjwh5e4IoPx6GOTkqkt/0RVctkHT+MPy51/TaW0k+DUrubvoxobeKuS52uBXmjk
	jaukcIOeboNneT0T9nsMHetTjvFk+dYA+nHyrOejFh/PoE/YtrDPI2LgEAOpPUKlGanwU+d+BFZ
	o2DPHhBLCeM0vjr3lMAdxPED0Xo3aQKfmvk4RMeuZwLFyzxY2IVDvgDS8Ts72g6VzIr3ZgJfPuM
	evc8R8fOllJ+yCh4uKVFRlPr6AIrRHefKYywH
X-Received: by 2002:a05:6808:3a0e:b0:4cb:f21b:6f8b with SMTP id 5614622812f47-5640dd9d763mr8688402b6e.30.1793722270713;
        Tue, 03 Nov 2026 08:11:10 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:08 -0800 (PST)
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
Subject: Re: [PATCH v9 1/8] serial: 8250_omap: separate locked TX DMA completion processing
Date: Tue,  3 Nov 2026 09:10:57 -0700
Message-ID: <20261103161104.2449407-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081112_660335_D5638762 
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

