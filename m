Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08888E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E38ED0bvZ8ViDN76LuuGorJVL00ITAOwya5y2WsL3AA=; b=if8Si+InTeHJEFxzfQt5p8XoED
	yxut065yZsambpVHdD6uhkhpp7LpZ4P8uMxmwlHqcpl3WhD2W6I6wTSD3X3kDDCgDy+JtDB4r+Zrq
	N6N3C+oUMqf5xqsl4Qw10ERrld2Dj5YFx6L3XhznjSLXqrDZWaL0pUfzyWQFZ9izgi2CEbxAl7spU
	ddFbVjVZqXAn4ChegVHFT4FYcFYBt81zmQrAGmON3/19HIuaFeIos5xJledJ7iYuX7oLXEf7VMEac
	z0d8ZuKC3CSC9VDTyl7sG0+pk5tt1t9u3gvhTAOrUHUWLXQvha6F0JHKmrGtg7kuQsNv6PKhGzCjp
	6UZDoNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7HIf-0000000A3ZB-3m65;
	Sat, 02 Nov 2024 16:48:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7HGz-0000000A3NN-1xmP;
	Sat, 02 Nov 2024 16:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 330E6A40E15;
	Sat,  2 Nov 2024 16:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47800C4CED3;
	Sat,  2 Nov 2024 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730566008;
	bh=GxoXhXGyHNH8GVqUExL8Ti1VvRWiwrpIEQI7tN7LYew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NJ+1XHVrktQ9WGmo2EqP6wMVn/OEt/Sv2350oNUT4r8GsAp9SYm0VRx1/D+bpxg8g
	 AhMeZGuz9tEsHn97hHwlwmvLVZz1BdRK3HPFE5YqLcs8A8XoDyXbcjgPGJYTBYv2lw
	 e7zJmHAonSkqpKaKaw6UnNUCHZimTZLKO1FLqORq1mUqGyfy2E7ES/38e2axn3jHVc
	 vyfrkc6wWAWUTuzFcDsIW2fxGUusCopNRtdPosLD46rmwBPJUZoGz8kFjaYjXuuFth
	 EueP60OBXtYFWJvxL+0V8IT2yf0FfbKIXjL0+19V3Zm0XEOHjVKdBVOhl1og12Usc6
	 DBoCweRx5bdQg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so38125041fa.0;
        Sat, 02 Nov 2024 09:46:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/vJtMoaP/dA2DRTpQ7tfQhY4Hvemh6+GW37YCrWsVL7ISqUT3QSUgngnVDip94mJNehahVpuwz01sdi8=@lists.infradead.org, AJvYcCXcwIj6xHCOuJI0gcHYEEEpOOdN+zwWVIZFCHshc/dTfS1UyAH5zm1JydFrVvsrzlSFQuI/o6tL21pEn0ktyU0g@lists.infradead.org
X-Gm-Message-State: AOJu0YzormiN1eBq80jl2xzVtnlxHP4wmzugszuLQrIOsqx2D9Czj5Cx
	WnZmQTWBtO2Wzn1W7zCDgpfRNTYyVWqfmfhmaGx3wxyhVEFeuhxwqBkG4pEUjth0X+bCmWn1is4
	t7HskhuW83Qr/QbUXhAuRx7EI/mk=
X-Google-Smtp-Source: AGHT+IF1qWuAPM7OXxHa9PDtIx4xdAi/SPdwq1d4i906hC2y1gUwoZbqVs2/tV8+cHeYBRRGdC2ase7pF6ri9+FpJxc=
X-Received: by 2002:a2e:bd87:0:b0:2f9:e1ce:1276 with SMTP id
 38308e7fff4ca-2fedb414a6amr24137441fa.11.1730566006632; Sat, 02 Nov 2024
 09:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au> <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au> <20241102163605.GA28213@sol.localdomain>
In-Reply-To: <20241102163605.GA28213@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 17:46:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEQHiqkO7j1W55UHGg-LNF2CNiPnpHcKfCdKnxFQSJ14g@mail.gmail.com>
Message-ID: <CAMj1kXEQHiqkO7j1W55UHGg-LNF2CNiPnpHcKfCdKnxFQSJ14g@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_094649_646410_D9B4A228 
X-CRM114-Status: GOOD (  28.80  )
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

On Sat, 2 Nov 2024 at 17:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
> > On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
> > >
> > > The only issue resulting from *not* taking this patch is that btrfs
> > > may misidentify the CRC32 implementation as being 'slow' and take an
> > > alternative code path, which does not necessarily result in worse
> > > performance.
> >
> > If we were removing crc32* (or at least crc32*-arch) from the Crypto
> > API then these patches would be redundant.  But if we're keeping them
> > because btrfs uses them then we should definitely make crc32*-arch
> > do the right thing.  IOW they should not be registered if they're
> > the same as crc32*-generic.
> >
> > Thanks,
>
> I would like to eventually remove crc32 and crc32c from the crypto API, but it
> will take some time to get all the users converted.  If there are AF_ALG users
> it could even be impossible, though the usual culprit, iwd, doesn't appear to
> use any CRCs, so hopefully we are fine there.
>
> I will plan to keep this patch, but change it to use a crc32_optimizations()
> function instead which was Ard's first suggestion.
>
> I don't think Ard's static_call suggestion would work as-is, since considering
> the following:
>
>     static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
>     {
>             if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                     return static_call(crc32_le_arch)(crc, p, len);
>             return crc32_le_base(crc, p, len);
>     }
>
> ... the 'static_call(crc32_le_arch)(crc, p, len)' will be inlined into every
> user, which could be a loadable module which gets loaded after crc32-${arch}.ko.
> And AFAIK, static calls in that module won't be updated in that case.
>

Any call to static_call_update() will update all existing users, so
this should work as expected.

(Only x86 has a non-trivial implementation that patches callers inline
- otherwise, it is either an indirect call involving a global function
pointer variable, or a single trampoline that gets patched to point
somewhere else)

...
>
> So I plan to go with the crc32_optimizations() solution in v3.
>

That is also fine with me.

