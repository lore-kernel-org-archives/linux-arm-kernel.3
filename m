Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C55CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b7SewZAz6UJbowyw2858+jipp4/HLFXQ/0LNBzaDtw=; b=g8MZAwM2kn9ZIS4PoRAITpVb6F
	mpJCHS06y9zk4fnAEj1g/D5tqgBIqSGSuitlJuNypHBw3tT8rqlhmugr2HQ7PbufIeC53MZhEuwpD
	w6cCcyGxxIvJ3nBItg8Kpk31R5LRD/uYeJk0KxNJe9ZyPtzx+iPaAUQb7kfsJErA3u94HCOaxOiBV
	mh6UkOXxQYHQc6Y79MUK9d+/0C/etXjirZdWFCQ9iwabsrNT9BG7VypzNJXUPwIbq9hWzyIloHydo
	5BpfZxki5m26sebRH86hm7rVwvi//mu/3tkpX2F8hYIFgoK+pa23y2+sV5dlfafRD+wvuKwEv6KmV
	yF1yGtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokca-0000000EEaa-17lG;
	Wed, 20 Aug 2025 15:21:04 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojNh-0000000DvOM-2XCC;
	Wed, 20 Aug 2025 14:01:38 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6188b5be5deso8560148a12.0;
        Wed, 20 Aug 2025 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755698496; x=1756303296; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1b7SewZAz6UJbowyw2858+jipp4/HLFXQ/0LNBzaDtw=;
        b=QYmAqYXnabTd9yEnwAa9iwpcnDjCZC10sPzptwBMh62xfnREPBQb41Cdq+lvG+9UVu
         mkF173aWcqHlOROJCJCqBjZ+vsX1ziGtIVJvTi/xtXGLmAd6fW58GAI+WZhJCKTJyrAq
         hPpk347ov7D11HqqFNHMysbGSmj3jI83WlNteA18s3QmakRzf50CRE4QMEcT6MNmP8vQ
         1n8OCb697Jm/8hoBjS1z57t6N9MY2nA6OuJK8XT4B+eE1BOcBSariSFMlimMV22H1OVk
         PR+UGyFIuFbyMXkHe/ZIPsxqrqW+CQJ52MWMEGS0sZvHbv71pqa+PPH5FCeOQud7L++q
         Orag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755698496; x=1756303296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1b7SewZAz6UJbowyw2858+jipp4/HLFXQ/0LNBzaDtw=;
        b=e/7/7sY0kUXvaJ1jcY2/2eaR/A9SWlJgjuHawkK/LkooNt816e/aSgpf/HPRa+w2py
         qgs03VnXRVoOKSz9EgdQFUCm7l77iYRVZtAWTfunA/Kzehn0m7y3FsiEP0O2jgiVfMjP
         xbgxlZGmhfe6qA5mGFHbbB3PnJyulTJ8mJJoMUg3BedtkwVoTrZZWUIyAiMR5pHbGuor
         vWrZUtjMw7WeyjZav5rvMYfRkyOL1LIM1B9KhXqJmJRvdhus3PSw/QuS8Il+SzlBoEgV
         Daib+SkNbrTHwgs1Fx75mrDwFfnBz78p8UiE4ba0gtrYGmwi5iEBBgg/ZG3tPzB2B80w
         i11w==
X-Forwarded-Encrypted: i=1; AJvYcCW31KgbitZHF0WjKmUSGXcLxqwI6cPsgsd14937FmKUd/fy28Fx8aZOW16S3/LLAGQ8DdEsbEpvHZq2JdzQ@lists.infradead.org, AJvYcCXzpllk5xbX/ilMCgOIeN+G1xEsx+OvruhrC/3OgO6jkuFaV2HM2a2iam1Zs3XTgKWBEfaPHvL0XnTcRhGj6atJ7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXOq0fC53wvQddcbi4L5dRYGYNVQ7RY1p4IXx0cVbU6L/BiyOd
	b2t25q+EgH73HbCAZK3wsdnOJUiRGhiG4LycFnSs3hk2E1FKXpCLtHtVKLBvVVr8cTHT/VdIfYr
	OgDIsu4+dHkyF4DkmeuDM/3GuO5875gz+Eg==
X-Gm-Gg: ASbGncsCFPuCBs8cBs75bL0A8nxDBxhcEI9m1d7BPFEq3YwzOX4P/um9Y7uvjNGQJ53
	I8LIepInaR2zFZockb8HWhpLKwLcontu0jr+TGC65EhSoDDXB46jHfYxHydPE5rvvWNqRohcgQD
	DK3Trm9SGRV1Q5dHwwI1ql5oZ3XD/uF7oGoPdO3QsrV7MAh5C5uFC7LLnqmtj1GCNeDMnmb7nn7
	hxquQ==
X-Google-Smtp-Source: AGHT+IG0mgYvT5kpudU6JBy79HoJor3+A1PLqYusQ7whieg5l9/kAstZ1IOiqt1ql+aYF7lyLGGYc4RTYbIiHCVo5p4=
X-Received: by 2002:a17:907:60d2:b0:ae3:6d27:5246 with SMTP id
 a640c23a62f3a-afdf0205351mr278895766b.48.1755698495409; Wed, 20 Aug 2025
 07:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-2-linux.amoon@gmail.com>
 <CANAwSgSzUW97U8MbWPdb_g4hqEpvLrVDGHG9Gjs2xALbDasqmg@mail.gmail.com>
In-Reply-To: <CANAwSgSzUW97U8MbWPdb_g4hqEpvLrVDGHG9Gjs2xALbDasqmg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 19:31:16 +0530
X-Gm-Features: Ac12FXyMcTdBuOxtvDWahcqoFUq85wpCJOj43vT1dhbjrrGJIqgkd2zIHaAMyYo
Message-ID: <CANAwSgT5RPNviXGfP9wdXoYMB220b=fd0mFbcANtWzSu+aPDQw@mail.gmail.com>
Subject: Re: [PATCHv1 1/5] arm64: dts: amlogic: Add cache information to the
 Amlogic GXBB and GXL SoC
To: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070137_644104_CA2A5394 
X-CRM114-Status: GOOD (  16.55  )
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

Hi Neil,

On Tue, 27 Feb 2024 at 18:33, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Neil,
>
> On Mon, 5 Feb 2024 at 22:50, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > As per S905 and S905X datasheet add missing cache information to
> > the Amlogic GXBB and GXL SoC.
> >
> > - Each Cortex-A53 core has 32KB of L1 instruction cache available and
> >         32KB of L1 data cache available.
> > - Along with 512KB Unified L2 cache.
> >
> > To improve system performance.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Datasheet
> > [0] https://dn.odroid.com/S905/DataSheet/S905_Public_Datasheet_V1.1.4.pdf
> > ---
>
> As per the Arm Cortex A53 TRM documentation
> [0] https://developer.arm.com/documentation/ddi0500/j/Introduction/Implementation-options?lang=en
>
> Since this SoC supports arm-pmu we could  read cache info using perf
> [1] https://www.baeldung.com/linux/analyze-cache-misses
>
> [alarm@archl-librecm ~]$ sudo perf list
>
> List of pre-defined events (to be used in -e or -M):
>
>   branch-instructions OR branches                    [Hardware event]
>   branch-misses                                      [Hardware event]
>   bus-cycles                                         [Hardware event]
>   cache-misses                                       [Hardware event]
>   cache-references                                   [Hardware event]
>   cpu-cycles OR cycles                               [Hardware event]
>   instructions                                       [Hardware event]
>   alignment-faults                                   [Software event]
>   bpf-output                                         [Software event]
>   cgroup-switches                                    [Software event]
>   context-switches OR cs                             [Software event]
>   cpu-clock                                          [Software event]
>   cpu-migrations OR migrations                       [Software event]
>   dummy                                              [Software event]
>   emulation-faults                                   [Software event]
>   major-faults                                       [Software event]
>   minor-faults                                       [Software event]
>   page-faults OR faults                              [Software event]
>   task-clock                                         [Software event]
>   duration_time                                      [Tool event]
>   user_time                                          [Tool event]
>   system_time                                        [Tool event]
>
> armv8_cortex_a53:
>   L1-dcache-loads OR armv8_cortex_a53/L1-dcache-loads/
>   L1-dcache-load-misses OR armv8_cortex_a53/L1-dcache-load-misses/
>   L1-dcache-prefetch-misses OR armv8_cortex_a53/L1-dcache-prefetch-misses/
>   L1-icache-loads OR armv8_cortex_a53/L1-icache-loads/
>   L1-icache-load-misses OR armv8_cortex_a53/L1-icache-load-misses/
>   dTLB-load-misses OR armv8_cortex_a53/dTLB-load-misses/
>   iTLB-load-misses OR armv8_cortex_a53/iTLB-load-misses/
>   branch-loads OR armv8_cortex_a53/branch-loads/
>   branch-load-misses OR armv8_cortex_a53/branch-load-misses/
>   node-loads OR armv8_cortex_a53/node-loads/
>   node-stores OR armv8_cortex_a53/node-stores/
>   br_immed_retired OR armv8_cortex_a53/br_immed_retired/[Kernel PMU event]
>   br_mis_pred OR armv8_cortex_a53/br_mis_pred/       [Kernel PMU event]
>   br_pred OR armv8_cortex_a53/br_pred/               [Kernel PMU event]
>   bus_access OR armv8_cortex_a53/bus_access/         [Kernel PMU event]
>   bus_cycles OR armv8_cortex_a53/bus_cycles/         [Kernel PMU event]
>   cid_write_retired OR armv8_cortex_a53/cid_write_retired/[Kernel PMU event]
>   cpu_cycles OR armv8_cortex_a53/cpu_cycles/         [Kernel PMU event]
>   exc_return OR armv8_cortex_a53/exc_return/         [Kernel PMU event]
>
> [alarm@archl-librecm ~]$ perf stat -B -e
> cache-references,cache-misses,cycles,instructions,branches,faults,migrations
> sleep 5
>
>  Performance counter stats for 'sleep 5':
>
>              52794      cache-references:u
>               2311      cache-misses:u                   #    4.38% of
> all cache refs
>             480343      cycles:u
>             140018      instructions:u                   #    0.29
> insn per cycle
>              15012      branches:u
>                 46      faults:u
>                  0      migrations:u
>
>        5.008073381 seconds time elapsed
>
>        0.000000000 seconds user
>        0.006952000 seconds sys
>
I just wanted to revisit this patch series with some updates on
Arm Cortex A53 TRM, here are the L1 and L2 Cache size details.

[1] https://developer.arm.com/documentation/ddi0500/j/Level-1-Memory-System/About-the-L1-memory-system?lang=en
[2] https://developer.arm.com/documentation/ddi0500/j/Level-2-Memory-System/About-the-L2-memory-system?lang=en
[3] https://boardor.com/blog/understanding-the-architecture-of-arm-cortex-a53-cache

Thanks
-Anand

