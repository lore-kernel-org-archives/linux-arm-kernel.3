Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B11FE8537F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=; b=vQNCm1z58YnX0R+9u/xHOGOYS4
	MjdGuNCkibH9HvZLqmP+wND4Qb/kr5ORzdxsui1aG0s/nu+WCH1fMo83k8xTEfLqskcoufqJfmakK
	jTZhIjphPX5q10oG60LW/OOUf4bVeUdldiPtyyiq8SXzXOMpAueIb0s3aoGP059UWqhH5Xh/roEcO
	T+8DmkB6LGGMuiiGgav6LaQuUIb1D98EqXP5k2fISPCfEZiez0D6oKT9r1AMl2rOLG4vUbcmSTOvy
	OC5SB3bSOBUp42Y2pZNv6fHT2rDL38iC1r1cv6ZzqZmzCgx3/1MJwR9Q7wMGVy+PXcWdCLyiz54iA
	AMHDkMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hFm-00000002JXb-2Cox;
	Fri, 03 Apr 2026 16:20:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hFl-00000002JXP-0uB3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=; b=ZCKfvqVRnaPc5TwkSpb2Qg2qpl
	qoF860xN5A1PkaBQk8D8TqCoEdBX5vvbbOFM0lQvXXBvwY93Y0Jv7dv3xudQAX6JS74y9jLIgUU/6
	f9eCbVJBDFGdbTkHwPkolO9Rjg5LDAe1tcr4d3Bcf4iydbvE1QHEkAqWkJVzfLpDfcTd5/JHIaVGq
	eu3ufQ4i7vLdcSBDHPUyUmi9pwyCBeySjB0YTd/4WmeMOzfO+rx2eru2xc1jzf1+b2Aen2nNQTbr/
	7KmhWMuicgOjiWQxwGcjrOzIcK2OkQr07TSBAMvnH/A7w+39rC6mPr1gKnN/MEzArpOdqn+Q89Ixw
	PQdIhQbQ==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hFf-00000004PtR-2jxs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:20:10 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d556c1a79eso2438580a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 09:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775233202; cv=none;
        d=google.com; s=arc-20240605;
        b=XFN7RkdodA2IR+RNPrW7J2LubJ/Vawpryq09AydJcxu9jo0d3McRQU0jtosWkAT41T
         qnc/6Qk4q8zCvfRbtV3GWMdhUfIlOyvCqnXXiMK3/gMpO2Fu2zWQ/dQND5wIWRD5cGVr
         0XGllabC+cTxi3AbVRqdpwPmy5PRrLTH1/JoSsLdfp6IononcPMMc0J3p+DYpUhR7WT7
         lsMF2qXLVkvFunG3k1V0EVs5ZT7JdsE6eA2m6yvS0/7gMtLYlzt4DYHABVGQKJZfJ5fl
         xQdrXwhGghONly7M+taHZPzpNrKWR4TJk5/wdHQdfH4nLLLzYaj4jXGmlXxB4K6DuzIS
         uQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        fh=hsdgz9VnzGxQENuCXhyvFkBwo8BklM30VYSXpdCkgJA=;
        b=br6+AnmoDQoZsF6wStDXzUVVYu3EYxPSjmAaUvEfqOc+0EB8bAKRNGJH3YLK9GrnGB
         5KnEPGOqi1B1QJx/uZSD0KOSV+mANFjIWUKiA5F5IIyiXpfMuEVGBn0tJRxxMzNK0Qhw
         gZCEmYaf/nIHaaub/Mx8B7U5g6uRaMXSA8YBcQ7PPf174/T7i8kJQwJw6is1nsGXh9JV
         kHsekENDYF4PylJ7z0nWxjkTCgxphuMSayhqswsNH12/F7DhCprH0PycMLq+JmlhmA6r
         sE9cpZn19zUHT8nLm9QB7nEtsPa1E9LWwUKFKLvkMiRR8p6XVmUlUI1N9BJlHq4DGbtC
         r1ZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775233202; x=1775838002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        b=NhdeJRVZyM6FqTLKdkcvB4SVdSKVb1ZFBhu+fk369L1R1/Wu2Vs6Z9V+FCbgHf/YFe
         cFUZEUiv/R/hPMUo1cEYvYzYRB0yLYBJhAEAP6SC9DhM2XHvqRjchKUJcET5XJJrfNtE
         XwHwVLp1OZm97tXJazoudL6bPZQM/OBuX/7s3CiD0gXWI4sOmh4BDaEtZUg4SdBbrb8t
         waN46e/1NnsTuXLRPjddksAqzC1WygWjHi0XW32SivU/4beYWiP9EJ+bXxCNuJsin7dq
         bqd/BSIBXsd0Lyjq2mEHVF50oEozKC2Hl7imKG9uYnGichKyYi9bYF8Gh+MU2DS71h/+
         xPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233202; x=1775838002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        b=Qivl+vFJE7bMrwPk1/CfgmJqFvEQ0WktawpjCJgMxk90ghiI8cA6MuyM57X65V6dxN
         Y82vMA6iRhiiETLdMyVIIjozqop5DGbWgA8HR9HS1FtABZ3IzSWfx4y+Z1ENQbsW4zcR
         owdW7yqo0KpAUBII+j/gV8ltym0zic1I9sN8HlrIvG3xLvJ5D/Icsjx+F0dHZHNkhs+l
         k+4MjvUrHk8tCDB7Sa2cGe9Z8pJbvRc5MfUlIFLyu79wJQW7pgsU1JVAWEQuufF2j0aF
         MpvklLDEHvZlga/fU9BdPJd3WcXuvj2SKzkJG8cjbY/vOaWevTlioxbA2HSyNCNPKZNQ
         KsOg==
X-Forwarded-Encrypted: i=1; AJvYcCVopjFKXhJQtiexMlkWnFQ3Ok5uuGWWVQt4DvZhbsoUgMhhyqziwOz2xSTFuhlmd9Scdp6idO2l4TnWR7Kwj4BY@lists.infradead.org
X-Gm-Message-State: AOJu0YyNieK/VTonyeXSiH4kWQuBT8/EqpiFOOc4J4Me5PaFQmlxsXE5
	zfUa/fIpQYg1bf521je9pKGD3KS3gyY6Ag+I77fUzHmUpHtd9jFaw+dh7IX22V55HuqU3cxcJNF
	nx/pG8cv63z1VPxb3hQUTv+FW1Diz5Y4=
X-Gm-Gg: ATEYQzzk1NfBSFKtlukZKoIQ5Uu69YTMsRJwbxlWC9WgfbP0KwP+OOWF8eFb331i9KO
	49EbayBpagQQoxHZXHnEfKCGJvVDZ4LJNUZir+BZJwGlET89829StYl3UnFfUZTWgEBlPXvWD7z
	qSBsf8Pi/lglEtqiFBp/0PWcRLjWOgTG70VSjTWCQic0Ug9a19/Z54F6sZ0l635EMt/HgwjM8Ea
	VOW5eLPHcIm/C0VhWkoeVgB0ncpUstvfWAIdO4J7j0rGXex2yZl+P6q2UrQivOZvVcqZp5d0Wz4
	n3YErvq2
X-Received: by 2002:a05:6830:83ba:b0:7d9:ad90:5677 with SMTP id
 46e09a7af769-7dbb75d7260mr2353806a34.30.1775233202503; Fri, 03 Apr 2026
 09:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
 <20260403145119.2581034-1-joonwonkang@google.com>
In-Reply-To: <20260403145119.2581034-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 3 Apr 2026 11:19:51 -0500
X-Gm-Features: AQROBzBimCWicSTdSy1XOK425eepJ2fZaf0LPQosLeZZ5fVq1iHQtw7KN5njBvw
Message-ID: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_172007_828304_D8AEFF36 
X-CRM114-Status: GOOD (  26.70  )
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

On Fri, Apr 3, 2026 at 9:51=E2=80=AFAM Joonwon Kang <joonwonkang@google.com=
> wrote:
>
> > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > Previously, a sender thread in mbox_send_message() could be woken up =
at
> > > a wrong time in blocking mode. It is because there was only a single
> > > completion for a channel whereas messages from multiple threads could=
 be
> > > sent in any order; since the shared completion could be signalled in =
any
> > > order, it could wake up a wrong sender thread.
> > >
> > > This commit resolves the false wake-up issue with the following chang=
es:
> > > - Completions are created just as many as the number of concurrent se=
nder
> > >   threads
> > > - A completion is created on a sender thread's stack
> > > - Each slot of the message queue, i.e. `msg_data`, contains a pointer=
 to
> > >   its target completion
> > > - tx_tick() signals the completion of the currently active slot of th=
e
> > >   message queue
> > >
> > I think I reviewed it already or is this happening on
> > one-channel-one-client usage? Because mailbox api does not support
> > channels shared among multiple clients.
>
> Yes, this patch is handling the one-channel-one-client usage but when tha=
t
> single channel is shared between multiple threads.

hmm.... how is this not single-channel-multiple-clients ?
A channel is returned as an opaque token to the clients, if that
client shares that with other threads - they will race.
It is the job of the original client to serialize its threads' access
to the channel.

> From my understanding, the
> discussion back then ended with how to circumvent the issue rather than w=
hether
> we will eventually solve this in the mailbox framework or not, and if yes=
, how
> we will, and if not, why.

It will be interesting to see how many current clients actually need
to share channels. If there are enough, it makes sense to implement
some helper api
on top of existing code, instead of changing its nature totally.

Thanks
Jassi

