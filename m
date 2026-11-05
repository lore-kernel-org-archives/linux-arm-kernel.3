Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80258606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yoo7Akqu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H32Q4xeGHAL5HVsaW0o1uw523KoBqyjwpUq440U+kXU=; b=yoo7AkquhQWoIx
	UfYHIoohKtVclkEEf71Xs4ExLxCcGb2P4Ypvi8swGiosMDKhk78JozHZtykULvReLXxy/VoIKtHmb
	trXKhhLjvrf373aWfBbcVbifyXeAFk7NH7+NlRWJt8BaKfR9ceeTliHHjsn4j8dIxM3kuBdWwt+EA
	krH1696RZU8SKskxNXlSCuCoXJ7BqqULy50YmUxz0epZBkcJTNNGXf+uiJ8nq5EspY7kRYNMsqrTA
	QiyZ4XJtJQPZyaLl+0KPhNbPwjqRLGHWPmnHPsLDvBfWqohv6HZC4TpzkHQFnrS2qQ4njBhaFg4Hq
	8zE1fvfKWLOuxwADnE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOs0W-0000000823U-1NoE;
	Thu, 05 Nov 2026 07:35:36 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOs0S-0000000821c-1jUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:35:35 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with UTF8SMTP id AQAAfwAnL5+3MexqjNKBBQ--.28033S2;
	Thu, 05 Nov 2026 15:35:19 +0800 (CST)
Received: from [10.22.77.56] (unknown [123.150.8.50])
	by mail (Coremail) with SMTP id AQAAf8DwS3KyMexqcxb2AA--.18258S2;
	Thu, 05 Nov 2026 15:35:15 +0800 (CST)
Message-ID: <c6af23c8-ee5a-47b7-bdf1-dc853ea388d9@phytium.com.cn>
Date: Thu, 5 Nov 2026 15:35:14 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Add linux,pci-domain-reuse property
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Wang Yinfeng <wangyinfeng@phytium.com.cn>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261102095150.2370959-1-cuichao1753@phytium.com.cn>
 <20261102095150.2370959-2-cuichao1753@phytium.com.cn>
 <8112d8ca-2234-490c-a4a2-c3b01adfbc88@kernel.org>
 <b49779cf-5132-4539-86c2-e4f806b1675d@phytium.com.cn>
 <c0313537-532f-4c9c-86fb-067838829427@kernel.org>
From: Cui Chao <cuichao1753@phytium.com.cn>
In-Reply-To: <c0313537-532f-4c9c-86fb-067838829427@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DwS3KyMexqcxb2AA--.18258S2
X-CM-SenderInfo: pfxlux1drrlkut6sx5pwlxzhxfrphubq/1tbiAQAKAGrrh8gDWQAAsf
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=cuichao175
	3@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxGr4xGrW3Wry3Wry5XrWfAFb_yoW5Kr1kpF
	WFqFZxGrW8Xr18Jr4Utr1UJFy5JF4Fka1kJr15J3WDAF90vF1jqr4jgF409ryUWF48Xw1U
	tFsrJryjvF4kXaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_233532_603356_EDD0BF2F 
X-CRM114-Status: GOOD (  17.83  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 3:23 PM, Krzysztof Kozlowski wrote:
> On 03/11/2026 03:57, Cui Chao wrote:
>> On 11/2/2026 6:00 PM, Krzysztof Kozlowski wrote:
>>> On 02/11/2026 10:51, Cui Chao wrote:
>>>> Add a new optional boolean property 'linux,pci-domain-reuse' for PCI
>>>> host bridges.
>>>>
>>>> By default, the 'linux,pci-domain' property must be unique across all
>>>> host bridges. This property allows a host bridge to explicitly opt-out
>>>> of this uniqueness check, permitting multiple host bridges to reuse the
>>>> same software domain number.
>>> Why isn't this deducible from the compatibles?
>> Hi Krzysztof,
>>
>> Thanks.
>>
>> The compatible cannot express this. "pci-host-ecam-generic" only
> You have vendor specific compatibles, no?


I used a tool to assist me earlier. I will now discuss directly.
The driver used by our hardware is not a vendor specific driver but
the generic "pci-host-generic" driver, so previously the compatible
in our DTS was only "pci-host-ecam-generic", with no vendor specific
compatibles.

>> describes how configuration space is accessed; it does not describe
>> whether two host bridge instances may share one Linux PCI domain.
>>
>> The same compatible is used on systems where every host bridge must
>> have a unique domain and on this system where two RCs intentionally
>> share a domain with disjoint bus ranges and resource windows.
>> Comparing the compatible strings of the nodes therefore cannot
>> distinguish our case.
> OK, so let's look at your DTS - where is it posted for upstream?


The DTS has not been uploaded upstream. Below is our DTS (with
irrelevant information such as interrupts and IOMMU omitted). Both
nodes use only "pci-host-ecam-generic", and their resources do not
overlap, but the domain is the same.

  pcie0: pcie@80000000 {
         compatible = "pci-host-ecam-generic";
         device_type = "pci";
         #address-cells = <0x3>;
         #size-cells = <0x2>;
         #interrupt-cells = <0x1>;
         reg = <0x0 0x80000000 0x0 0x8000000>;
         linux,pci-domain = <0>;
         bus-range = <0x0 0x7f>;
         ranges = <0x1000000 0x0 0x100000 0x0 0x10000000 0x0 0x100000
                           0x2000000 0x0 0x20000000 0x0 0x20000000 0x0 
0x10000000
                           0x43000000 0x200 0x0 0x200 0x0 0x100 0x0>;
  };

  pcie1: pcie@88000000 {
         compatible = "pci-host-ecam-generic";
         device_type = "pci";
         #address-cells = <0x3>;
         #size-cells = <0x2>;
         #interrupt-cells = <0x1>;
         reg = <0x0 0x88000000 0x0 0x8000000>;
         linux,pci-domain = <0>;
         bus-range = <0x80 0xff>;
         ranges = <0x1000000 0x0 0x200000 0x0 0x10100000 0x0 0x100000
                           0x2000000 0x0 0x30000000 0x0 0x30000000 0x0 
0x10000000
                           0x43000000 0x300 0x0 0x300 0x0 0x100 0x0>;
  };

>> Adding a vendor-specific compatible only to trigger this Linux policy
>> would not describe a different hardware programming model either.
>> What actually makes reuse valid is the platform-level relationship:
>> the bus ranges and resource windows are disjoint.
>>
>> If you prefer to avoid a new property, I can rework this to derive or
>> validate reuse from the non-overlapping bus-range and resource layout
>> instead. Would that be the preferred direction?
>>
> This one is clear paste of LLM output to a message.
>
>
> Best regards,
> Krzysztof

-- 
Best regards,
Cui Chao.


