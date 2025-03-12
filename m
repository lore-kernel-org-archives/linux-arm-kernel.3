Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF7C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MatbiHDO0DCUqMkCHmZ0elSs7NnL3O74U74cu1zQUug=; b=Xg6CfqwU1puB9XwU+1uSht9w2+
	rBhdpsKu+OWuBH065KHDfzEVS8kBr256yuc/+wT5B2OTtB8yRfB7YIludm3LXsmzXUbAd2JXCblck
	vz2AVggL9Xl0nbBl3BN5NR5vsLnM/uimXpY1UJ2otdJl3T5QvV4BuQSpO3wSxBswGjTs+P3RMqEGw
	pPxY5jz/xprVKm8jNKzK5S5R/QN0NBs1Fceh5dOq2ahi+HqoYFpfUCJhfMDm7lKneoTvCXkL9HrGZ
	dyr1+KESFmxwEBW8xPXdYY7bQmXthyTn//PRuNcOPvbl2Ii8ywRUEu3RQjiL+necAupqY17Xj3uBq
	lrwxwQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsEWV-00000007VpY-41Rr;
	Wed, 12 Mar 2025 05:20:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsEUq-00000007VcZ-2ozt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 05:19:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223fb0f619dso117287125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 22:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741756750; x=1742361550; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MatbiHDO0DCUqMkCHmZ0elSs7NnL3O74U74cu1zQUug=;
        b=Z7ZJ3mCTryQ2I7h6Nf1DqKlcDytIPoOZjYEB9NEB+nFv52loJtRNQF+su3bAfTU2/I
         xmtNfpIlUR8m3c2gs54F2LhN8cEyYRevT3OteP2q3d2xQ4I8d+FJ9YxrYEaXM6o3dafA
         Ma3rNpilRjuCMelRG3SJyihqPQtq0ffqFBXlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741756750; x=1742361550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MatbiHDO0DCUqMkCHmZ0elSs7NnL3O74U74cu1zQUug=;
        b=iDu0vZ5BVmvEYAxZIrdGSe2S7G1CeqK95+D+5mb0iJbZipBKp6A5o1LFT9O05OJEuE
         gtbZ0KnmoumfWgHT6orlfT9hVCxfihhxsj2cQvejdDK5b9nIMOts8xti09BfTy3/UgkN
         mkkNyBGzbJaZFCF84Ctr5SKHMfr0U48cDCshJ4dYO1uTzrT0vkP5Qa3aJyz1SKrWlPyv
         57eIEhcrOPxr3VqykUVb6CcA9Zc3IwQ7kLzCGZSEgJ06lJHzVwP/0DW1xHX2vZqjzkeb
         xHmDU9ed5E3riUYwi+ggCdscU7t2nmv/JkLOwKueVshya8XgY0r2uTgOPRLnVa9el3+4
         6hEg==
X-Forwarded-Encrypted: i=1; AJvYcCVXtu7boZXBZ9Fc+HmwVHk8vKXUP5HFCzI2gVT/T+WA+evIEj1N9DUIPwwWw8TNifkyS7da4bV17cvhayGtXfk1@lists.infradead.org
X-Gm-Message-State: AOJu0YzEPXzCZbG4pPbE6/6x31zfOuBja8bppTD7+wmWjlGV7mq1Dpn/
	+6mlJel5ZITpAPlVs3ez8RZrEUDT5tRN+SR4blXgpo0OYZwJGhiHwhMRsb+Jcg==
X-Gm-Gg: ASbGncvpIJJN/s244MYM9YSk9EJKvsXWvRtnBivJZo6PL4KvVAI1jpe4YT24itccWrW
	exAMUvG0LiIUEGr0/Hvc8Q9gsEHVhwEtBaAd5zVnMkv+TEpOkH9l1NPTdt/BoknXr/+acB+27Sn
	p+mNKlUfCMvHN1tDXlDjqzJpEZ0jY+hLkYNp1JPAkGwJETw/Wm1lP5hsJcPuRy7gzwvfTsHDaPP
	2Xkt0M4+b2k6Nx+X5EX9nznz2H5KeM/qBndgmVyDjnWzliyxWPGcb9x5jI2l9/QqttucBxIku/b
	yNRNa3xCeqlLD69adE2AGkNofmV18pPNfMVb1v0nXKdof40ldRgdnPBPY6Y=
X-Google-Smtp-Source: AGHT+IFe2j1+GACtRUcv6p7Y8qMgiJICjpvUMqBu5x7qOSpIgXxXSdQ6F+GhVarFS/5mqmKsiN8Zkg==
X-Received: by 2002:a17:903:46c8:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22592e207damr74581435ad.3.1741756750550;
        Tue, 11 Mar 2025 22:19:10 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:713f:ff5a:f7a8:2aae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109df232sm107260695ad.41.2025.03.11.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 22:19:10 -0700 (PDT)
Date: Wed, 12 Mar 2025 14:19:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Qun-wei Lin =?utf-8?B?KOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
Cc: "21cnbao@gmail.com" <21cnbao@gmail.com>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, 
	Chinwen Chang =?utf-8?B?KOW8temMpuaWhyk=?= <chinwen.chang@mediatek.com>, 
	Andrew Yang =?utf-8?B?KOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>, Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li@mediatek.com>, 
	"nphamcs@gmail.com" <nphamcs@gmail.com>, "chrisl@kernel.org" <chrisl@kernel.org>, 
	James Hsu =?utf-8?B?KOW+kOaFtuiWsCk=?= <James.Hsu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "ira.weiny@intel.com" <ira.weiny@intel.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "dave.jiang@intel.com" <dave.jiang@intel.com>, 
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, "schatzberg.dan@gmail.com" <schatzberg.dan@gmail.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"minchan@kernel.org" <minchan@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "kasong@tencent.com" <kasong@tencent.com>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"ying.huang@intel.com" <ying.huang@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from
 kswapd
Message-ID: <y2jpx4xcl34xxrh76jms7wojyhvjvigto4phmdek2ewbcyq32f@2owu5ndtama7>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
 <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com>
 <dubgo2s3xafoitc2olyjqmkmroiowxbpbswefhdioaeupxoqs2@z3s4uuvojvyu>
 <CAGsJ_4wbgEGKDdUqa8Kpw952qiM_H5V-3X+BH6SboJMh8k2sRg@mail.gmail.com>
 <32d951629ab18bcb2cb59b0c0baab65de915dbea.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32d951629ab18bcb2cb59b0c0baab65de915dbea.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_221912_746304_6607EC7D 
X-CRM114-Status: GOOD (  32.82  )
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

On (25/03/11 14:12), Qun-wei Lin (林群崴) wrote:
> > > If compression kthread-s can run (have CPUs to be scheduled on).
> > > This looks a bit like a bottleneck.  Is there anything that
> > > guarantees forward progress?  Also, if compression kthreads
> > > constantly preempt kswapd, then it might not be worth it to
> > > have compression kthreads, I assume?
> >
> > Thanks for your critical insights, all of which are valuable.
> >
> > Qun-Wei is likely working on an Android case where the CPU is
> > relatively idle in many scenarios (though there are certainly cases
> > where all CPUs are busy), but free memory is quite limited.
> > We may soon see benefits for these types of use cases. I expect
> > Android might have the opportunity to adopt it before it's fully
> > ready upstream.
> >
> > If the workload keeps all CPUs busy, I suppose this async thread
> > won’t help, but at least we might find a way to mitigate regression.
> >
> > We likely need to collect more data on various scenarios—when
> > CPUs are relatively idle and when all CPUs are busy—and
> > determine the proper approach based on the data, which we
> > currently lack :-)

Right.  The scan/unmap can move very fast (a rabbit) while the
compressor can move rather slow (a tortoise.)  There is some
benefit in the fact that kswap does compression directly, I'd
presume.

Another thing to consider, perhaps, is that not every page is
necessarily required to go through the compressor queue and stay
there until the woken-up compressor finally picks it up just to
realize that the page is filled with 0xff (or any other pattern).
At least on the zram side such pages are not compressed and stored
as an 8-byte pattern in the zram meta table (w/o using any zsmalloc
memory.)

> > > If we have a pagefault and need to map a page that is still in
> > > the compression queue (not compressed and stored in zram yet, e.g.
> > > dut to scheduling latency + slow compression algorithm) then what
> > > happens?
> >
> > This is happening now even without the patch?  Right now we are
> > having 4 steps:
> > 1. add_to_swap: The folio is added to the swapcache.
> > 2. try_to_unmap: PTEs are converted to swap entries.
> > 3. pageout: The folio is written back.
> > 4. Swapcache is cleared.
> >
> > If a swap-in occurs between 2 and 4, doesn't that mean
> > we've already encountered the case where we hit
> > the swapcache for a folio undergoing compression?
> >
> > It seems we might have an opportunity to terminate
> > compression if the request is still in the queue and
> > compression hasn’t started for a folio yet? seems
> > quite difficult to do?
> 
> As Barry explained, these folios that are being compressed are in the
> swapcache. If a refault occurs during the compression process, its
> correctness is already guaranteed by the swap subsystem (similar to
> other asynchronous swap devices).

Right.  I just was thinking that now there is a wake_up between
scan/unmap and compress.  Not sure how much trouble this can make.

> Indeed, terminating a folio that is already in the queue waiting for
> compression is a challenging task. Will this require some modifications
> to the current architecture of swap subsystem?

Yeah, I'll leave it mm folks to decide :)

