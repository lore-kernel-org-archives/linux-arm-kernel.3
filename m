Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F9EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+HtW+rIkvK86S37pH1rRGYPaW4xBUhocHkisjbxe7Y=; b=w/TYMpqNyf2iqbRqLhax0mdjoj
	bD+FzpEuqYZnW7jHO3H2w+wTlY+coPxwhKwZY2QkzGMF+kld+xo3M3nd1ufur9Uu7NNsqjggDXqAe
	znN/VRvF4j6uvnEhoqToiJ6re5jys9tItPqPxIenNsoD7vxw6D76QbkCFW45G1FdwKYvbLse2OMyc
	sNnU6SRCm0LFx8phMwj2zwfGmBBZntFK4tGr64A1ruawkQeUmkxZn4Op63RuiTmeb4d3O1N8u4/Ju
	629k1/n4nsQnZ+qXWkE550t2vVvmyWZrV8hhKJ9tYKFm3GW8MoH5lXFEGR5z1xQzSDzDuEwn7zI/m
	W4thfHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9liR-00000009svS-3GJW;
	Tue, 29 Apr 2025 14:13:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kgb-00000009jU0-1fRk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:07:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27B861515;
	Tue, 29 Apr 2025 06:07:36 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46EE43F673;
	Tue, 29 Apr 2025 06:07:41 -0700 (PDT)
Message-ID: <8dfaa919-228e-4a5c-abbc-efa1a19ae92b@arm.com>
Date: Tue, 29 Apr 2025 14:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/42] arm64: sysreg: Add registers trapped by
 HDFG{R,W}TR2_EL2
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-10-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250426122836.3341523-10-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_060745_480404_E14F0E45 
X-CRM114-Status: UNSURE (   5.56  )
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

Hi Marc,

On 4/26/25 13:28, Marc Zyngier wrote:
> +Sysreg	SPMCR_EL0	2	3	9	12	0
> +Res0	63:12
> +Field	11	TRO
> +Field	10	HDBG
> +Field	9	FZO
> +Field	8	NA
> +Res0	7:5	
Nit: Trailing whitespace. There are a few other places on Res0 lines. 
Maybe your generation script could be tweaked.

Thanks,

Ben


