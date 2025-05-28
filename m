Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D351C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sw0Byg72hBRQWtcnrsSfNt0jS20fOP7dxhnprvtsu5Y=; b=4Hv+ufA9oWfHZoZ7LAeoXDiqey
	c3f4c3km6tpnwIcg6v4C3caXUGgk2uXpF+JSkCOhhUNKJNPIYn+v0kMbx5Rm1pHMQXDlnKE858k6u
	3ZCLUvm5Uo+tQzXxE2rh3uLEZh193wItvdv5v42dFB0PEhsfJKHAVQyyKYpVYf4A1iCaNwCkRTWk5
	fawjtiRWDAbwmbCSYJDlQOTffpkU2B27pkk+IjN/D4dYz1thub404/DFPO5jhC7BXJAJ6jNnttzE1
	ZpPDVQV20Oc8arhJYaNTp2niMhk4IQHaFyBzwLMW4bdJqEbT1wQR3dMaPD1HdPWyFkNBrXOi67gUv
	gjVtn8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIEn-0000000DUQB-0dIV;
	Wed, 28 May 2025 14:58:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKI8M-0000000DTZO-2TAW;
	Wed, 28 May 2025 14:52:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 477DE1A2D;
	Wed, 28 May 2025 07:51:38 -0700 (PDT)
Received: from [10.57.94.142] (unknown [10.57.94.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB6363F5A1;
	Wed, 28 May 2025 07:51:52 -0700 (PDT)
Message-ID: <70f0abde-24a1-4016-9a69-cc341e9ef6af@arm.com>
Date: Wed, 28 May 2025 15:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
 <20250508123046.GA3706@willie-the-truck>
 <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
 <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
 <e1ff054e-bfaf-48d1-9d6f-46ea73d09ac9@lucifer.local>
 <c5df4570-84a6-430a-ba49-81cf75930c16@ghiti.fr>
 <a42e05b9-7568-4ebd-8797-c635c07d1884@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a42e05b9-7568-4ebd-8797-c635c07d1884@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_075158_665471_AAA5E462 
X-CRM114-Status: UNSURE (   9.61  )
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

On 27/05/2025 10:37, Lorenzo Stoakes wrote:

[...]

>>>
>>> And who would you sensibly propose for M's and R's?
>>
>>
>> Ryan is definitely a M, I would be happy to help as M too but if needed, a R
>> is enough for me.
> 
> Ryan understands this area better than I do, so I would say it's up to him as to
> whether he thinks this makes sense.

I'd certainly like to be an R. I'd prefer not to sign up for M right now though,
unless there is nobody else willing to take it on.


