Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679BAC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00K/huS9H/7mXu5HjFXMRisVEtgY4mqkAK2gH07p5mE=; b=euxsRcXDfC6wUOSUo74VEmgYpI
	LwZJXpnFEpNSsDhWDTfjjX5W7oExJIzZzaWwkO27KJYTmlZtDLUC9XuT8ZCd0+o9a5fA3CiwDkWjJ
	lzzmZl3Tn5xnrLCo+WX4nsPPlwJZV/jr1XQkXV4v3p/CmjZtkc8OHFB570eOzzWgPpAvJ9Al5n4YS
	UrSfZtBdE8KKYatul4/56DzJau/lYtnQ9B03Pu5eQzrni6BFm56Do97F4a7ED+nAByh0yVeLgpoPk
	XgjnmrHQXAZDOK7hb/PFf6QHkJ7ioz3VQCfHe6FWjJrnxotf+BDAgijmR65FmMAHzxei3Bo9lMSln
	u58Cft3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pnm-0000000G4r1-3ySn;
	Sat, 19 Sep 2026 07:48:02 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pnk-0000000G4qb-0wWT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 07:48:01 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso940895a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 00:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789804079; x=1790408879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00K/huS9H/7mXu5HjFXMRisVEtgY4mqkAK2gH07p5mE=;
        b=oqaCsLWN1sIEQRkGkhbXxwBS4crPouVMxX/lzCLZGTZZ4XSQhiYHsIU7ldi88iPhMS
         jmjffsqV+wr24NlkaLCDF7E0P/c76dmAx3Hns+8HzHi/x3/zt43ufKz6nlFIsQYJ5vhR
         dhJu0AYUlJKsilL/2MCc2BeXtvl0WgH0nhdbZHAwAdMOyuWLxgDQzSfLJYs9HHE4ZIYE
         Gh2q4PAKoDriPx4VdgRhrGFBADh8p/PaZIARSWY7NHG1fDa+PofbdYBWD+mwq5yMdUZ5
         ybSYgms7LM6fM2rlxl0Be+OjyxR/n1E8f0A6UWEJNTuNzdI7omef7ZB0nJAz4weOMw7I
         wLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789804079; x=1790408879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00K/huS9H/7mXu5HjFXMRisVEtgY4mqkAK2gH07p5mE=;
        b=QHHcAWDY5GgwV7W5XAs78W40T26niuRnvSmsNHBV+ZwvaH//2XF4xd17qmxYxdMTHS
         DlOLGN6WgXCODn6FInMZtPhcyZd73rh7Q1oqenOk4dRtAjpkOUX0tf7F4MaxHDLnXMFG
         TBb4Fh+JjDq+xpL4LNTOLXa+V4yXe8BGnAhWblpxS7JF8Pankq+pCtGvftqQMJoCEVGe
         9NITXlAW4iPxsZ13FboWDaW7F/SjDh7i4OvSZ48n8Sb/TEFEKrwXdslTa+Nc0h1C15da
         q65xvwoMqzzRcCb98c4kIGsFZWxDa25z1NtTed+elGOMZZYWsZSkpUWoOcwobhmKwQ/9
         ncow==
X-Forwarded-Encrypted: i=1; AKwUvBxRilB3v58RqT97dpPnr/pCRv1wRzIt7ZidUaLeGn9DwC7c227FkERsa/FyzJ/c7vQ29msPCDfSLfpw2Fn6hGc4@lists.infradead.org
X-Gm-Message-State: AFuF++kpGrctQpaX867dTlD/Y0eYYuq3oi34FqXvtYu+P/R6aztnqNMG
	whOtNvuHdixJzPeq6p7hnL4QpixhYABVwOM+NHoqCLa2zqwutJ0/BL2b
X-Gm-Gg: AYBFou1qpX3yBuo+0SKUNt8l4dL8MjJrRTvPjqI6CWhmbERcwZpPM/F1hEAfB+iKM8f
	CkOHj+jhlVlO+ZXTv+h4viWIfh/jTy94aZMJdm0tQoM0+AmIcDM9dLXGU91Yx9fO8seHZ3m9G5c
	p28pAGUAyEF0sJU+sa6vofFIGPwfcHHYZNWUUdvm8M1RTAC3Aouo5NZAQShZjC6x1p7tCF2l6ON
	f7QdODvIihi2VAXxjHDuz2jqwzbyhZq+8eHLyXOBroGjBkpKRWBkT6cm7b4jzCU7q0kNT+LyDfJ
	7q2Tq5kMkjpY2omft6kD0ArAm9zsxRyCkIBj426mxp35YI9YAvYNqZQ45rYQmogs7NWlHuvVew6
	XlNE0T198JVi4gp6SQ3IorIpPEkQfzEf1PHlY+NML4+ajg11s8nA0EKxUUjvSIzYcobKJhPr32E
	Y32khIkrTljgHdzYpckFr7uIZiV+v3jLw83OWQc0EG9s04nvRz9dBaknduXM6l2iGGqOzj2EzjU
	I5Q3g==
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr8952630a91.14.1789804078603;
        Sat, 19 Sep 2026 00:47:58 -0700 (PDT)
Received: from ai-agent-sv-01.. ([43.135.169.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm2145720c88.5.2026.09.19.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:47:57 -0700 (PDT)
From: Min Chen <chenmin83@gmail.com>
X-Google-Original-From: Min Chen <min.chen@siengine.com>
To: leo.yan@arm.com
Cc: alexander.shishkin@linux.intel.com,
	chenmin83@gmail.com,
	coresight@lists.linaro.org,
	james.clark@linaro.org,
	jie.gan@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mike.leach@linaro.org,
	min.chen@siengine.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the device
Date: Sat, 19 Sep 2026 15:47:11 +0800
Message-ID: <20260919074711.2070881-1-min.chen@siengine.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916141113.GI200420@e132581.arm.com>
References: <20260916141113.GI200420@e132581.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_004800_266247_EA25D393 
X-CRM114-Status: GOOD (  29.60  )
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

From: Min Chen <chenmin83@gmail.com>

Hi Leo,

> Good catch! I'm curious how you observed the dirty cache lines
> overwriting trace data in DDR and causing corruption.

The story is straightforward, I was testing the newly implemented CoreSight
source driver of AD1000 NPU subsystem and in the captured trace data the
starting part of a couple of MBs cannot be extracted by following the ARC
Trace spec.

Then parse the malformed data:
  Leading region - all-zero formatter frames, nothing else (first non-zero
  byte is at 0x180):

  00000000: 0000 0000 0000 0000 0000 0000 0000 0000
  00000010: 0000 0000 0000 0000 0000 0000 0000 0000
  00000020: 0000 0000 0000 0000 0000 0000 0000 0000
  00000030: 0000 0000 0000 0000 0000 0000 0000 0000

  zero frames interleaved into the fill; 5 of the 8 frames
  here are zero, then the fill resumes at 0x40080:

  00040030: 0000 0000 0000 0000 0000 0000 0000 0000
  00040040: 0000 0000 0000 0000 0000 0000 0000 0000
  00040050: 0000 0000 0000 0000 0000 0000 0000 0000
  00040060: 0000 0000 0000 0000 0000 0000 0000 0000
  00040070: 0000 0000 0000 0000 0000 0000 0000 0000
  00040080: feff fe36 f0ce c036 f0ce c036 f0ce c003
  00040090: 54ff feff 36f0 cec0 36f0 cec0 36f0 ce00
  000400a0: c054 fefe fe36 f0ce c036 f0ce c036 f006

  The same area in the unwrapped ATDATA stream (offset 0x40000), where
  the zeros appear as 60-byte runs bounded by truncated fill words
   - 36 f0 ce 00 on entry, 00 c0 54 ff fe ff on exit:

  0003fff0: 36f0 cec0 54ff feff 36f0 cec0 36f0 cec0
  00040000: 36f0 cec0 54ff feff ffff ffff 36f0 cec0
  00040010: 36f0 cec0 36f0 cec0 54ff feff 36f0 ce00
  00040020: 0000 0000 0000 0000 0000 0000 0000 0000
  ...
  00040050: 0000 0000 0000 00c0 54ff feff 36f0 cec0
  00040060: 36f0 cec0 36f0 cec0 54ff feff 36f0 cec0
  00040080: 36f0 cec0 54ff feff ffff ffff 36f0 cec0

  Note the quantization: every zero run in the plateau is a multiple
  of 60 ATDATA bytes (60, 120, 180, 240, ... - 6,251 runs at 60 B, 1,467 at
  120 B, decaying), i.e. 4, 8, 12 all-zero formatter frames, minimum 4.
  There is no run shorter than 4 frames and no other non-fill content
  between them.

The non-zero data is not random corruption, most of them are decodable as
ARC Trace message. And a further experiment confirms that the error mode is
overwritting not inserting, where the zeros are removed and trying to decode
the remaining stream still reports errors.

The next step is trying to figure out how the overwriting happens by writing
a fixed pattern 0x5a5aa5a5 to the ETR flat buffer before enabling it, and a
call to dma_sync_single_for_device() is added to make sure the patterns
are flushed to memory.

Then the issue cannot be reproduced any more, it is detected a cache sync
problem (dma_sync_single_for_device fixed the issue) without too much effect
since the debug change is small.

> > Agree, without the sync, the dirty data may overwrites the trace data.

> I don't think __tmc_etr_enable_hw() is the best place for the sync, as
> it can be called frequently when an event is enabled, e.g. when a task
> is scheduled in or migrated between CPUs. We should be able to sync
> once after dma_alloc_noncoherent() instead.

Agree, perform the sync just after the buffer/page allocation is reasonable
and this is what ETR_SG and CATU paths already do.

> The issue is not limited to buffer init. The driver also injects barrier
> packets into the bounce buffer, which can race with the sink. Even
> worse, the barrier packet write may collide with trace data when they
> share a cache line.

I think the timing of the barrier packet writing need further confirmation.
Is it only written to the buffer when the ETR is disabled?

> I think we should consider writing barrier packets directly into the
> AUX buffer. This would avoid stale cache data from barrier packet writes
> and simplify the flow without additional sync operations.

The AUX buffer only covers Perf path, and what I used is the
sysfs path:
  echo 0x10000000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
  echo 1          > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  echo 1          > /sys/bus/coresight/devices/arct0/enable_source
  # Run the workload here
  echo 0          > /sys/bus/coresight/devices/arct0/enable_source
  echo 0          > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  cat /dev/tmc_etr0 > arc-trace.bin

Need a solution for both paths.

> Would you mind if I pick up this patch (keeping you as the author) and
> add a second patch to address the barrier packet issue? That part may
> need some several rounds refactoring so can have better shape, I think
> it would be easier to consolidate the fixes on my side.

Please go ahead.

> Thanks,
> Leo

> P.s. Please CC me on future CoreSight patches. If you're using the
> mainline ./scripts/get_maintainer.pl, it should add me automatically.
> I didn't receive this patch directly, which is why I'm replying to
> Jie's email (also thanks Jie's review).

It's my fault, I did not get the list from the latest trunk.

