Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36EDFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=; b=jqN+N30pw+s7tqXogb3XhxtFlU
	tHjvc3cU17cGaR5uHVR9FSKD9dRTxD3zw2yDcOb/4C+BrzH2kWp8puz4YXf3ba5npR11yf30OH36J
	gX9GpsZXeqL3CiJBOY3JOQGSMFGuWQWVgGLwjXRZflhQdRhjWjdkI/xxcX90Vwyn/ShD+B2m/BAFP
	fcAhDki1v2GpuV1YlLTpZoL7xSupkcnR1SGXOsZh2KdIR7Yg3SfP9uA0riE1uVzj00aVw9PobaFQf
	XH31JVBfS9EROZfJ41BUzWt9MhRpRAKDGppOQgl1U1IQFWMgjaxzQMiOnax0c0q7P1fhR+JI7X/lr
	dYgl+/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeh9-000000015Q7-1zy2;
	Tue, 28 Apr 2026 09:25:31 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeh7-000000015Pg-2qka
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:25:31 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7365169a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 02:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368327; x=1777973127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=fncxh7gXAJ4Rp7l9I1GS/gvnp7NZuWUiyxNuzSUlY13brcykh9yGUuJZ/hlTPdSSp9
         OOM/rVXAuKzvfAqvAfNNTsZixEeLKyrhNUZgw0UejhMWxcO04YXrdy6OhTiP+Gh/PDUV
         bzhqegQCDB/ACfGulH5PwR3w0eajVtCwpJpUUf6oaMXK0ts9zAT0/va8FXFNiE8+7BmY
         6OXWBvpqECkNhnJhPaJemRaC/t6yFFnPR5RYeCGIfMXm/HiMVGw/dU4jKZObFzyCzd2v
         avN+5tCdbP2prTq7asJ4GmtryeH5biQQAGwvxu7GsfUimKx5hFKENNI5PVh6qQMmub96
         ZX6w==
X-Forwarded-Encrypted: i=1; AFNElJ+8JBtMf+ADqmAS6XOM7QcDd9Y1RV5g0h7A8VzrQvBCFryRMb1jVrHivPGFSC7pWC8Tf2xlraAulvVxhTpjk5Du@lists.infradead.org
X-Gm-Message-State: AOJu0YxXrlrGaGZGdTRAC2e3ZbcUjCvakegZxDQ5bSzSDTTQMEEwPcKf
	Z/NOq1pXNyN2GPtpwcL+fXvkIoiE8z+v6aNOjIV2qvOMnN7u0YoOIUChjYmP4vpSr9Y=
X-Gm-Gg: AeBDies9LUEOlJvyM4eK8IWrmFFEcgvSkx+SQsIafT9ySQrBO/K97lKhtPvBz1u2fHY
	DQ7lLersSse+ZdgPHHZu81m7zSRg4SCcXWNpH9A2Z9vaUhTVnfMTpOS+3ZUioGKgTooQ/q9dp8U
	dJP884Y7/PslGoeCorrOTt++RsojT7tmVoKO68DYSYtgN6mqGVSe2hPABNyNLEUY7VMvAmaYazY
	ik15IUG6jkTSJsjHwHJP5yvi8D8aUidwliXcCITMhCKO+r5tZTKWfLRE35JnUyROFN7rXECvXbm
	63jac2c2eud+Q2Tvg/0QrvZXVCiTlBJRpiLaCISKHm8n2Qfn/kEMWzn7Jh2uPDXsCRIQABflYO2
	ubyyFd9jK8dwIk5eQmxcXuSRCsajXuiCa+GNm40qd3zMOdC9NOp9v2oMKosK/9kKw3ouRV/Jb7q
	tyUv6egaNRkVdfAsLKGlbZkCyRhc1tyY+ntOcOkkZqyKgTCVOzTmlDlfL2dsPt9N9PxTYXFDk=
X-Received: by 2002:a05:6402:4316:b0:676:9c6d:5c4d with SMTP id 4fb4d7f45d1cf-679bb08f304mr995633a12.17.1777368327128;
        Tue, 28 Apr 2026 02:25:27 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b68524cdsm548639a12.21.2026.04.28.02.25.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so19496968a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/V3biO99P9SjY1l7evPtIPa6I6xffE070rCTWmRCshOmCNisLeYG09FR90WGz3m6HKAkKt2+eyHB2aWU1k7iH9@lists.infradead.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_022529_730412_DD1224EC 
X-CRM114-Status: GOOD (  25.86  )
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

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

