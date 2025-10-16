Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A06CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miyDSRpN9AKlKir+gXKesJMd/IlnLzbpzbWk9HDqZLs=; b=AizNomAZlOJ+UDbx7Fq0BlEzkl
	iGQ5GXfo/gz1EG2Iqb3dmhawGyPWpG/2DaK9ZF/S/eupQJreOgbWVElhWkvaZo8miDFyTP2H+mjQs
	kzfO+rGTqc5IDvINzF0NEA+Tm+WkVBtZ3uzwYPtk2N8YEFRv8uZuSAkDUqlinAdr/m7YdLc6SSZD+
	PTv9SHfjP/L0IFwktzV87K2kHpvoax65mJlFjSaFvdvmzQXDQcWbpPp6NeV0cs/RI6pczLb6dY8D9
	duIzJv/8cYGoies6kPQMJeTLuBfNAbUJemUSL1A7SRrNcS53xWk4MRtEi5ketJVVFGe4u/gjxAE+x
	dL5+yh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H8u-00000003ZRE-1OTA;
	Thu, 16 Oct 2025 06:07:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H8r-00000003ZQw-1kpD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 06:07:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC7B1688;
	Wed, 15 Oct 2025 23:07:04 -0700 (PDT)
Received: from [10.163.68.150] (unknown [10.163.68.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 618943F738;
	Wed, 15 Oct 2025 23:07:08 -0700 (PDT)
Message-ID: <b7e2ff40-c84b-4da2-b397-2b186b658f2b@arm.com>
Date: Thu, 16 Oct 2025 11:37:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64/mm: Rename try_pgd_pgtable_alloc_init_mm
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>
References: <20251015112758.2701604-1-linu.cherian@arm.com>
 <20251015112758.2701604-3-linu.cherian@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251015112758.2701604-3-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_230713_517950_FFA76AE9 
X-CRM114-Status: UNSURE (   7.31  )
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


On 15/10/25 4:57 pm, Linu Cherian wrote:
> With BUG_ON in pgd_pgtable_alloc_init_mm moved up to higher layer,

wouldn't hurt to also add "and converted to a kernel panic". I got confused
by this statement and was trying to find the BUG_ON which got moved upwards.

> gfp flags is the only difference between try_pgd_pgtable_alloc_init_mm
> and pgd_pgtable_alloc_init_mm. Hence rename the "try" version
> to pgd_pgtable_alloc_init_mm_gfp.
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


