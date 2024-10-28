Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D85D3399E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFCOLroLFXcEgjchaIorQHiTpZB3miBEfJXzHQvpThA=; b=Tb96BQJz8Z/V7z3+BKGRmnl+hO
	Xh2cDRN9H/IVnbhnzvXZSjZMXsAmWYvJoPHFFULHt6PvZ9zzs8KtwlA2HojoivwIncOwwWOrEL+HX
	6FU4z1tKPPzvhNfMf5WsyPa+kW2uperbQQe+t5Qw0YVnKIqKbEo1bz8TMPFntjeMg7JZeWs6c3gtp
	Mm/OmpJ9P6Y/daDW+5MGJ4t2P1BBk/+XbJfO/0IQ3Jc8bKJF+AXAIUnqDLT2jLS/quqYI4yPtwA0m
	gLGvM4sruLN1OVtvhA/OmsHsIXWfmP/R4pzn6oqzCfGwVZlYm0chVMacB3YJS1UcbbKWsWna8wZA1
	i4lsxc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sn8-0000000BXN8-2Awb;
	Mon, 28 Oct 2024 16:40:30 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sib-0000000BVQa-1r4o;
	Mon, 28 Oct 2024 16:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730133348;
	bh=SgbZ6d/TsfOwGbc31ZKuYuZl628O9USHtGUALdy8B+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZgS7BZdH9XB4Xl54n/5i1z3TmXuFPGbZT7e1yyh6uidffhW5fJX3UtOgD2UeUYK1h
	 aPieFahk0TWr7mrR5UR2vvYcP5G9n0GfgeYuBZezw2UKR5niDymDl8Chm2YXq1yxqd
	 vV4KAWsY0azGRYxHjbp5QIGL1rr6H6czLNQ6yUZmoFu5Ga1u8VcJoyhLXkD0lsoVNi
	 T2CoAgCcSGveBqJ5QOz7kqvpbcs/+pHyUxwaXhJI4d0jDTHHpou488yykXHXa3FNB2
	 SauQb81+iQBLuqZg93k1S5j7eQe03frPSqwIwgzzfHf1Vz5qoXIeBK2irb+YrAK9yQ
	 VpuH4DjlbmtDw==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 13:35:46 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: wens@csie.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Parthiban <parthiban@linumiz.com>,
 Yangtao Li <frank@allwinnertech.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 07/13] arm64: dts: allwinner: a100: add usb related nodes
In-Reply-To: <CAGb2v64tQ_9C3mwJqt-tm-6SV=SHAk75sO5Ho7gT=p=iyRfLcw@mail.gmail.com>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
 <CAGb2v64tQ_9C3mwJqt-tm-6SV=SHAk75sO5Ho7gT=p=iyRfLcw@mail.gmail.com>
Message-ID: <542c16a63ab228a7ed1cc81fc91b961f@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_093549_588881_13E336B2 
X-CRM114-Status: GOOD (  10.14  )
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

On 2024/10/25 10:29 pm, Chen-Yu Tsai wrote:
> On Fri, Oct 25, 2024 at 1:09 AM Cody Eksal <masterr3c0rd@epochal.quest> 
> wrote:
>> 
>> From: Yangtao Li <frank@allwinnertech.com>
>> 
>> Allwinner A64 have two HCI USB controllers, a OTG controller and a USB
> 
>             ^^^ Please update this.
I wasn't sure if I was supposed to update the commit messages; a few 
others have grammar errors as well. I'll fix those alongside this one in 
V2.

Thanks!
- Cody
>> PHY device, let's add nodes on dts.
>> 
>> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
>> [masterr3c0rd@epochal.quest: fallback to a33-musb instead of h3-musb]
>> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
>> ---
>>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 91 
>> +++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi 
>> b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
>> index adb11b26045f..0aee1b578661 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi

