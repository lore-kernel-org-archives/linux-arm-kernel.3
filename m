Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3SuTrK7ua1jSt5ecvosiLTOXicZe+1p9rD4HzyC/xI=; b=08Irby3CUIsDXLfdDIebTK2w9H
	GK5zywxkTcfbtv4r4DHDnZUAS/GlHwYaUSejJC6HOrZFrqLyXWzAXvu8fwXIYCyErBQ7LqsH+bDhO
	k54nyGOtMqHa1TXEpC4HctTIoszr+WiPbw/xgMZe0ol8KAjCZ1XOFNWjAZvDXGY+FOqzYJYEp3cmF
	C8c3Ue764nzmYqO5T3xQNipjFtriT4pULDsdrrcCo6X1Bd4NGtSYvQ1Wv6Qs0t83O0k9LqeIyqtAi
	DUJ1AsDAeDclQmUfigbJ0r6xH9AiA91O9pmR3Mg3xgC1QcnCYFf4XLHH65gfx+Sfj3ID8yRzZQd1f
	s1V1d1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnGb-00000002GUQ-0hlh;
	Thu, 09 Jul 2026 11:50:09 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnGY-00000002GT9-0r6c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:50:07 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpiuBvsJzzn8O0TJltw7o4bmR8Lez8EjE+onSAwPP3i2F3PEMEqQ5arvGIS/XqL1xj97QfwfXwmWwycEj0D/Bmg@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783597802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3SuTrK7ua1jSt5ecvosiLTOXicZe+1p9rD4HzyC/xI=;
	b=xVXS7T07k/cIqrNysR+kYtFgVMt29jB/UIvZ1/tVtHKc/Y1sfLDAKwRgX7Q9Q26i9YlKBC
	kzq78UqyAs4QPsKQyP57nwMI+QjN1dkJX8XXfOIAvYcMu0yrDpxJtuXFsNIZdQ+RNFJfui
	iORat/VhmYQ2fOfWu5o+8DD45GEDeb4=
X-Gm-Message-State: AOJu0YxPgGGuGmrXEwuZVRf7BylooJSAMF9wQdftpwr3DhtxyF+orbZX
	7rk7KXSiXzncug7qBtLGoEZHAfnCO7aQt7oC7wO+/RCfCwn6YX0empa4s8+RrUIyeeT6RaTSLTt
	FmsUGL7D7uPKLkjIeXp5Wr+8e8mpKBjWOXvipRnra
X-Received: by 2002:ac8:7f0d:0:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-51c9c573e75mr5591691cf.5.1783597796410; Thu, 09 Jul 2026
 04:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com> <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
In-Reply-To: <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 9 Jul 2026 12:49:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyhRFMa+diHpWyKcCuB8DrTH4p1bvraiaQnO0Fru74cHw@mail.gmail.com>
X-Gm-Features: AUfX_myGvG9GzTq40K-onGYQvIqSeZZ7bcchUs-KHtoNqS1WCKCcF98we18uqCM
Message-ID: <CA+EHjTyhRFMa+diHpWyKcCuB8DrTH4p1bvraiaQnO0Fru74cHw@mail.gmail.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_045006_387430_2D923574 
X-CRM114-Status: GOOD (  23.85  )
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

On Thu, 9 Jul 2026 at 12:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 09, 2026 at 11:26:41AM +0100, Fuad Tabba wrote:
> > > base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
>
> > I think this SHA is local to your tree. I can't locate it, and neither
> > could Sashiko [1, 2]. For a series this big and complex, it would be
> > good to get Sashiko to review it. Could you please fix that?
>
> That is the v7.2-rc2 tag, copying in Konstantin since this probably
> wants fixing in b4 and Roman for sashiko since this might bite others.
> I told b4 the code was based on v7.2-rc2 (which it is) by specifiying it
> as "v7.2-rc2" in --edit-deps and it's translated that into the git
> object hash for the tag and dropped that in there rather than the hash
> of the commit that was signed.

I figured out what the issue is in Sashiko and submitted a fix:
https://github.com/sashiko-dev/sashiko/pull/317

It wasn't advancing the local HEAD after fetching.

Cheers,
/fuad

>
> Probably if b4 is going to resolve deps into hashes it should make sure
> to resolve them into a commit object in case users aren't pulling tags
> (which I'm guessing is what's affected both Sashiko and you here).
> Either that or just keep the text (which would make it more obvious
> what's happened but doesn't actually fix anything if it's automation
> that's impacted).
>
> Unless someone objects I'll resend with the dependency specified as the
> commit object for Sashiko's benefit :/
>
> FWIW:
>
> $ git show 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
> tag v7.2-rc2
> Tagger: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 5 14:44:06 2026 -1000
>
> Linux 7.2-rc2
> -----BEGIN PGP SIGNATURE-----
>
> iQFSBAABCgA8FiEEq68RxlopcLEwq+PEeb4+QwBBGIYFAmpK+lYeHHRvcnZhbGRz
> QGxpbnV4LWZvdW5kYXRpb24ub3JnAAoJEHm+PkMAQRiGsv8H/Rn7Hr3Hp8t6au8B
> xQueZThJWjqQ4v8pyLnXF6OomKiDR24OTXMCrFgDkcmZ7RK2ALqowI3tQVwLUTuI
> yUN0qL2z2y+LyTcO0CYf3Lple8KlgLAXYMsv7pGLsOvhS7BW2jW97/bcbpUNxoHb
> eghxqbIEnyRImUbbyg+nW7VVk65RKdPUNkBPXfQ2NMVwe+SDE5Rl+NXNVqDNjGad
> soDTUBrD9yXkWX+4s0myleE62UzzH5nYgGPQeQgYmzWgq7LybH6WBlbQK9D7ODJR
> Cw3LCq1hwZZ2w04Yx+XwMHquGJYHW8L2pj77h95uhzksz8buKnM0AGwBCTC6RMoi
> AyUQvdc=
> =JUWl
> -----END PGP SIGNATURE-----
>
> commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 5 14:44:06 2026 -1000
>
>     Linux 7.2-rc2
>
> diff --git a/Makefile b/Makefile
> index b9c5792c79e0..b4035d3cef26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 7
>  PATCHLEVEL = 2
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc1
> +EXTRAVERSION = -rc2
>  NAME = Baby Opossum Posse
>
>  # *DOCUMENTATION*

