Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9953ECD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUEnvDqz1SSyEKVvs1pgOac32s1g7LZkjL1zUnxDxK8=; b=qg709jykC5gwLcBQdIeL0TMuX/
	wH8g+SJWcXqbjgkdsewfeq0bbKJ4KQuvnYrOmELMlRuUjxNyx2nGAJQ7KRtcjJu5r3IDIZU6Xm43K
	8m8NxUoibinHQAbSc31hTvl9tr4GREfVWBwvZn9Zkzev2PhCHpEwQKb/mztzmXTn7HRb0/TWoA0u2
	pLz3da4scr3c82myq8jnsJLHPzpSDjHAsNogVneRYgXnelJK9lfJiRUogPwb40+8/oIht8Pw2uLwZ
	+WoBEXFc92ZUrqhtbF3shwmy9Qw+x2wjSDVhtYhufWI0ld7LbuXKB/Pld8jBxqg6YaGYWH69XjhtX
	ZxnylKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvq-00000003cUI-0kiH;
	Mon, 08 Jun 2026 13:22:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvo-00000003cQt-3HGv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Jun 2026 13:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pUEnvDqz1SSyEKVvs1pgOac32s1g7LZkjL1zUnxDxK8=; b=Joagq6o6tSpLFV2suuF5RObgzz
	zmbN9XzXsIEdNZ5O5/fPiZoVBpz5XewNBhbh0jKX74PtrdnYWNa1JVDMvDJ+y1QOVnThw+/ujR0Lf
	XRqs1BFmPG5TiHDCOFtTbevI8fmKnM5QUg0OR1v7FRdUexH6L1XZIrqxgi/Ha3j1zzcs7EynPYtAR
	9cE7hy8ON41bl99h9Ju6gBhGBxKtLaTK9v5tOyyOnk7KosQj9w75SdTekxoOyc6VQ9GKdHbNFKLd+
	9u8C3voJlbmi6/01GzYTFqlG9RbzxrfhlLeZPe3t91fenCR8+UkJ0p+DdCmL0fcl0SEgjcGTlnDg2
	UtK7O99A==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvk-0000000DlBj-2FNV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b3637b90so36850745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780924935; x=1781529735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUEnvDqz1SSyEKVvs1pgOac32s1g7LZkjL1zUnxDxK8=;
        b=ZPxqhbct7NEOUcWKCBXOADFPxT8HIHigrxKmwOku9mgyUmtCIM+/EPb7a4YIjbjoQC
         gmwzk2Y5GUjEk4WSryEF89MhIlSVB96VpDmUlaJnCjItfFHXvYkJ3f/dVP3Dwdg+rVe3
         4uVt8m0JY2gp9LkcMmbmrv+8gCeZBpgxHA/2Wv9OXPhpbCZQOU073jhclR1UAxmRsfrh
         EL6QPwfL8lzLrxL65D3swh67RRn4ol7WZRMUNd0HMMY/0a1C+l7BeQDYuRFwo787qqxX
         h5KkPrwUdUddd0V6eG2OK74gth/KokSCaaX/ubDjEI1lcawYDi41v4tviaGCG0UzZcbO
         zMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924935; x=1781529735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUEnvDqz1SSyEKVvs1pgOac32s1g7LZkjL1zUnxDxK8=;
        b=pt4p8ttJTpRtfNm1B1x1knoH6Qbimqfn9VuXamRIbwxsnmsIv0iPCFCsM4jqsGXxrC
         83edqlL35bSgPJYDGO+ogeXkh62f4tyEGayiGg7qrzf/8+gz/DSojYjt7L/4W3dhZhsl
         CLwisP/NHbjj/cdZwJkwvJXoLNWMbcPE6idQYwJjIQsorU/tcg9rHD8fYl2yBD0fZKbi
         LzvuY5Pc7zQqqTJRhNJS0yYcoSIe+ZXwr+iVqPHgTEUN69drcor3wLm6gY+mFVJyVIyL
         GPF6q+ZvvZlW6gkZuKoLKGBCSAqpkyAa9Rwne0cMIxLA7DFJQfHrhjP/0PsUUO1bTydq
         4dkg==
X-Forwarded-Encrypted: i=1; AFNElJ9z280QnOaPzKXWXOWIYTMAVExRAdJrvWAEwmwBsD5TbnEUkpXM+Ho8peWmSzHO5v2ytotVLneSW4s3u30nr59Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwHpf1E9hWC6G+6xbTJZJ1TyblU5Ob4uA5ggweT8HMSMC5T5ZD0
	Ba6pHhmK1+zHTZD4OOVLq7fX/kgCel4DbnmtpwyFiX41qr2VNlg4allBvQlRiD7sKAE=
X-Gm-Gg: Acq92OGy57MeW8z4MiosEM/9dGXaXPtpv6o5p3llo5wAIpF6q/qccPPLK+vCNRf8gLI
	JcfmBD+UVLzfp+5qth6DrBJHA7hrApBJVFD8Bsld4JM2174tYEpwSfUzC662j4/6NWKnVbNzVOU
	naksKYfVPofBes6l1qT5qB9djmo7GJ2LMTRAmnuxEOO5pFt8c3f7/K76BIapJvgd8GZMkixmIPW
	ZAkzEkG5fPMNk/hw7eQG3yJUeF6FU0RaU8cPN2ZL1thYYVVUoLzJhUiI15EfWf4UBYpjDXEwqYi
	XqasEk61i6vCavEapkWicWCfdK1tnXN6+yv9nbpD1HSUav8lYP/4ldD1Ax/Xxg2YkGG4RYpmvv5
	Mr0vTpzOU8zkmOWR+w9NbsZroL1t0AKVWD8g8H7MpWEZAB1PvIUmRcSej0ZsjSz4k+7LDyaWOjM
	h+A7cRIIMInBw7LMu2dQRvet5lRCjIeR3iuoN1
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-490c2508a5emr287463765e9.0.1780924934875;
        Mon, 08 Jun 2026 06:22:14 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm428671945e9.8.2026.06.08.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:22:14 -0700 (PDT)
Date: Mon, 8 Jun 2026 15:22:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] printk: remove BOOT_PRINTK_DELAY config option
Message-ID: <aibCBGjVk4yqtYyT@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_142217_095615_9BB7C4EB 
X-CRM114-Status: GOOD (  11.69  )
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

On Mon 2026-06-01 00:17:37, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> In preparation of combining them into a single configurable feature, let's
> first remove the kconfig option BOOT_PRINTK_DELAY.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

The option allowed to reduce a bit the vmlinux size when people were
not interested into the functionality. I am not sure if it is worth
it though. I am personally fine with this change.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

