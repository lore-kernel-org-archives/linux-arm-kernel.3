Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66988C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVNZNX6eNlyCyjqKZuhGwmsTwuDYuVKLYvCN2QvkmDQ=; b=OTqkaKe+hUH+A4ja4WcpbT26aV
	b4lNjn3TBFUK8HLq8f2Pmpv3futMOjkNcRarVNWJC5q8GBZLXoSH68l5Y40I9T4tLYxUHwzU3i2c7
	0V66W1/Zro5zBuLY1arAGNOA107M7KjHtJrLzAPAlQogqV1/2HM16ZnNDCOLgIzvAAHZz/PbM+/Fd
	CZ7suVXb6WGPrYWVhyB2S3v5ATIHupGscxRfT2034VUf+vAGdz0jbWXN1KySz8KkULHbVW+QVlhbv
	Soeab65B64mNqT1+iofPoQs7e9+wgDRCN+8Iq5bQLDOwXpABLZe9tKutGQgwc36IqBDWv6CPeg6tJ
	0rXghISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PPW-0000000DObR-2ljO;
	Fri, 18 Sep 2026 03:37:14 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PPP-0000000DOZt-0oZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:37:11 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260918033702epoutp01219cb4cb9eb6a8a5e62451a226669122~WTQ1z6MB32927329273epoutp01T
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:37:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260918033702epoutp01219cb4cb9eb6a8a5e62451a226669122~WTQ1z6MB32927329273epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789702622;
	bh=wVNZNX6eNlyCyjqKZuhGwmsTwuDYuVKLYvCN2QvkmDQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TZ7epoleif9/tjTCcwO93NSveNWPb4CaXuiXxPkjyTfMyLKPfIi3GW7o0WGU20lu3
	 Kx/Je1eQy2oWYSd9deri3WFiDdKCCi6uGV5DWMsPwy5SMiyA9GpIAZ22FkouOtm1v8
	 JK+WiKXzaPImGziv4DNIlpUOgAg+8lqHmr71x2eQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918033701epcas5p28c94072e3b67ed14d50879deaf09bbfb~WTQ1SToQ_1503415034epcas5p2S;
	Fri, 18 Sep 2026 03:37:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hmJG4309hz3hhT8; Fri, 18 Sep
	2026 03:37:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918033659epcas5p3efc91b48516c12b52293604b2c272239~WTQzosaGy1269112691epcas5p3b;
	Fri, 18 Sep 2026 03:36:59 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918033656epsmtip1d0d87fe4e19cc56648a53ea55d7ab60f~WTQw35rEG1575715757epsmtip1V;
	Fri, 18 Sep 2026 03:36:56 +0000 (GMT)
Message-ID: <c74dda5e-7fc7-49e8-befc-7def930e8bb3@samsung.com>
Date: Fri, 18 Sep 2026 09:06:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
	peter.griffin@linaro.org, gregkh@linuxfoundation.org, robh@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <058301dd471d$5d985170$18c8f450$@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260918033659epcas5p3efc91b48516c12b52293604b2c272239
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
	<20260916122229.2604003-3-selvarasu.g@samsung.com>
	<058301dd471d$5d985170$18c8f450$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_203708_717773_843B6F11 
X-CRM114-Status: GOOD (  15.59  )
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


On 9/18/2026 8:55 AM, Alim Akhtar wrote:
>
>> -----Original Message-----
>> From: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> Sent: Wednesday, September 16, 2026 5:52 PM
>> To: krzk@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com;
>> gregkh@linuxfoundation.org; robh@kernel.org; conor+dt@kernel.org;
>> Thinh.Nguyen@synopsys.com; mani@kernel.org;
>> selvarasu.g@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: jh0801.jung@samsung.com; h10.kim@samsung.com;
>> dh10.jung@samsung.com; akash.m5@samsung.com;
>> hongpooh.kim@samsung.com; eomji.oh@samsung.com;
>> shijie.cai@samsung.com; muhammed.ali@samsung.com;
>> thiagu.r@samsung.com
>> Subject: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
>>
>> Add the Samsung Exynos8855 DWC3 binding using a flattened node
>> representation, where the DWC3 controller is directly addressable rather
>> than nested as a child node of a glue layer.
>>
>> This is the first Samsung Exynos binding using the flattened representation.
>> The existing samsung,exynos-dwc3 binding describes the parent and child
>> representation used by existing Exynos SoCs, which can be migrated to the
>> flattened model.
>>
>> Samsung Exynos SoCs sharing the same flattened model can be added by
>> using the samsung,snps-dwc3 fallback compatible and extending the
>> compatible enum with per SoC clock and property constraints.
>>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
> Thanks for using flattened node representation. Are you planning to migrate other existing SoC as well?
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Hi Alim,

Thanks for your comments.

Yes, We are planning to migrate other existing SoCs to the flattened 
node representation as well.

Thanks,
Selva

