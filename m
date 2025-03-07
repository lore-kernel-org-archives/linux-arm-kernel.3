Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5387C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsLIF0KuSa0+9gIStTKUSkGySCuhFSqgeXthFQ3bTsE=; b=1bNM+mBGZRnGr6IRxHmE4EUHF/
	J9q6O6HyjW8PrxbJQP3CpT40R0nfGeFuVRdEw0ZbL+655v6S6HZB9GDbFbwftB/LceQriZIZl+4OZ
	Ffvt38AVi84adlfsZ2hkNhHgsjLDLaOZNvCatPn11Fz9CDJHdaN4QTMgWYVdlHodQd0mMSOZKRVvf
	4DeIHNoGOLFzxMRzH8GpCBdl4f17mDFgdn5vy4e+RMd9l8OdMp88gSOus5JoMeUkLqvTFQVtOu5U6
	Eo3Tgsu+1kL5vvznMWqEFF5lBpLiICxJJWfxpoT/8ZtSu2PGk56hMC57W6tDnPo1IhR3Rbx3pW572
	dS7D9BWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdUe-0000000FMuJ-3Aib;
	Fri, 07 Mar 2025 19:36:24 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdT1-0000000FMW0-0MGT;
	Fri, 07 Mar 2025 19:34:44 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso2070024e0c.3;
        Fri, 07 Mar 2025 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741376080; x=1741980880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsLIF0KuSa0+9gIStTKUSkGySCuhFSqgeXthFQ3bTsE=;
        b=Y1CbhGd2kkVywnDhASiw2ZwI13Xj4VojSDa0Xf8LYIwyU7CA01tMzvSazBm6valSuZ
         Jg+nYNKhnrL/xCOfVN1iIsYVQETr9gpd363f0W6qXCmN95fi7MFWeIqlOhDaUgnQ3z9m
         Ejv6nKmPWXuCi4eNhnDFQKTsIkoHNeXafkP/An+rqEqSy4tKpJaoC9Xyf+inQDvarREp
         1gc6Rae8bEvtOSumt8eopt1R1OQs4zlv22JCWPqQWF2T7Ks1Tb5Z3wG65NoCf1scem9z
         MYnes5J/1aHevjZ9pxPh7lmt0bBVyTFwz+fuz55buYrtUk6q5mB7bgetowp62iEHJ5R2
         A+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741376080; x=1741980880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsLIF0KuSa0+9gIStTKUSkGySCuhFSqgeXthFQ3bTsE=;
        b=dWc7lwkd89RNiXolP3HEwj8FV7w/Q8zWpFMazfKF3ynGFy7xBz4TF+HkFN5tW5qdtW
         6NXGDK8sqDyz4a0yUbm1gH1EMLxt3w9Pqt+UhOO7CDOEy3tS9SvIPBrlcGY0aZYi/2Do
         dOmjXdO6JWSdIDfevataO/ZK0Cj+FvNQKHeVEyc3p5mvEnc/a9abDbP1cAQxrtQT3qyU
         DdiLOF3HzMz0a3ZE0M4IMt0SthfN5FL1TqtbtnjiMl7tv72Po0f4+WB906BVxBf4Vf+/
         movgSrg/GE0rxflJNMxcz2jYosjZuLnXEizG5G+eUXaBLbUZTPvQ0nnILLcNL+/TVGVg
         VJXw==
X-Forwarded-Encrypted: i=1; AJvYcCXBaJ/oP0O4M/2+4d/ovgcNwa5qUguntzPTdtwPeMC7wdCT8CHA+hq8E5dor55STRedbF/sLmOMlLFd6lV7n1Y=@lists.infradead.org, AJvYcCXbygWtztukyaAvxNPW36Ljqvy7JFpDezGsPQgqwAWrOOswf0tUAhwL16sIx1WsGvf0lqq/SynNWR1F61PKiY8m@lists.infradead.org
X-Gm-Message-State: AOJu0YxVDwaR/v1fjuPHULjdxO8zD7lODvETG8UzfI9Rq/x73BbhQLfY
	p7hzmIsL0ePde3kGE9csHGNIz3wmB4XGX7wTZ6Ir4CGgS6Jj2vSQUGtP4T+7BKjsGdBjN3tkOEq
	pwbxSBQxWL9IU1T5Yj7LhMwOvOH2k/25cp1M=
X-Gm-Gg: ASbGncvQpURmpCiBzEGzZPCc4IODRqpJAP1J55Q1JyMtcV2VPHqK2qr7mUkadY04DGa
	HJJI0Z/xmq3VTjObDPL3tRhd7IWdATY0D6l2o6m6IDLJoj0t1c9Vh/TvcVD91tWVelfUEqf2jz8
	/FGMCSEp/+s+0uEwGDaexl2UA7uQ==
X-Google-Smtp-Source: AGHT+IFgqqDqQofofV/JVROxQO86oLW8odJwAWvtAGFI3OGLPlYXWCYP7AEGD+cKOelEyOiLNufTRKzO83KiF2eNeL0=
X-Received: by 2002:a05:6102:cd3:b0:4bb:e1c9:80b4 with SMTP id
 ada2fe7eead31-4c30a36790dmr4084956137.0.1741376069586; Fri, 07 Mar 2025
 11:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 8 Mar 2025 08:34:17 +1300
X-Gm-Features: AQ5f1JpJm8Pz4qzzGj-4qBmXe9E99kwhewd_E_rbXmfvrZ8eGN5IKtbpRd0ER-s
Message-ID: <CAGsJ_4z4yKRQiqMtGRr2bjvgVY6mmujdqyKyVgid=RUXr_9TbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
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
X-CRM114-CacheID: sfid-20250307_113443_126928_33CEE024 
X-CRM114-Status: GOOD (  24.64  )
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

On Sat, Mar 8, 2025 at 1:02=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.co=
m> wrote:
>
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system. The
> main goal is to separate the tasks of page scanning and page compression
> into distinct processes or threads, thereby reducing the load on the
> kswapd thread and enhancing overall system performance under high memory
> pressure conditions.
>
> Problem:
>  In the current system, the kswapd thread is responsible for both
>  scanning the LRU pages and compressing pages into the ZRAM. This
>  combined responsibility can lead to significant performance bottlenecks,
>  especially under high memory pressure. The kswapd thread becomes a
>  single point of contention, causing delays in memory reclaiming and
>  overall system performance degradation.
>
> Target:
>  The target of this invention is to improve the efficiency of memory
>  reclaiming. By separating the tasks of page scanning and page
>  compression into distinct processes or threads, the system can handle
>  memory pressure more effectively.

Sounds great. However, we also have a time window where folios under
writeback are kept, whereas previously, writeback was done synchronously
without your patch. This may temporarily increase memory usage until the
kept folios are re-scanned.

So, you=E2=80=99ve observed that folio_rotate_reclaimable() runs shortly wh=
ile the
async thread completes compression? Then the kept folios are shortly
re-scanned?

>
> Patch 1:
> - Introduces 2 new feature flags, BLK_FEAT_READ_SYNCHRONOUS and
>   SWP_READ_SYNCHRONOUS_IO.
>
> Patch 2:
> - Implemented the core functionality of Kcompressd and made necessary
>   modifications to the zram driver to support it.
>
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per secon=
d
> by over 260% compared to the situation with only kswapd.

Sounds really great.

What compression algorithm is being used? I assume that after switching to =
a
different compression algorithms, the benefits will change significantly. F=
or
example, Zstd might not show as much improvement.
How was the CPU usage ratio between page scan/unmap and compression
observed before applying this patch?

>
> Qun-Wei Lin (2):
>   mm: Split BLK_FEAT_SYNCHRONOUS and SWP_SYNCHRONOUS_IO into separate
>     read and write flags
>   kcompressd: Add Kcompressd for accelerated zram compression
>
>  drivers/block/brd.c             |   3 +-
>  drivers/block/zram/Kconfig      |  11 ++
>  drivers/block/zram/Makefile     |   3 +-
>  drivers/block/zram/kcompressd.c | 340 ++++++++++++++++++++++++++++++++
>  drivers/block/zram/kcompressd.h |  25 +++
>  drivers/block/zram/zram_drv.c   |  21 +-
>  drivers/nvdimm/btt.c            |   3 +-
>  drivers/nvdimm/pmem.c           |   5 +-
>  include/linux/blkdev.h          |  24 ++-
>  include/linux/swap.h            |  31 +--
>  mm/memory.c                     |   4 +-
>  mm/page_io.c                    |   6 +-
>  mm/swapfile.c                   |   7 +-
>  13 files changed, 446 insertions(+), 37 deletions(-)
>  create mode 100644 drivers/block/zram/kcompressd.c
>  create mode 100644 drivers/block/zram/kcompressd.h
>
> --
> 2.45.2
>

Thanks
Barry

