Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A928BE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9tP804CKKIc8fPyno90HqS3ih3nV1edUalGMWSC688=; b=g/vF81XR1GLQ6F4mJPwGXNvM6c
	GHOkFvG4H9buv6Bblgnc2vgnam0SDPuEEvIap+oJywKJ5ek/djXfJVhN0JfHuRdmuxN05Yokc+DqF
	A2Pxah67W4Zt3tz0YzxctInHJ38Jgn7rwoM06j4MWomf3Y8VnGma5QQiuQQtLG1zXU9NNiWbZeqJn
	H2Dtd3miCP15eJeURTVoy4b8O8dfIi8oN4gMa05JvsONBhpDcT7iQ+nCMr1RDoWgBDUkAT6yuv3JX
	clm6GyYArPsDSRtfzWUJU5VUgZGplGHxaf7i/GFFmP1ogqsQRz4UHoAyOiTsk3ggKXnoY3wsPGKct
	jI57r0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRB0n-00000000LrR-25ns;
	Fri, 27 Dec 2024 14:08:21 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAzc-00000000Lnd-3yFj;
	Fri, 27 Dec 2024 14:07:10 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735308427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9tP804CKKIc8fPyno90HqS3ih3nV1edUalGMWSC688=;
	b=v+8jVoKVewKz0JKLMRH781Ex5RKwvl0OpdQQ7PAJSh2+dkScAA1ba92TNcBtDA/Mc2Z2mi
	omTvJ6zuFoK6yxZRn6FD05NNKk5GWEqXSRPbdGpiGUOrO1B2gfTc32YpFt47QVWm5lswtH
	L8i3vu3bKBEcs2TsiG0FS9U32QlxwRelvfaiY1MsWVnkErNMGyeg9Mz0C9m6qhhKwugXh4
	2X7pL2QwW+kEQqjCPnR/z2gLYC9garblYugfuY5q0Y+CimMEleztp9LfKLz0A2mSSbPPSU
	4uhNJKktLM/dPLuold80X0uXthO9KehzGJbPTYFDUykNh1uBYUZORFtQW8CC5A==
Date: Fri, 27 Dec 2024 15:07:07 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jagan Teki <jagan@edgeble.ai>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: Add Rockchip RK3588M
In-Reply-To: <8f40821508fde291aab01674618c0a2c@manjaro.org>
References: <20241227133420.169714-1-jagan@edgeble.ai>
 <8f40821508fde291aab01674618c0a2c@manjaro.org>
Message-ID: <e03da44cd6ae417feeb3de3fbfbff7f9@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_060709_150728_17D61A9E 
X-CRM114-Status: GOOD (  19.61  )
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

On 2024-12-27 14:48, Dragan Simic wrote:
> Hello Jagan,
> 
> Please see a comment below.
> 
> On 2024-12-27 14:34, Jagan Teki wrote:
>> Rockchip RK3588M is the automotive-grade version of RK3588 SoC and
>> is operated with -40 °C to +85 °C temparature.
>> 
>> Add rk3588m specific dtsi for adding rk3588m specific operating points
>> and other changes to be add in future.
>> 
>> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3588m.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> new file mode 100644
>> index 000000000000..0bbeee399a63
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> @@ -0,0 +1,7 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
>> + *
>> + */
>> +
>> +#include "rk3588-extra.dtsi"
> 
> I don't think we need or want a separate rk3588m.dtsi file for this
> purpose, unless the RK3588M variant actually differs from the regular
> RK3588 variant from the software standpoint.  The latter is already
> described in rk3588.dtsi, so it should just be included in the new
> board dts(i) file.

Actually, after having a look at the downstream code, it seems that
the RK3588J and RK3588M variants share the same OPPs, so actually
rk3588j.dtsi should be used for the RK3588M variant.  Could you,
please, confirm this?

Alas, it seems we've got some serious issues in the OPPs currently
defined in rk3588j.dtsi, which I'll double check to make sure I'm not
going crazy, :) and submit a patch that fixes those OPPs.

If you could confirm the RK3588M == RK3588J assumption above, I can
add some additional clarification to the rk3588j.dtsi file in the
above-mentioned fixes.

