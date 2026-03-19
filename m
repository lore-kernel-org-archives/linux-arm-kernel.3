Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A24109023C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la6q21dzl9cdZ+ydvl7xfiG/4fkdIzeR4iCGQNsyqs8=; b=ls4RG0R1v7i3M4/l1ObKvUDY+J
	Jt4I2oQtr8BIpRU3QSmS+/gxkwmBrMwnd0MvaV3kGFDZeME4qp3Ak0Bw/sd1cFrM1oqj3LfXlghIa
	QHEpj6UrWVvwLIDQgY5LY4sOGdmRjJzfIrQPyvE1dAByLicG312CDn1eJUnzoL8X8qhiDAm2olNID
	HQtm6dTGo9/3oZ/x5YRAii/lL4UBJSrqas1abbiRgbEzzx7dQLM9mfcWUgR+Tt9UrOx06yQ121klE
	mcb46IeJXDEEzI4aBXkzrSqGWmMsYDT+sXRB084GtMe1Vl3osknhCVCFYJKIGPDqYNRuanXms9YPp
	TDOj1cHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FMO-0000000Av7V-0M4y;
	Thu, 19 Mar 2026 15:32:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FMK-0000000Av76-4Bcr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:32:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663831A25;
	Thu, 19 Mar 2026 08:32:20 -0700 (PDT)
Received: from [10.57.59.172] (unknown [10.57.59.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7972A3F778;
	Thu, 19 Mar 2026 08:32:25 -0700 (PDT)
Message-ID: <7fe97d37-b6e4-4fe7-a871-b4d67763079a@arm.com>
Date: Thu, 19 Mar 2026 15:32:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: errata: Reformat table for IDs
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, daizhiyuan@phytium.com.cn
References: <cover.1772125743.git.robin.murphy@arm.com>
 <3adc16d4d035cf76803e706e325822b99c13e977.1772125743.git.robin.murphy@arm.com>
 <abwNg5LY9Ll235vS@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <abwNg5LY9Ll235vS@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_083229_084951_75E02BE8 
X-CRM114-Status: GOOD (  14.89  )
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

On 2026-03-19 2:51 pm, Will Deacon wrote:
> On Thu, Feb 26, 2026 at 06:10:20PM +0000, Robin Murphy wrote:
>> We have some inconsistency where multiple errata for the same component
>> share the same Kconfig workaround; some are one ID per line, some are
>> smooshed together, and some are entirely separate entries. Standardise
>> on the single entry, one ID per line format so that things render nice
>> and consistently in the HTML docs, and it's simple and clear to add new
>> IDs to existing workarounds without churning the table too much.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   Documentation/arch/arm64/silicon-errata.rst | 44 ++++++++++++---------
>>   1 file changed, 25 insertions(+), 19 deletions(-)
> 
> I think we're better off doing this at -rc1 in the Arm tree, so we avoid
> unnecessary cross-tree conflicts for something that doesn't really matter
> that much in the grand scheme of things.
> 
> For now, please can you send the SMMU patch on its own so that I can
> pick it up?

Yeah, that's fair enough, it's not like it's a real dependency that 
would justify taking the SMMU patch through arm64 either. v2 sent, and 
if I haven't forgotten all about this by -rc1, I'll rebase and re-send 
this one then.

(And I did rather expect that patch #3 might end up getting dropped, 
hence keeping it separate at the end. Oh well, worth a try.)

Cheers,
Robin.

