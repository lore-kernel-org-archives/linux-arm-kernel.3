Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9354108E1E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMg0rkJLW9pmm80ccnxfiQROSU8NAOon9o2bCBKOtfs=; b=z1eR6HMtqSw+a+HkgYSxZu/Pyk
	zYz7gpwFxl8cJ9HFTf72A7nvtmscpEZVzsNkUZPzgXd9W87WWO11zSyVfmqEYbIfqTrdQf25+oHU9
	y7VNqe/EJ4rPaWNSYRcJvDQjGTBBvSbCUNxVQVwC6+3vNwwGjbRWhpi+vShh2zB+z5763kyoKOK8O
	jchm4IJ2xsI2wQlXcoKFMrWAzmOrcsfoEY9h0XjavC/aE61oP8l78duP/3x6xZ6WQrxPqlvtn3+TQ
	5tSoocJZUOo6UoltDcB9VhCSe1Ae95LdmA0JbdkilG0cvnPhkPtvSoxknVCL5ZiC9EOiJD7uwhh4S
	ozrVWIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BQF-0000000AVub-0CO0;
	Thu, 19 Mar 2026 11:20:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BQ8-0000000AVsb-1nXt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:20:12 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260319112002euoutp01b9e582455b5038a37fccb68c5e651bd2~eOh2Z2JNq3047630476euoutp01y
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:20:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260319112002euoutp01b9e582455b5038a37fccb68c5e651bd2~eOh2Z2JNq3047630476euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773919202;
	bh=OMg0rkJLW9pmm80ccnxfiQROSU8NAOon9o2bCBKOtfs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=A+0URX78R/8DxzDvSmu480/veK62Q19iLscD+xrtnAoiR08J6qMndWvbDpwm9R43q
	 NWg6mSqpH6NmAz0pBO9GUk3NhO6HofowtC+ro7f5g7lGSQJD/Nuq6nCtqrSMPUE6f2
	 hIM1rT6M0vtufwk+hi41YraZPIyltnEtQUc0cD3A=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260319112001eucas1p13a5f80fe1877e4547b4b6aa27e4f5db3~eOh13Vykc2060420604eucas1p1W;
	Thu, 19 Mar 2026 11:20:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260319112000eusmtip2860b5807312356c7523a69a643584d08~eOh1Lszz_1318713187eusmtip2f;
	Thu, 19 Mar 2026 11:20:00 +0000 (GMT)
Message-ID: <86bce6c0-dbaf-4508-9f40-ff209c85a76d@samsung.com>
Date: Thu, 19 Mar 2026 12:19:59 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/2] ARM: dts: broadcom: bcm2835-rpi: Move the firmware
 node down 1 level
To: Florian Fainelli <florian.fainelli@broadcom.com>, "Rob Herring (Arm)"
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
	Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <a9a202c1-048f-473e-b8f4-6f0550bdba2c@broadcom.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260319112001eucas1p13a5f80fe1877e4547b4b6aa27e4f5db3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260114182227eucas1p16eee8f1fbf41f998214b89517793bb0c
X-EPHeader: CA
X-CMS-RootMailID: 20260114182227eucas1p16eee8f1fbf41f998214b89517793bb0c
References: <20260114015810.701076-2-robh@kernel.org>
	<CGME20260114182227eucas1p16eee8f1fbf41f998214b89517793bb0c@eucas1p1.samsung.com>
	<a9a202c1-048f-473e-b8f4-6f0550bdba2c@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_042009_881233_CD641A61 
X-CRM114-Status: GOOD (  17.76  )
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

On 14.01.2026 19:22, Florian Fainelli wrote:
> On 1/13/2026 5:58 PM, Rob Herring (Arm) wrote:
>> Commit 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non
>> simple-bus nodes to root level") moved the firmware nodes into the
>> standard /firmware. However, /firmware is intended to be just a
>> container for firmware nodes as it is possible to have multiple types of
>> firmware (e.g. SCMI, OP-TEE, etc.). Move the RPi firmware down a level.
>>
>> Fixes: 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non 
>> simple-bus nodes to root level")
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> This is only half the fix. Unfortunately, a kernel change[1] is also
>> needed to make this all work. I do plan for that to go to stable. I'll
>> leave it up to the Broadcom maintainers whether it's preferred to revert
>> the fixed patches or apply these fixes. A 3rd option is revert for now
>> and apply these DT changes some time later to give some time for stable
>> updates.
>
> Let's wait until your fix for the /firmware match table gets applied 
> and then I will pick up your two changes.


Florian: I've noticed that the $subject patch has been applied to 
yesterday's linux-next as commit 0603d8af97ff, but the code applied in 
Your tree differs from what has been posted in this thread. See:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi?h=next-20260318&id=0603d8af97fff097daa118faf04d9f439b2227ec

https://lore.kernel.org/all/20260114015810.701076-2-robh@kernel.org/

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi?h=next-20260318


The "firmware" node in Your tree is under "soc" node, but without adding 
a "compatible = simple-mfd;" property there it won't be populated, what 
breaks operation of all drivers requiring the firmware driver(s).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


