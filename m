Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83213C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tzwEHLf8s85+zyGb/tLCAPn4b62D9uaY7uMidIF++E=; b=gnLmeaP6Ih/+cTV3/QGxkqv7wT
	2cGcJdDqsKt9QE0Nztcs6eYWcPxpmIw0H/MEeHyaEIQIlv/h3pfG5K9t/32pMzZH46V3vvtZ5sj8c
	cBy9YW8LE4fShQGb4Ur4ar+yLH83vHHoM4DkWTYt4rZsoE6D+0YdyEJ58CznEsdgrVQ4ZZwyO87w7
	xOFh/hgE6EjHllCR8vOedje8B+OuklwXEvW86gb7J3usrdrsBxqNQ3/f+bSECg5k8kohG4PWZdhmv
	SFASN9q/FPqNDI/3+lXoWfMpTWFn5zUo0d1xTiA4pWPi6LUbxVMqkCUi6274pV7uYQf/zhjg+97fp
	nu+MUnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Hz-0000000CcLP-2rzf;
	Wed, 15 Jan 2025 17:34:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Gc-0000000Cbze-2TeJ;
	Wed, 15 Jan 2025 17:33:23 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54021daa6cbso51564e87.0;
        Wed, 15 Jan 2025 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736962401; x=1737567201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tzwEHLf8s85+zyGb/tLCAPn4b62D9uaY7uMidIF++E=;
        b=LfAvVFcs36a+8f8BL7f4u2I8B3BwwrsX0WBWroJhooUm7kVcKOlXJZaKwB3KgEiEp9
         b6DleeGU665IGeA61OuiFNlNEOXd1mVIHY8NyvJK4ofpObfJQrxYqr8xIIlGXwKVXhCi
         uvaWm30EgqgoVWoRs3H040oko0g8+vrGFA63EwUaah5s5o+cj56UQl/TYKEgs91l4rUb
         HH9uYwncMbT86VszzcaviYmpMj/wekMXw7TPD4ESRlF5uvGtChnILDolkF64MyYRsKNg
         UX+Gtd4eg4RxJD8Au+NDfJZEp492DaRdGV9MyqfPHFZ6MZ4jNUnaiSGAys6VjoAnJAtg
         nv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962401; x=1737567201;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+tzwEHLf8s85+zyGb/tLCAPn4b62D9uaY7uMidIF++E=;
        b=Eo1XOQDQYHpcMJAruENGJ1wloY60wVA1XoVUeT/9qFRZ0nZDZBbY4AMo2dHEJIpk4H
         pID6ml78e+l0tIImwvf+40jeEiWrF1O+SpTCLAOG5jduyvB8E6Pl/Pls0M1imqVS+h1n
         vGObeaqGb16v5xzeNwsX5MJW0QK6hMOMqoWuw7VKzay0IW/OEoGKjI3dVlRhSxEYqGt/
         F4/NHDKV0ifOKHrA+ZjTxqa+CZ1HwN7ENkym8N2t6XUQRI5DdHR2wzvNeO7jj5PIHomn
         wpLc8qQilxvUwcr7M80VKZZ3VT8TuHy8cPS0Ght9dGojoT0fHBHkeQiocf2poRsig1Wz
         eHiw==
X-Forwarded-Encrypted: i=1; AJvYcCVod/r6apidEzlPvO9Mbu97Kp0h6KBRzmbAIxl0lC8UzggGHd6WL+xZUQST349MrayTQPdR8Sonrnqdek6bFH0=@lists.infradead.org, AJvYcCXyXlx879YAm5mUuAWuW0cX8uuZaY+D6HIG32lv3QraFPP3dnUZwRiMmFtgkmLJjn1e8X70S0jSz1RBTId9qwm5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2fanIuzfrVol4Oh/+TUuavU1vtbe0u0l5GJyZx+P8o+4F/89s
	mJQzCI+zgmwECHXO5D/1ssNY54cFTfImpEYIuQFhbSso1W9ae7xm
X-Gm-Gg: ASbGnctt0G8hfH/588IcL7p8En3EKKgHYL988UvTJZhsp7F2WxldeYlXf94ZcMuu4qM
	l0/C5rcS7enZBCARzLup3R6HOdRCw90Z28Xhqip8aPAVlkjvsx7y2+DhQLYa3FUCui9yE8vzFMt
	jiQ7KeYIypuTwkcNlakhlDG8E7cNx+6jaQnRI0b9HeSrP0jc7ajwDoXkmQ1HFrCBB5uytMw5gey
	ehjSo50HXiHKULvfGDLHtS8PODZxJWuA7WGgUwVMnW9Wu3zndc/i8gCyaoEv6cB6EWy0WSE3TNA
	zsFffYVzIadI4K9jp1b6zftgDtWvhv8MZB0FBVw8blAI
X-Google-Smtp-Source: AGHT+IHVuITnk6uWqJC7r+dQL/h3YFb1nzsnse5J2mvy5M+/MKpOzVH47aIYncz/G8LBHPMH6ccR4w==
X-Received: by 2002:a05:6512:2246:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-542845d35d9mr9465671e87.30.1736962400482;
        Wed, 15 Jan 2025 09:33:20 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becbc25sm2051761e87.259.2025.01.15.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:33:19 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
 <877c6wryqn.fsf@gmail.com>
 <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Wed, 15 Jan 2025 20:29:58 +0300
In-reply-to: <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
Message-ID: <87y0zcq8wy.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_093322_629867_383E88B5 
X-CRM114-Status: GOOD (  21.66  )
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


On 2025-01-15 at 23:46 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> On Wed, Jan 15, 2025 at 10:30=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gm=
ail.com> wrote:
>>
>> Hi Tomasz,
>>
>> On 2025-01-15 at 17:31 +09, Tomasz Figa <tfiga@chromium.org> wrote:
>>
>> > Hi Mikhail and Laurent,
>> >
>> > On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@=
gmail.com> wrote:
>> >>
>> >>
>> >> Hi Laurent,
>> >>
>> >> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideaso=
nboard.com> wrote:
>> >>
>> >> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> >> >> Currently, the rkisp1 driver always uses coherent DMA allocations =
for
>> >> >> video capture buffers. However, on some platforms, using non-coher=
ent
>> >> >> buffers can improve performance, especially when CPU processing of
>> >> >> MMAP'ed video buffers is required.
>> >> >>
>> >> >> For example, on the Rockchip RK3399 running at maximum CPU frequen=
cy,
>> >> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer t=
o a
>> >> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when us=
ing
>> >> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
>> >> >
>> >> > What's the time taken by the cache management operations ?
>> >>
>> >> Sorry for the late reply, your question turned out a little more
>> >> interesting than I expected initially. :)
>> >>
>> >> When capturing using Yavta with MMAP buffers under the conditions men=
tioned
>> >> in the commit message, ftrace gives 437.6 +- 1.1 us for
>> >> dma_sync_sgtable_for_cpu and 409 +- 14 us for
>> >> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
>> >> buffers in this case is more CPU-efficient even when considering cache
>> >> management overhead.
>> >>
>> >> When trying to do the same measurements with libcamera, I failed. In a
>> >> typical libcamera use case when MMAP buffers are allocated from a
>> >> device, exported as dmabufs and then used for capture on the same dev=
ice
>> >> with DMABUF memory type, cache management in kernel is skipped [1]
>> >> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
>> >> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>> >
>> > Oops, so I believe this is a bug. When an MMAP buffer is allocated in
>> > the non-coherent mode, those ops should perform proper cache
>> > maintenance.
>>
>> Thanks for pointing this out!
>>
>> > Let me send a patch to fix this in a couple of days unless someone
>> > does it earlier.
>>
>> Now that we know that this is a bug, not an API misuse from my side, I
>> can fix this myself and send a v2. Would this be okay for you?
>
> I'd be more than happy :)

Done, see [1]. A review would be appreciated. :)

[1] https://lore.kernel.org/all/20250115-b4-rkisp-noncoherent-v2-0-0853e1a2=
4012@gmail.com/


--
Best regards,
Mikhail Rudenko

