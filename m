Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB85EC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORq9jkRCIXj2zv20dBQ5aH6mM2s+q06FC9H+4PepyX8=; b=GILAI5NDrmrSnie2HWFRmfElsP
	KOLFNfZ7xplwvVrx4ubi4Xt+fNDvtlqOh3FUH75zuXVnoAHD6anG8AcZBW9IX0uPatkaWRyIkbPJn
	s9HjLGC3GbbsCtyhn9RSEPxzeSQ+jEZc2wiw17qyvhRoT39COyd/GIFhTrt7W4EY6lwHs2VF2skC6
	ymNC1WEwYxdurHK3R5GLInQLOb5hNKAekYIAcGdryqIbvB2BE/mDg9M9NoupF+zFFic+6y6Rjg4s9
	8UuWenGdWS9tm1Wq5rdqsBBIbjxEL87E6jJKQ5UURJWDGudgyrVbC50SbrE71Cx8R+/U3pK3kquTH
	6NGAUNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnktK-00000008pyX-1QDN;
	Thu, 27 Feb 2025 20:53:58 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkrk-00000008plR-23El;
	Thu, 27 Feb 2025 20:52:22 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5494bc4d796so385550e87.3;
        Thu, 27 Feb 2025 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740689538; x=1741294338; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ORq9jkRCIXj2zv20dBQ5aH6mM2s+q06FC9H+4PepyX8=;
        b=inMj4pYClzrKx54wz626bj6gKVqPSArmboFN8Uk00nl7iod+o/oIJPMaV90/OFhzcX
         MW8wdGMLF7qCHhchwoLcvXhTcCVtmhwyBccUwOrkmkfpWp4cdms5gTFtLGZjOK6V1XOa
         LZap8QkQjmnKJtX3z9F7LT5KVnqAoD8fVQNAjUcoBtDmuKJ51AShmu+AIavqvZ1zGNUs
         rB1hKLztx/eIuWfsvEogAxB/2S2CyxCf4/+4bRlRXq77LOTiiM/YRem4mlBSSPhIv95P
         5OujRVvQCQp7WgR2/p+ZE7AmW/0sL6BO8fKSk86kyABhURise1lhEu+8NyKhNLxtrmcr
         Wdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740689538; x=1741294338;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORq9jkRCIXj2zv20dBQ5aH6mM2s+q06FC9H+4PepyX8=;
        b=jjAvbZ/E8nG7lhoQjaXoFPzvTMR5BWAkL8QW0jfQ3kqJwRelUP7QBOOyltrRhZJjjQ
         3UEXYqpWxo6H8NwIZy81G2OHvipx4FGLihPCXAyQD8BmwU/78yFbqZkeB9WPETFrbmu9
         coLuNrQsj6XPbVVAJcJtr7SEL4+VrZZUmHjXJ6Sh9z37h0CjuUNJR5GFyCR3Lx0k+XWG
         H1f+5tCzoOEXepcj4VaTh+peYUwcrJNKFN7fbBQovyMzMvSoCfljZ7+qmf3BrMX10S/P
         YVUmdI4ZSYwbJTIEdzAL0D7wQsEGcN73vrtih130ERUN3Y4mkoBr29+n16v9DeGbApWm
         dFXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBmYf23gGJx7/bEL23+usyrwQixjfaSyW2lh9HtWm8vP1jPF+b9KcC0kBPRsaLBDEf6vBm04iJ+FvxWmlqPDs=@lists.infradead.org, AJvYcCWUzoBYPxd/HrTH6m8pS2dXTe2e7igCE/dwqxmM5kwXVvlzGKzOp7olQNCVnNT2uUWEV5NCo9Y9zn68LvIzD82c@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXC1VZ+jtt7wB5k2xvRby8BwGfllwNec5s71axK5vql49RGFG
	mb8JttqycbsK7zOU25lsiDbW9g7rYvPNiXgMQI61tIgRGRBVGCIhbHFHMlnu
X-Gm-Gg: ASbGncuh9uk2NZKSYnQDXt/+w79IQfHLZC/wYC0Wd0bEBobUVqv7xOllTvJqj4fzX1A
	XavvxJL+PN/EwwU8nErD519GpJN8FFPmZ0Ykih7otxBi1K9vH+4Dslk+Y8LQ6L43zRGRCqo/4Fd
	8p5sRCNV9TGo65Rpfu+gBYSTSK8E7klZjTXyv+J9JiD+JsBXhAWMouvsFsyhlQU2Hjf8DnRJn2U
	cUiED2Xb7QBPDRgQ+/tZgNflsPG5gHg+SrOYNfHgDFQuEoUuti2Jp8YnzqH1CVrR7bW0AFpXkVa
	3olVrkWgFegY
X-Google-Smtp-Source: AGHT+IGihLlnXop/m8uLi6YA+JiEFOKQNSYL2eLkoXrXYoArVJ7ew7FmuX17wQiiXQfECok7M8pYyw==
X-Received: by 2002:ac2:411a:0:b0:549:4e7f:24af with SMTP id 2adb3069b0e04-5494e7f274cmr57045e87.0.1740689537881;
        Thu, 27 Feb 2025 12:52:17 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494a149b07sm105767e87.157.2025.02.27.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:52:17 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Thu, 27 Feb 2025 23:46:44 +0300
In-reply-to: <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
Message-ID: <87ldtraz5v.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_125220_530108_74132D5C 
X-CRM114-Status: GOOD (  28.14  )
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

Hi Jacopo,

On 2025-02-27 at 18:05 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hi Mikhail
>
> On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
>>
>> Hi Laurent,
>>
>> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>>
>> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
>> >> video capture buffers. However, on some platforms, using non-coherent
>> >> buffers can improve performance, especially when CPU processing of
>> >> MMAP'ed video buffers is required.
>> >>
>> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
>> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
>> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
>> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
>> >
>> > What's the time taken by the cache management operations ?
>>
>> Sorry for the late reply, your question turned out a little more
>> interesting than I expected initially. :)
>>
>> When capturing using Yavta with MMAP buffers under the conditions mentioned
>> in the commit message, ftrace gives 437.6 +- 1.1 us for
>> dma_sync_sgtable_for_cpu and 409 +- 14 us for
>> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
>> buffers in this case is more CPU-efficient even when considering cache
>> management overhead.
>>
>> When trying to do the same measurements with libcamera, I failed. In a
>> typical libcamera use case when MMAP buffers are allocated from a
>> device, exported as dmabufs and then used for capture on the same device
>> with DMABUF memory type, cache management in kernel is skipped [1]
>> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
>> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>>
>> So it looks like to make this change really useful, the above issue of
>> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
>> solved. I'm not an expert in this area, so any advice is kindly welcome. :)
>
> It would be shame if we let this discussion drop dead.. cache
> management policies are relevant for performances, specifically for
> cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
>
>>
>> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
>
> I would like to know from Hans if the decision to disallow cache-hints
> for dmabuf importers is a design choice or is deeply rooted in other
> reasons I might be missing.
>
> I'm asking because the idea is for libcamera to act solely as dma-buf
> importer, the current alloc-export-then-import trick is an helper for
> applications to work around the absence of a system allocator.
>
> If the requirement to disable cache-hints for importers cannot be
> lifted, for libcamera it means we would not be able to use it.

Meanwhile, I have posted a patch, which re-enables cache management ops
for non-coherent dmabufs exported from dma-contig allocator [1]. It is
currently waiting for review.

[1] https://lore.kernel.org/all/20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com/

>
>> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>>
>> --
>> Best regards,
>> Mikhail Rudenko
>>


--
Best regards,
Mikhail Rudenko

