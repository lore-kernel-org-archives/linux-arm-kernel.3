Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E85BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tghv0NnaHu52whCw12bEhrQP4iuYVJ1S9bWwB/iV8JU=; b=JqUFKdGaFSP0NqRhIMT/JZ4V6W
	fLsQWYaOf8aFmjrgW9PB+xnSz5ebhLRD28X8RvjqPDqW21wqO1x/kEq0JMp72mySXCPvqOFpppCIK
	H+ceWfhANx+TNlw54Q2o1WKbHhQYH7c/Ox9i6/oJsCF2GAtpkv8fp0j+9OuG5mgrEvYv6mRQXeOpA
	r8y2vSrNmUZcYWyHOq1e6eeDwPq3OuzeRCL9mbS+uSJlVvcwpgl9qHPv818IyMb1JkFX72irA17kt
	w6HUHXW29T5qX8MkZXLBRwCHAer7mJlB5FSNLJzlUjZaFo03woOYFNu4/uUm+qqY2CsJ0ga/3hPB9
	7xfQwWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2SQ-00000005VGA-2DyJ;
	Tue, 24 Jun 2025 12:08:58 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1iz-00000005QG6-2UXY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 11:22:03 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OBLwas1774429;
	Tue, 24 Jun 2025 06:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750764118;
	bh=Tghv0NnaHu52whCw12bEhrQP4iuYVJ1S9bWwB/iV8JU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MTgDwYxecSBYTbh7kyx1W3VkiwPCGXoRTh0enJaeGziwSLU1lmOEKs9uWc1tDG7JO
	 agYLkSuVFLCQo01JJ2hsXzk12KjiLPWuedB0xbbMh1VqbET3mxQwQH0+qKqWdn9eRt
	 94t2JThVPQScu5MHVQmBYJetpTvnRntKRFw8qAFw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OBLwGD1488432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 06:21:58 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 06:21:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 06:21:57 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OBLqTs1415540;
	Tue, 24 Jun 2025 06:21:53 -0500
Message-ID: <9ac27b3b-5bb3-4b32-8c18-f66b3b72af89@ti.com>
Date: Tue, 24 Jun 2025 16:51:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/6] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-3-p-bhagat@ti.com>
 <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
 <c4362d9e-62a4-4c28-b1cd-c338467f92ae@ti.com>
 <6f98274a-88c3-4afc-b324-b024f31e1628@kernel.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <6f98274a-88c3-4afc-b324-b024f31e1628@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_042201_727391_4AFD3520 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Krzysztof,


On 24/06/25 16:25, Krzysztof Kozlowski wrote:
> On 24/06/2025 12:39, Paresh Bhagat wrote:
>>>> This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
>>>> variants. While the AM62A and AM62D are largely similar, the AM62D is
>>>> specifically targeted for general-purpose DSP applications, whereas the
>>>> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
>>>> does not include multimedia components such as the video encoder/decoder,
>>>> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
>>>> processing, or the display subsystem. Additionally, the AM62D has a
>>>> different pin configuration compared to the AM62A, which impacts
>>>> embedded software development.
>>
>> This section is important as it clarifies the difference between AM62a
>> and AM62d, as we are reusing AM62a dtsi files for AM62d. Let me know if
>> you need a shorter version.
> This is not important:
>
> "While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads."
>
> It is irrelevant. Rest is fine.
Fine will do.
>
>>
>>>> This adds dt bindings for TI's AM62D2 family of devices.
>>>>
>>>> More details about the SoCs can be found in the Technical Reference Manual:
>>>> https://www.ti.com/lit/pdf/sprujd4
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> And what happened with the previous comments?
>>
>> Yep there were some indentation problems earlier, which is fixed in this
>> version. There was also an ack from Conor Dooley in v3. I will include that.
> Why you did not include it before?
>
> Can you start using b4 for your process of submitting patches?


I missed it. I got to know about the b4 tool internally, will use it. 
Thanks.
>
>
> Best regards,
> Krzysztof

