Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1921CD5BA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkpOCPoBnoxbPm/dHfe1tXIDImknpNkGj0HDeligwvE=; b=r5kNVe8844E8QLfUJeZ5ihhXRw
	+IjHNuHVLmqLcAyuF8GTQYRfPsMvtzw4eWSD8RnRkjyR3Ah1UzfM8ritcrCw2UiMAj/AnFRz0UuZ+
	tK3r1XjfiGgYBG9GbHfZX8Udz7luEsKJPCLoA4vIINCFJNyi2XD2SdHCbyNzgbhYgEKlTrWCtW9VS
	umd+4wLhOhjFrO5klI7ONdKqnPb1AihA07u1TQZhSe7B7V4hWhTxusJJk4dSLrJ+3yuJnIAST1m/P
	cZ+II0UL3x8XGy/mVVelJI4ZvWZCJ+LupwpK4n3kw3yT+DtBL/75hDZqdHGE/QUpMVF+jOcAFxhyt
	K3pgOxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTG8-0000000A9kK-0uDY;
	Thu, 13 Nov 2025 09:04:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTG6-0000000A9jj-0Zsw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09A6041E58;
	Thu, 13 Nov 2025 09:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C15DC4CEFB;
	Thu, 13 Nov 2025 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763024688;
	bh=g2ApyTbvFn+O4SPpXvNk6aXSXJ9xS0/6+BQ/w0ijal0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cmvv58qqtEpaPmX3c+SScMrcSzaga0Px1RP5KQeXSey4+8xsMlLqfGCnhbrKKZW/7
	 1x1IZ5xh793XC0Qc6GHi023xk+rgYW18Lr0xRCEBskq9ppRl11XNfacbYg18/w3gFp
	 07YVZ1tcjj6/ehzVskFNjBsUZu82L7XE4m3p3DBARMCShxXawh7Z0cBzj7YN0zDcv9
	 Bs+OsfW8jBuu2hv6YWt6955Q+Fs5eIUKQu0ykTlRVZno4XKwbXRJNuKGVGz7tl4FIG
	 u1+Wc4NMhVn96vKl45u/9MW2eIjXsajCrvLfmQ1fBWAuBhqprSdMtCwp4TOaNaDvto
	 4iQF6JIsdz51g==
Message-ID: <a786cb49-43f6-408e-af32-f05dabff36f5@kernel.org>
Date: Thu, 13 Nov 2025 10:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm/huge_memory] adfb6609c6: xfstests.xfs.050.fail
To: kernel test robot <oliver.sang@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Lance Yang
 <lance.yang@linux.dev>, Beleswar Padhi <b-padhi@ti.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, Jan Polensky <japo@linux.ibm.com>
References: <202511131537.1a31ee77-lkp@intel.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <202511131537.1a31ee77-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_010450_204018_72E0C38A 
X-CRM114-Status: UNSURE (   6.03  )
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

On 13.11.25 09:23, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "xfstests.xfs.050.fail" on:
> 
> commit: adfb6609c6809e107ded9a1cd46f519c882e64ea ("mm/huge_memory: initialise the tags of the huge zero folio")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on      linus/master 24172e0d79900908cf5ebf366600616d29c9b417]
> [test failed on linux-next/master 2666975a8905776d306bee01c5d98a0395bda1c9]

Fix is in the works, discussed here:

https://lkml.kernel.org/r/20251108191948.684586-1-japo@linux.ibm.com

-- 
Cheers

David

