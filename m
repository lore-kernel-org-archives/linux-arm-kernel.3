Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3FB606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6vEu8ic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K/VKNZTnoHlYdA52mhm/Cd/cZKCsJadbDnR229CP3IM=; b=T6vEu8icpYK2t6
	k3AAYwe1BYWceJFRPln2KioACsXjBCLzKuF+TEcupD34sfb5m2IEtIP5nmUCNuxPbORNnVt6i3+ke
	kqmmxRDU31fYQNm7xsvUiKri3lA0cc4b3yLCd8J0aF7GVCpGdbVZ+zP5ZdCwZIKak4/vvxFf3C+SS
	jJOMHTbjlmdG1pMb+4GuNCfuo6T3OD/vNJREPbdxc/bUWtbcGkxXs3mlqDPWR2w7ezQksJBMu6cxE
	A9hHdtxezgdPXg9JnDfWll6c6NFYXkIMWNAnmLc5ffx4SajmI7Kb1BxhUV9JYwklJGIIeluhdCtD9
	e+nJkDWYZZKNG2PkZI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4iF-00000000uHQ-2pXC;
	Tue, 03 Nov 2026 02:57:27 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4iB-00000000uGj-16fz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:57:26 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with UTF8SMTP id AQAAfwC3v1uNTelqASjbAQ--.20994S2;
	Tue, 03 Nov 2026 10:57:17 +0800 (CST)
Received: from [10.22.77.56] (unknown [123.150.8.50])
	by mail (Coremail) with SMTP id AQAAf8DwOXOFTelq9qL0AA--.19487S2;
	Tue, 03 Nov 2026 10:57:10 +0800 (CST)
Message-ID: <b49779cf-5132-4539-86c2-e4f806b1675d@phytium.com.cn>
Date: Tue, 3 Nov 2026 10:57:09 +0800
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
From: Cui Chao <cuichao1753@phytium.com.cn>
In-Reply-To: <8112d8ca-2234-490c-a4a2-c3b01adfbc88@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DwOXOFTelq9qL0AA--.19487S2
X-CM-SenderInfo: pfxlux1drrlkut6sx5pwlxzhxfrphubq/1tbiAQAHAGrnk0kFEwABsG
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=cuichao175
	3@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7AF48CryrWr1UZw4DXF4xWFg_yoW8XrW8pF
	WaqryDtFZ8XF10yw4vyw10vFWYkF4kJFW5J3WUGws8A398XF1UXrs29FW5u34UAF18ZrW0
	vFWqq34kJFZ3ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_185723_468557_9100FDB0 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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


On 11/2/2026 6:00 PM, Krzysztof Kozlowski wrote:
> On 02/11/2026 10:51, Cui Chao wrote:
>> Add a new optional boolean property 'linux,pci-domain-reuse' for PCI
>> host bridges.
>>
>> By default, the 'linux,pci-domain' property must be unique across all
>> host bridges. This property allows a host bridge to explicitly opt-out
>> of this uniqueness check, permitting multiple host bridges to reuse the
>> same software domain number.
> Why isn't this deducible from the compatibles?
Hi Krzysztof,

Thanks.

The compatible cannot express this. "pci-host-ecam-generic" only
describes how configuration space is accessed; it does not describe
whether two host bridge instances may share one Linux PCI domain.

The same compatible is used on systems where every host bridge must
have a unique domain and on this system where two RCs intentionally
share a domain with disjoint bus ranges and resource windows.
Comparing the compatible strings of the nodes therefore cannot
distinguish our case.

Adding a vendor-specific compatible only to trigger this Linux policy
would not describe a different hardware programming model either.
What actually makes reuse valid is the platform-level relationship:
the bus ranges and resource windows are disjoint.

If you prefer to avoid a new property, I can rework this to derive or
validate reuse from the non-overlapping bus-range and resource layout
instead. Would that be the preferred direction?

-- 
Best regards,
Cui Chao.


