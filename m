Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3714606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rW7fGAqQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mrvxu3Ia;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=mTTn8ZWR;
	dkim=neutral header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z0LOYJhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GEmx/sUPQ2VMJDaiqbyGhNC0GffzmoblRKDktdSOsjs=; b=rW7fGAqQbQWmpb
	i68JwmYjWvTD6+HfhX4upLo9t3hc7bA6GOzww5B2+lxFV7xOGxBmHDQhj7T7lFlOTh96nSp95zKPe
	gxDubO0aM0Q21nd57m44QEVDt5JKXIFR69FkdrSegEBJ5ojsGbGARgrZsnsXpQEkm7A8dC6oalB2Y
	E+ULIi9Cwjkuxzb95rDpSb4MyEaeAUScyRGyeiIJdiPmv7Pq9YzWYDBjfa802tVkHrwyJZ7x3GeDN
	3pJLsL3a+8iVNQvQxFQIliE0TCTCT5KUKPj8QqJWDYLe1ApQWWRPLj0hFUBueLKZ1l4LuSjuOivop
	lO/pjjxpxD/FgiPvyafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhYO-00000004wAv-2kPc;
	Tue, 27 Oct 2026 13:49:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhYH-00000004w5e-3Gk0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 13:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GEmx/sUPQ2VMJDaiqbyGhNC0GffzmoblRKDktdSOsjs=; b=mrvxu3IagVdKGvizJG+gdh9wQ9
	0Gfl30gxb+9UQrVM/V8E0kTf5FilOU/+oL/5O/Rb2YKU7QahZw25PWXJ3AQ0X7ZZFQ9BLt/WrWjYe
	WVVkh3bTiSxlErAn5pfrhXxZjzUrtYcpg9czQdg0c7o/+Dtkcie7NPit7L7D6D3i2bTmhOwY8fvDi
	7sA8/jqqum6pxPI0PHFsIS9r0DyWA2xhSqIM3DKbQW7EVDlwNFOxh/+MfsdMgOKucCjrbrpU5TXKF
	0yb4HzhtNWSbicrd5rEJN6jVCjHNOdlG4cZQSc9X4B0BjYj82V4PZg8Rt5G0qvVj6zIRqxdEW0tPV
	qzU9vuoA==;
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhYE-0000000F2Hn-0WC5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:20 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id A26531D0017D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:49:14 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 27 Oct 2026 09:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793108946;
	 x=1793195346; bh=GEmx/sUPQ2VMJDaiqbyGhNC0GffzmoblRKDktdSOsjs=; b=
	mTTn8ZWRIuh6yCC8N7zM1RkyjRwCnYj5ApXsvRRDF4DShqntltu32cedImYWxCZW
	3T3+rX3vuwWPL5BhK3RzggeyxYrft8Aa0815cxCyq8/KAlrCQQgYJqtyYcVcPEAE
	QZBFcR5xocMUdNEC/Ss256l4ZTh36L0yA6nnDmsTbvCqx+aGJldnAm0J34yVwDd5
	m04wU9UA04ybLZrICroOAcmeVLw2Ys3YtKcCDiKCNrxuqwql7L/kxY1RPM3o8joN
	8/N1a/j2bRPmUrjsWmf/ailBEue48H+ng2y83WUFWdeq+wi0PRYNxXfVLZstF6Am
	KGujzhZxqmlaOMguIzoIhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793108946; x=
	1793195346; bh=GEmx/sUPQ2VMJDaiqbyGhNC0GffzmoblRKDktdSOsjs=; b=Z
	0LOYJhmXY4ILhQ1ZEb9qsYJQb6aASLrmEzl9aoPc7z19rsBh9FMGWNyVNLU7hfmy
	eZxpXf2mvRssP8XDq5BwNlaRlz5VE7OO5sTjTAUHeCklgX95D9UEE6KYLyNRa5py
	1buGciWMGbz4a8FiV2/B0WZzxZLXehhPunxe710+MHMw23z0UhckVw58ZTZY1OFF
	K7sJFwa+taHtRtekI+ovUwvgLNKhqphGmdlgaxNz94Ecd56bxmn/eEDHONbdfZSV
	GC+WA7Llt0rFNrzwSacSwSzAnXm8emS5XWDdgAx/ihLYXUr3Kuu0StEEeQIx4iyU
	s2anVNpi2GVaFVauFQC6w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793108946; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:Ncp0ScYHx/imYBEUZzUHYM8NdMEvo2ys+WuTWa2TAIO2UMZ
	PzwsK8AuhykWPo6aIwYw4DXL+GbUZV5/43JHqC4FVTzoLFKaxpZ8bbo1MNJIETu+
	ExJvhO+Ejob+ibg0A3PM78j26I/joZgmycP+AoZFKgB/FUzUFQA3e+xPVZsO836i
	51JfIH/AkddHCZLrkqhe6mcJLyde0HFpLW5Ti8Lc2BOaKQalZTBZJHqwwTyu1Fz1
	u2z6BEv0MLTEHDGUrBv+0ph0gRNHI2pUfTSkuYy+7exOMe34x3iiV0q/1UTLsjuy
	hHPAdOXj0TizHMSr84U6JE9t58jvoP5/O5cRPjw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:rJDu4bsxco/gIMrD+dD00LfJT4/xDEIwd0IpCUvE7Ok=:KdZkVqaRMOJUI0d/ETxpGSeypZPRT8HH1n5VL0jRLOY=;
X-ME-Sender: <xms:zKvgamIraj1gKKF0eAeZnUhaYnPU1FGpZQXoPCi9QC9qq4y6HIW4Rw>
    <xme:zKvgao9YFV_HCtCeHk0_T4CjvW0coaEmOrDF5Z2kFhRAfjJFVdAfJCZgMYi2KAs4y
    3f0xiWGAzDybQFUZvrDJOKx47W96PA_q1fy2h9Hfuu1yJwKNNKxT-HG>
X-ME-Proxy-Cause: dmFkZTGzAS/DSW4CsdWGOtMkgyUDpHtAQSg7qB+7/Ys6E0HD63N/Pcrnnyg0NyVoPg7+rI
    ROPODo20FS22WszwXXzPBCSg8LrAc4Gs0zt1FYqdFSEzsiYNN6B+Zdt10yoE6tItpi5jSF
    QuM9+Ljs5u0qdw3cXSYAYD7nPRBHPOx8gzkFNpi6Gbseu+z6gAkwtVDJbRXCWlJjnurtGi
    Pmj6Er35n4sJoC87PBTI4TELC6x88vYuf+atC7A7hhxb4VyPJywRy4I+EgvWCkwzhpkRvn
    nMptqgxqOXAcIdYDrgrCRIhV3oZrEOQDiLoCeq3SRJUVU6ykskJEuUkSjrW9OFNct6siFR
    fRCHMvYkK6bV80wdgi788H8hwIJ8b9THhB9ckSuR1RmxxvD7WxOIPSotO3yOc02D3nKnM3
    e5m4h7NOqMTkmL+0dH3YuEt+ZM4fUlHTkD+MOGsV2QC0axBtB9LuC6UF/Hga2d60sEaMeM
    40YHfXH1iCpHr3TKPHgkxz6Pj9XU+ZkKAllecoPy6beK8+P2VrT9S8dyN4ldk28HsXkye6
    rxBtxqQVDFqXb0+HrrMWnKRsiap6QZrMWRBn1XhjGmbJBKSbQuPyhm0bn9y/0hzTeACm5g
    ExZO57S+I1i8J638jlcrb+h37dguBbsFt1hT6dF/Yp3L+Unc9SLLJFjplqEg
X-ME-Proxy: <xmx:zqvgaiR9mD7HzWGzG7wCHl-DWnL2Zp7N8DEi80yl8Lf6Z1YFmMmqog>
    <xmx:zqvgaosexHicgu3YXFdciJAflEvO83wUz3WY2lZdgiSFEu0DpPk1pA>
    <xmx:zqvgagLpwi8qhmSfz4hjB85clzUCUokk2iF93sfQYo-JIMnIelfEzA>
    <xmx:zqvgasfLrqodpNqK86D1uz78eKcESEEdMr7W4hbdXGZ5NycJfIS3Zw>
    <xmx:0qvgaqh-ax7aBUwe4VoD-hxpmbytdLt64gvmlJ3Psa0VesPsIERnIBlT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0259C32A0093; Tue, 27 Oct 2026 09:49:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmcrnnMArev7
Date: Tue, 27 Oct 2026 14:48:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, "Steffen Eiden" <seiden@linux.ibm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Yicong Yang" <yangyicong@hisilicon.com>,
 "Zhou Wang" <wangzhou1@hisilicon.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com>
In-Reply-To: <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev>
 <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
 <86ecdgzp6m.wl-maz@kernel.org>
 <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
 <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com>
 <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_134918_803098_4693AD83 
X-CRM114-Status: GOOD (  26.38  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026, at 09:14, Fuad Tabba wrote:
> On Fri, 23 Oct 2026 15:10:23 +0100, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> [...]
>> @@ -254,6 +269,8 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
>>          if (prev != next)
>>                  __switch_mm(next);
>>
>> +        switch_iommu_mm(next, tsk); /* FIXME: is there a better place to do this? */
>
> switch_mm() isn't enough when the same thread also runs a vCPU. In v2,
> which I'll post soon, KVM will save and restore ACCDATA_EL1 only for
> the guest, since nothing in the host uses it today. So after KVM_RUN
> returns from a guest that has LS64_ACCDATA, the VMM thread's next
> ST64BV0 would use the guest's value, unless KVM also saves and
> restores the host's.

Right, makes sense.

I was a little unsure at first how ACCDATA_EL1 gets handled on PCIe
TLPs when there are both host and guest users that set it. As I
understand it now, this only works if the PCIe requesterID is assigned
to the guest VMID for stage2 translation, so a guest st64bv0
uses the ACCDATA_EL1 as PASID in combination with that VMID.
The host would just use ACCDATA_EL1/PASID for its own stage1
translation without stage2.

This means that with your v2 patch and the switch_mm() code I
have, this should be safe. There is a possible optimization to
skip the host ACCDATA_EL1 save/restore if current->thread.sctlr_user
does not enable SCTLR_EL1_EnAS0 (i.e. the same process that
runs the KVM guest has mapped the MMIO area of an SVA device).
This would make a difference if ACCDATA_EL1 access traps to
EL3, but otherwise likely does not much much of a difference
(I'd have to do some measurements on hardware).

>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> [...]
>> +static bool try_enable_st64bv0(struct pt_regs *regs, unsigned long esr)
> [...]
>> +        isar1 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
>> +        if (!(isar1 & ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA))
>> +                return false;
>
> v2 will add an ARM64_HAS_LS64_ACCDATA cpucap, so this could test that
> instead. As written it tests bits [1:0] of the register, not the LS64
> field, since ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA is the unshifted field
> value.

Thanks for pointing it out. I have rebased on top of your patches now,
so this line is gone.

>> +
>> +        sysreg_clear_set(accdata_el1, ACCDATA_EL1_ACCDATA, pasid);
>> +        sctlr = current->thread.sctlr_user;
>> +        sctlr |= SCTLR_EL1_EnAS0;
>> +        current->thread.sctlr_user = sctlr;
>> +        update_sctlr_el1(sctlr);
>
> On a host that runs at EL1 (nVHE or hVHE), this also requires
> __init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
> __init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
> access traps to EL2 and the hypervisor panics, and so does ST64BV0
> once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
> once you're ready to post this.

Thanks for the offer, that part is definitely not my area.

     Arnd

