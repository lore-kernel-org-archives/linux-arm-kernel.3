Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2397C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 23:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS6BKgfrUIcfA7SodlW+df9HXE/1l4HmyjE6Q2zGX3A=; b=Ds36fWle8RnlkEdph1RMmpL4Q2
	dPYHre7tgBeNxMlQCB/2Ej03qscVXZoMk/LVXdfXk1ALOZTbjwDtJ/hySLJoiVZHUSi4Yi5FweedQ
	8Z7NA3Te5uebS3AIGvb2Cc05zyNghf5n77jEgSp2SZH0kynqeFu7vkpPv3yajHf9WGyM7IOdKt48a
	au9pA6SIdQxMEVKG65rmwq+0VkyO9oyP3dglMbsRCvKtPRVr4oDShBXbjCgXzuA8Miuk01fMRR49s
	BtJv3wzJ9xjfkPCpvIgeQ1pDRZAUA+9HspSOd/+d6h3lKevmM/RT/PmejtrPL48n3J74m2SBQHgUT
	D/xQNwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cYw-0000000848P-45vU;
	Tue, 15 Sep 2026 23:27:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cYv-00000008483-3pOM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 23:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RS6BKgfrUIcfA7SodlW+df9HXE/1l4HmyjE6Q2zGX3A=; b=mqSrzhmyU4qwyWifHc0aWFZrRb
	XICwdqeWjfp38SUAOPF2IQ4iW46mPgpuPStbO+3Dc3QdtQZJ6XmHxizEMSGH0K5FKLZc7939G4s+C
	ipRs0UUq+8axgNRZ5nLWOnoy7zPOih39AgDdUcu+keIWeBaSVm9vwtHjwEQD9PY6nNOwGNhpuibCH
	RYy2488maDm7AZANll8igDCyTqh0l0pO2iVWg7pfXRnn2QHoScKsqVqSSrnM9jE7ubU1lWYdcQY/m
	1rvFk/ufDFeyIwscHW/f2dDJxccvlqG40nEB00V//G4P7PCDX7JuA8BSTsymmjVngtByqrsJhr+7D
	31nYUM5Q==;
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6cYr-00000007K3q-2Kps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 23:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789514857; x=1821050857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSim44TEkk941GEs+6Vkv7QcLI3hbxOBT/IOZZGSsEc=;
  b=raNsQIyMsQTpVlyypdf51z2X1BEt/86SO3waqu6aE1orylj4ZOUJfTbc
   cMt81vaZu6vb6LqRKY98C5uwkdbo8TbChlbsvBHRf/EIudNT3hC+CQ9r/
   ZkEqd4EjQ4WUcdKuQc/C+oitmiTzkUZPmrWcEq6amyzENvVjFB6XXHePD
   doIERll9MTj89Lw7t4qKlAfHJvkWT3xm8zWo6iwcQykBX8SkoYViQeYLQ
   JhaoASnJoaQwi5qtp/ubYhG1on1AJ6LpBovLhpMcHh2vx8pCwv+t3KNQq
   krwYjPwl6NaCNP1wklzZivq9X7ryPew3L9ThU8vGHmvRMfUDW29jtDeLp
   g==;
X-CSE-ConnectionGUID: FYN9X4LPSxGT2oghUmxZ+A==
X-CSE-MsgGUID: SF5AGv+kSbKwoTehTH5JjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="258939260"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="258939260"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:27:31 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9FA3F100035A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:27:31 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4E67210000AF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:27:31 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 4878A8288F1;
	Tue, 15 Sep 2026 23:27:25 +0000 (UTC)
Date: Wed, 16 Sep 2026 08:27:22 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <aqnUWp_VJXUCcJnQ@sm-arm-grace07>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
 <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
 <m6ldbr7hdafmoycx7xjcbsg62mblcakcu52ndowwzqgxdjb3q3@huv4i5bfxtza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m6ldbr7hdafmoycx7xjcbsg62mblcakcu52ndowwzqgxdjb3q3@huv4i5bfxtza>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_002738_426352_45855782 
X-CRM114-Status: GOOD (  21.92  )
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

On Wed, Sep 16, 2026 at 12:22:30AM +0100, Wei-Lin Chang wrote:
> On Wed, Sep 16, 2026 at 06:49:57AM +0900, Itaru Kitayama wrote:
> > On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> > > Hi,
> > > 
> > > This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> > > notifiers.
> > > 
> > > This version fixes a few issues, and adds Marc's space optimization
> > > for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> > > 
> > > Tested by booting L3, and running in-kernel targetted tests described
> > > in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> > > carry them over since some bugs fixed in v6 are non-obvious. Some
> > > retest would be much appreciated!
> > 
> > How did you boot into L3, with KVM selftest or recrusively boot on HW?
> 
> I just recrusively booted VMs on hardware. :)

Good. Then I actually tried that on Grace CPUs, but letting L1 boot 
with nested mode did not print "VHE+NV2" KVM init log in dmesg, thus not
able to boot L3. Do I need to add other than kvm.arm-mode=nested to command line?

Thanks,
Itaru.

> 
> Thanks,
> Wei-Lin Chang
> 
> > 
> > Thanks,
> > Itaru.
> > 
> 
> [...]
> 

