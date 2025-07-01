Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E06BC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0s5vP/twFnifWEx4+Z+Ywh5kGebPT9a2dYHeXSIkrQ=; b=GGeRqjcatHeEiGjWMvbMTtfHNp
	99bUGt5nqvHhIe/KwBcSgsKsbtmHLC03Vf6BzDUaLrEXZ4wyPdtOumAeblyZSxd/aCLMGwwMEJQAE
	UhVFGOyEti+Pt2NzBHzLf61Lf2WuT8im1KGClPHfDvZ33bePmB+c9NyoRFA/d3BzUk/6QJ8jUT+h1
	UWEBThcBUnJUysiW2T+Q0OjvGqUDgT0ZMMUXHeU8TcVsb8aEXZbDZa1ikXAxjig3xOV3Vb+EgUAgx
	41WmOPxCrr0Ztlu70lSP9I3kUo5kRrcxCwvfymteWbFVIMMf8284WoguHRHopYfSRxU6wwLbXAG9R
	GGy2o3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY4t-00000004jKg-2fDo;
	Tue, 01 Jul 2025 10:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY2X-00000004iyK-3Y9B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 10:16:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C27FC1595;
	Tue,  1 Jul 2025 03:16:21 -0700 (PDT)
Received: from [10.57.84.92] (unknown [10.57.84.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 183133F58B;
	Tue,  1 Jul 2025 03:16:32 -0700 (PDT)
Message-ID: <8f59f1a5-64e7-4444-a8b6-d399e2822829@arm.com>
Date: Tue, 1 Jul 2025 11:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/43] KVM: arm64: vgic: Provide helper for number of
 list registers
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-13-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250611104844.245235-13-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_031637_922888_FDE91E0E 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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

On 11/06/2025 11:48, Steven Price wrote:
> Currently the number of list registers available is stored in a global
> (kvm_vgic_global_state.nr_lr). With Arm CCA the RMM is permitted to
> reserve list registers for its own use and so the number of available
> list registers can be fewer for a realm VM. Provide a wrapper function
> to fetch the global in preparation for restricting nr_lr when dealing
> with a realm VM.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com


