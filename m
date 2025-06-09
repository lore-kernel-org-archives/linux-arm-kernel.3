Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D491C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=; b=ABoiqNin4SQRBsPkwOIuL/pM9e
	ruSEIIKH7soZeGzBD1RBxq0HWfvUgpk0PexrmPXdBdBDzy226bzxPEY7YRaqwMZK/5TEN9vjKsijv
	wf17Pyu3sawdgwR4imioMmwol+clnH37hJSNnZrP9LqjGu16eWvXRL75LpEwXXKp6HxKpawqYJBN4
	DrzoH8r8T/rO6aG7UrNgjj4mSNz8M+lUWkU4E4hapCHdAHYg5RUJzeADrdcd6lqJZcGtLHMh6CyrM
	RzDamZ02CeD+m6m8Q5xjeXzV5O27CxVKVqdmCKyqCvP926UsLlzeg+ikqHHmm1wbv71oh8+NtQ4qO
	02JCrHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXhW-00000003eOV-46uz;
	Mon, 09 Jun 2025 08:17:50 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXfP-00000003eCc-0kUa;
	Mon, 09 Jun 2025 08:15:40 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a44b9b2af8so24062851cf.3;
        Mon, 09 Jun 2025 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749456937; x=1750061737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=SMts9hkabMXcQzpHPZrZBCa/dAKmouK8/xf+8QHjuDXCJ7U+a5PG6JfmWwBt/2N3WI
         tms8nsnlT+FCeY7ThjHn+i3OlLg20JDBymScjoXLSH+d0z3XTh/Fzddjdp21AxHrHbeK
         NLUxOArRARMNybxmM+aGMe2vGhMKIR6QLMDqJZUD/XiZkgYpnZkn9VSf2452KL31L2SR
         vcIHxVz7+S2kBsCXkUiSCOqkaYfxnTbNzRUgoTm8kMyFpkvdBnEKswQgR026NqlFRaNO
         rZxBOqM0Y/w986YFHErq53qgNDeVtDwB9X8QaGmJ3Gl0Ce/q6jlXIsNNMSFxizzxSv0l
         xs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456937; x=1750061737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=CRfU+sS+DmjHS1zx4Ui0/Yg4kVn2+uEQUqzM+4UF3m8niMwk1doNTgX82Q9L77BnGh
         fDeQHOmnRtEGRdDDqlifgeqBk0rK6Fx4qCUenWpmp3ndhK0lJbyt3QicGyIzdlsGeiP7
         zXTdQwKwAQ0P1xb+G4lJnMRcvbqB3AJn96t3yZoKTnrrvpSigWwr1a0R1Grpv518eyHD
         Qw2yFfpzeIdeHBytEPZB16iQryTPzS7s08lhiJ7AglZ+luiBKxz9OvfqMjAMxyTIqOgj
         11TaTMbbzOY/rxdnZfvpYXeFxsI5/vMs6ES9rcGDFyY6zqkLydPc5yMTHREx9+IVeEhX
         oIeg==
X-Forwarded-Encrypted: i=1; AJvYcCUdU3hlaLv+8Hlhmf51CXyRYBP1v8xMzW4XIJacYEfuRyXqC/UmLKM6sFNs7cbHdLCnthiyF9lJ1sLid2w=@lists.infradead.org, AJvYcCWnhGZb/Hd+eNwhOw+lxIxlazZXiF3QJpmnW2gy0wpA1sPejWtBPTcRN4Z7QP/NydC3rcEbKkDC9RkxW+x3q5sp@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8jWvsNS6l0aYoyrQBGkAXcnlfCyzvX5NZwzNkQP3BkbG+f3T
	WTRoh8GCJDZnV5hhAMU9bksvHhyPOcNYMpzcei49Z3PtNT3Lg24Frr+dlQtuoOVwIA8EZDmTm6d
	l4HGPbC2gj6A65Hq7IUzr1/bexFh1BBQ=
X-Gm-Gg: ASbGncvZYNdm4WnWLj+4Vprbykqy4UbkTkwXt+UMSGI/ycGTTzZs6PnsAs+PLCet/sx
	6aWpxDun/VBpV/JmwxPPk5CXCn6oDw9cK2Yf36/CB5bcb5dJBVfegoLkijamDiDnTDduttfruzT
	G8bew+0Hcs+jnitMAngdEJ7xSxE3iiGctP
X-Google-Smtp-Source: AGHT+IH9me4CEdVFtIOCuIg1XAKf5VF3TkyjvnvcV85fkEmF6RBw78F2p/ZOsZjFija3GtR5SXP0ijToaYQxk0VMGhA=
X-Received: by 2002:ad4:5f09:0:b0:6fa:c81a:6204 with SMTP id
 6a1803df08f44-6fb08f50942mr228433326d6.10.1749456937558; Mon, 09 Jun 2025
 01:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org>
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 9 Jun 2025 18:15:24 +1000
X-Gm-Features: AX0GCFtpUUxU8yEaZey6YSh4XuBhQlOITIBZOiB21tfxDGQbnIThjp-0HFxjxHQ
Message-ID: <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_011539_220370_E62FA96B 
X-CRM114-Status: GOOD (  23.10  )
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

Hi Eric,

On Sun, Jun 8, 2025 at 6:07=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/li=
nux.git lib-crc-arch-v2
>
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
>
> As an example, consider CONFIG_CRC32=3Dm on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
>
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
>
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.

Quick question, and apologies if this has been covered elsewhere.

Why not just use choice blocks in Kconfig to choose the compiled-in
crc32 variant instead of this somewhat indirect scheme?

This would keep the dependencies grouped by arch and provide a single
place to choose whether the generic or arch-specific method is used.

It would also allow for alternatives if that ever becomes a thing and
compile testing of the arch-specific variants if that even offers any
actual value.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

