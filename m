Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D113EF588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOu+vVFihCEmkjozS1KokTNi3VqIWrSsawSq2Kx8kE0=; b=wv2YeNNYAdRLWkL+Y9lAcGbins
	ideo6BvucbiOlYE8ZGLob+hVD1ro4QrAUiRxrLTx/6V+nyluIx201qbEQIU2GsYy8Rap10F/qz21e
	AzoyTLIoUc+pi1XTpEOMvmHbWWW+cYS36dBKG8uGyu5KXEMV75IhGoY227raWU+tKAqTeA0F1Auh9
	vm4VD+fs+TU0YpjIiFmtRlUkLI+hdbhaz+8wQXA/sgOS1DDYn/bwGOB3pwljQWoS0BgUanqgJu+ze
	SU3MuUp4Zh9ymqvPYU9FJrA7oaQBneE4wPhzxxck2RNCK+oPwYQ1usZ6ccPGoGw3POmjYP6he8/gF
	kEIQpLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqUF-00000007FRf-0Mlt;
	Mon, 20 Apr 2026 15:24:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqUC-00000007FPy-1ns7;
	Mon, 20 Apr 2026 15:24:33 +0000
Received: from [100.79.96.139] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 299A120B6F0C;
	Mon, 20 Apr 2026 08:24:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 299A120B6F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776698671;
	bh=gOu+vVFihCEmkjozS1KokTNi3VqIWrSsawSq2Kx8kE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KWQlqxfTN40wNb3WVRA8ZgJcOVGUOlHVivHDV48JAR4Mc4i1uVH+A2ksT0mVv3YYj
	 YMV0myVe7co405qvMygbvAM5iDfHr3QoX0SNl3/3tn9NpJfJuNBdYalpKNzUZs9R67
	 4X9VGzFkvBK7YysNuDzpZrygb91w51etcxSB+EPs=
Message-ID: <35364b2e-4f28-447d-b77c-6b3726c4bce3@linux.microsoft.com>
Date: Mon, 20 Apr 2026 20:54:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] Drivers: hv: Kconfig: Add ARM64 support for
 MSHV_VTL
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-12-namjain@linux.microsoft.com>
 <SN6PR02MB4157FEE5578344625418BFDBD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157FEE5578344625418BFDBD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_082432_579675_BB6C6766 
X-CRM114-Status: UNSURE (   7.02  )
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



On 4/1/2026 10:28 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
> 
> Nit: In keeping with past practice, the "Subject" prefix for this patch could
> just be "Drivers: hv:"

Acked.
I am also planning to change other subject line prefixes, based on your 
earlier suggestion:

mshv_vtl_main changes - "mshv_vtl: "
arch/arm64 Hyper-V changes - "arm64: hyperv: "
arch/x86 Hyper-V changes - "x86/hyperv: "


Thank you so much for doing such a thorough review. I really appreciate 
all the help and guidance.

Regards,
Naman



