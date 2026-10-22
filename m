Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E84606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KD7egBy0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0HP0OMG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP4AVkHj1vVs4GKmhu5BRjV+em6C3v1oHesjAHsANOg=; b=KD7egBy0g8QGGBgsWaUS8+n8Ac
	ZpaIokK910c/HFo/CZachJa/ZGtbJWZ4W39dnXn5ZrxQm4WDLGTV3XjhD+YuBg+f5Fdfk4lcQn79k
	KmJ3E0hWtN7U3ljwomxHH5jHkA/6ofKaWF++n1xXwSmOYKY+DSog/B0uYfixX9spRnjURLFbZOQGt
	nfqbz80bRXbw7KI7YO8eVUGX7WBCTBD+ln7+r7NN2M/ULCU9QkU8MDEnL2giaNqZxCfquDPwn/hAb
	vUQpUQoUz83eZRhoGM65yGp04WxcU0ZG5tD2FVDBT5HCVlxglLElbCmWDsLjxzNxwmQmlUqRt1o9/
	JoXLURjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlvu-0000000DRmD-2Ao1;
	Thu, 22 Oct 2026 06:05:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlvt-0000000DRm3-1xQt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:05:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A259260211;
	Thu, 22 Oct 2026 06:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A18B1F000C1;
	Thu, 22 Oct 2026 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792649144;
	bh=iP4AVkHj1vVs4GKmhu5BRjV+em6C3v1oHesjAHsANOg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=D0HP0OMG/p47NEfefL7dEf2mUpOhAwtCvQfVHAYXavAz8z27n1Ptr/ZQe8hCBka+0
	 kpucKG3GyeuS8Z2X6ElVYHehXmr8pGTQZif/POWyvjcFC7cbfSh2YYsZcgI5pwm+c8
	 COiHo57dggoq+DZ5JWGhcqPT4JWMNGrNat49/N4DoDiU7cnP9qktE+o664oSmuYRfg
	 W2jQzmaGTR2ntQxN85i94JC4asK0L/UlXGvAzAupcxTqCalA92YZqJ+fvqyGec2wPA
	 TAPhiVczS9G00EMW+WMCbZlJcB9L+Ph3vVzCgAnPloCHgEMMwGmOIPJQ3otGc1wD2o
	 HHIdtlWTn9/ZA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 90AA81980052;
	Thu, 22 Oct 2026 02:05:41 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 02:05:41 -0400
X-ME-Sender: <xms:s6fZaqCUct5c1thVTLqr1fORiJ0xag2YKGaS7Z1I2Kne1UvNSDhIwA>
    <xme:s6fZavXbX0eN09ydtcp7xtRvbiLj_Xt7GILf4qG8J-_PAXbAuROn-1r-5Kn1gN-wT
    IUKX59pasoMBkcxa87gKd-VkEmH4H9-4spVlmeawj_vQk2dBHNGOhXO>
X-ME-Proxy-Cause: dmFkZTGejHTXrWaje0jvkvcP18Z4kYP9Z9nzvJ1wxkLZGqWBup9Pw/LyzhCl4/ep6WHOAp
    M2bACzw4FQPWYZL9VP48W9F0zHYr8gq0X63K3G+tQ0EY8JVTPrnA8iwJ5//pA8WRvDYQ1e
    j+2IAIiM3aNuiwzjO+amOCdsjVAZQ3GXvu8sNm648QKQj6jpn9JnEjHEm/SLU18uLG/QsO
    a2YY2VENDpk0aj+qjTcJfnc53AcWnANOAaHb4ejdKxHMQbwZF5qOzTQqmm4GBodXGQj1PR
    7EWQF8YynpdVy0pyPcvYYWXwW5ICw97eTE9R7hSPi3IZ61GiB36NseTfsn8nhDVVLCpuKo
    QTqK6hMyMLCY4m0iqJsp1K9/NjLt+0UFVHlI2eubfm30wW3idDU39rPoufhwB6RHG6CIo/
    1IUfR4VYot/efnizyFo8zvVwlkb5LC/zkrHeF1JoQi4FyKKXAvCmQhsYes/DVTrSy29jVD
    HPnnKv2BQEUpQZuFbJDkMwwOgdvGvFhXdGSYC/3B2fGUrY6G0F06XcpltCdL32o/dliKyi
    2N55wsWSOHCTYwW3IV0zPeixcRcj3C4FKYbSSoKFTbpHK+5Hdk2NwE6gJue5WKwl4QtFCi
    KHMFN9fFeEyS3cCrjiSmlVHKyX8P5rvBR56oG5MeNz1h24pZbmM9gvn3Fvwg
X-ME-Proxy: <xmx:tafZatmeF6MNmH8oqFm6oYsbE9GGiKudNyW-x6dAUT1YjSs8wUo0hg>
    <xmx:tafZahCpQwqrxJnBVE43IKsVxeQRJFjvHaKCBQtvv4zG-ra_5GFfLA>
    <xmx:tafZavMd7mxWviBEcw3u3OmaQV4_z20a79akhK87bJi1kiPPr1s_Ww>
    <xmx:tafZaoOYxwiqPIyfa4EoJHth8Iy4CSyrL60DEGFRiAiQnIK0qfEFVw>
    <xmx:tafZannlEzp5YXxIRMsfVDOqX2oHeaJXhN0oDn_mdfTgWmBAu2Iixq8O>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1D3FAF8008C; Thu, 22 Oct 2026 02:05:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 08:05:17 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Hamza Mahfooz" <hamzamahfooz@linux.microsoft.com>,
 linux-efi@vger.kernel.org
Cc: "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Kees Cook" <kees@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <13d53e6d-9fc0-4926-b8e6-3ee75ea82660@app.fastmail.com>
In-Reply-To: <20261021230503.2075618-1-hamzamahfooz@linux.microsoft.com>
References: <20261021230503.2075618-1-hamzamahfooz@linux.microsoft.com>
Subject: Re: [PATCH] arm64/efi: only disable the EFI runtime service that faulted
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Hamza,

On Thu, 22 Oct 2026, at 01:05, Hamza Mahfooz wrote:
> When the firmware faults while executing an EFI runtime service, arm64
> recovers from the exception, returns EFI_ABORTED to the caller and
> disables all EFI runtime services for the remainder of the boot.
>
> That is a rather big hammer.

It does not just return EFI_ABORTED to the caller. It basically does a
longjmp() out of the faulting context straight back to the caller in
the kernel, skipping all execution that would have occurred on the
way back out if the fault had not occurred.

Assuming that the runtime services are still in a sane state after this
is not justified, so I don't think making this change is a good idea.

Do the systems in question expose the RTC via the standardized ACPI
methods as well? I'd be fine with some logic that avoids rtc-efi
entirely if the RTC can be driven by a native ACPI driver: that
seems a worthwhile improvement in its own right, given that EFI
runtime services are evil and should be avoided where possible.

