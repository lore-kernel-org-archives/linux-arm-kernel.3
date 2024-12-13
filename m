Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2801E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uPtqPumo6KwvxbkLBKcwxn97AompsYgpYkahNyogJ4=; b=wdx9gUxgOaa9+VUTpouyRXxnP7
	ZPyuYEOhQWDe4ew9H96ObLRg3T4LNqjqm12cdlEfprwDYRt/5MAKLQr9NiwxPgqWRVY+GukjQwI0L
	AvJcB8+Ah0sRqZrY1cChQg+VVnmx0S16g42QMC7IpaBNmB8/39XHLD/tfOGBP8VS0Nxxne910NvHB
	PrKUt0lhNLcl9Th72wdv+V4RPIDVfCuCH7o+eH4YDWEjocKPpwO0DihgumcOmoaoWGIX6GlZ7yefo
	/RTvhIKAtJVgjciLZkBU1XgW9FhhZOdV4UUbhaXWta6wYLfQuSoei9SLu10M/gFCmoqAlvIt2yo4Z
	3fWoGrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3or-00000003YUK-1kGV;
	Fri, 13 Dec 2024 11:26:53 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3nk-00000003YEy-3PzB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:25:46 +0000
Received: from [192.168.5.25] (unknown [120.85.107.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D700F40277;
	Fri, 13 Dec 2024 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1734089140;
	bh=1uPtqPumo6KwvxbkLBKcwxn97AompsYgpYkahNyogJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=LtK8AXJcccUMfBI+gK/4BHLMv6/0/0hGDwldzQtw0t53/pHL3IP1T6Nv7N3W+fgz7
	 /VqN4el8Q+YhMNzK2sGy9UudEKvGdZWUJES8Xoxo562zzX36zWqSqMNcLQpzjTdZp8
	 p/+pfgWNrXEzGe+RYvr7j+edtc1BtqsfWTpDcTRYd6Z8/Ryg7tAVLCO7J1SmJ9Vnwc
	 Z/djQK1RQGNzWbknJgdE1b3YztEktIchT04uYvWECtqOm7bwvlCRcDzCwf5P2rhn4X
	 mM4vVkF0SPpu3bbkuLL5RY/ozlW7U8n8eTjycwW5txCIRc00fSVhPTSkuz4fG1RzB9
	 BsnHDDDj0KySg==
Message-ID: <cb6c7f8d-6244-4370-944f-a1a2beac3a79@canonical.com>
Date: Fri, 13 Dec 2024 19:25:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: nxp: imx6qdl: add dr_mode to usbotg
To: Xu Yang <xu.yang_2@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com
References: <20241212043126.73045-1-hui.wang@canonical.com>
 <20241213081729.ohgs7tyyzywd4uyc@hippo>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20241213081729.ohgs7tyyzywd4uyc@hippo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_032545_240903_57D71D00 
X-CRM114-Status: GOOD (  18.49  )
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


On 12/13/24 16:17, Xu Yang wrote:
> Hi,
>
> On Thu, Dec 12, 2024 at 12:31:26PM +0800, Hui Wang wrote:
>> For the chipidea usb driver, if the dr_mode is not set, it will set
>> the device to otg mode by default, so here the dr_mode has not been
>> set for a long time. But some testcases need to parse the dr_mode from
>> DT and decide the follow-up test strategy, here set the dr_mode to otg
>> explicitly for QA's testcases.
> The dr_mode is board specific property, so we normally don't put it in
> dtsi file. Also, imx6qdl.dtsi is a common dtsi, therefore it's not a
> correct place. I wonder you don't set dr_mode in other dts file which
> include will imx6qdl.dtsi?

Yes, our QA reported this issue against the imx6q-sabresd board, I 
thought dr_mode could be overwritten if board dts set the dr_mode, so 
this change will not impact existing boards. But as you said "we 
normally don't put it in dtsi file", I will move it to imx6q-sabresd.dts.

Thanks,

Hui.

> Thanks,
> Xu Yang
>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
>> index d2200c9db25a..285fb7314a88 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
>> @@ -982,6 +982,7 @@ usbotg: usb@2184000 {
>>   				clocks = <&clks IMX6QDL_CLK_USBOH3>;
>>   				fsl,usbphy = <&usbphy1>;
>>   				fsl,usbmisc = <&usbmisc 0>;
>> +				dr_mode = "otg";
>>   				ahb-burst-config = <0x0>;
>>   				tx-burst-size-dword = <0x10>;
>>   				rx-burst-size-dword = <0x10>;
>> -- 
>> 2.34.1
>>

