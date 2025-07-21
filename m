Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5E2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmub9aFjvw/tMVjGdDoWaTJsjARmDuiOsiPPDj+ZHGM=; b=XJZil3rqJdXLz3P5oaOXN3+Wxs
	eroJX+nQmKtyO9tnMDoBW7Po9ZKOtiQ2zdakOReoZEfDwOi0lCf2eS9YKRz4QbE8yjo3rNFJ5SLd4
	V+a/dY53ZDcWXSAUTQivs8PJ0DoG8y7TChEzukyLjLB7hfga/bkFNAJC377QUVWSIZhGUbe9mxj8q
	KfT5xbz2nloDabkJpsXmM+aJDtVlujfD+TGT8tuu164VY4hCKrgnHaXK3/ev1TnELgxibZwSKwuxN
	ve5xYbmwKjdSjvV8Nn96cbBwUvym2RY7KeMQbzEW1GldOfX6EXEPL1PLmvd/Gu5hKvr4jB1n7WmFm
	yUQMgtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udufu-00000000MrE-3szm;
	Mon, 21 Jul 2025 17:51:42 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduI8-00000000JiX-2sqi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 17:27:09 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 86BFD21175B2;
	Mon, 21 Jul 2025 10:27:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 86BFD21175B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1753118827;
	bh=xmub9aFjvw/tMVjGdDoWaTJsjARmDuiOsiPPDj+ZHGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pC94KJnzta6iMqNqUYaCSQV4FmFEG6muwIv+Ul3Kml2rl8YX+6COamsbOVfmaeiln
	 iA3hgjNLDefPnXXkNEDhAmDXqGYB2jUUkDhsE5ZWQKN3AibF1VwuiE4kTavpYvRm6G
	 jSP0Y0HxHnQQ0/YFG0mMKbyV/YL6pYQM+XswYtJo=
Message-ID: <9f39e539-3216-4f5d-819f-9500f76a0154@linux.microsoft.com>
Date: Mon, 21 Jul 2025 10:27:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kvm, smccc: Fix vendor uuid
To: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Jack Thomson <jackabt.amazon@gmail.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@arm.com, arnd@arndb.de,
 wei.liu@kernel.org, mhklinux@outlook.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 oliver.upton@linux.dev, kvmarm@lists.linux.dev, roypat@amazon.com,
 Jack Thomson <jackabt@amazon.com>
References: <20250721130558.50823-1-jackabt.amazon@gmail.com>
 <86jz418rh3.wl-maz@kernel.org> <aH51jfOmPfF3XEke@willie-the-truck>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <aH51jfOmPfF3XEke@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_102708_755979_BFFE926A 
X-CRM114-Status: UNSURE (   9.27  )
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



On 7/21/2025 10:14 AM, Will Deacon wrote:
> On Mon, Jul 21, 2025 at 04:59:36PM +0100, Marc Zyngier wrote:

[...]

>>
>> Irk. This is remarkably embarrassing, and needs to be addressed ASAP,
>> before 6.16 ships. FWIW, I've just posted a quickly whipped selftest
>> that shows the problem[1].
>>
>> Will, is there a chance you can pick this up and ferry it to Linus?
>> If you do, please add:
>>
>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>> Tested-by: Marc Zyngier <maz@kernel.org>
> 
> Sure, I'll grab it. Thanks!
> 

I'm sorry for that, apologies for screwing things up :(
Very much appreciate the fix and the test. I clearly missed testing
backward compat. with the old kernels.

> Will

-- 
Thank you,
Roman


