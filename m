Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2622606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sn/Ogi+b;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aKzvdfuh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=; b=Sn/Ogi+b0+ItXTOS96uCj/CISi
	YRZh6g7G4MbiXlOddSeM1XELZut0WQNuWNgbWTwJjRThfKqVASYiMA0M6Op3JMROvpLQLDZ3dvKCR
	zuyrdRvyBrS5uemfY05lS+0D3MylMmUkBY0a1xChreGBeRP2TY9VF2tax88OqYWd63lLKLFVafDj7
	1W67qyQcPILoeS8fbmlDtfOIPXSZ5xdk+vpc1X0H7tTuFWXcQkR0qF4J7CuXlkiZKiNzN6SnvrHg6
	O/mHQVjJE+ZFHVw6LK3XQuAQo8aI6n1r03JqWfspasAfY44EETHrTZXETekiO5U7Iek7vBcupH8cx
	uLWi8Dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYJZ-0000000CGrK-1xBH;
	Wed, 21 Oct 2026 15:33:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYJV-0000000CGpt-2xIo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:33:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso4955175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792596791; x=1793201591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=aKzvdfuh4Dz2Qc8fSMb5+oObIzLB9ydGQe5WtaAJHx8XkRnTMp9CryG1L3QatFdB7X
         hMRBYP1+OCyLvSayeO8jH91e7OQpuB8XYwPhQ+/qyR22FgcQyOE4ZTWw4nRiRq6YHrbY
         rlDJ3Hdcymo2CckYIuCv/wzR3+yxOurTVr9c2DM8naotCX1twwM7Zf20Qhlch5VZTWFZ
         hODkJwW2WLadMwr866crBhUlRHyc4rIsIZmrjBXfCvqa4edug+3GhjhHXKo6+Jm7jYlM
         1F1OyzUMvg9Eo2Sid5LQwNwBCbf1uKd58uqTx5VENw46GDrRwsV8wQQ7Ww6IF27uInM/
         qKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596791; x=1793201591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=LhFz/WBXbOaQKsf8aFh28nG/bBnL4DqsJs1dKo9M42ENrejit1z2Uj6o0AL7pwOP+m
         MUxW4dkHSHOnLd9KAwrZuWXg0ysj2lQnhQcvezFzGzAv12DseIkvLj+YiWYVCNHpAc5Y
         b6LESZEitPwtbgzzQ9y3VbuDnRHelY3rgVgk/zmcW8FG7IRs78LxJk204QSyOioK5+qj
         lVk+ATjbmTIEEDb6kH+Py1uj76en59MJ6uwHW0TZk4L4N7LehxAGLaXo36fGig5Ixf+j
         U7fvMnjYcoTW/RAVBL6W0gB0dmnKC512DNGRW18NTkzeXr5EpbMiJx6vCrWbIbG9oY6/
         ttNA==
X-Forwarded-Encrypted: i=1; AKwUvBzzLfCkIrPXVUBL1z/gWgjjiPbv6j3EdgUyT9dE9h9WjlycKBw6W+5ShWeHF79xpxBk45TlgyTtVJ4rHGDPN8Xy@lists.infradead.org
X-Gm-Message-State: AFq9FYJCmNUoPfn4B+HaNIow0C7c+amwAjL3kxQCemnIlK9lIPB5iDro
	SGYxEFOC46M6ZnQJJox/fircGz1QQjcNz5TEvRYEeDrd+4GX8N/+6OJnXL0dKRURxiM=
X-Gm-Gg: AYBFou0e9sJV0GoMB16B/OhcCvDXmkquyUbF7adNAyRBNfuvesO/4jR9rpmiJFatGkx
	21gIC9KmVeLA8DjYdjQyJayGZ9zvhs4T6RZ9YZCM6AV+0EB25XUlEBBfETg47EOvoKe5kz8cHkA
	3/ITRV3wozO052a4Gwey2Xg34d14tUSaUl88t6lpeAu64UpkiMvoyh+GHMzjjLcHjNGrzS4GLxw
	jQ9JU+DqPDKzEcyZHSxo9ZyDm9mYZHCgf6DEo2VfSS2um2NSU5yyGhhCIA92WJjnYcy+w7uGhYz
	1QDq8YShIRgQqvW9kq1+4FuGYAH/i6nt4h8N1inlmByfOaZCI01mOwKCNOZ+6JRcn3tS/HYqhYt
	LyRrcg5gz99jBMiJwI4l9D43iHwtn/bK884CbWdd2rzO2wCTzshX5P4v5OH9tuMkDGXuBP7nXbR
	D3oX948f8PqmCrbNHvpKdrZGClDpfb/gktoifn9u1o4RgmVEK69IX/vqxSr6+C+Pwc077zv3woD
	7wMwnfiGyIlAg/eGhEoa1aizl6bLZyKlScL78JOPqASsTlfgF1EhGChsObelOsReTlqt2O28sow
	uOXG8yGe1zhX4vCPtkmSLBC6jW4xuHidOPMPCP2WKxbJ6S/ZdnhAy+9zANAuuPhO4HKqpw==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr56977285e9.16.1792596791483;
        Wed, 21 Oct 2026 08:33:11 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm59333825e9.0.2026.10.21.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:33:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:33:08 +0200
From: Carlo Caione <ccaione@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	David Lechner <dlechner@baylibre.com>, Julien Stephan <jstephan@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Message-ID: <atjbCWF1OU1c-Vtt@macbook.homenet.telecomitalia.it>
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_083313_749991_AC693E52 
X-CRM114-Status: GOOD (  11.63  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Jul 30, 2026 at 10:04:41 +0100, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Gentle ping on this once more.

thanks,

--
Carlo Caione

