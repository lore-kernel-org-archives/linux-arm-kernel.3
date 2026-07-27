Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E9BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvEhKcJ2ZVZIzvdPXLbXyAox3SL2pO0W3068N1UeoMg=; b=zikQSvolNbCmUDkMkBKAxQaROx
	hNeRttH3UUUTiTE2piyubTVTlMrBQ0VEOzmXa/rC7zHKr7FbYl0C940cuEnIDovIsL0FODCvf7Nus
	R9OpPfWXy42rhmQTYKVR0TXkipFyrPx5aaSVvtvOtH9Ex77GigXJLl1qoflC7h0yUXmoy2sdtmN1o
	DPJ/BR1s9S9U+8OBVrvsn4sVAjtX5FzacxBm9XWw5/pc1crPQztqFSka9BNcC56fLzbE6OaSzZ2Fr
	Te5Qw5oiKglsboUvpb/O4iXz1FgEIr6MujQrSZ3pLMli8TMqhpQqrHpmuhWoOK7oJA9EW53HoIaz8
	3tRO5PvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIxu-00000002Wwh-0R2s;
	Mon, 27 Jul 2026 10:53:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIxs-00000002WwH-0mTi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:53:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0307D143D;
	Mon, 27 Jul 2026 03:53:39 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ABBF3F86F;
	Mon, 27 Jul 2026 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785149623; bh=7WpwP8RisrxnArjb2LK5kEATiDum+IBvXOvgLgkJm6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sbtuWqmQYn9269wgUse/Rtj71CbSRnD6TElxQDFKMGbYdmWesPYBJdvdbR3GzHBB/
	 AmMc/nUI1r5ExsyP52QqsPN9VsEK3TXB43MKsg5v4GzUvcRu/7uHw8fjy7m0jbsQmE
	 QETa8MrZxMizcuWF/YcIaAknmugdqFxzrgikFxio=
Message-ID: <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
Date: Mon, 27 Jul 2026 11:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
To: Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, jyescas@google.com
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <amYIuhYenP4-qHyV@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_035344_281050_C57A6607 
X-CRM114-Status: GOOD (  16.41  )
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

On 26/07/2026 2:16 pm, Will Deacon wrote:
> On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
>> These two patches add support for a new "arm,instdata-override" DT property
>> that enables the override of the instruction/data attribute of incoming
>> traffic to Data by setting the INSTCFG override bits.
>>
>> It is intended to be specified when the smmu can't guarantee that these
>> attributes are provided correctly from the client device.
> 
> This is going to need an in-tree user and a much more detailed
> description of what is being worked around before we consider this for
> inclusion.
> 
> In particular, if a particular client is emitting data reads as
> instructions, then a better work around would be to avoid mapping its
> domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> limited description provided here.

Unless it's also emitting the privileged bit and thus falling foul of 
the implicit Unpriv-W -> Priv-XN rule, but then we also have the means 
to deal with devices which actually do that themselves (hello pl330...), 
so that would seemingly only leave the case of some innocent piece of 
AMBA-interfaced IP which doesn't expect to need special attributes, but 
the system integrator has gone out of their way to tie the AxPROT bits 
to some wacky value, which I would put in "erratum workaround" territory.

Thanks,
Robin.

