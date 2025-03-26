Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8ACC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 06:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slCF2xs2ElnaTVorgRjJtJXFeYpLhzlPphzcbXRpqBA=; b=icv/QaVf2IRj3MLfe2gWK21m0C
	CBNTG0Qo8Od4Z9COpDGOFfHu1+5hiXbebwJIE1LfSGESjavutnZvMV3YQink0t3ySxCapUcHZBWz5
	lBYVX0fDczS40XiFT/l0y7cvXgBfU4YJAl6r8dqLmw8zrOB5U3Qq7b76GvNc7s9Cd8hs5VGXLdNDB
	b7ksv1jEafJAg301ACzcRxfgjI9EgfPoSmqxTlZU1MovJxS2wXcYrLqZLAPyy9UyYYZtFj3Z9yIvJ
	L30tpmVSYni4x+KAIgBN9AEnAmbkx5qCoKw2wxfQR7JHIb6yb8kUcuPp03RL3eRB4QO7XhGRjbZmM
	U9HQJ5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txK4L-00000007eAb-41um;
	Wed, 26 Mar 2025 06:16:53 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txK2b-00000007e0X-2jd2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 06:15:07 +0000
Date: Tue, 25 Mar 2025 23:14:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742969702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=slCF2xs2ElnaTVorgRjJtJXFeYpLhzlPphzcbXRpqBA=;
	b=OuiqmHTL8r1gLM/KKEIjqAjSmMsNYpkvBf0rF1fapMbUROPNKPJrNCuIniEZweIt2hcbQL
	zVCmBXHOplOtEyzKqjZRA+blDaXiM047RrfHp6qItXfsJFcV6cpMoOiCI/Y01E5Hi1/f8w
	jCLrNhkoLu/Hgj/xfyHkzQiqiV4nuHw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Emi Kisanuki (Fujitsu)" <fj0570is@fujitsu.com>
Cc: 'Steven Price' <steven.price@arm.com>,
	"'kvm@vger.kernel.org'" <kvm@vger.kernel.org>,
	"'kvmarm@lists.linux.dev'" <kvmarm@lists.linux.dev>,
	'Catalin Marinas' <catalin.marinas@arm.com>,
	'Marc Zyngier' <maz@kernel.org>, 'Will Deacon' <will@kernel.org>,
	'James Morse' <james.morse@arm.com>,
	'Suzuki K Poulose' <suzuki.poulose@arm.com>,
	'Zenghui Yu' <yuzenghui@huawei.com>,
	"'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	'Joey Gouly' <joey.gouly@arm.com>,
	'Alexandru Elisei' <alexandru.elisei@arm.com>,
	'Christoffer Dall' <christoffer.dall@arm.com>,
	'Fuad Tabba' <tabba@google.com>,
	"'linux-coco@lists.linux.dev'" <linux-coco@lists.linux.dev>,
	'Ganapatrao Kulkarni' <gankulkarni@os.amperecomputing.com>,
	'Gavin Shan' <gshan@redhat.com>,
	'Shanker Donthineni' <sdonthineni@nvidia.com>,
	'Alper Gun' <alpergun@google.com>,
	"'Aneesh Kumar K . V'" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v7 00/45] arm64: Support for Arm CCA in KVM
Message-ID: <Z-ObUJQn2dGsgSsO@linux.dev>
References: <20250213161426.102987-1-steven.price@arm.com>
 <TYCPR01MB11463C8CCEFEDAF79868E9BBCC3A62@TYCPR01MB11463.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11463C8CCEFEDAF79868E9BBCC3A62@TYCPR01MB11463.jpnprd01.prod.outlook.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_231506_264136_D8339B1E 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Emi,

On Wed, Mar 26, 2025 at 02:14:35AM +0000, Emi Kisanuki (Fujitsu) wrote:
> Hi all,
> 
> I tested Linux-cca cca-host/v7 patch with our Internal simulator based on QEMU (with CCA and MPAM support).
> A panic occurred when starting Realm, but I don't think this is a problem with the cca-host/v7 patch.
> The location of the panic is [1].
> 
> [1]https://lore.kernel.org/linux-arm-kernel/20241030160317.2528209-4-joey.gouly@arm.com
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 44718d0482b3..46ba30d42b9b 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -478,6 +478,9 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);
>  
> +	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1); /////// panic occurred here. 
> +
>  	cpuinfo_detect_icache_policy(info);
>  }
> 
> There was no problem with the cca-host/v5 patch (based on v6.12).
> This panic is caused by accessing MPAMIDR_EL1 when the chip supports MPAM.
> This functionality was enabled when the cca host patch base version was rebased from v6.12 to v6.13.
> 
> I am not familiar with TF-A, but I think this maybe a TF-A's bug.
> Because It seems TF-A sets MPAM3_EL3.TRAPLOWER to 0 during normal guest boot in manage_extensions_nonsecure_per_world function[2].
> However, TF-A does not set it to 0 during Realm guest boot in manage_extensions_secure_per_world function.
> Therefore, a trap occurs against EL3 (TF-A), and it is likely being processed as an invalid instruction (Undef).

Your instinct is correct that this is *not* a kernel bug. It is the
responsibility of the RMM to provide a consistent feature set to the
Realm.

Looks like this was addressed recently in TF-RMM by hiding FEAT_MPAM:

https://github.com/TF-RMM/tf-rmm/commit/7b0874403726d215c40054abfd5d8704049f8dac

Thanks,
Oliver

