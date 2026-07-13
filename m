Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5317C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yoLIAxyc2K4qHLq/6jmB6EcYdYLRcJ9qmXi423/+Yo=; b=HR8dTe71WQsfewxfhN3kZiMosM
	pAN6ysKV/PCu/MycUku6/6/QZLWkNo54z+CGdrXO3UJcfypEKlzhju3tgKWUvD+PaDeN3Q7dJCpuP
	8cQ9+IbnyVUcuqzuRpKoexQGVzPMfglxYkaKKfiUvxwDL3EFJir6i30e74uWHxzeDaILte+qfE28F
	RGEvjWl/gVBxMkzIVgXMmdnNNmr7QX6K2UiXaurAWvVeh+diGE/IfzF//GihJ7oH/8LRLGMTgZUUJ
	EeXWOu9q6riX3XRnCOp5EGBUZFxRW3yzLplv9DERnTYOIUGo/l6Zc7pCAtQgVDf2u1gyF0chLMk9I
	a33xqaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBJ1-00000008TZd-3w4u;
	Mon, 13 Jul 2026 07:42:23 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBIy-00000008TYH-48Qp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:42:22 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783928536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yoLIAxyc2K4qHLq/6jmB6EcYdYLRcJ9qmXi423/+Yo=;
	b=ufoX6hFMdIyLPO8Bw5rY8zTYrpNA07qYpWVfVGzOWth22H/31rETGvgoTniThRqaviyYjp
	htnItLldN4JOMquRcrdmPsuHj2DOHOcAm0DNHDeMEhGdqp39vxpUiAkeDe6HylLlexVVjw
	HCSJeSNqf3qY+mgdiIs8xFbCmBLuGPs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HXNoRA_cnR7KVPwN6zA32E744OKOfTmDMReoykzR39H8Q@mail.gmail.com>
Date: Mon, 13 Jul 2026 15:41:35 +0800
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
Message-Id: <9C56FB0F-AE0E-4975-9D89-AFF110433C49@linux.dev>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <3B2B37B5-16DE-4DB0-8A78-4CB8636C1A86@linux.dev>
 <CADrL8HXNoRA_cnR7KVPwN6zA32E744OKOfTmDMReoykzR39H8Q@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_004221_597432_D2086256 
X-CRM114-Status: GOOD (  30.14  )
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



> On Jul 13, 2026, at 12:59, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Thu, Jul 9, 2026 at 9:59=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>> On Jul 8, 2026, at 11:11, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> Hi everyone,
>>>=20
>>> This patch series uses a trick with the Access Flag on CPUs that =
support
>>> hardware update of the AF to update vmemmap page table entries =
without
>>> introducing a time window where CPUs accessing the vmemmap might =
fault.
>>=20
>> Hi James,
>>=20
>> I was just looking into the Arm ARM specification regarding the TLB =
caching
>> behavior to better understand the "AF trick" used here, and came =
across a few
>> sections that got me a bit confused.
>>=20
>> Specifically, Section D8.5.1 [1] states Rule RDWZCQ:
>>=20
>>        "Descriptors with AF set to zero can never be cached in a TLB. =
For more
>>         information about when translation table entries are =
permitted to be
>>         cached in a TLB, see Translation Lookaside Buffers."
>>=20
>> This indeed seems to support the core assumption of the AF trick. =
However, when
>> following the reference to Section D8.16 "Translation Lookaside =
Buffers" [2], it
>> defines the following rule for permitted caching (RSQBCS):
>>=20
>>        "When address translation is enabled, a translation table =
entry for an
>>         in-context translation regime that does not cause a =
Translation fault,
>>         an Address size fault, or an Access flag fault is permitted =
to be cached
>>         in a TLB or intermediate TLB caching structure as the result =
of an
>>         explicit or speculative access."
>>=20
>> This is exactly where my confusion lies, as these two descriptions in =
the spec
>> feel directly contradictory when FEAT_HAF(hardware management of the =
Access flag)
>> is enabled.
>=20
> I don't think it intends to say that "translation table entries with
> AF=3D0 may be cached" just because they don't cause Access flag =
faults.
>=20
> It is likely that this clause was written before FEAT_HAFDBS/FEAT_HAF
> existed. Re-reading it with that in mind makes the meaning clearer:
> PTEs with AF=3D1 may be cached if the architecture otherwise allows =
it.
>=20
> There is another clause, in D8.5 "Hardware updates of the translation
> tables", I_RGQLZ: "If hardware does not update the AF from 0 to 1,
> then the descriptor is not permitted to be cached in a TLB." I think
> this supports my interpretation.
>=20
> I am convinced that it is impossible for an implementation not to
> conform to Rule R_DWZCQ (PTEs with AF=3D0 cannot be cached) while
> supporting HW AF correctly. Let me try to explain why.
>=20
> For HW AF to function correctly:
> 1. Setting AF=3D1 must be done atomically, otherwise hardware could =
set
> a bit in an invalid PTE. (This would break Linux swp_entrys.)
> 2. The AF=3D0 translation cannot be used, otherwise we could
> potentially drop AF updates.
>=20
> If an implementation used the translation before coherently setting
> AF=3D1 to perform an architectural memory access, then it must choose
> either to set AF=3D1 on a PTE that may have since changed (perhaps to =
an
> invalid PTE) or drop the AF update entirely. Either way HW AF is
> broken.
>=20
> Please also see I_GXGPN: "When the translation of an architecturally
> executed memory access occurs, the architecture requires that AF is
> set to 1."

Thanks for your excellent explanation.

>=20
>> On one hand, Section D8.5.1 [1] explicitly uses the word "never" for =
AF=3D0
>> descriptors. On the other hand, under FEAT_HAF, an entry with AF=3D0 =
does not cause
>> an Access flag fault anymore, because the hardware is capable of =
updating the AF
>> automatically. This technically makes it eligible for speculative =
caching under
>> Rule RSQBCS in Section D8.16 [2].
>>=20
>> My question is: which part of the spec reflects the actual =
architectural intent
>> when FEAT_HAF is enabled? Is an entry with AF=3D0 permitted to be =
speculatively
>> cached in the TLB by the hardware under FEAT_HAF, or does the "never" =
in RDWZCQ
>> still hold absolute priority?
>>=20
>> Please let me know if I have misread the specification or missed some =
overriding
>> constraints here.
>=20
> Thanks for making me look a little harder into this; it's a good
> question. I hope my reply above makes you more comfortable with the AF

At least to me, what you're saying makes sense.

> trick. I also hope to hear more from the Arm folks as well.

Yes, it would be best to have an ARM expert here to confirm that our
understanding of the manual is completely accurate.

Thanks.

>=20
> Thanks Muchun!



