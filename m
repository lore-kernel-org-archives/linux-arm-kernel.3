Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE907606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 02:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FrmwMQVN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XR1TLTet
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:References:In-Reply-To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=; b=FrmwMQVNmPKZOVk+pXl7QVijHa
	qdMcBguIQ4SIUnz233xpRJRicggL4wbiTjDvH1kw6V2mOh26Fzxs74dZDwDBaw2sFRQ/1mmC1rNx2
	QgozVSStn6WYhV8Up1UHKBt9qvjasBIx7UVc137GTKI5CXERj1os/XIgyTlyRDA3A+mTmZA7mbUVb
	eWBeYWFJuzwPL9koer80k1ldKf2dAkedr1lj6M8d0W+AQpF3S2MCSFnfaPqfWnCF5jsN4bov7D4qg
	Zv5zBjspDmz4T6nJG35iaxGOFYOzXbkc5QneMl0Mh0h1St43OB0e0N6G8XVVN3pOds7HmEWi3B2e8
	mgWINN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNLVB-0000000DpGU-1maq;
	Sun, 01 Nov 2026 02:40:57 +0000
Received: from mail-yx2-x05.google.com ([2607:f8b0:4864:41::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNLV8-0000000DpG8-0qXO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 02:40:55 +0000
Received: by mail-yx2-x05.google.com with SMTP id 956f58d0204a3-679e6ab647dso894040d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 19:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793500853; cv=none;
        d=google.com; s=arc-20260327;
        b=onMAImtR+7/+64YVivmu8aBmWgbuXPfsfQ+VCG1QkLpwUCle0FNLm6v1hRoAGNFugD
         2xeRgINIzbDttzPHgNsFkwcJZ7i1l+DEKBK/eL+xB84PehfR2Q9Eo9X/qo1DVUVIXwsC
         E8wFw1z31lsf70nHOm6rXAVYUsuETjYUnu+C9Nvn3yUtxebUiPPY+Qg/vxOQFJyuHVjN
         SxfaRYZK4FUikfxMgHywI92YbfMmKK+XVT1B9AUrb8BZfk++iA/Wwx/QuknVtDnWgdp4
         xbRfjDne7LzB32FZ79LQ+o6bF/BoFZ18TpYZSyGws9YrDXMCVz3oI1O7vjTHmAE9k00Q
         PMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        fh=CY3UFomuXh+PLbIoyvml3bGecKwSM8U/8BNRpdrs/hw=;
        b=MTl7hdAMW3SHDN8FrrW34GcXUQWLf1RwgKQTEyf0iFkcnSd0Jf2zA3tF/Fq6s5imbE
         Bo/9X2ZoPl6meAXFnRCoKLfjrehl+7yfRWHwFxlBH62LGCHkf2KTIyOPSfP+RqumnPgl
         eiqXLtKNaqBjTdnWrU2vDEV5Azc+sdfGIQtjvgd7CVgzFms0nSXZttZXpU6OLW/a7KN5
         iRt2pQN0sIhjiGHItkZJZShNOJCZXzqJJERsTtc/dn+5nNT0LtWEGGtzTID7lyHvkkRv
         I7WbZ2j8QAV5IeOQOimjp68MBl4xs39M/lp4kqubF1tFaXURMBx7Ww7b60rmIlRLhVbJ
         1yPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793500853; x=1794105653; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        b=XR1TLTetQMl1kyIPWqM1DUdsjAEvOare9/gVLD4D5nfvgbxTmNCAoJaxvHOeFS3GnM
         +F8/UI87ywa2qCGyejzUVWTerr4RbzumTkgmbGsM5wbf7JHK2P9rHtZ4Nk3atDSS4vYV
         e8VUGGtf46C7yDW6PL2ydoZfA+7hbjI68jbnXYjDgEI+SxW6gBmSkA4XDPqozT1CYgBm
         otIrd75YPTo4Ybk9/ebDIclc1iwnocxPufAj6pTn5DHBPr7aRx9DIVhuU62LkWZRqgHP
         ozcMwEkmPINBTXWT/VB3/WGDXrAURNBVndLg4s0XXuzEl8jGiZ45/hXXUSd+gamenvx1
         LFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793500853; x=1794105653;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        b=yWIllrfcFKXb4yq7uYIcDSiarz5YwBUy6vjGJJB/tZekU+oFJv9EJcuud8sCmOyuiy
         abOBCUSPCHMF4GakqFyX9OzbZqXW0K96qi8W56yixZKDBBlrmXVK3aodfpCOxOQ0xSX3
         uIrPyTSeZTR9V9FJMoKvINHunuKxEXtXRyN1OhiOARmCJy3fMq60dQHxn9VzDS505Obd
         Ghw5HSu8ATqva3JbzV4POPun8j/bYS3CW576V0y5n9EqN3WPYSp1NiYHgxzzMhE6Q2CG
         iAe18ZuNUKrDfM1V1w0MZefxYE1VGCFUUj5GqfGKkVjBZiEmGwKMiJBkrmlxE/XedEnr
         dRhg==
X-Forwarded-Encrypted: i=1; AKwUvBzzS1NsPFImRIWcpPdu1is0u3kT+iINFBP/MzS6ZIJpmqzyqfKRKDYi8XKm/OzQrSkTvlA4YF48czfoR6/qNSmb@lists.infradead.org
X-Gm-Message-State: APuU4Z9DISEKf99NQuxYmUqoU+J7Q6KSp4iG/FtKl5XOGKgHsmrnbfBA
	fi170NRbMBxvLn8I7wtDkCEmFFlxN/Y/uJlJsR84XumUNjgXONZRwBHDVB1BrZlMug2qMtZ7VJv
	qYaCUu/KDA1uoVo0Dfj4Ue5Q++hkWca1gdOunqB/07A==
X-Gm-Gg: AYBFou0LEhOMZ974FkBdH2Bi7GJw/aCU39FVOh4Oo5UvdnuJQCduF1sdeCwHAG7TKNm
	OIc3gR5mYrh8cpIIK0Yfx3uMNl3hqb7qN9+GKNS7S/rB58+SA+lIc14PONjjw19hLsd+DgQZZQb
	dqrjMERllOCX4ppFPmHOl43ZAgWY9MarNZWFaQpKHsFKJ4LAPJ9RO6sfF9sRO5sqzKJKmaB3Epk
	1OlVlKqrvNCuU+wB12gkOa3xWAwrLV/ssNBUK11wCpfWC9uwaXYp1OujU3LfQ95EbK8II3yZlV6
	+87NVD8ZFM1trri3GIKV3t6effRf4sF77Pu5+juiW3qDkfk3mmJaeG4U5priQmtSZiw3CMOcS9F
	7agrTPRP1zUdKi+8lGTFSh2VVJDQfv3Q8Ix4=
X-Received: by 2002:a05:690c:6989:b0:8b0:ecb2:884b with SMTP id
 00721157ae682-8b2b6707c48mr49035517b3.26.1793500852565; Sat, 31 Oct 2026
 19:40:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 31 Oct 2026 21:40:52 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 31 Oct 2026 21:40:52 -0500
In-Reply-To: <2026103142-shorten-shindig-bedc@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh> <20261031152656.1422-1-xiex16070@gmail.com>
 <2026103142-shorten-shindig-bedc@gregkh>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: akari Akaza <xiex16070@gmail.com>
Date: Sat, 31 Oct 2026 21:40:52 -0500
X-Gm-Features: AclHuK_3PZPlhb8eWBRsqZBFCzLH4zAeC2-QvNwLLojfXV5DV2NRjTLb-47rKFM
Message-ID: <CAJePJ2c8b400Q15=GrdDsJ=aF03g+ZwcTx8ZsJCDM5uHTH3k4Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush race
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, krzk@kernel.org, peter.griffin@linaro.org, 
	alim.akhtar@samsung.com, m.szyprowski@samsung.com, samarth.colleges@gmail.com, 
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_194054_273500_282C066D 
X-CRM114-Status: GOOD (  19.52  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg,

Thank you for your honest feedback.

To answer your question, I'm still a student learning Linux and how
the kernel works. I've always been deeply inspired by the generosity
and dedication of the open-source community, where so many developers
freely share their knowledge and work for the benefit of others.

That spirit made me want to try contributing something myself, even
though I still have a great deal to learn.

Looking back, I realize I was too hasty in submitting this patch
without having a proper environment to test it. I sincerely apologize
for my carelessness and for taking up the maintainers' time with
insufficiently tested work.

I have great respect for the rigorous standards of Linux kernel
development, and I understand why those standards are necessary. I
take your criticism seriously, and I appreciate you being direct with
me.

I'll work on obtaining a suitable Linux testing environment as soon as
I can, and I won't resubmit this patch until I can provide more
thorough and meaningful testing.

For now, I'd like to step back from this submission and focus on
learning and improving my testing practices.

Thank you again for your time and for the work you and the other
maintainers do for the Linux community.

Best regards,
tianci xie

On Sat, 31 Oct 2026 21:28:16 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Oct 31, 2026 at 11:26:55PM +0800, tianci xie wrote:
> > I do not have a Linux machine of my own. The x86_64 build above was run
> > on a rented Linux server, and the arm64 build was cross-compiled there
> > with a no-libc aarch64 toolchain; that is as far as I can take testing
> > without hardware. There is no Exynos or Apple board available to me, so
> > the model is what stands in for a runtime reproduction. If you would
> > rather have the flush modelled as a KUnit test in the tree, say so and I
> > will send that instead.
>
> Sorry, but stuff like this you are going to have to test on your own
> system. Why would you do linux kernel work without that?
>
> greg k-h

