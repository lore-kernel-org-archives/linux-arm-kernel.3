Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983CDCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzs2vHElBxAxaTXOkiUYIT3dwHA81jT9EchFQHRd0Hg=; b=cH0p6kTySsbBByFPOtSPQNh55l
	1PyPssJ4ARNk672XjW4g7Xln1Qvxb+G4Poizx2iqqS1lCoUq1QHFae8wi5iGs8I/nUAVISrqV/qD9
	lvmLdVLRR38wqGbRlJRs5yFarIkibQWtpjCe+O7CgJS/Bny6xnqs4mkasrMredDYCB6YuTzEouHRa
	46AXDlQ5vFRAbBKdPE4EunlADpjclBVGONwxwZxVr0tuAajZ7ONtg/c/lM793AIDdHTHEY6GTZlmF
	+7EQC6ThOM2mhp2gEBRe/2/Z1fvL7LEk8FrLAN68JzpJMAcARXOHGYfxVzmZ8JacK/jKLHURmRC4K
	Jq1UPq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZmc-0000000GQIO-3rIr;
	Thu, 27 Nov 2025 11:03:30 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZma-0000000GQGD-0MYA;
	Thu, 27 Nov 2025 11:03:29 +0000
X-QQ-mid: zesmtpip3t1764241347t78aa8971
X-QQ-Originating-IP: jkDH227WqUwOoFTBtC1hwDrWemoF+qI3vLMPnvs0/lI=
Received: from [IPV6:240f:10b:7440:1:c95a:801a ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 19:02:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10963241468344092550
Message-ID: <53C4D04AE30D7004+12cd5747-7bde-409d-bc02-fcf86a47cc44@radxa.com>
Date: Thu, 27 Nov 2025 20:02:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Jingoo Han
 <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
 <aSRli_Mb6qoQ9TZO@ryzen>
 <7667E818D7D31A4E+cf7c83d4-b99c-469d-8d46-588fc95b843f@radxa.com>
 <F11F0D13437B012D+0c15c5ca-f64f-49f1-9ff5-26b88d59ff59@radxa.com>
 <aSgBLQ7rDOiEFhMB@ryzen>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aSgBLQ7rDOiEFhMB@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NbLMjDNEDlGtzPHyvsnFLwRWanjn7xRp8z1LRylheb1EYNHWahdNky6H
	J2NRH0JaPBU/gqfabk9hf+xV6yrWl44Xn0vn4PG26NJxLvcFd1Y9tjqKL7qeLGOFjhVOAgF
	uOPMXRK1RPCldrJg/F4xnZt+81HG+Ku1NvCJv71RIBfnJ6Z4+xPGY4wqCYfUmXqYc5UcmvV
	ErNm7+UYPiTxVB/U5/AqLhdFYkpILkLpDv3Q3Rn9ZCVdDyda1LbVHVyoMv5nfru4GFZfpvB
	IpMP6OxHctgSOygGghhPBRarJd1abJR1qcNAXna6ZXoIKKGNSyInX/vR0Uot8/+L6KIh41J
	9dMKSD6MK3RHL2+FTNN+UjIyJOOAoapWdyhRR7Y+w2Q+qYkWbwVaXaGRkfP+F9CvuKI/8VR
	iy6NvCWrV8vOGd1lXPdU0/PjYsofIVQEBwxb9LJzpuimtn2T3w1kkTrWoZXObjq7yxUICV0
	5sVZZfEOZzzgtaNoyJpEo4HiiGv5Daye9iarCTfWw3ZT+LvGQQmYuH/C8sABmCkC7HntH0o
	vTwCGO8fG8qGdd/ZFzY1BYrAEreZLN0G8VzLypCeCxV9JDy4I4asnqio4DV47ficwrXf0dC
	TpDOFeT3ak+6s4oA5NlwYw2B5Xf7NzbzUCKyL1Iz8d1hCAyYaLNnsz3g4xnlhoIuxoZfRtJ
	gzt0FIHyYtyXFUxB1BwAb3rVEz8Zp4LJQ47DtaqWN/Zn2IafNKzAifIHsK38wY96aX+AE18
	DmzjQcku7YB/cIYUwjBN5rg61L2c5Aa+Tnc4NaaDYLVLXFOHNi/coM+RJrhlvmMC8xd0llm
	dIptVAfpHzaVvQ6YNGuDrCG29P3UgrwKyBFvPYU7aZ5mKet5LxHmZtRoo+I3GKPAV6s7eFQ
	Z2DN/Y1CrOlBu9N+ZuM5I2tkxe/aZhvQWHv4/HSIHsCwGKI1+NTKmewdQFIc7NdyXfbpS1+
	6TG5pi+JhL4uDrDBkYvZRBoBL035wJVU84LfIKWWGmrkGDg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_030328_622394_E6E76B9C 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Niklas,

On 11/27/25 16:43, Niklas Cassel wrote:
> Hello FUKAUMI Naoki,
> 
> On Thu, Nov 27, 2025 at 04:34:53PM +0900, FUKAUMI Naoki wrote:
>> Hi all,
>>
>> I'm very sorry, but my ROCK 5C appears to be unreliable. (It worked fine
>> with vanilla v6.13, so I thought it was fine.)
>>
>> I replaced it with another 5C (Lite), and now every method (Niklas's patch,
>> Shawn's patch, and applying patch 1 and 2) seems to work.
> 
> Could you please give us some more information.

Sorry for the confusion.

> Does the Rock 5C Lite have a PCIe switch?

ROCK 5C and 5C Lite use the same board design, only SoC is different, 
but there is no difference regarding PCIe functionality.

They have a PCIe 2.1 connector, and I've been testing a HAT with ASM2806 
via PCIe 2.1 connector.

> Does Rock 5C Lite work fine with the current code in mainline?
> (i.e. with bus enumeration when Link Up IRQ is triggered).

No, bus enumeration behind ASM2806 on ROCK 5C Lite (and any other 
RK358x-based boards I have) is not working with vanilla kernel.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Kind regards,
> Niklas
> 



