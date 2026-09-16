Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A11C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9wYFqkMO68SYOCGbriFllUPMhixN2gtllHySmb7w5g=; b=N1bPED05ut4UkdG/YgON8nUkMR
	cKQL5sRHtdBTbD+Y8GjjL36vsSFcaGKytPb08p9bCi53J2SlBLl11eM5zkvMvf0Ac62bxWjB7Glmr
	lg285Vhjw4wcp+xr3xIIOtt3CsUnbpgMoVdDZwHOxzNyCq3hIH9qUKAWXITO1QNg+6Y+RN8wfnE6d
	vSJnidqZI5yhJOU+Ur8D7dpRcMjljwxxBsmHDn5Lay/GnaQcnYI8vQJvljAo3M5uBF5pWekPllZJV
	DyDyHqkdrrGopzC3eke46E05gjY0TNTOGho66VZEBwrmz0rkVg6jOC197AZWRqIwfGcgjYgq0inpC
	iJE2lDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6r7l-00000009USn-3H4F;
	Wed, 16 Sep 2026 15:00:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6r7c-00000009UQW-1odF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 15:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j9wYFqkMO68SYOCGbriFllUPMhixN2gtllHySmb7w5g=; b=OYjVuAhXUJJr8n/NTkNglucizo
	EFi1GJBCNPT/8gH5U6jRDvlnoi1l4JAApOIXrijdthWLtEDoWagye4y+gFD1GqY2OoF1QPQ3GQio2
	urOdS1qEvVWGjtFFUq0b1SQSNN9hO0LFbYeq9k+uZ/1CMENlCBxOvpQ8NGWp99KXg6AQTPV/M2iOU
	bG2GJgrpMvYKUDz2sqAHgjwiuOje1GE3LlKBrLknwbhlGKWov16mlyywve1nRg6fivS8lwwzzrKTd
	hceM02y6SKPyswt8cnjy59eFAddKnbDQSTpyC4v3sINORBYu0sDOyB9I7VxOqbUdNxmqnbWHytAwV
	Zw/gwJZA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6r7Z-000000080gX-1QhD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:00:27 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEVxdJ3863290;
	Wed, 16 Sep 2026 15:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=j9wYFqkMO68SYOCGbriFllUPMhixN2
	gtllHySmb7w5g=; b=DSW5uGXcNBEav274LLwLVkQJJXunKRGXxm0hv6idwZZISp
	jNx9tZ9aNgkx+oEM1BlRNdtXGx3Cc4ARJgmyUfNis7HfO07p6U0UKavc97fP4TvX
	oUcKb36q2dUDMm8TJVws4WFM9cJ9al6mM7s9nLrvqdsO0eaFsWJLrcrt2t5Rxnmy
	3t8fBs6c4Tiv/7v2y0dlBG0Fu4Dc2oqUQMAMGah5/jUTvPz8CLIwIe4myfy2ySV9
	W/BBCPM2X/1Dd12JPrdXNmuwK4osTJfDO8sj2iYqVv41qJ9SUTMTBST9uZvh18Az
	oRfEATaVPd6dFEd0FsIWB4YjaGjhMJuMTNVnbaCw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmv5hw4vu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:00:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEaDkJ1571790;
	Wed, 16 Sep 2026 15:00:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gq03bxty3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:00:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68GF03fh49873402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2026 15:00:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DA662004B;
	Wed, 16 Sep 2026 15:00:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5059C20040;
	Wed, 16 Sep 2026 15:00:02 +0000 (GMT)
Received: from osiris (unknown [9.111.20.35])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Sep 2026 15:00:02 +0000 (GMT)
Date: Wed, 16 Sep 2026 17:00:01 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v7 21/23] KVM: s390: arm64: Implement vCPU IOCTLs
Message-ID: <20260916150001.202565-D-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
 <20260831144802.834315-22-seiden@linux.ibm.com>
 <d706435a-3984-4ef3-b319-1efc92517650@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d706435a-3984-4ef3-b319-1efc92517650@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5NiBTYWx0ZWRfXxeAY1ElL61t/
 DSYaS/30ktfKLmCi1Je1B8oA5SSK0YMYFdINg32ZZXjlxEc9UVimA+x4ax64svDgzOof3EE+8Cq
 Vl8VAQsLH6OyJehRfezU1Slb3TVCSuZRAL9WWS3smLcYBp41FSMALFI1GRXyRzvYpwhzchIjlIb
 CkraEYnR4xehufNRYTAt45GmKn5YprnOrEXn+lXaPv8GrkVyfwHxDdUH/jkyYa+BwuOXTH5DASu
 kDegQycer+tXRRKiwObfFg6xsGp1+6tFw5IjK0QCpvpWHQ01ArLIpW1V7WjxcWuRkSv3LPrY4WX
 WTvUpoy2w1zB1MT+a+DaUVsEOXz87JpHkY8arJG1M5FfIGhZmq5O7Kpopd6aVb6eogrOYMABlIe
 vitrrgpi7QOp3DeMtsyo4XAdnUcOb3Oh/j+6VjF+J1g12DjFVEw5gMZ+jmN4OVH6vugtF3ro7tt
 US9PSysZIEbXkVY+LSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5NiBTYWx0ZWRfXxG44vfSHFzXS
 7DdX+PaMTaaPE/YyCzXnSUPL9HrecC741FwX1UnjFTWpWFPm3oI14f3lIBWA7I+3UY306cDUbZK
 R4kIROXqO89uOkaiabda0mrXWcATLjE=
X-Authority-Analysis: v=2.4 cv=Zsx4uN7G c=1 sm=1 tr=0 ts=6aaaaef9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=2EDVkJ_xZdsl-fsxt_cA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: CcjZPhrNXuk_fD7ZBanhcQxmk7O2fTAK
X-Proofpoint-GUID: pSdKo_eOc1M7lhhBdE68zGvs-QjHxbP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_160025_734446_C76BB682 
X-CRM114-Status: GOOD (  20.29  )
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

On Thu, Sep 03, 2026 at 03:27:16PM +0200, Janosch Frank wrote:
> On 8/31/26 4:47 PM, Steffen Eiden wrote:
> > Implement all required vCPU (arch) IOCTLs.
> > 
> > Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
> > Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
> > Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> > Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > ---
> 
> [...]
> 
> > +static void arm_vcpu_run(struct kvm_vcpu *vcpu)
> > +{
> > +	struct kvm_sae_block *sae_block = &vcpu->arch.sae_block;
> > +
> > +	adjust_pc(vcpu);
> > +
> > +	local_irq_disable();
> > +	guest_timing_enter_irqoff();
> > +	guest_state_enter_irqoff();
> > +	local_irq_enable();
> > +
> > +	sae_block->icptr = 0;
> 
> We already do that in the function below, no?
> If possible I'd like to avoid setting ictpr here.
>

yes, removed it at this location. thanks.


...

> > +		kvm_vcpu_srcu_read_unlock(vcpu);
> > +
> > +		arm_vcpu_run(vcpu);
> > +
> > +		vcpu->mode = OUTSIDE_GUEST_MODE;
> > +
> > +		kvm_vcpu_srcu_read_lock(vcpu);
> > +
> > +		ret = handle_exit(vcpu);
> 
> ARM increases stat.exits here and since you copied the stat fields over we
> could do that too.

Good catch, thanks. Adding the stat.
> 
> General question to the ARM maintainers:
> We'll be adding more stat fields in the very soon future.
> Are you fine with us adding them under any name or should we prefix them so
> it's clear they exist because of our architecture / implementation and will
> likely never be added to ARM KVM?
> 
> In the past we've added a lot of stats and I'd expect us to at least add
> stats for every intercept reason.

That is the exact reason I copied the struct and not reuse the arm64
defenition. I already added a gmap stat we have but native arm not.

If the stat is meaningfull I am all for adding the stat to arm as well.

	Steffen

