Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C502CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 23:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKk8Oar5iZKEtHs3mIMqLniZOpjNKKqk8+Ef4SYJV3s=; b=uh6ApJQiQ7gq39UZiDN6JApvCw
	bjRKqPsAYGXG1ZAGumd/PfbaLbmA94nMiVE++jR35nEe1ar+PxO8kTT6KDa4guLQBSGoooTGXbbk1
	Hmg2xpHZqT2iV6WF+0+jdQGnc6sWmkEl+xdHlreokNzZiJRC62p/5qrzxqgxvwrpoU1HgCEmNWoqE
	IfqVG/UPxvEypCDHQ1i6kwetvMeavyM2W325AUOuJ1FHn28AVdHbxbHgzU2EWvBhSGjwKe/l/D8AZ
	f1blVMzFZf+4x34DDyFTMqge9vO02CWXgQ4E0AW+2YnyjyogRX3zZShFulJYWYDXh8YTXT9G31TPZ
	ghDi6ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLr4q-00000009oVO-2jrQ;
	Sat, 09 May 2026 23:27:20 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLr4o-00000009oUn-0Nzl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 23:27:19 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8c70b5594f4so357254585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 16:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778369236; x=1778974036; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eKk8Oar5iZKEtHs3mIMqLniZOpjNKKqk8+Ef4SYJV3s=;
        b=f8oS3BAiJktdGq5QlQN4WHr9K9MMiur5aiPnO2t14L7ruBpdrAA9/5HFVcDA1fa/iw
         H7a6KgMxZNFTkVSPdw8Xbkql9/JrGt75PV75pB5K/FbRPlvgxfh+i74cz7Zewy8Mr9oE
         zwYuhairFCTjOjLQbwY7NTz/y8dHB+94f/LkjIamuyp/Lf0agFPVNxochROrpsWuX4ZF
         gm3em5c5jIX1QSd2AZpNd2DsgdMSqNTNZl5wjWecHS8HhunLTlP6OKkSuqZ6aNhnQgyS
         iXx2YPCPRnXAXij5rm+JjL3aHnYGa+h06l7nvPNuIVpbqzgN4lkeB6zbFZU8SWbAcbA8
         6aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778369236; x=1778974036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKk8Oar5iZKEtHs3mIMqLniZOpjNKKqk8+Ef4SYJV3s=;
        b=MmgyYkEg4DV5EAn8cpw5YgCrIA87iaCnYZzRc5kHrmQNEpb5d9bK4rcGLvqVxpFjVH
         5X5zyNgdpaffEiWCk592VYy0d3f/3qfxDJaW4WFZ/GgwJtnoXaoei2AVSNz9wTgBOSaA
         RVvnlt8bWPipQbUGLsXRz0sol80VS87yrrpfQh9HN5fR8V961boTHuudyMqI9gk+5+Dz
         B4dtA/vHiJLqUcgI7xXoCBcaHPYrOr8TiI9cc1JrdJXDs7mO6FsYKww0ksofW3ZsPU/N
         k1bU+Nr3ZpA0Em3VdWcmEH944peA3Zd62LQOHSmAFdlRyzxOF+lT3xvBcA27J0aNDljT
         VGhw==
X-Gm-Message-State: AOJu0YwFiGGaH5mWoVcTspNoOHV4pZvi3bTYERQbQK8hJRS3Kbw6tmZ1
	lXeFGNSrhYr7ILMvqY0MyEvyGy/RHddF7VISE4w7zRQqBq4H6yvvbVmv20vm98ChFJ4=
X-Gm-Gg: Acq92OF7QUpDpMWurCaB30RaHXtBEGtw81P4NZZEV5EH1YrybxserHisFxkiLSchQEV
	Qa7YLU3app/rYEGp6xXSSwdYoQ8HMa0ZbturHHqULgBEwGfGfDtPN71xTsZAxdOGEt/6+ArnjAz
	O6ffXN3TXTfiEh38VaTiNljdGIEhXLWJMuOl30w6Ot2KzOzhEWVVG0212wHwV5GR5MvkY/smA2X
	gLPaZS9N83u1ndKmvRlYZzTyjLEr1Wsgh5uvLQ4a1NH7vZ5x1RReQjy+fGXEF3tKaLRWlkV5g7l
	/GhZ5HQFYWGJ1rQV3euI4HiuOG4PnDNP9+WdnV1ENKFudddE+ZSaa65t7N3jnl6BN6Z0nIz80nx
	BDFqvOHFNdSH8Xr8JPbT1vwuOmu+K4s4JOTSbf+dQaGO5EAqt6JNh1VqE2ghlM02NBHECas2WVx
	oGdfEW7/QcsY7tA1c22hzQVT5tyw9jTVrS1w96QgzlT8axS0EV0dy0dPbYGmAMCBhPWejl3jjt/
	7f3Gg==
X-Received: by 2002:a05:620a:28c9:b0:8ef:3312:a165 with SMTP id af79cd13be357-90652193274mr1653712185a.24.1778369236452;
        Sat, 09 May 2026 16:27:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c3e01sm668270685a.26.2026.05.09.16.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 16:27:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wLr4k-00000002NhK-33XE;
	Sat, 09 May 2026 20:27:14 -0300
Date: Sat, 9 May 2026 20:27:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <20260509232714.GI9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <20260501130006.GF6912@ziepe.ca>
 <afiRB3e3o0G1oZvY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afiRB3e3o0G1oZvY@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_162718_175458_81812E40 
X-CRM114-Status: GOOD (  22.68  )
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

On Mon, May 04, 2026 at 12:28:55PM +0000, Mostafa Saleh wrote:
> So far this is the list of requirements/changes needed share the
> stage-2 page table (besides the obvious: same page table format,
> granularity, endianness...)
> 
> 1) HW BBM is not supported in the hypervisor page table, that’s
>    because it can generate TLB conflict aborts, which the hypervisor
>    can not handle because of the limited syndrome information.
>    We can rely on FEAT_BBML3 which was newly introduced to work
>    around that, it’s quite niche and not supported in KVM yet or
>    have an allow list similar to the kernel
>    (as in cpu_supports_bbml2_noabort()) which also limits the number
>    of CPUs that can run this.

Do you think pkvm will need BBM? Hitless replace of a PTE is already a
pretty advanced feature and the SMMU has its own support matrix there
too. Is it for shared/private conversion?

> 2) Handling page faults, devices must be able to stall and let the
>    hypervisor handle the page fault (which has to proxy through the
>    kernel as the hypervisor doesn’t handle interrupts), this includes
>    also IO page faults which are hard to get right from the HW which
>    and may lead to system stability issues or lockups.

No.. once you turn on IO like this you don't have page faults
anymore. Everything must be permantently mapped into the SMMU view, it
can never be made non-present and you must run without page
faults. That's what you have in the io-pgtable constructed table,
right?

>    Alternatively, we can pin the stage-2 pages, that would require some
>    hypercalls, hacks to the driver/IOMMU API and possibly new semantics
>    in the DMA-API for IDENTITY devices as they will still need to pin
>    the pages as they are actually in stage-2 translation and not bypass.

?? Then how does this series work?

> 3) SMMUv3 must be coherent.

Yes for sure.

> 4) Support BTM/DVM for TLB invalidation, otherwise some hooks are
>    still required (although not io-pgtable-arm)

SW needs to forward invalidations, BTM is rare..

> IMO, 1, 2 are the most tricky parts. It's more work and runs on very
> limited systems, However, it can be implemented as an optimization)
> which is my plan.

I think unless you can do it without these HW features (excluding 3)
don't bother.

> I am not sure how CCA deals with that, I’d expect they have a lot of
> constraints on CPUs/SMMUs and DMA capable devices on those systems.

3 is not supported. The entire S2 is permanently mapped and doesn't
really change alot at runtime. No page faults, not sure if the RMM
private/shard conversion would require BMM..

Jason

