Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D304C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnoh24Dz4UQuumTV0v3UEOHMNb0aqFjMMibU0zsSBlc=; b=KpeiGGWjLMfW0lTMezM+n5X5wh
	QysArp+nozPyp8jcYpMkeRnoM8JjGwV4wXZ1Hj0tALzFDkHcQTKJZtwU+Qag+N69G1fwguzOmJcw9
	yfLuB3zCNQXVJz9nkGlF7VPyLUEXhhoGGPBW1fCs/8Ew+z51PhCmOl9zq5a8twh2GbHaYO3J7fFQP
	arAGN5zvPbUYWUAtTLU6NBeoHicUtlIEShRqbrMPiyrFYTuLr8rJxkU6ZiQ3O2XUSBTrHHkAIbvgy
	HmuFjCm4eYvjfLoxPbliRHmfxV3dUNC0qC9t8eAMaIpoVjr186L3fqja1pHMD9xbHf5cUmaP4ogFi
	9evUB9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkPI-000000098U5-3L2n;
	Tue, 14 Jan 2025 17:08:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkO2-000000098Dj-09nv;
	Tue, 14 Jan 2025 17:07:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54298ec925bso3431897e87.3;
        Tue, 14 Jan 2025 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736874447; x=1737479247; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Nnoh24Dz4UQuumTV0v3UEOHMNb0aqFjMMibU0zsSBlc=;
        b=TVJA7EWiRVvBtX6P9pqqV0hxWTWP/Xj43s1e98JKT7C/JDuUMtS6H3SndUmDUIs4op
         9+YxHkL/ZDpoUZ2Ltcc+pRCGzr92+XU1BdymjtqJ4T6b+dew9Dgif4LZBb040AqlSAXi
         HRC5iWl1bJhNr/2PHMJTEH9QqCOzz41dI8Zd3MTYEY0ufkxh3mnqPpiJOXi1Y2C8+foM
         Xg19IJC/0jEms8ArU0ga/EA770h+sfE9bpXgNP6sZKumVbmtn54qh0pcFdiAFpSpo7xm
         ZN7kfmUD5eK8Xg8K3DoCvAD8KKpFYoNp1mmbVJR375ZbNlujEQ/1U6gh/F4s90kTgYSB
         hexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736874447; x=1737479247;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnoh24Dz4UQuumTV0v3UEOHMNb0aqFjMMibU0zsSBlc=;
        b=vSsrNLc/T/OGntC29T1fTqIWDWUL2q5GuPTfH9homKA5PbdSD/gc34fyiIpT6XCKJC
         XGvClV+8TeRryvANiJTa7l0yFj937Thv8T2uckyUYiEnM3eM4EoKbGpNT0myD9EMlQ1K
         KJpqM67weTjJew5U0ucERdsmcVhgial1w/OtCK7B23EhbSR68BN4XJoee9v9Pclydj6T
         oU9a3bZ9LC52bY/ibO0cO66/OM5OfnRkzdlz/+eIFIydLrrGdCW3rIaywFwV3qW+PHt4
         XpGeK8TmkgYdgdWTRDX5OIvgtVfL7DG5ZYdhwFqFiGUgqNGL1PiFK3zRZLmwfVqFCHxq
         /gzA==
X-Forwarded-Encrypted: i=1; AJvYcCWq/OhZMb83xtAyTQgY1L/iVRB8CTj/yE573t5m34DfhP45lVikUEAG2oc1CZpfXVrA2S+YZa3FegUc6ZusEwI9@lists.infradead.org, AJvYcCXwc8V8WwrGMzdZNnVtwn9IOqDbQ3uZ4QRevic08SeL8BxbpXEhd8m0/j1h6YDrL1uKvF0cAVs1LiTsvI7kf6c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSSjzUm3sn6i5wo5xi8BWAbHJHgDngfjrdV+1jrM0wpqSGWgiq
	auZkzhWYULAs2cAaTxsAYTnrbQcK88A1OnP2aiv0QO4MhZSpEyPNtaRODY0NBuI=
X-Gm-Gg: ASbGnctrVL0YlcR6drVOGkdcjrlF4Q9E1/kKSNGrNtcPyucK8B98ZhxCLxnLZbo1o/v
	3BvdfJ/Oi0nQ01N+Lrs2SV7wPlcnPJEySLRLwqWvtCZgw+RGacoqwfUx6MuelSBoH2Yf4pfkCYJ
	SN7BvgmCyiwb5iX1aHex00GlHsAOJE15DxmCj8LE9bBswpHgt4tBJQhMs75VorZ++e2vm85zi1k
	CPEw/Vg9Cct7vOn+eGo6ECnYaV3ewQBiLDZRIvkqkIWs2taNkdvLIX3VcfYMwx/7/59531eL9iU
	ysqy60SeojxpVxJ6IErUmD5BCRGg9dj2pF593mJlfEBa
X-Google-Smtp-Source: AGHT+IHeaRN9PDguwxNaRUx8e7RlNc1zAJ+FhIwOOoRUyKrjzbduxhH7kD38+VAVbJRFlGbFeDbwlw==
X-Received: by 2002:a05:6512:3a83:b0:53e:362e:ed3 with SMTP id 2adb3069b0e04-542845aed9emr6667187e87.1.1736874447229;
        Tue, 14 Jan 2025 09:07:27 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec073esm1769027e87.194.2025.01.14.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:07:26 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Tue, 14 Jan 2025 19:00:39 +0300
In-reply-to: <20250103152326.GP554@pendragon.ideasonboard.com>
Message-ID: <87bjw9s4s3.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_090730_076521_9A0EEBD3 
X-CRM114-Status: GOOD (  15.22  )
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


Hi Laurent,

On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> Currently, the rkisp1 driver always uses coherent DMA allocations for
>> video capture buffers. However, on some platforms, using non-coherent
>> buffers can improve performance, especially when CPU processing of
>> MMAP'ed video buffers is required.
>>
>> For example, on the Rockchip RK3399 running at maximum CPU frequency,
>> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
>> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
>> non-coherent DMA allocation. CPU usage also decreases accordingly.
>
> What's the time taken by the cache management operations ?

Sorry for the late reply, your question turned out a little more
interesting than I expected initially. :)

When capturing using Yavta with MMAP buffers under the conditions mentioned
in the commit message, ftrace gives 437.6 +- 1.1 us for
dma_sync_sgtable_for_cpu and 409 +- 14 us for
dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
buffers in this case is more CPU-efficient even when considering cache
management overhead.

When trying to do the same measurements with libcamera, I failed. In a
typical libcamera use case when MMAP buffers are allocated from a
device, exported as dmabufs and then used for capture on the same device
with DMABUF memory type, cache management in kernel is skipped [1]
[2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
DMA_BUF_IOCTL_SYNC from userspace does not work either.

So it looks like to make this change really useful, the above issue of
cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
solved. I'm not an expert in this area, so any advice is kindly welcome. :)

[1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
[2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
[3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426

--
Best regards,
Mikhail Rudenko

