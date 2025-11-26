Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD2FD1036E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaB2KVWRNAbMaNATIpxj7yIi4zwUBMB8DFcAl65yplo=; b=FPEu8EaXfPcqzShvLAz/QYhyvX
	znbVBFyvb3kuonWz88hw/DSp8vH/tqKuzy+j0e9dLdDf4SHaNGcp2LiKJ/WAhMBqhe13a3P/Zv3uY
	MLQBOitjg1DdR9MWLr+5k/v0xhV15r6Wi12OiB8bltZh/DXS9HJMiVaAcnzzVKJhKCy/kHS/nhdJK
	3WsQPHXMzbqSXE/mtSSzOprwp07auCbdr7OuuhygUw5cPpikQfvdLqMjBi8ddSR0V32nyzYMOW4Tt
	nBYC7vlLDa/t6PsAld3YcckEJ4nPqMTeKw1txPMr+NZoQUvKXgjBwiGT5dpmOq5NtBs4YnN4JsnLH
	bsnCEptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8ee-0000000EPxz-2lKV;
	Wed, 26 Nov 2025 06:05:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8ed-0000000EPxl-17BQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 06:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OaB2KVWRNAbMaNATIpxj7yIi4zwUBMB8DFcAl65yplo=; b=g3z1saHojzUKKHETZd96MgcZyi
	YSPCyLce/iHEeyHXtJ/7xoDAE3L1YBnoI+Apj+uvBKAMKL7zLZW8EoYzc6VcPmyQyr7N50z6RiWbU
	IthZoA416PVcSvE2oQhmFkQ37ykHh5ouvS177kSo+yvh8uJBQQFzqDfLu5VpdxXPalYSQgsiyq/fN
	ciDpeuuKuu8H4Yapwf/oJdpLLPfe5nXYsQokNdtIzBV6Wfn3UupMOK6MbymzVjMeCUObGT/LCVNQe
	orBnsN5bepwM0BvaaIHfl4lfwTqL268/HhEpX/da/cS9Jj0PZEGssYpJdrBKnOlpcgrtWV/4k+yMn
	wzrxI4uQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7mb-00000007FUs-0Ggx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 05:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764137083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OaB2KVWRNAbMaNATIpxj7yIi4zwUBMB8DFcAl65yplo=;
	b=hdcMgqUlq0us/DVT39J4Ie7oxX8ImunuSgoGYUdn72qtgULfakBedhxy50JF81dLk8/JuH
	sVwVSV3SjpgtfHJxKf+XvNaSYVsm9WhisliAj7rKiMjzrXgxQKRsDOPnB37tLFpWAyBPab
	HhpyBsaiXOzNNF26bKld0sacUcOaQtE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764137091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OaB2KVWRNAbMaNATIpxj7yIi4zwUBMB8DFcAl65yplo=;
	b=aN9F0Jwj/77M1JiDQbp6mWlnsEugIjqX7BSxOTUKSXOXxgbbi9ezHSSEs24wAe4rII0bfP
	4T/N0wEPBeBkYEV878Wc7vwMBg52STUs7P9MnrLChtBaC/7gTZUYmM6JCtLZ/+GUtW7crw
	LFmR2sbuOrDRTm0j3Wqb58pXy1sSOyQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-8U7VpzxUPFSDF2l42a5JyQ-1; Wed, 26 Nov 2025 01:04:37 -0500
X-MC-Unique: 8U7VpzxUPFSDF2l42a5JyQ-1
X-Mimecast-MFC-AGG-ID: 8U7VpzxUPFSDF2l42a5JyQ_1764137076
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so6801542a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 22:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764137076; x=1764741876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaB2KVWRNAbMaNATIpxj7yIi4zwUBMB8DFcAl65yplo=;
        b=G4xqloRN2z7S2evS+50mA56EMqMz1Gyccu2kR/9GIcNvVDJ/2skC84e5BGqegrqP1R
         6EeJpS7kDvB/VNGYGUYaBYwxFhitEbZFMr9RiqE7QirZzuWKXluxBAhljFIG9rfmH2xR
         VKC0yOBepzAHDSJHb2VrONmb6Yen2ClyPP8xBtg/E1th1cD7uf1WXrE2+1Qtg0kHEi/Q
         UM9Kdhm15l1N+NjzZzQPodcQVXCBcnUQpitzNUzDvrinsBc69HbNg7gTIsbefp8VUuq8
         JW2ol2qPgGEZuvmjkXk/g4bv2ghFOrhjHLrHZou6dc+ix8n5THe5k07l9mij9x/qGaWf
         G3hA==
X-Forwarded-Encrypted: i=1; AJvYcCWEF3YvnWTvGsFXmmoCMZh+uauBo2hx6HeHWKHCH/m+6OvtRQbJOiv3G8ATsAxCXELvFEnHTYtn8QF21kzIdKzR@lists.infradead.org
X-Gm-Message-State: AOJu0YwFWnRi2ThKLEIo74PWOtQR+2SPLR3uzj6TOcHdf6EDIsg3KceP
	D5UdSeF4zvIyo7amOUWznyG4hZlpB9g23komgt1pBnEDqRME880G2xre/vhhea5nGHDN4V1Q24h
	uiZv5dGJPwsCd0rrVK9l6OSnmDGFrN4YSBVQC8HJreegnQn7GGwNP6CTuDRKNgvE98eGxdIkoUx
	cXz2qX8eITAlvla/3CEa/jQXneRvCDkg/M+9vVj/cRbsR/EDCpTIc=
X-Gm-Gg: ASbGncsY58xqy5zmVwuygqkgRAqyD6Yzg++l0N7SqBifFv0OYBQrSrHywELIJky0W1R
	M263hZnHYej32QdSnwU9ohtILJL6hZ1LPNfYHnKjYYBu9cLvjTvV/lkfBKqN2eR1/qy6U66HEYB
	ZK5QZsZkSq0EBn7nFIGkPHzggPFXclzAD3u00k2SjkwMLkLYgxatiBymhvpQSyG5Ezlvo=
X-Received: by 2002:a17:90b:3a81:b0:343:684c:f8ac with SMTP id 98e67ed59e1d1-34733e4c8fdmr16172935a91.8.1764137075882;
        Tue, 25 Nov 2025 22:04:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMgyGfGhHuIXlnMSRmydbJ73Umy+/ihi3Es7MfZVsIvdOL46Du5q/FBIP1Zh+sAGvjoTwtO6cxu9UWM/LPP4s=
X-Received: by 2002:a17:90b:3a81:b0:343:684c:f8ac with SMTP id
 98e67ed59e1d1-34733e4c8fdmr16172898a91.8.1764137075386; Tue, 25 Nov 2025
 22:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20251113005529.2494066-1-jon@nutanix.com> <CACGkMEtQZ3M-sERT2P8WV=82BuXCbBHeJX+zgxx+9X7OUTqi4g@mail.gmail.com>
 <E1226897-C6D1-439C-AB3B-012F8C4A72DF@nutanix.com> <CACGkMEuPK4=Tf3x-k0ZHY1rqL=2rg60-qdON8UJmQZTqpUryTQ@mail.gmail.com>
 <A0AFD371-1FA3-48F7-A259-6503A6F052E5@nutanix.com> <CACGkMEvD16y2rt+cXupZ-aEcPZ=nvU7+xYSYBkUj7tH=ER3f-A@mail.gmail.com>
 <121ABD73-9400-4657-997C-6AEA578864C5@nutanix.com>
In-Reply-To: <121ABD73-9400-4657-997C-6AEA578864C5@nutanix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 26 Nov 2025 14:04:21 +0800
X-Gm-Features: AWmQ_bmSzNmtLXzsLUvLhgWB8dvqy0Qa5CQPOMXfuQ7SoDSN1_7LIgv1Nc8s6u4
Message-ID: <CACGkMEtk7veKToaJO9rwo7UeJkN+reaoG9_XcPG-dKAho1dV+A@mail.gmail.com>
Subject: Re: [PATCH net-next] vhost: use "checked" versions of get_user() and put_user()
To: Jon Kohler <jon@nutanix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, Linus Walleij <linus.walleij@linaro.org>, 
	fustini@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CH9RNhQPYzDt7-f6fVcRjTrz5FapKnHQTCmPVlK73r0_1764137076
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_050940_872191_04972ECA 
X-CRM114-Status: GOOD (  36.47  )
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

On Wed, Nov 26, 2025 at 3:45=E2=80=AFAM Jon Kohler <jon@nutanix.com> wrote:
>
>
>
> > On Nov 19, 2025, at 8:57=E2=80=AFPM, Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Tue, Nov 18, 2025 at 1:35=E2=80=AFAM Jon Kohler <jon@nutanix.com> wr=
ote:
> >>
> >>
> >>> On Nov 16, 2025, at 11:32=E2=80=AFPM, Jason Wang <jasowang@redhat.com=
> wrote:
> >>>
> >>> On Fri, Nov 14, 2025 at 10:53=E2=80=AFPM Jon Kohler <jon@nutanix.com>=
 wrote:
> >>>>
> >>>>
> >>>>> On Nov 12, 2025, at 8:09=E2=80=AFPM, Jason Wang <jasowang@redhat.co=
m> wrote:
> >>>>>
> >>>>> On Thu, Nov 13, 2025 at 8:14=E2=80=AFAM Jon Kohler <jon@nutanix.com=
> wrote:
> >>>>>>
> >>>>>> vhost_get_user and vhost_put_user leverage __get_user and __put_us=
er,
> >>>>>> respectively, which were both added in 2016 by commit 6b1e6cc7855b
> >>>>>> ("vhost: new device IOTLB API").
> >>>>>
> >>>>> It has been used even before this commit.
> >>>>
> >>>> Ah, thanks for the pointer. I=E2=80=99d have to go dig to find its g=
enesis, but
> >>>> its more to say, this existed prior to the LFENCE commit.
> >>>>
> >>>>>
> >>>>>> In a heavy UDP transmit workload on a
> >>>>>> vhost-net backed tap device, these functions showed up as ~11.6% o=
f
> >>>>>> samples in a flamegraph of the underlying vhost worker thread.
> >>>>>>
> >>>>>> Quoting Linus from [1]:
> >>>>>>  Anyway, every single __get_user() call I looked at looked like
> >>>>>>  historical garbage. [...] End result: I get the feeling that we
> >>>>>>  should just do a global search-and-replace of the __get_user/
> >>>>>>  __put_user users, replace them with plain get_user/put_user inste=
ad,
> >>>>>>  and then fix up any fallout (eg the coco code).
> >>>>>>
> >>>>>> Switch to plain get_user/put_user in vhost, which results in a sli=
ght
> >>>>>> throughput speedup. get_user now about ~8.4% of samples in flamegr=
aph.
> >>>>>>
> >>>>>> Basic iperf3 test on a Intel 5416S CPU with Ubuntu 25.10 guest:
> >>>>>> TX: taskset -c 2 iperf3 -c <rx_ip> -t 60 -p 5200 -b 0 -u -i 5
> >>>>>> RX: taskset -c 2 iperf3 -s -p 5200 -D
> >>>>>> Before: 6.08 Gbits/sec
> >>>>>> After:  6.32 Gbits/sec
> >>>>>
> >>>>> I wonder if we need to test on archs like ARM.
> >>>>
> >>>> Are you thinking from a performance perspective? Or a correctness on=
e?
> >>>
> >>> Performance, I think the patch is correct.
> >>>
> >>> Thanks
> >>>
> >>
> >> Ok gotcha. If anyone has an ARM system stuffed in their
> >> front pocket and can give this a poke, I=E2=80=99d appreciate it, as
> >> I don=E2=80=99t have ready access to one personally.
> >>
> >> That said, I think this might end up in =E2=80=9Cwell, it is what it i=
s=E2=80=9D
> >> territory as Linus was alluding to, i.e. if performance dips on
> >> ARM for vhost, then thats a compelling point to optimize whatever
> >> ends up being the culprit for get/put user?
> >>
> >> Said another way, would ARM perf testing (or any other arch) be a
> >> blocker to taking this change?
> >
> > Not a must but at least we need to explain the implication for other
> > archs as the discussion you quoted are all for x86.
> >
> > Thanks
>
> I=E2=80=99ll admit my ARM muscle is weak, but here=E2=80=99s my best take=
 on this:
>
> Looking at arch/arm/include/asm/uaccess.h, the biggest thing that I
> noticed is the CONFIG_CPU_SPECTRE ifdef, which already remaps
> __get_user() to get_user(), so anyone running that in their kconfig
> will already practically have the behavior implemented by this patch
> by way of commit b1cd0a148063 ("ARM: spectre-v1: use get_user() for
> __get_user()=E2=80=9D).
>
> Same deal goes for __put_user() vs put_user by way of commit
> e3aa6243434f ("ARM: 8795/1: spectre-v1.1: use put_user() for __put_user()=
=E2=80=9D)
>
> Looking at arch/arm/mm/Kconfig, there are a variety of scenarios
> where CONFIG_CPU_SPECTRE will be enabled automagically. Looking at
> commit 252309adc81f ("ARM: Make CONFIG_CPU_V7 valid for 32bit ARMv8 imple=
mentations")
> it says that "ARMv8 is a superset of ARMv7", so I=E2=80=99d guess that ju=
st
> about everything ARM would include this by default?
>
> If so, that mean at least for a non-zero population of ARM=E2=80=99ers,
> they wouldn=E2=80=99t notice anything from this patch, yea?

Adding ARM maintainers for more thought.

Thanks

>
> Happy to learn otherwise if that read is incorrect!
>
> Thanks all,
> Jon


