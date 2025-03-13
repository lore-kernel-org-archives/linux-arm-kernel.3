Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C09C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 03:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dixt0o39GPmiD7R1LFsj4ci5HN2s7q23k30NE+Mi48k=; b=jrlt24K2r6lgO9YbnxnI5csdty
	GPtsumFPU3MboWXDeRf6KWzRIMgC3T+WeE3Bg+6vOy4jETns9iD7jHnN4nBJKp7covv2PALDw6Oan
	X/cPMZmIx22tCgm3QlWDKxNGImHiHZIiopLDYI5oIsQv13/8qCmxjRziGXVlm2Mublv/qRkoQuK6x
	uAzYFATj4iQJBVEReNMHRUpSWUGM6a8wc/V7nv/pT99rhoNI7DW1q1bCRua/t1DD/O9SgE9lM961/
	LwV4NSbnRWpuIhSZRn1I88ng/uSt24zzEMEYyIC6Z2CdGD+nhJZ8VTqwsxot4lZHi5dJ3pOz7yVIO
	3pvJOxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZeD-0000000A1kO-33TT;
	Thu, 13 Mar 2025 03:54:17 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZcZ-0000000A1aE-1yCQ;
	Thu, 13 Mar 2025 03:52:36 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so496167241.1;
        Wed, 12 Mar 2025 20:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741837954; x=1742442754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dixt0o39GPmiD7R1LFsj4ci5HN2s7q23k30NE+Mi48k=;
        b=LIXJ3qmz92e68GIYNMasFoTUkVeR3BGE5sKmQUltAjRwZLaEQ7YOUrizAp59eFzfiR
         x4bZxzFFt/fxnQs1mFJw7/Rrg0ZzZY2TC0u5F5l30AX7dwVXSSE1McNuQOOUrcyJadD+
         fwqP8bfqLHLsM42VpoLNbEb27mKoNKPfBZT5D4d4iii3r8RmE9sl42kp7P3mr0zHa6OM
         dFgZJ/dCsWeapq6ciCPtA3GhCu23gw1v5iYkrbnK10xQEjxHDs1xKD8fCg1Z7/GwR7Ou
         Usm0e12hXPSrfoTD6TAQiB8qGbtVvXTwHa5+fOrqfK/M/AapZmY7FcBVqyOF2s3cCobB
         3nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741837954; x=1742442754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dixt0o39GPmiD7R1LFsj4ci5HN2s7q23k30NE+Mi48k=;
        b=q+JdMLRSXOUWFZMyMYQOusb3dU7yfKAzwgJIiVcc61YyhE1QmtUaON4Mcp0uEkB7Nh
         63Wds7JhWAjQMARwEKBOuEfS3pCwgzkl6wXcPnh/Az/0NTzo4kd6WfjuSeEzL4tYelD4
         LW4pUeCcXMb6boNClyyVP/VqvX1QAdLvTZ5wwcBNpBDh5vlkmistvq6O3xIgAwYDo0fu
         eV3WLz5g1YBtsqx4lCX/4pDCNYt1JahUczFeDvSN+kG8Xb5nKZy4gnH+VUcWG7fv8Clw
         Ps8wf0mo9PHdhiDvcHH7fWYYuudqDSYKctWTfwyKjzTfvwsmrVSJUcxrucWNDigfBdcv
         w7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4nsfpB783qE5g9Vi3p/qPYR45bBy1m9AA+f/mQu/5wFFgNsmflI4eyFDOM9Sva6uiZnGT9s5/6J81AUUhaSY=@lists.infradead.org, AJvYcCXXCk+4JEvBvirLQaNUlwRwjgGqY1AW2UcMA8BelzF7cjDpnrocsyH9TFkjW7zUzxT8UXlyMrmoYGtOkBYazxr9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+NFMcM/nH7WDcD5kLwnMvjrRAclD3QbxYajIqGuFI8az6xT9Y
	MhjydVxzsMcrJqq20O0oGNILL/Y4S+ovkRkiHcJ1odYAMdm0IECWuGWqNKDa8w63Ms2HMF5CAnf
	P0g5ISYTjSHkJCT2NxsD+na5gasQ=
X-Gm-Gg: ASbGncuimNxpDFCjdaf+THWGF2XbjFWooh/CXHCjMKV8JK533kjutcdQ6hpqIVZELkZ
	49N7VG2nV3HWxd+hj5AIYTiSGUljacpYfREP+u5jnmMHuPyfV0p9aiwNiJK4tqlIVQ/JnC35WYz
	dPVP+1mLEBWDKpYJnp0QrouAvcjBWQ6UoQ+cmteQ==
X-Google-Smtp-Source: AGHT+IElZnLD1RtQvQ1Xa/HL9SBtcFTvUikPJzrreCJkAkwTjpXP1UpN4dl74wMUECd2sr+yNxTt2PDKxbQqviHf2Wo=
X-Received: by 2002:a05:6102:41a8:b0:4bb:c24b:b61a with SMTP id
 ada2fe7eead31-4c30a6d23e9mr19456122137.19.1741837954156; Wed, 12 Mar 2025
 20:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com> <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
In-Reply-To: <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 13 Mar 2025 16:52:22 +1300
X-Gm-Features: AQ5f1JrExyj5F0Vah_a1_rjhnAnivAK4d453p9csn5RazKNq_dZhJV200JGLGds
Message-ID: <CAGsJ_4yw17rLJPgS6CNXfXNVQnv2pf0PnLSA4UVAR1sUWDhP5Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
	Jens Axboe <axboe@kernel.dk>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Casper Li <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, 
	Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_205235_543351_7ADF4175 
X-CRM114-Status: GOOD (  21.52  )
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

On Thu, Mar 13, 2025 at 4:09=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (25/03/12 11:11), Minchan Kim wrote:
> > On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > > This patch series introduces a new mechanism called kcompressd to
> > > improve the efficiency of memory reclaiming in the operating system. =
The
> > > main goal is to separate the tasks of page scanning and page compress=
ion
> > > into distinct processes or threads, thereby reducing the load on the
> > > kswapd thread and enhancing overall system performance under high mem=
ory
> > > pressure conditions.
> > >
> > > Problem:
> > >  In the current system, the kswapd thread is responsible for both
> > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > >  combined responsibility can lead to significant performance bottlene=
cks,
> > >  especially under high memory pressure. The kswapd thread becomes a
> > >  single point of contention, causing delays in memory reclaiming and
> > >  overall system performance degradation.
> >
> > Isn't it general problem if backend for swap is slow(but synchronous)?
> > I think zram need to support asynchrnous IO(can do introduce multiple
> > threads to compress batched pages) and doesn't declare it's
> > synchrnous device for the case.
>
> The current conclusion is that kcompressd will sit above zram,
> because zram is not the only compressing swap backend we have.

also. it is not good to hack zram to be aware of if it is kswapd
, direct reclaim , proactive reclaim and block device with
mounted filesystem.

so i am thinking sth as below

page_io.c

if (sync_device or zswap_enabled())
   schedule swap_writepage to a separate per-node thread

btw,  ran the current patchset with one thread(not default 4)
on phones and saw 50%+ allocstall reduction. so the idea
looks like a good direction to go.

Thanks
Barry

