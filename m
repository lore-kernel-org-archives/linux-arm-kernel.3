Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2903ED2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94HTcG0mS3EnXGF9suXhL3MTb32I4uT6j8xnAYATUI0=; b=GxIq1H3FQVDTg/VcO7/qAa1E47
	mgX5lWOpwoYYZ9qAG/+k6m0VCpRFK3wshNk3ynTry21yWqzw+2FJtuwhDHeFq0duk4PWUCrjAtUq+
	Fj8U48vOvEFvwgWC+m8pSO4CMmp1XwIZUe1RpkNLrQWE2DqQwIDfeJkxDfit6B2Frrqi24EqGRa/3
	4lLsFLV6QCFL/o8AaXkEK69B5u5OPDKcR0IoK3cSl6mYVCMISc8o5NWJ1j3l6ArqULRiJ8IaXw+If
	WynUQ9adj4IYa28TmrDGCp3V8dJdcUm4BzU5zq+767kC8XCdRYvLG1EiQR6uXyXRTRigX67MR4/Fi
	gjG7dnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHps-0000000FLxt-3L4h;
	Wed, 10 Dec 2025 10:54:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHpq-0000000FLxT-0yHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:54:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67B75153B;
	Wed, 10 Dec 2025 02:54:07 -0800 (PST)
Received: from [10.57.76.190] (unknown [10.57.76.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E04893F762;
	Wed, 10 Dec 2025 02:54:11 -0800 (PST)
Message-ID: <d3e946ec-787a-424a-9a7a-f04aeb490ba6@arm.com>
Date: Wed, 10 Dec 2025 10:54:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/24] arm64: cpufeature: Add cpucap for HPMN0
Content-Language: en-GB
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-2-coltonlewis@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251209205121.1871534-2-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_025418_314408_B2A57ABF 
X-CRM114-Status: UNSURE (   7.17  )
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

On 09/12/2025 20:50, Colton Lewis wrote:
> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
> counters reserved for the guest.
> 
> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
> because otherwise not all the appropriate macros are generated to add
> it to arm64_cpu_capabilities_arm64_features.
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


