Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF14606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 04:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=30ucI8Lo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByfXy9jy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=; b=30ucI8LozPaWA4
	EZelqk4wpuNE9ALD8LjkxJuGwTvSeJNw9JeF7pzSBjAEY8OSadTUScmNb/5woQJFs+YJPSI38ER3n
	EODXxXVpzHzo9z6H4HFsK7PEYnDNbjzEgZKkFqJlU2ztmex5QY15NTODI9auh73c4Ck8r/be54gBi
	z8sKLqKjV3O0bCajO+P0lIvGvKxtmJr8pqtuJL3e3S88MMKaVdYZbbeH2p+XYbJw9Us+Nmjxx4/b2
	rxg6gsan9Qf8guaOai02lDRWoQwyP0akaRTXHN+SAFgJRsXfcSpWTFl7wT8FS4EHAzh/ysfx8ythh
	Y7xbMUw8Y8rdgAlrj5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjvz-0000000FWyc-47DZ;
	Mon, 02 Nov 2026 04:46:16 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjvx-0000000FWyG-3ckc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 04:46:14 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8aea7b7ca0cso21310617b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 20:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793594772; cv=none;
        d=google.com; s=arc-20260327;
        b=jB0BF8mpN7HPj/IgpSIW1INWkx4lKMmaROb5BjREzHJVzej0VU5m9Qm/qrIAk6FKAt
         gF0yUsFlj+Xlh0BXk/cpjZ0AAQixLUnsjTRMKQlxqut/jevLCgH31GbFvzSmFQwX6+lT
         W3Au8NKcsmTR7mon1/BBAmLYUDFx4PvaCJNzYIRrFL5wAc0AjhB6NPK196UjmI2U3vsV
         OHuWYzytoXYWTyJKaP/X/Jr8irc2aSRar78fi6bgQmd5jB8yT2Tf1eB+Vmk+mprgubuZ
         GD023KF81N6zg2x+qpKC1hZak7heTWplFQAS1ZLgXwTy9gnhE6a7402WV2zXL28dHFks
         u43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
        fh=isw0gnRi60tteBqm0JGNTGAbZ4i4ZCSWu/ZGxOUiFgk=;
        b=C5QBMgIjCN0AxgOIkFeoYXjWEQ855o2QfG79Bgpo3bMSzM7/Ea4hfZHknEV/RxFoYJ
         rHwm8NVkl5XkbMyQgI09TDKsoFYOFAVSwSMpa4ioCzK5gddh4uTr8V7M+e3wkh10SHAn
         /0V3JcppO+JAjyvLVc8tOnXHg5FVHQ6+u+SZy8077oampaWZ8cYgMs4ZQ7VPRX6wvXfi
         J3PQMhR3E/bXX+B8Grbc6k+/Bju/5jMBa8IcZmlyO8bEFPjunq4EnpHl6ocGDH/9CkBR
         V/zDMjYKFE4ej8qvCL5r9dvwDow01qDeVogvP4wfWebIIlBmJ8RnJGnFEOAxRKMk3PiR
         dQuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793594772; x=1794199572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
        b=ByfXy9jysYx1is3gOV10xAYiry1LaOssw2GvWEG1v5SSfSj77IJX2q/E6bpV1Obokb
         00np6CmeKgJnvYGcjJ7v3JBWFc4AyeN+bvR537mpKvlkLVf/ZU44ZgdlAOhmRUh/fNXN
         eIQXApjETo5XJabAf5l30m6jnk3TIR01dN2suxKu5NatZcp4R8DTgTK/at07wDazTM7a
         3EFq9VO5u46G6Kkjn4q/rmfDWTl/dYpqg92EdCDbBNq2oF3eLC6lGac1WNlOkzb7qo9I
         3O5tqlBWjZtScGr2PZhpLEzHQWA5uNtZw+yLhOT1pRReV2uQ/cYjWWY0szxgVg03JcKd
         Zh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594772; x=1794199572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
        b=cSZ//7sMAsX/aeYkLZLQ9pUBGGYPpWYYkCouLb7z+nWjtKfQqHr0liv0UVHa3ebQvu
         tM+BZwP011Ldc7pnDorpifaTlStnCIX989AbjoVRnsG3yefYxRNBU4EtfTSN2lMFsIOJ
         UfgLokApAKxZXRd8kOLuSwkFqwUkJUcgIkYX9ca8ELI5+uzg3vDLP6dTi8omkERlKfJK
         4eY9zUhY5vu8H29IMF+4l6M4omcJfspJtMog0GDb7ct8SUzGgze4WjzHBBexwKL9pK1I
         jHHjW6SVslduX7B+ebJUhgdfG3vwAImJqvyKndegWzoHnQ5Vf4VmPDnyMEb4o/CgXS7s
         aMmw==
X-Forwarded-Encrypted: i=1; AKwUvBzIHKPvN3R5Ps3GQv5fuWv3IuuvKc+D6CEfOw3O1bGxjCh848n2mahLxh//g0MZ7ghN4tFCKxUFMQW9dyF4fHoX@lists.infradead.org
X-Gm-Message-State: APuU4Z9vJ4FujLcXIAy9BC6l5rsYrx3REu4oFIh1z8XA3NGkdWoxW7d9
	ZgmFqvzoD1js7OI6LANrT6elH0Kzzgp4ZirLP8PvvSWu+wZETdRX6DHlSPjwPP5FBQ4JARQqw07
	AsaSIrsh0ji4Jg2plVjGYNOwJlF1KqTw=
X-Gm-Gg: AYBFou1jShhlGt4NeyUBWC7bHyJRBAee8IcWT0+7NZyRPbpcWmkIYfmznwyj1CFG3X3
	gnhNCUIMPeQqCZKpAZ+HGyDzjQjgI92gvYoHRsTYdLIXCIUJb06j5AA//cSFlK/A0oLdElAPoR2
	BrtlttFcWDX1hSVJvbtx+NHL9DISoboShMohqC37R+0mAZoyKzPjdJTwW+5AQcBMcu3Y1zrnbdD
	JGdbHHqGXuxThxKPCmqY9MwOkoc0A/6lSadFUA8mY/zLjdRQbAQfWB75vOmUeFYF5wqzRkbwduh
	RlvrB2af0EIkHuRgqe5JPrYk2NqqgKUUWZy10tgIEIJvGh6lPn3ZR6cKbOLwkW66CWPsfWJshmZ
	1DmqarSePhs97nMgfRnvHW/oiQteVRgNuj2oZ2d7dfdUb+NrWFXhqQRh/wTf1
X-Received: by 2002:a53:ac90:0:b0:679:a47a:d414 with SMTP id
 956f58d0204a3-67ba50520d1mr4698256d50.148.1793594772269; Sun, 01 Nov 2026
 20:46:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
 <20261031-tty-dont-use-autosuspend-removal-v1-5-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-5-7bdadcadc4dd@kernel.org>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 2 Nov 2026 10:16:00 +0530
X-Gm-Features: AclHuK_YfQrdtG8grRC3sDl9M88bqx3_75JwW2gTYOzUBxf8mRI61Vj_PHN10uM
Message-ID: <CAKfKVtG5xCzn3mHcR_7+Q9mdq+46eXAk0qu12KE1UsS_-zNbLQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] serial: uartlite: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_204613_912031_9C7B2FBD 
X-CRM114-Status: UNSURE (   9.74  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 10:40=E2=80=AFPM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosus=
pend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function call.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

