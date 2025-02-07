Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E17C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOWLTHbn9vwR6m0LzB3m289CKoGRx7iqA6UpMo1RMbk=; b=AktR+mR8GXt6L8XwpAzeWiuw2s
	Gtut/2yLAWG42gQbU2g5IqD+yW5X4mxr+fZHlabUxrkcIUk+BDBo4m8G1kwSs5fqzaAi0GEJBALkj
	bOFuKkQ1S0I8EIEl/gA0y/qfBafcuF90xUl3cXYid0CowavrRl2rPbNClg6EumxfWnYUIczoc7SdR
	5RBPlBsMZRAjORLlL0g7zc3Bu0C1m8O4drzKE95Z88r63NSVT3/3IkMydjVh4lEr+fSc3/RRAK17b
	4MgGMR1fBDqMBnomL20iamPb55RS9IzKsxV79qIvekEOg9Vipo1ygJbcVmkFUOE8PtFcZUmNuAZ7/
	kTcMlIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNJE-00000009TVq-05Nu;
	Fri, 07 Feb 2025 12:18:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNHp-00000009TGW-2eT5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A06CDA432CE;
	Fri,  7 Feb 2025 12:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F60C4CED1;
	Fri,  7 Feb 2025 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738930604;
	bh=7e6g6OCkpwbbGI6SHOEt+loTWxRQZEpgL2ZxwiU3pfc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t1Xn2gmIPvrMZ4ok0mbMF6xEGiKb/RzmjTckImIFK+fAeGe18AdXJMDrLt5ONgToA
	 WTZCr5WwcJPLWgBSm10IP9hIypCtTmMOAgP3m41PebT/YFwirJqa6+Mj0jeIl8F8lQ
	 q1IhM40wChU9JOjTj0uOddf6HuRoer+Y9sRZdcFLuG3RD8J1AjJw5/VlMgADvm/0jJ
	 DK5KYZg2sPWlJa1KsH5bUjcVd/FNUZj4v5PlGfGSTYPZgaKh3yOWz+xWbkRqiryV5s
	 FQVKCm4laIkRmDcX58nh1YEK2UMR4Z4SzTuimBypWfPMwPCt39cxJhtPC6BfRk1sNC
	 eFhZpVKkmN1Ug==
From: Puranjay Mohan <puranjay@kernel.org>
To: Weinan Liu <wnliu@google.com>
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com,
 jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
 live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org,
 roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
 wnliu@google.com
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <20250206150212.2485132-1-wnliu@google.com>
References: <mb61pwme55kuw.fsf@kernel.org>
 <20250206150212.2485132-1-wnliu@google.com>
Date: Fri, 07 Feb 2025 12:16:29 +0000
Message-ID: <mb61pikpm3q76.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_041645_799405_56EC9484 
X-CRM114-Status: GOOD (  22.58  )
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Weinan Liu <wnliu@google.com> writes:

>> After some debugging this is what I found:
>>=20
>> devtmpfsd() calls devtmpfs_work_loop() which is marked '__noreturn' and =
has an
>> infinite loop. The compiler puts the `bl` to devtmpfs_work_loop() as the=
 the
>> last instruction in devtmpfsd() and therefore on entry to devtmpfs_work_=
loop(),
>> LR points to an instruction beyond devtmpfsd() and this consfuses the un=
winder.
>>=20
>> ffff800080d9a070 <devtmpfsd>:
>> ffff800080d9a070:       d503201f        nop
>> ffff800080d9a074:       d503201f        nop
>> ffff800080d9a078:       d503233f        paciasp
>> ffff800080d9a07c:       a9be7bfd        stp     x29, x30, [sp, #-32]!
>> ffff800080d9a080:       910003fd        mov     x29, sp
>> ffff800080d9a084:       f9000bf3        str     x19, [sp, #16]
>> ffff800080d9a088:       943378e8        bl      ffff800081a78428 <devtmp=
fs_setup>
>> ffff800080d9a08c:       90006ca1        adrp    x1, ffff800081b2e000 <un=
ique_processor_ids+0x3758>
>> ffff800080d9a090:       2a0003f3        mov     w19, w0
>> ffff800080d9a094:       912de021        add     x1, x1, #0xb78
>> ffff800080d9a098:       91002020        add     x0, x1, #0x8
>> ffff800080d9a09c:       97cd2a43        bl      ffff8000800e49a8 <comple=
te>
>> ffff800080d9a0a0:       340000d3        cbz     w19, ffff800080d9a0b8 <d=
evtmpfsd+0x48>
>> ffff800080d9a0a4:       2a1303e0        mov     w0, w19
>> ffff800080d9a0a8:       f9400bf3        ldr     x19, [sp, #16]
>> ffff800080d9a0ac:       a8c27bfd        ldp     x29, x30, [sp], #32
>> ffff800080d9a0b0:       d50323bf        autiasp
>> ffff800080d9a0b4:       d65f03c0        ret
>> ffff800080d9a0b8:       97f06526        bl      ffff8000809b3550 <devtmp=
fs_work_loop>
>> ffff800080d9a0bc:       00000000        udf     #0
>> ffff800080d9a0c0:       d503201f        nop
>> ffff800080d9a0c4:       d503201f        nop
>>=20
>> find_fde() got pc=3D0xffff800080d9a0bc which is not in [sfde_func_start_=
address, sfde_func_size)
>>=20
>> output for readelf --sframe for devtmpfsd()
>>=20
>> func idx [51825]: pc =3D 0xffff800080d9a070, size =3D 76 bytes
>>     STARTPC           CFA       FP        RA
>>     ffff800080d9a070  sp+0      u         u
>>     ffff800080d9a07c  sp+0      u         u[s]
>>     ffff800080d9a080  sp+32     c-32      c-24[s]
>>     ffff800080d9a0b0  sp+0      u         u[s]
>>     ffff800080d9a0b4  sp+0      u         u
>>     ffff800080d9a0b8  sp+32     c-32      c-24[s]
>>=20
>> The unwinder and all the related infra is assuming that the return addre=
ss
>> will be part of a valid function which is not the case here.
>>=20
>> I am not sure which component needs to be fixed here, but the following
>> patch(which is a hack) fixes the issue by considering the return address=
 as
>> part of the function descriptor entry.
>>=20
>> -- 8< --
>>=20
>> diff --git a/kernel/sframe_lookup.c b/kernel/sframe_lookup.c
>> index 846f1da95..28bec5064 100644
>> --- a/kernel/sframe_lookup.c
>> +++ b/kernel/sframe_lookup.c
>> @@ -82,7 +82,7 @@ static struct sframe_fde *find_fde(const struct sframe=
_table *tbl, unsigned long
>>         if (f >=3D tbl->sfhdr_p->num_fdes || f < 0)
>>                 return NULL;
>>         fdep =3D tbl->fde_p + f;
>> -       if (ip < fdep->start_addr || ip >=3D fdep->start_addr + fdep->si=
ze)
>> +       if (ip < fdep->start_addr || ip > fdep->start_addr + fdep->size)
>>                 return NULL;
>>=20
>>         return fdep;
>> @@ -106,7 +106,7 @@ static int find_fre(const struct sframe_table *tbl, =
unsigned long pc,
>>         else
>>                 ip_off =3D (int32_t)(pc - (unsigned long)tbl->sfhdr_p) -=
 fdep->start_addr;
>>=20
>> -       if (ip_off < 0 || ip_off >=3D fdep->size)
>> +       if (ip_off < 0 || ip_off > fdep->size)
>>                 return -EINVAL;
>>=20
>>         /*
>>=20
>> -- >8 --
>>=20
>> Thanks,
>> Puranjay
>
> Thank you for reporting this issue.
> I just found out that Josh also intentionally uses '>' instead of '>=3D' =
for the same reason
> https://lore.kernel.org/lkml/20250122225257.h64ftfnorofe7cb4@jpoimboe/T/#=
m6d70a20ed9f5b3bbe5b24b24b8c5dcc603a79101
>
> QQ, do we need to care the stacktrace after '__noreturn' function?

Yes, I think we should, but others people could add more to this.

I have been testing this series with Kpatch and created a PR that works
with this unwinder: https://github.com/dynup/kpatch/pull/1439

For the modules, I think we need per module sframe tables that are
initialised when the module is loaded. And the unwinder should use the
module specific table if the IP is in a module's code.

Have you already started working on it? if not I would like to help and
work on that.

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ6X5nhQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nYmvAPwPT53bFmRfLn+t4r+dsnHeYai0TZrr
f0qZrEfx2fOnxAEA2fy5HjDlJx+1cO4Mc/JA9gxF74wiZOOUxwFwou7jlwc=
=ZyLG
-----END PGP SIGNATURE-----
--=-=-=--

