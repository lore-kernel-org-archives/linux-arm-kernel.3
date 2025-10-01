Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF13CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvL5m6qKEdfPWV8JJSTrl6zR9uyZlkcwGsX8E7ly+d4=; b=N+h3bw8YkJsZuJyorwX1CGyJ/W
	pLpXDY5IREekbp80zNrscrSUPHjThIcSDXGuX4CKCDJUlcZaEHx364Zr5qbmHTluxZltmZrXKdCXY
	7sDd9hDARu+f27PAJ5VsboppGX4NEo5b76t4pKsM/0RFepNEVF9X7CO7RZwQhzdMMeK3bFil5Ea91
	MfgntQQ6OL65A+g60pFUsbaS4sjsyC5T2PZ6SyLh/rrVpy7kcV8WXn89DndhhgfSPDoDGGfDsBIin
	by10dX3fCpzimICQ2jzAV/22MiugaeTlxKY6h0b/o54uK5TvZfvZMSpbe/+9Z7c++AimorSlfhhNv
	DB9inAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yc3-00000008N70-1KRT;
	Wed, 01 Oct 2025 15:19:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yc1-00000008N68-3JRI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 15:19:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DB241424;
	Wed,  1 Oct 2025 08:19:16 -0700 (PDT)
Received: from [10.57.0.204] (unknown [10.57.0.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5E213F59E;
	Wed,  1 Oct 2025 08:19:18 -0700 (PDT)
Message-ID: <765f8a3e-2bdd-4352-ba89-99ce3dbc6e4c@arm.com>
Date: Wed, 1 Oct 2025 16:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/43] kvm: arm64: Don't expose debug capabilities for
 realm guests
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-9-steven.price@arm.com> <86ikgyzrzj.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86ikgyzrzj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_081925_881323_331130D8 
X-CRM114-Status: GOOD (  10.75  )
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

On 01/10/2025 14:11, Marc Zyngier wrote:
> On Wed, 20 Aug 2025 15:55:28 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> RMM v1.0 provides no mechanism for the host to perform debug operations
>> on the guest. So don't expose KVM_CAP_SET_GUEST_DEBUG and report 0
>> breakpoints and 0 watch points.
> 
> What is the guest seeing for the same things?

The number of breakpoints/watchpoints is configured using the usual
architectural register ID_AA64DFR0_EL1. So the VMM can configure the
guest as it pleases to be able to debug itself.

Obviously CCA is about the host not seeing into the guest so debugging
the guest is generally not permitted.

RMM v1.1 should provide some mechanisms for the host to debug a realm -
but this would also change the attestation measurement so needs buy in
from the guest's attestation flow. I don't think the RMM API for that is
finalised yet, and I certainly don't have any Linux patches.

Thanks,
Steve


