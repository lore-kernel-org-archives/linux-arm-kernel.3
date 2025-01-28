Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E8CC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rRnUf2C4qGu4mG0eUm02gORC0+DK73TfFhmB10CU5c=; b=rN9czaZ2rqUnm7mlGtOxCsMXHt
	RWsyPeXoylareFGXdYCHISDzgPODWuhDl0MlyHyduD9DsMo2osLdVEMIvm5WGRravvpM59Va4Ie3j
	8HwezWZsAy5m2aWgMOEY3dvw1D4l28bk71sTT7gpUcvpJmZMwsVQbJa09BcIuYkAqhQu//OdxIPJV
	C/EXEyVMinLOd1uDnQk7d+P/zyR6enwzGgcLSc1mAvbCDW8COTZUJTlKVST1zzKpwZk4YTKGiKHNI
	zwO8/hJmkc+CuFMVC8O5uz/b3rcpRVLXrj1n/0a1I6VN/pLlgnJiUfS49VVdHdO5oQL6rLK25JvC2
	39js6RLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoqa-00000005OkH-1AR5;
	Tue, 28 Jan 2025 16:53:56 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcopF-00000005OXv-06FG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:52:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SGqSkU1995400
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 10:52:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738083148;
	bh=2rRnUf2C4qGu4mG0eUm02gORC0+DK73TfFhmB10CU5c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mkjsxEWumD9c27vIqA8NKvaND5tbdd7KQjQo9pR66QIJu5HUWXf6HLDDxp3qx58/n
	 oxUPgWu4CHlreWk3zwpt1KlZD5R/0yxYCkTbPijGwiW2gfGCVtHqD+gVF22RTQOxEM
	 jkOzfjlT4twMd+VXj6NjuPffaDtqcE5Iwm8WlA0M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SGqSYi051579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 10:52:28 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 10:52:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 10:52:28 -0600
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SGqRi4010086;
	Tue, 28 Jan 2025 10:52:28 -0600
Message-ID: <76f9e9e8-dd7c-e783-fccc-0b6f913ce753@ti.com>
Date: Tue, 28 Jan 2025 10:52:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc
 node
To: Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-3-jm@ti.com>
 <8b152f81-0848-4f34-adcb-fee9b4f2fd7f@ti.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <8b152f81-0848-4f34-adcb-fee9b4f2fd7f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_085233_107125_63C2A127 
X-CRM114-Status: GOOD (  12.47  )
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

On 1/28/25 10:27, Andrew Davis wrote:
>> +    mcu_r5fss0: r5fss@79000000 {
>> +        compatible = "ti,am62-r5fss";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>> +             <0x79020000 0x00 0x79020000 0x8000>;
>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
> 
> Newline here.
> 
> Also this should be default "disabled". It can be set to "okay"
> in the board DTS file when the needed mboxes and memory-region
> are set. Speaking of that, where are those patches? This is
> incomplete without them and these nodes will not function.
> Same for the DSP patch.
> 
> Andrew
Yes, by default needs to set the node state to "disabled". This is HW 
description of the wake-up domain components. Memory carve outs and 
mailbox assignments for IPC are a separate patch as it is configurable 
and distro dependent.

