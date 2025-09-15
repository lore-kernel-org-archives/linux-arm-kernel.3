Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E64CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjCQVoRcvkNWmv8o166ThVNsGRK8YUNi+qrJMGfB+yU=; b=YIt76oMXwN4Jm/0UyzbCic/LUB
	8nbGQhbbTzpLqr5C9z6HpwEcQ6S7SEfRus3i6elY+C9IeqqRQ+7f+wVuHCGkYgKWMmPIQzfoaDilS
	kjNfNhqa0tICuVNvccFrSDqqzHHpc+wrMmU5CKLOXuRSfzYIHCDoyVRIVVcCjxJrJQUGQmierr+wf
	8vj/kJWOA1iHfjHOB4MiuGWEsbq6JNNBhA9hi/lfF/Wpm71MtIIkKgvgg8G6Ux1QxyL+QQJuwH5V1
	C4CVGvIOrNHZLnZkMgq015At27BFUx4Lw3z5JkDntS9V30kTyiipGA1JCwY1uIInhHpc6F/m0cliw
	xCCe7Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGzN-00000005j0Y-1jOR;
	Mon, 15 Sep 2025 21:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGzM-00000005izz-1gtk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 21:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=TjCQVoRcvkNWmv8o166ThVNsGRK8YUNi+qrJMGfB+yU=; b=aVuif7xh0NRW3fE5m8fBlzzTn/
	dUHMsYpv7LaFphV5tF/KdvCtRK2xx0fQEpov5F0S7KWozTL0Og0rTxL2r1l2Xx7YcPUHzLjeQQAgj
	gtjtJcarcXHo+mfHPYLWCrVmh06N8KDDeFzXyj/EnIlyToIi7PBfMltx2QE7oumfQOUWO8pmoKHPK
	GaTQw7wr8EwOua+f2j44lmd7KRnrU4ydY1Kx+KBv4JbMxB9LF9KK7cm0g8iSA1UBeNj6ZH9i1I/na
	5Aq43kMeL79uhD6Pmuqpln42IvNOt6hPO8hlIdMjqrjA/zcllnlGjj901ee8q6c8kIw+uDc3AXO5R
	wWFD/1DA==;
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGxd-0000000762V-18Sq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 21:43:54 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757971911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjCQVoRcvkNWmv8o166ThVNsGRK8YUNi+qrJMGfB+yU=;
	b=geKn2S6PjU8cjPzCGXTD7pgYIXVvFexC6PL/ne74oYaDfT7ErWwmgUZlTnKEWFLlqwjK4g
	dAdDWU1mliydp+hlSe9nK4kAyAnaF5hOmeW/LTAyCI3zETi+kyivMSOs6f9ZLYJGOnZGQk
	hQyHt8PkQo143xev04YYejRqnoaumWs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] PMCR_EL0.N is RAZ/WI. At least a build failes in Ubuntu
 22.04 LTS. Remove the set function.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
In-Reply-To: <86348rdg5o.wl-maz@kernel.org>
Date: Tue, 16 Sep 2025 06:31:31 +0900
Cc: Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>,
 K Poulose Suzuki <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Shuah Khan <shuah@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev,
 kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Itaru Kitayama <itaru.kitayama@fujitsu.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0524084A-9E82-408A-9F22-369ED25E42E9@linux.dev>
References: <867by4c4v1.wl-maz@kernel.org>
 <3FEB4D87-EEAF-4A21-BCBC-291A4A7C2230@gmail.com>
 <86348rdg5o.wl-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_224236_960761_213A81A1 
X-CRM114-Status: GOOD (  15.66  )
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



> On Sep 12, 2025, at 21:11, Marc Zyngier <maz@kernel.org> wrote:
>=20
> On Fri, 12 Sep 2025 12:33:39 +0100,
> Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
>>=20
>>=20
>>=20
>>> On Sep 12, 2025, at 20:01, Marc Zyngier <maz@kernel.org> wrote:
>>>=20
>>> =EF=BB=BFOn Fri, 12 Sep 2025 09:27:40 +0100,
>>> Itaru Kitayama <itaru.kitayama@linux.dev> wrote:
>>>>=20
>>>> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
>>>=20
>>> This isn't an acceptable commit message.
>>>=20
>>>> ---
>>>> Seen a build failure with old Ubuntu 22.04 LTS, while the latest =
release
>>>> has no build issue, a write to the bit fields is RAZ/WI, remove the
>>>> function.
>>>> ---
>>>> tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 6 ------
>>>> 1 file changed, 6 deletions(-)
>>>>=20
>>>> diff --git =
a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c =
b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>>>> index =
f16b3b27e32ed7ca57481f27d689d47783aa0345..56214a4430be90b3e1d840f2719b22dd=
44f0b49b 100644
>>>> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>>>> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>>>> @@ -45,11 +45,6 @@ static uint64_t get_pmcr_n(uint64_t pmcr)
>>>>   return FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
>>>> }
>>>>=20
>>>> -static void set_pmcr_n(uint64_t *pmcr, uint64_t pmcr_n)
>>>> -{
>>>> -    u64p_replace_bits((__u64 *) pmcr, pmcr_n, ARMV8_PMU_PMCR_N);
>>>> -}
>>>> -
>>>> static uint64_t get_counters_mask(uint64_t n)
>>>> {
>>>>   uint64_t mask =3D BIT(ARMV8_PMU_CYCLE_IDX);
>>>> @@ -490,7 +485,6 @@ static void =
test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
>>>>    * Setting a larger value of PMCR.N should not modify the field, =
and
>>>>    * return a success.
>>>>    */
>>>> -    set_pmcr_n(&pmcr, pmcr_n);
>>>>   vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0), pmcr);
>>>>   pmcr =3D vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
>>>>=20
>>>>=20
>>>=20
>>> So what are you fixing here? A build failure? A semantic defect?
>>> Something else? What makes this a valid change?
>>>=20
>>> Frankly, I have no idea.
>>>=20
>>> But KVM definitely allows PMCR_EL0.N to be written from userspace, =
and
>>> that's not going to change.
>>>=20
>>=20
>> Then I=E2=80=99ll drop this patch.
>=20
> I'm not asking you to drop it, I'm asking you to explain. If you found
> a problem, let's discuss it and fix it. But as it stands, you're not
> giving me much to go on.
>=20

You are right, while the bit fields are write ignored, to be consistent =
with the handling of other bit fields of the register, I=E2=80=99m fully =
convinced that checking the write operation in the vpmu_counter_access.c =
file should be kept.

The build error I=E2=80=99ve seen with Ubuntu 22.04 LTS is below:=20

gcc -D_GNU_SOURCE=3D  =
-I/home/itaru/projects/linux/tools/testing/selftests/cgroup/lib/include =
-DDEBUG -Wall -Wstrict-prototypes -Wuninitialized -O0 -g -std=3Dgnu99 =
-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT =
-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset =
-fno-builtin-strnlen -fno-stack-protector -fno-PIE -fno-strict-aliasing =
-I/home/itaru/projects/linux/tools/testing/selftests/../../../tools/includ=
e =
-I/home/itaru/projects/linux/tools/testing/selftests/../../../tools/arch/a=
rm64/include =
-I/home/itaru/projects/linux/tools/testing/selftests/../../../usr/include/=
 -Iinclude -Iarm64 -Iinclude/arm64 -I ../rseq -I..  -isystem =
/home/itaru/projects/linux/tools/testing/selftests/../../../usr/include =
-I/home/itaru/projects/linux/tools/testing/selftests/../../../tools/arch/a=
rm64/include/generated/   -c arm64/vpmu_counter_access.c -o =
/home/itaru/projects/linux/tools/testing/selftests/kvm/arm64/vpmu_counter_=
access.o
In file included from =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/arch/arm=
64/include/asm/sysreg.h:1098,
                 from =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/arch/arm=
64/include/asm/esr.h:10,
                 from include/arm64/processor.h:16,
                 from arm64/vpmu_counter_access.c:16:
In function =E2=80=98field_multiplier=E2=80=99,
    inlined from =E2=80=98field_mask=E2=80=99 at =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:141:17,
    inlined from =E2=80=98u64_encode_bits=E2=80=99 at =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:172:1,
    inlined from =E2=80=98u64p_replace_bits=E2=80=99 at =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:172:1,
    inlined from =E2=80=98set_pmcr_n=E2=80=99 at =
arm64/vpmu_counter_access.c:50:2:
=
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:136:17: error: call to =E2=80=98__bad_mask=E2=80=99 =
declared with attribute error: bad bitfield mask
  136 |                 __bad_mask();
      |                 ^~~~~~~~~~~~
In function =E2=80=98field_multiplier=E2=80=99,
    inlined from =E2=80=98u64_encode_bits=E2=80=99 at =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:172:1,
    inlined from =E2=80=98u64p_replace_bits=E2=80=99 at =
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:172:1,
    inlined from =E2=80=98set_pmcr_n=E2=80=99 at =
arm64/vpmu_counter_access.c:50:2:
=
/home/itaru/projects/linux/tools/testing/selftests/../../../tools/include/=
linux/bitfield.h:136:17: error: call to =E2=80=98__bad_mask=E2=80=99 =
declared with attribute error: bad bitfield mask
  136 |                 __bad_mask();
      |                 ^~~~~~~~~~~~
arm64/vpmu_counter_access.c: At top level:
cc1: note: unrecognized command-line option =
=E2=80=98-Wno-gnu-variable-sized-type-not-at-end=E2=80=99 may have been =
intended to silence earlier diagnostics
make: *** [Makefile.kvm:303: =
/home/itaru/projects/linux/tools/testing/selftests/kvm/arm64/vpmu_counter_=
access.o] Error 1

Thanks,
Itaru.

> M.
>=20
> --=20
> Without deviation from the norm, progress is not possible.



