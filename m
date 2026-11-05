Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA44606D817
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GM4gLEQI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUgN4M03
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XlaV0uHB9IBgqNWTAny15HrhpzdaWp2QYmmqAipvZcE=; b=GM4gLEQIHBHn7o
	dKu8Qrz/8eD1gcxUP55ykRAG6vx7270oUKRR9hqydm/KKm2uAc5CE99Y5MDfrGaovDfDEtRobkMPf
	nE8lL1T92JVBgTqz3Wta1Qn+cmtKm3hOr4uPWxQSHFxe5ADwk+I1/ZrtMy4UGn099IvhfaP+ZVvOL
	mypVAt3b7eHzFzyTu6g9cKsrhDvL75EZ4P3ItqAarSH5BUXcKrh/SFzLBJ4Lp21gSrMRc7+Vr9IPO
	0hacXsGStvKymPkS0V13oBW0mQgx3ZoGwPm0CbEHqwY45O5t0cmYh60o9gISr1vMf9bjMvHaCserg
	0u34g/h+GyGYAw8VKx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx1n-0000000928D-2S9a;
	Thu, 05 Nov 2026 12:57:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx1m-00000009272-2a7C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:57:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6182144644
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459461F00A17
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883434;
	bh=XlaV0uHB9IBgqNWTAny15HrhpzdaWp2QYmmqAipvZcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QUgN4M03Wd98TJzZFuwVCPSCN6m4z92QSI9MBGTDS7uED8gWPribpIshAoTXJ84nZ
	 zoIBve5f+wRKTd3+15+N/+dSVO9rgqJa7EaW1qj8rSy3H/aaMaRAUsd3v0/yTeTnjE
	 rXg26gJt2Ez+QZrmiT4V5YeKbnt9b1v0luY3aCwWnpWl435PBhshJmHeGXR0PBmrgD
	 DFRlD+mfSabMvSGDKwp/kVKxdPHyxJpcxqsrAE5ijYgjlVoBiXWYBdOuFucro94h/y
	 QXLqhCMxOVdEhTm1CdyVSPjohHHY/bHNp/Z5UDXcjbNdSfuhwpLXuPBCRwAA1caEOF
	 6Jv5dNin7fPiw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bffd1e177fso446029e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:57:14 -0800 (PST)
X-Gm-Message-State: APuU4Z/jA5P+xFZLIG+kEhLy1S43RPClwOhRi3rT5NZsi4WGMe9J027I
	e2+PXMAl3d8hL0UZ2++x86B9MxtK2XXxBWk0C3OlWfep8dDs06xH+W1wRVWuk+7s/3bjw5Fkyh4
	xDct56R9LIriYwivG+VYTe6QfqB2BTJE=
X-Received: by 2002:a05:6512:3c96:b0:5bf:d54c:1fb6 with SMTP id
 2adb3069b0e04-5bfd9574e70mr6105817e87.44.1793883433089; Thu, 05 Nov 2026
 04:57:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104145446.2767924-1-sudeep.holla@kernel.org>
In-Reply-To: <20261104145446.2767924-1-sudeep.holla@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 13:57:00 +0100
X-Gmail-Original-Message-ID: <CAD++jL=O5XcB63aOcoVcj=SDH8ArG5-5ED3h6k_3Ooj4n-xxXA@mail.gmail.com>
X-Gm-Features: AclHuK_3QxK_-3SuTISH-Sfgev6koiYHUm__gjgUUdEUqKHtFLerNIGj8Nwk1-4
Message-ID: <CAD++jL=O5XcB63aOcoVcj=SDH8ArG5-5ED3h6k_3Ooj4n-xxXA@mail.gmail.com>
Subject: Re: [PATCH] ARM: vexpress: fix iounmap missing after of_iomap in SMP prepare
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 3:54=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:

> of_iomap() maps a region of device memory and returns a pointer that
> must later be released with iounmap(). Currently return value from
> of_iomap() is passed directly to scu_enable() without saving it, making
> it impossible to unmap afterwards, causing an I/O memory leak.
>
> Store the mapped base address in a local variable, check it for NULL,
> call scu_enable(), then release the mapping with iounmap().
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-5bb0baa3-6a9a-49a0-94f1-80f8cd8f6=
915
> Closes: https://sashiko.dev/#/bug/linux-6803acf3-f91e-450a-a738-8803e6ac1=
f1a
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

