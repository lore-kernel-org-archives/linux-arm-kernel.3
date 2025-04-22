Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F7C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XZxo2AeYJxskkMsy2OfoTSgQ4u4wqQ7diEhp8U6M7I=; b=lZAeFZOaYhhH5j7fuqjjaTlA2n
	rnfMOHejYoJy9GOta9KNYohkRIxb3iHJ3STTO8K5F1mdfuVlc+wkwGjDP2OWDJw+AKniwKDHyEXsn
	T6xXnI3JQqxxsQB8IJ8nCTaOejzctJ3x01Srcu1ktvwow6XZHUw+46cxNeHn2GfolruhKunPuuD/G
	hZOVutNSj3g+hBWbsxLhnMYy6FM0EQp2VxZzjdtmYTi54q9t8BJ4XBu7wI6/SbrQub2YyQQoh2WIv
	xq5yW8AylRc5FMcvj81Ku2z1F4M0DHZkFC6PjB+tmKlrE52HeL0JyI1bdEcZk5gojnis6YXfMV+M6
	gxqhY7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FRX-00000007go4-0cIK;
	Tue, 22 Apr 2025 15:21:51 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EIa-00000007Qp0-0yUy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:08:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ME8RpZ1982803
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745330907;
	bh=7XZxo2AeYJxskkMsy2OfoTSgQ4u4wqQ7diEhp8U6M7I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XGsUrAIQJRj8tR4/BMi4y7pWWZGFHbJH4/ifILMEtiq9xOXwN0kpAbCSeNV9hvir+
	 Nu4a4SESCEgQBLyiXCkjP+uoAuQktzLUqv+C3LXA1Jj0YE5ajMvCZgTRve1y1Enifz
	 jdxFPyuwD5nJ2wzDq7F+pS8vdFHfBF6B4EyDhgC0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ME8QlI080071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:08:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:08:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:08:26 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ME8MKJ105187;
	Tue, 22 Apr 2025 09:08:23 -0500
Message-ID: <12a748ff-2c33-44e7-b685-fa7d7d0138ca@ti.com>
Date: Tue, 22 Apr 2025 19:38:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Nishanth Menon <nm@ti.com>, Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
 <20250422123748.ugkk2pzp54vzmyii@acorn>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422123748.ugkk2pzp54vzmyii@acorn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070832_361748_6D614C35 
X-CRM114-Status: GOOD (  18.76  )
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


On 4/22/2025 6:07 PM, Nishanth Menon wrote:
> On 09:36-20250421, Judith Mendez wrote:
>> Hi Udit,
>>
>> On 4/19/25 10:00 AM, Kumar, Udit wrote:
>>> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>>>> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
>>>> for eMMC. This change is necessary since DM is not implementing the
>>>> correct procedure to switch PLL clock source for eMMC and we have a
>>>> non-glich-free mux. To remove any potential issues, lets switch back to
>>>> the defaults.
>>> IMO, we need to fix DM  if not then documentation [0] .
>> DM cannot be fixed for only one IP and documentation says what clock
>> parents are supported, it does not have to say what are the issues
>> that come with using a specific clock parent.
> As I understand the arasan IP requirement is that the IP must be held in
> reset while the clock is switched, which is not reasonable to implement
> given decoupled systems like DM and Linux OS.


Thanks , then fix should be extended to sdhci1 as well


>
>>> Then only this patch is ok because as per document [0]
>>>
>>> removed clock by this patch is valid parent for eMMC.
>> The clock parent currently set is a valid parent, but we have non-
>> glitch-free muxes and to avoid any potential issues with these, we
>> should switch back to the defaults. It seems like we randomly switched
>> from the default for no good reason and it has been copy paste per
>> platforms since then, so we are switching back to the defaults now.
>>
>> ~ Judith
>>
>>> [0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html
>>>
>>> Thanks
>>>
>>> Udit
>>>
>>>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral
>>>> nodes")
>>>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0
>>>> instance")
>>>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
> Please follow ./Documentation/process/stable-kernel-rules.rst - this is
> easier to backport if these were to be split into 3 different patches.
> Please do not forget to add Cc: stable@vger.kernel.org as per the rules
> as well.
>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>>>    arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>>>    arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>>>    3 files changed, 6 deletions(-)
>>>>
>>>> [..]

