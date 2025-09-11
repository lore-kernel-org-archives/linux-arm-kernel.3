Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFAACAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4SQGKIlkipINvl+R90RuJAQdt11TIrJOgV4rbHAwlI=; b=Y11AY7FlsAppyGOKEavThHhX9Q
	XlWMqOYgf+y2vgTrlpFbBXM/ZFcIGyWXKse9wwEZFdWeyCUJ5Pii8/OTZdulzXyS+ImvDdpGVc3SF
	TKq0pLCX7oCcU0lxs5LPtGfyc9UoqU1mq8KOLF4z3GT+EcgvwqYKLtj5IuD2W4GaIRUD6AFPTx21i
	uma5WGzBd0izBLwXL+ls5sMS/BLS/c6f5vZ68vywDxFS4hbOyieR40s/Fgw1BQLhCCtPXkmtGF+V0
	LdwzR22bnNjaDvGU3+rpgb4LE76/Bt70DDCXPApgAZ85ljDULK3RCkuYEU3KQKEmsXo3SoGHxYDSR
	Wor5O48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmUR-00000004s5s-1vuP;
	Thu, 11 Sep 2025 18:57:51 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmUO-00000004s3i-0CdW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:57:50 +0000
Date: Thu, 11 Sep 2025 11:56:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757617064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4SQGKIlkipINvl+R90RuJAQdt11TIrJOgV4rbHAwlI=;
	b=I6QD9dGiUYM3bhHavuuokGgkfn2aw33ufD+qMrk74tUf/3fweSDpi4SADE59D35WlSLTsw
	acyEHKnhvh93iLBKEofeNyCplFpeBZ4i3N4UtjriguIONPSw6IPT6s6YHc0Hn7OrFw/61y
	nkVQuprWrsyVpLiuisZxOC4R9ithJcY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, pbonzini@redhat.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com, roypat@amazon.co.uk,
	kalyazin@amazon.co.uk, jackabt@amazon.com
Subject: Re: [PATCH 0/6] KVM ARM64 pre_fault_memory
Message-ID: <aMMba1r3AVdC9cQw@linux.dev>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_115748_741852_A0DF10A4 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Jack,

On Thu, Sep 11, 2025 at 02:46:42PM +0100, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Overview:
> 
> This patch series adds ARM64 support for the KVM_PRE_FAULT_MEMORY
> feature, which was previously only available on x86 [1]. This allows
> a reduction in the number of stage-2 faults during execution. This is
> beneficial in post-copy migration scenarios, particularly in memory
> intensive applications, where high latencies are experienced due to
> the stage-2 faults when pre-populating memory via UFFD / memcpy.

Thanks for posting the series. More of a general comment on the UAPI
documentation:

  "... However, KVM does not mark any newly created stage-2 PTE as Accessed."

This behavior is x86-specific since kvm_pgtable_stage2_map() will lay
down PTEs with the AF set. Probably shouldn't have documented the
internal state of the stage-2 in the first place but oh well, please
just update the UAPI description to make it clear this is x86-specific.

Thanks
Oliver

