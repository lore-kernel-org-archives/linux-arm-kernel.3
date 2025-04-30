Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5DDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 22:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbpbINSrxfUumV9lwyjlqLA8g7akUpbSjiCjBJP9b4Q=; b=cFHDFKjhYwEccaAfIYnpuy1Nv5
	Uw7EpLy61ZBbyBrAD1pWD5dWCI9KK0ozGY9vszJvKcsnFA6kkAk+5g6SkqYnj0bROMN8c5ZLc+Tcc
	I5Efit0yidxb29l8J4qZ+49YJSOLP44J316j4J4Fwmcr7a7uCpxDipD6BY1JGr7ux1pi20p03gc5w
	KziLhwyb9chyWzm9SC+BA4m49s+vO6M/3bVGnI6huYpnfFOu8C0jIM9YULmPi6C4Gf36+qkip01iJ
	cyq00nDaB7TrCDGW3+iE1Qsi4cUayzam/c6pfwWLS3g2vZcmHZ0Zdn//DI+JzvsROF1xURjoGsodG
	QqCWMbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGHc-0000000ECHq-0N4S;
	Wed, 30 Apr 2025 22:52:04 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGFf-0000000EC2z-1FAS;
	Wed, 30 Apr 2025 22:50:04 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4c34dcdaf88so123200137.2;
        Wed, 30 Apr 2025 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746053401; x=1746658201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbpbINSrxfUumV9lwyjlqLA8g7akUpbSjiCjBJP9b4Q=;
        b=Ow8GEJgXR2Bu4RXZhOIkXvIITOyvQLPMreCc3JI0ONmOU6jY6R9lrgKDMvQvdrVav+
         JB4sUXQRMc1sjqWXPBjRjnFIKf4xmMpSXv7UyUi6SlaCXY1ZQnlZOn+2fHQUXSY0chak
         QY9Z9gqQSFoo51TOKzx92dknxKcNPe+iCci1gIIo3h+EtPgDdvm+XLX84marKqtOOWgm
         NMdyOkXLpVNFErN661eSWJxCSd90xisX+lZUAo6y70lHpUwFHxh6+WhIHxCERANC0JfE
         foRqZtoFDf90Y2BPCYO9XJ/HH2IjVPJ87G2EVYy9EjEXDjXN0rk5uqD3dGJA4HFcU9Pm
         pLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053401; x=1746658201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbpbINSrxfUumV9lwyjlqLA8g7akUpbSjiCjBJP9b4Q=;
        b=JTpvB+jQ+zQICS6iKYZwDequHe/b+PIY4hjtFYMenhkGpjcHqw6Q5RSAsud5jGqrdu
         Om4jCsFDt7h/8UaO15uQ+zcPP3iPAC8ZRdLN7WfLjkKLHrwz2bwnQxk4G4iQzmsZi4Lo
         +vyeD1gv4fQAgHmtVciSeVOojgfg2e3HOWQ5ubIFQa2vu4qWiuIab6GZit+Shng2sj00
         4cBaH6lnDUbR0jbpg5qLTklg6cKQwkP+7t/+AngQxDQ2IYmgqkOmXiTbNrUHGdW7Wwv6
         CUgiM0+hDUvN+IRo4mTY1KUN3RBeDe6lDgjl58VkexRWkVyqn/ZEk9/S/VZ8ocSKjwCV
         Jtpg==
X-Forwarded-Encrypted: i=1; AJvYcCVVRg/QPciOtJ/IPah8kBT8NotMiSgGpT+H4KUNSCLBG0okkFbekeghffxh+8kWYBF3pp5ZIXJCJjgnUhklkoln@lists.infradead.org, AJvYcCXW9+D1xJ4aVGZjiJau0D5gSnjZ849bmceq2cFZVK+aUQ0PIKGenbXSPEYIYKx7JHuoBUKby0+WmujYEKZXgWk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+NcW9gNeEka6PZeS7K59et7ODnp+NiiMGnj34SAZRYnOY3dct
	NLNnd2m+uIeJ6ZTnJN5ucln4xYHqBzkap7tRdn4KO0D2Wuzmlfv3CuvjUZ5RJtRisfUcp+m/Ete
	fWOxwG+px/bRQ2P3XoN7rRqlPt/I=
X-Gm-Gg: ASbGncsR9eVUiYQ4iqScdUcs4c5GIal4MtOuDlWb9zExfiywkHQRUGwSdMfrfvIIzyJ
	Br3X7f5lEyr7WW1Npp3X4KvxJOFJama74OinAyDjfm4xGkqSgGRmxlhEgt6kCiEOnQTvJ55cRAF
	bNygIZw/XLOr0wEPeIxeiAOOsxxiNAyBz7
X-Google-Smtp-Source: AGHT+IGzkaGVgrKTVWAg6uYcHiRtwbA0R/supqUwGLiy3GtgazMGGDJF+F5gy1Ww2dKzbjTsV1APhcaThlpXeBvRPg8=
X-Received: by 2002:a05:6102:3e8d:b0:4c4:e018:326f with SMTP id
 ada2fe7eead31-4dae53bb727mr916415137.10.1746053401317; Wed, 30 Apr 2025
 15:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com> <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org>
In-Reply-To: <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 1 May 2025 10:49:50 +1200
X-Gm-Features: ATxdqUGvtOD0hW5rJBr5f2DF6ZxtN6Be6JTfSzIEhz5_WOzsDzAADbdK5XApyCE
Message-ID: <CAGsJ_4wLuJNe9uPE3-fBNLdiCPBpKt4a1ytuf7-+oiS5rBrg_w@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nhat Pham <nphamcs@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_155003_341118_26A692C5 
X-CRM114-Status: GOOD (  25.24  )
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

On Thu, May 1, 2025 at 9:51=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 30 Apr 2025 16:26:41 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.com>=
 wrote:
>
> > This patch series introduces a new mechanism called kcompressd to
> > improve the efficiency of memory reclaiming in the operating system.
> >
> > Problem:
> >   In the current system, the kswapd thread is responsible for both scan=
ning
> >   the LRU pages and handling memory compression tasks (such as those
> >   involving ZSWAP/ZRAM, if enabled). This combined responsibility can l=
ead
> >   to significant performance bottlenecks, especially under high memory
> >   pressure. The kswapd thread becomes a single point of contention, cau=
sing
> >   delays in memory reclaiming and overall system performance degradatio=
n.
> >
> > Solution:
> >   Introduced kcompressd to handle asynchronous compression during memor=
y
> >   reclaim, improving efficiency by offloading compression tasks from
> >   kswapd. This allows kswapd to focus on its primary task of page recla=
im
> >   without being burdened by the additional overhead of compression.
> >
> > In our handheld devices, we found that applying this mechanism under hi=
gh
> > memory pressure scenarios can increase the rate of pgsteal_anon per sec=
ond
> > by over 260% compared to the situation with only kswapd. Additionally, =
we
> > observed a reduction of over 50% in page allocation stall occurrences,
> > further demonstrating the effectiveness of kcompressd in alleviating me=
mory
> > pressure and improving system responsiveness.
>
> It's a significant change and I'm thinking that broader performance
> testing across a broader range of machines is needed before we can
> confidently upstream such a change.

We ran the same test on our phones and saw the same results as Qun-Wei.
The async compression significantly reduces allocation stalls and improves
reclamation speed. However, I agree that broader testing is needed, and
we=E2=80=99ll also need the zswap team=E2=80=99s help with testing zswap ca=
ses.

>
> Also, it's presumably a small net loss on single-CPU machines (do these
> exist any more?).  Is it hard to disable this feature on such machines?

A net loss is possible, but kswapd can sometimes enter sleep contexts,
allowing the parallel kcompressd thread to continue compression.
This could actually be a win. But I agree that additional testing on
single-CPU machines may be necessary.

It could be disabled by the following if we discover any regression on
single-CPU machines?

if (num_online_cpus() =3D=3D 1)
     return false;

>
> >
> > +static bool swap_sched_async_compress(struct folio *folio)
> > +{
> > +     struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
> > +     int nid =3D numa_node_id();
> > +     pg_data_t *pgdat =3D NODE_DATA(nid);
> > +
> > +     if (unlikely(!pgdat->kcompressd))
> > +             return false;
> > +
> > +     if (!current_is_kswapd())
> > +             return false;
> > +
> > +     if (!folio_test_anon(folio))
> > +             return false;
>
> Are you sure the above three tests are really needed?

Currently, it runs as a per-node thread mainly to accelerate asynchronous
reclamation, which effectively reduces direct reclamation. Since direct
reclamation already follows the slow path, asynchronous compression offers
limited additional benefit in that context. Moreover, it's difficult
to determine
the optimal number of threads for direct reclamation, whereas the  compress=
ion
in the current direct reclamation allows it to utilize all CPUs.

The first condition checks whether kcompressd is present. The second
ensures that we're in kswapd asynchronous reclamation, not direct
reclamation. The third condition might be optimized or dropped, at least fo=
r
swap-backed shmem, and similar cases.

Thanks
Barry

