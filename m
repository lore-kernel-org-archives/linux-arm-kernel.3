Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D3AC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt4e7QN0rJH2sd9pKw5EYUdXR/LSB/5HWW+QqOZZCsw=; b=kCZDsmcdEXS+ga4XKWbU4sLf8+
	YPR8yKkCCQvcpK+NI6mQ/qsisWd/jCwqRo0yMBlVJNzfZc8/WSvn5xamdsUsTCkuMBbfKFA0s5N++
	X1e0l41RNbWUo2vR5mNK7BJHut8R2gd3hi/IXNqry1swghL9ZsJvCxeo0zBLqBcDJQADNAHk31WUK
	xqfnaZ6yIE6W48Dl0q0zg+OoVWEJ9Sb6OIFHsT/vIex+mVyBcXVXQFMJoyncpl+FJ7181JEpLX/c8
	PO0iUvg7bp6By7pHWqSzbwLbpdIKBLr/YpfmF/PhXB2ttv1MJAmTksbSBmn/uOhs4hp2B/Xh3T2h8
	fVUbqfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22yh-0000000Gp3O-17GR;
	Thu, 03 Sep 2026 08:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22yg-0000000Gp2k-3Rz8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 08:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rt4e7QN0rJH2sd9pKw5EYUdXR/LSB/5HWW+QqOZZCsw=; b=Dj/YgwMj6ceEEXtgvZYS8HmP9f
	j5/6Z43wmZVz6uILsYHnfovmO+SmgZhaQbVz5jCNXteW27CaDpzS0vUrQr5qGEi9tbsnMpuLO8SmM
	p8lhNx6U/dn/BNi9SG0Kb3B3DGFSwCiSFq66NB+epbttvOFhyBBWGupKRtyCr6gUMy9gxC7fCSEFA
	/kzRJIK11+8S5ESEy8fFwhzP3PTzRdYMHx02nyQDl6Bb4PFCm/XU/8NRIImztbcpf/BKysXq1II+i
	+jxwo/hIz90t/8cHw0wrRFWrXoM+sjyJyXhleVzqHGzYkk/vz+kc2Q3521hmLuGEqP16fEKSAnkgb
	MGIq20oA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22yd-0000000CsHj-3PR9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:39:21 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68361dIY2067499;
	Thu, 3 Sep 2026 08:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Rt4e7QN0rJH2sd9pKw5EYUdXR/LSB/
	5HWW+QqOZZCsw=; b=rEQVh27WfTWWYLSguk9gflz5iF8TNsLXhDbfHpqP1yhhXn
	L5o0CoJHP6CQVA7rzpKSYCyTjKRSAX8oMRCwcmth0zWeI/PisnKV5vsYiLNsiN11
	jdC/y11SoBEr7B0RhMl4KAoGKCjlq6/MiwydPPrSDYtDm+nyAre4or12tEMo9tNL
	YnnLH4g+4KFaGBJkYAsorO1/HSaiOlmqzepzxVND3vkB1SGqUSnvYMSndyB3lelj
	DertguxMa2aHLyFjjai8+xvE93sbuOjhZoOIDEAFcR8PYTDr9rDo2/FuFYAeIenN
	Zpt7GQkAMH9WZdd0MVPE4GBWRQCMxx0rj93hRMxA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbmuj3p4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:39:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6838QNSR026134;
	Thu, 3 Sep 2026 08:39:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcceyem3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:39:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6838cxWI42336638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2026 08:39:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7D862004B;
	Thu,  3 Sep 2026 08:38:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E135220043;
	Thu,  3 Sep 2026 08:38:58 +0000 (GMT)
Received: from osiris (unknown [9.111.48.84])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  3 Sep 2026 08:38:58 +0000 (GMT)
Date: Thu, 3 Sep 2026 10:38:57 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
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
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig
 and Makefile
Message-ID: <20260903083857.33034-B-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
 <20260831144802.834315-24-seiden@linux.ibm.com>
 <aphMx5hsoXwIpNjt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphMx5hsoXwIpNjt@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: rM4PDv8t8LtgoXWWsvkGxVtFUtq-EWVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX0qBnQykfpZag
 LyEzK0Q2M0otBgsmLVbuaAXKJ1SF9G5knSJd5e9TwSRJWnhgOAIKtus94XMVUFZbY3RAHtC2GFy
 GrJ/EQcRD6HLVB/I53AkO2OBxgHGDKhHPKzP43l2GO/48ztY7rAhh7v87gpdNIe5WDWhmkAJ+ps
 r4v5KU++n8/8KPATh3+9syWC4QpbkaMaOidSWFB3jSmFvZcc64ijxcRxh1oxIPWg7PTPyMNuszZ
 ArgyScowGdXwliSCGujAoDa30fmB3jZZcrv2wZffigtVL7djh0ln08kPoXM44OejTN/LYy91zMX
 Q09wpnUQlRpRCOIQ6R3mHs0FWFxpR436WNSLzGX4z3C/AjbFaUUH71G3nJ3MXzxkcqfqrk9/zLa
 FRaId3HgBwE7Ij5MeYY4GqvWtAsYZksNYqJyEtpqu6P3WRTDs+mdvIZFQOWdrCYOnIjrTmHt3Ib
 gswBu79IXXUSHWb+O3Q==
X-Authority-Analysis: v=2.4 cv=Osl/DS/t c=1 sm=1 tr=0 ts=6a993229 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=FnF-cwsuLINmlKs4EWIA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX1y1xvG8KvX7m
 QIoVzvZSl28jyNFTawqLR78bFVRCcQlmevjvDeSlZNE3I7PMWOOiwILvshbzSvL0170u+/ERtyM
 +G6PSYLb8MF2/wG8GYXB8mQBExjwxiM=
X-Proofpoint-ORIG-GUID: BC3K-qeP0r6HnRlADMcN-_W4aPty92j0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_093920_238794_727770A1 
X-CRM114-Status: GOOD (  28.94  )
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

On Wed, Sep 02, 2026 at 09:20:23AM -0700, Sean Christopherson wrote:
> On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> > index 8d3ee17a1bcb..9c69ea16031e 100644
> > --- a/arch/s390/kvm/Kconfig
> > +++ b/arch/s390/kvm/Kconfig
> > @@ -53,4 +53,33 @@ config KVM_S390_UCONTROL
> >  
> >  	  If unsure, say N.
> >  
> > +config KVM_S390_ARM64
> > +	def_tristate y
> > +	prompt "KVM support for hardware accelerated arm64 guests"
> > +	depends on HAS_IOMEM
> > +	depends on KVM
> 
> Is this actually necessary?  I.e. does kvm.ko need to be *loaded* in order for
> kvm-arm64.ko to be loaded?
> 
> If kvm-arm64.ko does indeed have a hard dependency on kvm.ko, then I think it
> makes sense to not have redundant "select" statements below.  As an outsider,
> it's super confusing because the KVM_S390_ARM64 are incomplete, e.g. are lacking
> things like VIRT_XFER_TO_GUEST_WORK (at least, I assume those are lacking), and
> makes it hard to see what is actually unique to kvm-arm64.ko.
> 
> If kvm-arm64.ko doesn't have a dependency on kvm.ko, e.g. to initialize hardware
> or something, then this "depends on" should go away.


It is a bit more complicated unfortunately. KVM_S390_ARM64 depends on
KVM as there is code around in the kernel & drivers (arch and common)
which depends on CONFIG_KVM we need as well. I did not want to leak arch
local configs to common code if I can avoid that.
I could change it to select KVM ? Do you have another idea on how to
solve this issue?

The two modules are completely independent at compile and runtime. So
kvm does not have to be loaded for kvm-arm64 to work.

VIRT_XFER_TO_GUEST_WORK is only lacking for now. I will add it later.
Currently the kvm-arm64 module is incomplete anyways but I did not want
to send a 60+patches series and rather stage the introduction over
multiple series.

I will remove the duplicated config selections. Thanks for pointing it
out. In previous series I had an explicit KVM_S390 config. Both KVM_S390
and KVM_ARM64 selected KVM. But this created too much churn around the
whole tech-stack (default config change, s390 is the odd one out for the
KVM config meaning, ...).

	Steffen

