Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27446D3E76E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiX4YaZsu72v5286rzvVlyrVkIKfaRKOGwhHpvzjTVs=; b=kZnveCITM9/R0s9gWN3ikmdiBk
	v/SGygCrMB4rCsuWPdr1yU5wmOszpsmmuyqAM8o98mjJvaA0jfSv2ynS+mmmaAnTrJ+1kSNwl1mBj
	XwMQL+XXPoV2bLxzGoJMhGJbWS0Ju1i962O5e8sVferPWCzqN+8G6Nck+nsl+1tCOhNuSS3kC5HDQ
	c04Iru5UNaJDZFRbHqGYCx9eTlpMo/24Yjoz65sr4hU0/2YadLEccbcv76jxZzQAEeVJomGDaSY62
	jGsMEf/dz7bOVeAaU+rjfb887uJP3iqyxr33AOvq+yD/SIhmamvnTt2Jy1w0W+i6c5W5qKkI/v0ks
	mMJxIsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTP5B-0000000FkcS-37sZ;
	Wed, 10 Dec 2025 18:38:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTP55-0000000Fkc6-3eMZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 18:38:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999FD153B;
	Wed, 10 Dec 2025 10:38:22 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 735EF3F762;
	Wed, 10 Dec 2025 10:38:29 -0800 (PST)
Date: Wed, 10 Dec 2025 18:38:27 +0000
From: Leo Yan <leo.yan@arm.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 01/35] arm64/sysreg: Add new SPE fields
Message-ID: <20251210183827.GA3920451@e132581.arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-2-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114160717.163230-2-alexandru.elisei@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_103831_968265_A4246042 
X-CRM114-Status: UNSURE (   6.80  )
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

On Fri, Nov 14, 2025 at 04:06:42PM +0000, Alexandru Elisei wrote:

[...]

>  Sysreg	PMBIDR_EL1	3	0	9	10	7
> -Res0	63:12
> +Res0	63:48
> +Field	47:32	MaxBuffSize
> +Res0	31:12
>  Enum	11:8	EA
>  	0b0000	NotDescribed
>  	0b0001	Ignored
>  	0b0010	SError
>  EndEnum
> -Res0	7:6
> +Enum	7:6	AddrMode
> +	0b00	VM_ONLY
> +	0b01	BOTH
> +	0b10	RESERVED
> +	0b11	nVM_ONLY
> +EndEnum

Not sure how to select the enum names, but seems names above don't match
well to the definitions.  How about:

  Enum  7:6     AddrMode
        0b00    VA_ONLY         // Virtual address only
        0b01    VA_PA           // Virtual and physical address supported
        0b10    RESERVED
        0b11    VM_PA_ONLY      // Physical address only in VM

Thanks,
Leo

