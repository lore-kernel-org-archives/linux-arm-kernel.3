Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11BAC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADIdlKa1fA4/imYaZXygiUs98rCXU1xydtVTW+Hgst4=; b=frUulP1oXZGSVU2XQDXsyqY21D
	2Vsmo7bQPlhQxRuZbebQxw3qtUS6McLgfkrhBbZrOpvEL0qauiqqqKV2HIB4JiqnT28fcLUhXAhgP
	lvxKgZ+XOYqfR3YBqlC7u0bUiRr0+ixLejiK2kd2Eh01JpayOMR9kOi8uVTGHgPzmtEhcSuDbBlxG
	xTrsLrk1h2ehZWR7cwRMacU+UuYCreHUv2hQF1/Syry9XnNabCTT185rLjeTLtxrTdcs1H9arNrKl
	KVIdyb2ejMiySTDJYqzycymrzn7qCeiQo16XtETJNPvQ7AN1pfxasp8QX2V0FVCPBfrrS/NmRnxfn
	fLxHvRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9b-0000000Byiy-0pS7;
	Thu, 13 Mar 2025 17:15:31 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslsr-0000000Btln-13mi;
	Thu, 13 Mar 2025 16:58:14 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso552814e0c.3;
        Thu, 13 Mar 2025 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741885092; x=1742489892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADIdlKa1fA4/imYaZXygiUs98rCXU1xydtVTW+Hgst4=;
        b=SlsCtCTR86pXY3sn8KBPMv4QJbaoT9Nz3tUDIWrVjnHOHRQhZcse8+eQiYucyeOXNh
         006X/Jhe5eCy35OMHb/mRF/t5nSoYixFY6UyUzfkvSIkWCPOr1/4ALWUEX+yqAvUc8ou
         8DQjV7wPhrQpcPHuhtPp74rVatGo0sMNFSKTqyGT4Y8H+hJzYB8ITZxV2zMjbo+9d7f1
         h8BzrVft5VlWqDpDaXCtj0dQhSRUPF9KMV5nh4i4sFoZVYmj+y6gaJ4v4Z1IMhsHqBpK
         DwOf/82LxskFl6oiMB4bUopJsH7XpvjMAHnjefAkN3zWT348AsGOVIDCTsZeS52qCMW+
         E/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885092; x=1742489892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADIdlKa1fA4/imYaZXygiUs98rCXU1xydtVTW+Hgst4=;
        b=DLBRUi5ytrqoyjafAhDupSEUzdLBQNq1oVlP+Tleamnfv24fJauvpTpKqy509qq6UP
         KXnehsfEbY91ToTkMy2bIXZPxbFDi4Zu2CbvH+XvmE7QGyHRaSXip+9JcrGKX+GrUK71
         5s/s02bPzf0s0yNJ7rSY/M+jAtdNa4Ktaq5T1yLNZRqQYRHkTcvwisMQjEU5hEexrtik
         d36lln0DMyiUVpQ38hKIbA1oubN6ovywmoXiICytnAixMYj1Lhiwe+zrxjoB5mL0Vq8y
         NlbozHloo9fcpPFxLfvKKxOLTz8RPlpFU97Y1YXEBW/B20kI63rOoGo1pngDlwSbAgK6
         fvWg==
X-Forwarded-Encrypted: i=1; AJvYcCUQoMpIQrv2bDe8oK2WjPhMOB0XaAn7jKR44Ig1t80zuyJmO+jIbpRFyhbajToUHhWrrE9Ufkx/Ia5mrqRfFRag@lists.infradead.org, AJvYcCVqlUp8ZOA+QjZYPqayqT94n1JRJPws0jOJPQvjOK/+oFNRW8ev3gqSL5H7vGDxCoi42A0/wKVhS8MjhGtEsGk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz6BNAjeGuM8pz34t6t5tLBPr/Mriv+0zbMIemdFZ7ygPpvWtC
	pmlY/2OqM8UyYyRb11VkNgOZ3cc2yEwAR9B62D2zXz7iglQ8v8JeQw2uKXIKBtj9FBhwMTg7Jte
	IxHNdwvLDqjQ6HfmevOokMMUNX8s=
X-Gm-Gg: ASbGnctZW6IKpvpntTbsF6kCrueqdij3jMy+m9y2G+hCLJFSCIiTCfjYwqM0NjgJcAK
	z1w1Oe+mfi4jfh2VI/Ebb/eLzDFpWod75jvuCyAXqpMCtolKiUBVrBBo6oNdNeo/L35OP8XgS76
	mLWlTjrztSwti4jBSjAR91U0ymtw==
X-Google-Smtp-Source: AGHT+IGqd4mPuYQMTlhSCpe62t8tLvAKCPyLobikqm+RE8kQK34379HRDecEtPPNH8Li/NEYmxYtyykiKOTPdHHJXWU=
X-Received: by 2002:a05:6122:2001:b0:51f:3eee:89f4 with SMTP id
 71dfb90a1353d-524462587bbmr1339574e0c.9.1741885091858; Thu, 13 Mar 2025
 09:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com> <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
 <CAGsJ_4xwnVxn1odj=j+z0VXm1DRUmnhugnwCH-coqBLJweDu9Q@mail.gmail.com> <Z9MCwXzYDRJoTiIr@google.com>
In-Reply-To: <Z9MCwXzYDRJoTiIr@google.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 14 Mar 2025 05:58:00 +1300
X-Gm-Features: AQ5f1JoQPpin_yzy1xmzTa5CZUM1Y8yc8ZWtftl1w5WEvizQdxmWfzWVnzMz6I0
Message-ID: <CAGsJ_4yaSx1vEiZdCouBveeH3D-bQDdvrhRpz=Kbvqn30Eh-nA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
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
X-CRM114-CacheID: sfid-20250313_095813_294288_B4E16F84 
X-CRM114-Status: GOOD (  36.29  )
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

On Fri, Mar 14, 2025 at 5:07=E2=80=AFAM Minchan Kim <minchan@kernel.org> wr=
ote:
>
> On Thu, Mar 13, 2025 at 04:45:54PM +1300, Barry Song wrote:
> > On Thu, Mar 13, 2025 at 4:09=E2=80=AFPM Sergey Senozhatsky
> > <senozhatsky@chromium.org> wrote:
> > >
> > > On (25/03/12 11:11), Minchan Kim wrote:
> > > > On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > > > > This patch series introduces a new mechanism called kcompressd to
> > > > > improve the efficiency of memory reclaiming in the operating syst=
em. The
> > > > > main goal is to separate the tasks of page scanning and page comp=
ression
> > > > > into distinct processes or threads, thereby reducing the load on =
the
> > > > > kswapd thread and enhancing overall system performance under high=
 memory
> > > > > pressure conditions.
> > > > >
> > > > > Problem:
> > > > >  In the current system, the kswapd thread is responsible for both
> > > > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > > > >  combined responsibility can lead to significant performance bott=
lenecks,
> > > > >  especially under high memory pressure. The kswapd thread becomes=
 a
> > > > >  single point of contention, causing delays in memory reclaiming =
and
> > > > >  overall system performance degradation.
> > > >
> > > > Isn't it general problem if backend for swap is slow(but synchronou=
s)?
> > > > I think zram need to support asynchrnous IO(can do introduce multip=
le
> > > > threads to compress batched pages) and doesn't declare it's
> > > > synchrnous device for the case.
> > >
> > > The current conclusion is that kcompressd will sit above zram,
> > > because zram is not the only compressing swap backend we have.
>
> Then, how handles the file IO case?

I didn't quite catch your question :-)

>
> >
> > also. it is not good to hack zram to be aware of if it is kswapd
> > , direct reclaim , proactive reclaim and block device with
> > mounted filesystem.
>
> Why shouldn't zram be aware of that instead of just introducing
> queues in the zram with multiple compression threads?
>

My view is the opposite of yours :-)

Integrating kswapd, direct reclaim, etc., into the zram driver
would violate layering principles. zram is purely a block device
driver, and how it is used should be handled separately. Callers have
greater flexibility to determine its usage, similar to how different
I/O models exist in user space.

Currently, Qun-Wei's patch checks whether the current thread is kswapd.
If it is, compression is performed asynchronously by threads;
otherwise, it is done in the current thread. In the future, we may
have additional reclaim threads, such as for damon or
madv_pageout, etc.

> >
> > so i am thinking sth as below
> >
> > page_io.c
> >
> > if (sync_device or zswap_enabled())
> >    schedule swap_writepage to a separate per-node thread
>
> I am not sure that's a good idea to mix a feature to solve different
> layers. That wouldn't be only swap problem. Such an parallelism under
> device  is common technique these days and it would help file IO cases.
>

zswap and zram share the same needs, and handling this in page_io
can benefit both through common code. It is up to the callers to decide
the I/O model.

I agree that "parallelism under the device" is a common technique,
but our case is different=E2=80=94the device achieves parallelism with
offload hardware, whereas we rely on CPUs, which can be scarce.
These threads may also preempt CPUs that are critically needed
by other non-compression tasks, and burst power consumption
can sometimes be difficult to control.

> Furthermore, it would open the chance for zram to try compress
> multiple pages at once.

We are already in this situation when multiple callers use zram simultaneou=
sly,
such as during direct reclaim or with a mounted filesystem.

Of course, this allows multiple pages to be compressed simultaneously,
even if the user is single-threaded. However, determining when to enable
these threads and whether they will be effective is challenging, as it
depends on system load. For example, Qun-Wei's patch chose not to use
threads for direct reclaim as, I guess,  it might be harmful.

Thanks
Barry

