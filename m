Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF15107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joRicMoJxVQO94MIwIw5xrK7vglnHFroYJT52WMs41c=; b=GLSARndGOWTmA2k3qj8lDHK/XV
	kGhpwssVZL6+hZCCnM/GR3gVmqHQkhftu2RsdOlJZP1J2gV2WyOM7UmDIMo2353qs1WbpwaBuiYQ3
	vBO9VU/vc0S/HCjvb2Np7vBiY4GxfGuZqdqcAQq9pmMt3UdMF+bq5nqSH+B2YvV1YFqS8BcWGzZj5
	fB26czvVvzVl3OvHTNmKHXpBsYbCEK2GZH7Cw4pYR0WeBjPQKvDRFNNeMgZuExgmEjNUwhUXN7jS6
	U8VKS5ESGwgaFpnAQhkErF7rxFwLQ11/P7TxIdT8UfOdXsE++C9mYkRdpHSbtHYc33CC/mp4lcpj6
	68zMTFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18G3-000000014aq-2Flr;
	Fri, 13 Mar 2026 19:33:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18G0-000000014Zv-302f;
	Fri, 13 Mar 2026 19:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773430388;
	bh=ojwFUsM/iT2lF91PBJe00tHmWNmES2FQ7zwsljgOW0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fJTnOia1iWfEb5R5IrGx6ImRr+cbw44K2coEHIRJfQJVVCEG/9dTLaulsPB3ySHrd
	 OaqAye+2edYmHwHzbrsk2DtjHYriPjSPliLolsWEwMqwDWeKGoUg0szX2NacwxZ6mQ
	 qshwzzUipEZ+T8itCDjAwcw8d13z/EseNbsMaUV0NlyW8o2m8ds3la5Bu4RavQygCq
	 1VTj1Ey/RqBnfZAVcDDfpRSLBOFHbCTywurcZX1giroewPM6FlW3987mLvKdVgeLl/
	 C4HluG8U5XizyTTgX2G9arOACRTrP89M037pn2hPY0RH6BIop7SXhiM7iaqyeFtUPY
	 18LBNEYlawiFQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E40217E0222;
	Fri, 13 Mar 2026 20:33:08 +0100 (CET)
Message-ID: <1f9942a5-e63b-4f44-87b6-5153f7ed72b7@collabora.com>
Date: Fri, 13 Mar 2026 20:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: enable vicap dvp on wolfvision pf5
 io expander
To: Heiko Stuebner <heiko@sntech.de>,
 Gerald Loacker <gerald.loacker@wolfvision.net>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-wv-io-expander-vicap-v1-1-11001fb3b744@collabora.com>
 <6246776.lOV4Wx5bFT@phil>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <6246776.lOV4Wx5bFT@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_123312_928046_1622A646 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Heiko,

On 3/13/26 19:19, Heiko Stuebner wrote:
> Am Freitag, 13. März 2026, 16:53:29 Mitteleuropäische Normalzeit schrieb Michael Riesch via B4 Relay:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
>> is broken out to the PF5 mainboard expansion header.
>> Enable it in the device tree overlay for the WolfVision PF5 IO
>> Expander board.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> 
> The From should match the first Signed-off-by line.

Hmm... First of all, the Signed-off-by line is correct, this patch stems
from my WolfVision era. But then with the .mailmap entry I created when
the era ended, I cannot set the patch author (and thus the From line)
correctly.

Let me try again without this entry...

> 
> All later Signed-off-bys are from "other" people handling the patch,
> i.e. that other Michael Riesch ;-)

Yeah that guy's pretty weird!

> 
>> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
>> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> 
> Heiko
> 
> 

Best regards,
Michael


