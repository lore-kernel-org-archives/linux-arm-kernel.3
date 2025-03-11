Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DBBC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 05:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8USPBO/MC/ax4XcIyiJLB9/BI0M0mqSA7MMjrt59Uto=; b=GvXbLWZeNt5CqnzIzqBi2+uyem
	M6lBNbisoXBBhVKhVWp4XoD2LAiOgCnpTRDcYy24FImfnOuzfxc1bVKpWYMnbTUx2ERqUkC7GAZMh
	FGDMak6toGm3Ux1claGSfQifEwEr7RN8TaOFMmGaLUh7KrHZYDldRE/EvfGqrwqvkwQLccXbNrQdU
	EKvQTvtpBz7fdwZXBUDArfpyBdhay+wxPsV2UQ0dCDg/iqpUgrEmeNyewoPIkv4za4YSzosdolYY/
	Vaf5aA1LTfFetta4p1IcY50wpqJCPWhS3GqwR4YJznNx5Z9kWXyoUjM7F2qGLu16oX0NE1VXJPFSI
	loSIahCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trrjO-00000004cPb-4B1m;
	Tue, 11 Mar 2025 05:00:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trrhK-00000004cEn-3Pn2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 04:58:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223a7065ff8so20983645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741669114; x=1742273914; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8USPBO/MC/ax4XcIyiJLB9/BI0M0mqSA7MMjrt59Uto=;
        b=lDy0O0RAaUZYGsXlvWTL8C0XyGqrVSTtHCU/QRUQmZDF3lubpIiOTbsnxy1T6DgM++
         Z2Z62GgY2I8JQr4pH1ZzKPAe05kKvub4LMicTL01lzZGme6uigQjNyDJYlHHpHMKBVLx
         IiB8Ra3gGTvQxGPgVQflAbvkQC1E5osNTd/eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741669114; x=1742273914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8USPBO/MC/ax4XcIyiJLB9/BI0M0mqSA7MMjrt59Uto=;
        b=xEft3U3+ETp+GBKf6dqtQGb/QtTbpIl6md/0S3XOGHo/iWJ3IL9qdAGgKUe50WQtbz
         pmuQ4EaOqmZU7SYVlb7r/Zb521KsT0FIzGcDlmoDgEPLQxFdFeYfhoD8hzr/Yk5KFHJT
         hvA81dcVwk/jqfQtlbb95g3xhexJ1VYsxemfnPbmL5F/OaA9e+qn3VVqSfIV1XfqJyQL
         qY0rx3SNx06HoUkpF5urRy7bx9dMfZMV94y107izHoglIYiSlPF8YwE/hshkXBGSw+/K
         1p0UYE9v9HSj0FvYkBihIeDFA2ptHly2D1NeAcffrx8Yls00ZRi/7Hna5iL1F+dMgKdv
         wQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ5xqNRw5YrgJzs4vwJGNsaK0MmW+JRcWpTHSgkkZp3jsPlLHNLfLEVu38bk5c9INV1OmSB+GGOu6QqBN66l8a@lists.infradead.org
X-Gm-Message-State: AOJu0YwlUSfLDAx5eiVxtXhSMQJQdLoVfTJKP1KlD6OXs94QyBPw7LaB
	1QEZXu1cOVq9i+UTwY3njlgG1q+e1uVROwsON7lx3wfZDRgTYRm1walW/utmIQ==
X-Gm-Gg: ASbGncvvB/orEPYJPpoVPNI5+iG4xrKfziB+rfMsW6dIuobQf3OsZLaVaWb2ze5CVzJ
	LmspErsPAKXQ4I02fbfBBQNzbVV1m+ggwCk5O2Uhm+hLYqjDNGro8gS56Anpkmkb86KL2iZlWpx
	MdFgAlKqsXE8iZmIMjceIlaLiZqZ/TAT7WPHIlZJXaexFSuzzcx08tPjhDvzWvNqvRJ7Y9VKKRi
	adVYOhJnhEGKxQeBLq8P7WvahGae5UwJstf2EyeatSodvUDA5m+JbkzCa5vSv5ZWM1b5Q88PS8p
	zRv9CuGIU5iogJXJWD8dfvgYLmqdi7muUdZYfjnpWOAaFVwhNALjKelFl6c=
X-Google-Smtp-Source: AGHT+IEy+/UJdnWSvGMFpDegWU6yxUJzFshmjVJEwVUQ1vPxzmyvb0Te8hk0DkXqfdh84yZ0kk8jEg==
X-Received: by 2002:a05:6a00:b84:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-736aaa00c36mr22819900b3a.14.1741669113611;
        Mon, 10 Mar 2025 21:58:33 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cce8:82e2:587d:db6a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287d9esm8542757a12.75.2025.03.10.21.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 21:58:33 -0700 (PDT)
Date: Tue, 11 Mar 2025 13:58:24 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Barry Song <21cnbao@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from
 kswapd
Message-ID: <dubgo2s3xafoitc2olyjqmkmroiowxbpbswefhdioaeupxoqs2@z3s4uuvojvyu>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
 <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_215834_882078_BF6EC8E7 
X-CRM114-Status: GOOD (  23.40  )
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

On (25/03/08 18:41), Barry Song wrote:
> On Sat, Mar 8, 2025 at 12:03 PM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > On Fri, Mar 7, 2025 at 4:02 AM Qun-Wei Lin <qun-wei.lin@mediatek.com> wrote:
> > >
> > > This patch series introduces a new mechanism called kcompressd to
> > > improve the efficiency of memory reclaiming in the operating system. The
> > > main goal is to separate the tasks of page scanning and page compression
> > > into distinct processes or threads, thereby reducing the load on the
> > > kswapd thread and enhancing overall system performance under high memory
> > > pressure conditions.
> >
> > Please excuse my ignorance, but from your cover letter I still don't
> > quite get what is the problem here? And how would decouple compression
> > and scanning help?
> 
> My understanding is as follows:
> 
> When kswapd attempts to reclaim M anonymous folios and N file folios,
> the process involves the following steps:
> 
> * t1: Time to scan and unmap anonymous folios
> * t2: Time to compress anonymous folios
> * t3: Time to reclaim file folios
> 
> Currently, these steps are executed sequentially, meaning the total time
> required to reclaim M + N folios is t1 + t2 + t3.
> 
> However, Qun-Wei's patch enables t1 + t3 and t2 to run in parallel,
> reducing the total time to max(t1 + t3, t2). This likely improves the
> reclamation speed, potentially reducing allocation stalls.

If compression kthread-s can run (have CPUs to be scheduled on).
This looks a bit like a bottleneck.  Is there anything that
guarantees forward progress?  Also, if compression kthreads
constantly preempt kswapd, then it might not be worth it to
have compression kthreads, I assume?

If we have a pagefault and need to map a page that is still in
the compression queue (not compressed and stored in zram yet, e.g.
dut to scheduling latency + slow compression algorithm) then what
happens?

