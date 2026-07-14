Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkwP5nYboJKLZttgwm6FIm5eYW0GGZtVCMUIDOwO6xA=; b=HNiFc51/izUBgc3Tqcw5ZKVhNH
	rUuzjrTu/8GU5aXDxJHY8ppPnouIgmsaYT2wbggQ4xfNsOic78LdOGcMOopANLCXzCTbcSVeci2Ej
	0enGN6QpieqSLJiJfT45BkTNzTVMJd7jX3hM+PEbRcp6qPr75xNdyxqbdibrsdpoFe+2CNj8oDDsK
	Lw+qnv9oxZ9x35t8xt3PIOTyxcdI21vXKf6IIAh8sE9ZrW1vPi5CJapjPCsTmZkiLitprOlYgzw70
	dZBvzhlpB5aLYPG5M1VNx/gVsqRzQ1oDe60jVD5W82IvliNneq508dFTE9lM2NxpSwoJsSKFJj8Da
	6ed3Y8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWpX-0000000B4iE-2IvW;
	Tue, 14 Jul 2026 06:41:23 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWpV-0000000B4h6-0RDa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:41:22 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784011275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkwP5nYboJKLZttgwm6FIm5eYW0GGZtVCMUIDOwO6xA=;
	b=rBDobzERfqXt13rpR2Ehjlzpy/zktyZ+Mb6QOJQDJBtt6ms9AYnO7aIshqLDqT5J+NwgWC
	3qPNcYTTHDQEy0pCcCO5nzsv+JlejATb8F+VXwXE6EsEITMDWbGISMOPDzwbCjAfLYSowR
	R7wHhb82rl9HP//fF83TguXApJ1SsFQ=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HXZiHcwYR8Hcoje4c9HZBNSCmQcG-3y2f6AhJksYQRvhg@mail.gmail.com>
Date: Tue, 14 Jul 2026 14:40:24 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD3A6158-5794-49AF-A7F7-677F748D30D8@linux.dev>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev>
 <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
 <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev>
 <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
 <F2693104-180B-44CF-9F3D-CBDE26151EA3@linux.dev>
 <CADrL8HXZiHcwYR8Hcoje4c9HZBNSCmQcG-3y2f6AhJksYQRvhg@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_234121_287803_CE2BBC4C 
X-CRM114-Status: GOOD (  39.40  )
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



> On Jul 13, 2026, at 12:09, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Thu, Jul 9, 2026 at 8:41=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>> On Jul 10, 2026, at 03:04, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> On Thu, Jul 9, 2026 at 2:55=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>>> On Jul 9, 2026, at 00:49, James Houghton <jthoughton@google.com> =
wrote:
>>>>>=20
>>>>> On Wed, Jul 8, 2026 at 1:41=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>>>> Do you mean that the support for AF might vary across different =
CPUs?
>>>>>> I'm not that familiar with arm64, so it seems a bit strange to me =
that
>>>>>> such basic hardware features can differ so much from one CPU to =
another.
>>>>>=20
>>>>> Yes, hardware updates of the Access Flag is a per-CPU feature. It =
is
>>>>> available for a CPU to use if TCR_EL1.HA is set. TCR_EL1 is a =
system
>>>>> register; each CPU has its own. (Linux will always enable HW AF =
for a
>>>>> CPU when it is onlined[1] if support is advertised, so we simply =
need
>>>>> to check if support is advertised to know that it is in fact =
enabled.)
>>>>>=20
>>>>> These days it is not uncommon for a system to have two (or more?)
>>>>> different core implementations, like with "fast" cores and =
"efficient"
>>>>> cores.
>>>>>=20
>>>>> [1] See the CONFIG_ARM64_HW_AFDBM bits in arch/arm64/mm/proc.S
>>>>=20
>>>> Thanks for your detailed explanation. When enabling HVO via the =
cmdline,
>>>> can we simply prevent CPUs that do not support AF from coming =
online?
>>>> Would implementing it this way be much simpler? In practice, =
developers
>>>> definitely know whether the current system is suitable for enabling =
HVO.
>>>> If some CPUs do not support AF, they would just need to evaluate =
the
>>>> trade-off between memory savings and having fewer online CPUs than =
expected.
>>>>=20
>>>> For scenarios where HVO is enabled via sysctl, we simply need to =
check
>>>> if all CPUs support AF. If any do not, the system should return an =
error.
>>>>=20
>>>> Then, we can proceed with the Pre-HVO.
>>>=20
>>> I don't think it makes sense to try to implement pre-HVO.
>>>=20
>>> We cannot do HVO if any boot CPUs do not support HW AF, as HW AF =
will
>>> be required to free the HugeTLB pages later, which we should =
continue
>>> to support. Pre-HVO (today anyway) happens before all boot CPUs are
>>> onlined. IMO it is not okay to prevent boot CPUs from onlining.
>>=20
>> When the boot CPU starts, it first checks if the hardware (the =
current
>> boot CPU) supports AF (The selection of the Boot CPU is critical here
>> If the user really wants to enable HVO). If AF is supported and HVO =
is
>> enabled via cmdline, we perform a Pre-HVO. Subsequently, any CPUs =
that
>> do not support AF will be prevented from coming online.
>=20
> I understand. I don't think we should do this. I think it's much
> better to always be able to start all boot CPUs[1] and simply rely on
> "normal" HVO.
>=20
> [1] Just to be clear on terminology, I'm using "boot CPUs" to refer to
> all CPUs that are onlined at boot-time, not just to *the* boot CPU
> that starts the kernel.

Thanks for the clarification. We previously had different understandings
of the boot CPU, but that should be resolved now.

>=20
>>=20
>> If the boot CPU does not support AF, enabling HVO is not =
permitted=E2=80=94neither
>> via cmdline nor sysctl. All CPUs are allowed to be online.
>>=20
>> Once the system has started, there is only one way to enable HVO, and
>> that is through sysctl. 1) If the current system includes any CPUs =
that do
>> not support AF, enabling HVO is not permitted (unless the user =
chooses to
>> take these CPUs that don't support AF offline). 2) If all online CPUs =
in the
>> current system support AF, then HVO can be enabled. In this case, the
>> system must also block any CPUs that do not support AF from coming =
online
>> in the future.
>=20
> An approach similar to this is implemented in this series: if there
> are (or were) any HVOed folios, onlining a CPU without HW AF is not
> allowed. If HW AF is not supported by any onlined CPU, HVO cannot
> proceed (though it will appear to be enabled).
>=20
> I probably should have integrated
> `arch_hugetlb_vmemmap_optimization_supported()` and a `hvo_status`
> check into the sysctl handler for HVO. I'll do this if it is still
> relevant in v2.
>=20
>> Of course, if a user specifically wants those CPUs to be
>> allowed to come online, they can choose to disable HVO first (At the =
same time,
>> this means that the HVO-optimized HugeTLB must be freed first as =
well).
>=20
> I could make it so that, if there are no HVOed pages anymore, onlining
> incompatible CPUs becomes permitted again. I don't really see the need
> to do this.
>=20
>> My proposal assumes that even though the system supports different =
types of
>> CPUs, their support for AF (I suppose this is a very basic feature =
nowadays)
>> is generally the same. I believe that for servers (Only servers stand =
to
>> benefit more from HVO), there shouldn't be a mix of those that =
support AF
>> and those that don't. At the very least, such a situation would be =
extremely
>> uncommon. I believe this may be acceptable. That said, if we go this =
route,
>> is there a way to simplify the code implementation even further?. Of =
course,
>> this is just my personal speculation. Please let me know if I've =
missed
>> anything.
>=20
> I agree that systems where HVO is relevant are very unlikely to have
> mixed support for HW AF.
>=20
> I don't think the approach you're suggesting in this email (as I've
> understood it) simplifies this series.
>=20
> I don't want to mess with the arm64 cpufeature bits more than I've
> done here; preventing boot CPUs from onlining will certainly be more
> work. :) And then your other suggestions seem to be quite similar to
> what is already in these patches.
>=20
> I am happy to get rid of the "disable HVO if it is unused and a CPU
> without support is onlined" part though and replace it with something
> similar (the simplification from the other thread[2]).

Thanks for the explanation! My main goal right now is to keep the =
initial
implementation as simple as possible. If any of my suggestions aren't =
quite
on point, feel free to adjust them as you see fit.

Thanks.

>=20
> [2] =
https://lore.kernel.org/linux-mm/674EC6D6-B1F7-447D-B462-861ECA5A99B7@linu=
x.dev/



