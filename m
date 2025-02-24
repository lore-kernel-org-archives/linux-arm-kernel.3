Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7924FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dG+gxPUSWpwDoki4eEh/9rwYbhNLk1VbVLvja7f2r94=; b=3oPwgpV56M3xJViHtw7IkTX5zv
	PBR6Qh3fiVIpRYBsF0zxBmDEivZC7seXe6CSOrxIo4Wwz5Wrg7LNWT81xfTUr4Th+r6c/VXLsNGF2
	SRHlP4vR5VvuWp6fYBo3QYkqxwt8/8OmsF8wo+rpIWnvGOHvEOZkeRbVjrhs5T5JU4MwYzUgdBI9e
	R7EWjsR61yU8oh4m23yH2TLrxHGMaCn0jgsSZwZG13qOtPoDolNOEyJTxC6T5u9ujOg+zsxJsPEkX
	EjfUs9i1XvGBs2JpIRqbIyMqAo2Tx16aQ+Zsyws7xolokHzVAWYGebLfj+yu9my6GaJmh4B23Ms7S
	bnRkktRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUS5-0000000CpFD-1KtW;
	Mon, 24 Feb 2025 09:08:37 +0000
Received: from mail-m49231.qiye.163.com ([45.254.49.231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU7x-0000000Cl6q-3awd;
	Mon, 24 Feb 2025 08:47:51 +0000
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfe5cb08;
	Mon, 24 Feb 2025 16:47:42 +0800 (GMT+08:00)
Message-ID: <28dcac28-9060-4f65-8167-64f6a0e4532d@rock-chips.com>
Date: Mon, 24 Feb 2025 16:47:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock, reset: rockchip: Add support
 for rk3562
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <20241224092310.3814460-2-kever.yang@rock-chips.com>
 <z7jb32foci6bamqqddkkp34hazi2itp6uclarsoi5pkrgso2go@bxflagkaciq6>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <z7jb32foci6bamqqddkkp34hazi2itp6uclarsoi5pkrgso2go@bxflagkaciq6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSk4fVhgaTE1NSRgeSx4fT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
X-HM-Tid: 0a953724079603afkunmbfe5cb08
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhg6USo6KDITPxMsKzQMHgxR
	Kx1PC09VSlVKTE9LSENNQ01NQ05NVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlPTEg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=WA3pmr7QT5Hkf9NM5J4r4h5VyGiCXSrAlc66OXg1bmLMCGq8+B/MxJUJuUTBwUobsDxt5vimbfthlLTb8yGUl78OUnFzK+4mK+s/50Qw5ldgbqV+MuwYxHQP3gbV0JmYJr2l6940JfCv8oDALgFpshdtPcSBah52AfMtjoxPQqk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dG+gxPUSWpwDoki4eEh/9rwYbhNLk1VbVLvja7f2r94=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_004750_392089_66A3B6F6 
X-CRM114-Status: GOOD (  16.47  )
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

On 2024/12/27 16:28, Krzysztof Kozlowski wrote:
> On Tue, Dec 24, 2024 at 05:23:09PM +0800, Kever Yang wrote:
>> From: Finley Xiao <finley.xiao@rock-chips.com>
>>
>> Add the dt-bindings header for the rk3562, that gets shared between
>> the clock controller and the clock references in the dts.
>> Add softreset ID for rk3562.
>>
>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - rename the file to rockchip,rk3562-cru.h
>> - remove CLK_NR_CLKS
>> - add new file for reset ID
>> - update to use dual license
>>
>>   .../dt-bindings/clock/rockchip,rk3562-cru.h   | 377 ++++++++++++++++++
>>   .../dt-bindings/reset/rockchip,rk3562-cru.h   | 360 +++++++++++++++++
>
> No, that's not a separate patch. Headers *ALWAYS* go with the bindings
> patch.
Will fix.
>>   2 files changed, 737 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
>>   create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
>>
>> diff --git a/include/dt-bindings/clock/rockchip,rk3562-cru.h b/include/dt-bindings/clock/rockchip,rk3562-cru.h
>> new file mode 100644
>> index 000000000000..ad07ad3a12ad
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/rockchip,rk3562-cru.h
>> @@ -0,0 +1,377 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> Why not using license requested by checkpatch?

The checkpatch does not report error/warning for this license, and this 
is the same as many other SoCs.

Which license is recommend in the header file?

>
>> +/*
>> + * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
>> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3562_H
>> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3562_H
>> +
>> +/* cru-clocks indices */
>> +
>> +/* cru plls */
>> +#define PLL_APLL			1
> Start with 0. Your other binding also starts with 0, so be consistent.
Will fix.
>
>> +#define PLL_GPLL			2
>> +#define PLL_VPLL			3
>> +#define PLL_HPLL			4
>> +#define PLL_CPLL			5
>> +#define PLL_DPLL			6
>> +
>> +/* cru clocks */
> Missing clock for 7. You are not supposed to have any holes here.

Will fix.

Thanks,

- Kever

>> +#define ARMCLK				8
>> +#define CLK_GPU				9
>> +#define ACLK_RKNN			10
> Best regards,
> Krzysztof
>
>

