Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1247AC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sp1kFZZ0O6uT9i63Hix+4jeTVWCdlo9frW6hVcqvPU=; b=oEpfkyUCmBRbRXPHAn8/BZDNBZ
	9PgMR+s+3C6bF+3HQ7OGM34JGroRnHkut4ehtFk2zuKCeEUUnPyqfbJgWxEQOj2p79JHghfYzluiu
	wc2gRbPcicRg2Eu3EP1aPPMgt09IN8Yh+23N3gVT7wYveJ4jnjEoAdEBQJYoPPB0SrFdD3CNnH1N+
	TEKTRyRffzLTK0YaAm77N1vpEpGj8m5vOXv6UAfoRA9InKH9WOtOI8160OVZNS/s/1MBb8ETdkh+D
	nXOd+5Ouzz+01AXVMNRUQ2ZmetBzztyXpHGoULP1b2R8WL6eJ9kdqYnfdTaOJoq8H4TxpIjA3b2Uu
	H5KtWv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xNZ-0000000GEw0-3wmW;
	Fri, 11 Sep 2026 09:17:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xNZ-0000000GEvq-2CEM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:17:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD8D360213;
	Fri, 11 Sep 2026 09:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461631F00893;
	Fri, 11 Sep 2026 09:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789118224;
	bh=9sp1kFZZ0O6uT9i63Hix+4jeTVWCdlo9frW6hVcqvPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbxSeSbZZUU0Ne8WJuZalWlgBdFvk4xRMp9Ec5R+eTdN31MG6FizPvealsA8XcP1v
	 zNS5ieOGImLE2jalyPZo4vsiTdEfdUkdB7GmVkBOf1vxa4SHkKXsGBTvg0avzvhGGg
	 deKE1DrgNkIX1pL2e9ZZ9QtOCasm9rCQZwiwcuv9+jAyGAYazY/1fZfbAtrB+Zh3ej
	 NWcg19p2iAlvNl7WI95KE38yDNvPQOt8/ixv+HzhfDYf0JZnCUmE7FuSKFKpOvbPZu
	 vwVSPh+NomvlJ4fIvsfBXc71GY1MwJdG0NzylODt5gOCTZANrP/D3O723K3yAQCT+4
	 JhYiRwBiB3F2w==
Date: Fri, 11 Sep 2026 10:16:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Subject: Re: [PATCH 0/8] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Message-ID: <aqPGWNxm0rOMRaXw@gremlin>
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
 <CA+EHjTw=7M+ac5UCfM5yPmuX8RuqZN08TLfXAmTLbQgmuhNWtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw=7M+ac5UCfM5yPmuX8RuqZN08TLfXAmTLbQgmuhNWtw@mail.gmail.com>
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

On Thu, Sep 10, 2026 at 07:44:25PM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > This series implements the KVM stage 2 page table pre-faulting feature for
> > arm64.
>
> I know there's likely going to be a V2, but FWIW, I tested this series
> as follows (finally managed to get protected mode running on my Mac):
>
> QEMU (arm64, -cpu max,pauth=off):
> - Protected-mode host, boots non-protected and protected guests
> - pre_fault_memory_test on a non-protected host, VHE and nVHE, all 13
> guest modes
> - nv_pre_fault_memory_test with kvm-arm.mode=nested
>
> FVP (AEM, FEAT_NV2):
> - nv_pre_fault_memory_test with kvm-arm.mode=nested
>
> Apple M4 hardware, running as a KVM host at EL2 under Apple's nested
> virtualization (nVHE only):
> - pre_fault_memory_test, anonymous and anonymous_thp backing, over the five
>   guest modes available there (the IPA is capped at 40 bits and the 64K
>   granule isn't implemented)
> - with kvm-arm.mode=protected, pre_fault_memory_test skips on
>   KVM_CAP_PRE_FAULT_MEMORY, so the pKVM exclusion holds on a live pKVM host
>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> (happy to retest again when you respin)

Perfect, much appreciated thanks! :)

I won't carry the tags forward to v2 just in case anything breaks there, so
appreciate you taking another run at the v2 also thanks! :)

>
> Cheers,
> /fuad

--
Cheers, Lorenzo

