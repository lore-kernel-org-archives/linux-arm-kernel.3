Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA286E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NP5Y8/O0Oc9k478L1LRw9mJQHwjSZlVZoadTLuLD3bY=; b=pcM2mjc1Pe4FzFKbg3eA23IZRi
	SnkY+nxs4+DRZMj72+BdEeJkx65zRNAjgvtb/O+gXuI6LrYhO/szK9Id6kgbHptCfdzrVYAPGb1oh
	5iDZaWF4zvFXROiZsNuJP3BvL/al0+ztXGJywQeNITcwec3Ce6e1o4+JeVPoAkFnfT2JtV8A4ccr8
	BDfF7b47cPbBvra2pFgHnT9t8EqnM+DxbHMbK/GP1bezMh/hlk8cqmeZ8KpH3G1XQLXYjubTKlu3R
	jGQVd1Scz/tCb6jDClrp14FObnWH8SxtnW9/vQDy5DWXEFzkECkxNXSLr5P7EecBd3+qRQNqhfgZm
	vjSF62mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFlR-00000004NjU-0hHu;
	Mon, 13 Jan 2025 08:25:37 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFkC-00000004Ncd-0dpE;
	Mon, 13 Jan 2025 08:24:21 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1736756657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NP5Y8/O0Oc9k478L1LRw9mJQHwjSZlVZoadTLuLD3bY=;
	b=d8Empi5WA2UJ1zS0ddwUrM+Qk1NkOfJa4O3dj5SEXV6LaLW7Y+bc12XtymLBfnjfJ6AgIt
	sf/zpnRI2sY1w1ufENH7lsq77JuGSqiG8Td2KqrSyllg3aqZthzhUOWKQcWfVXzlnh9n9p
	dZT1YstAPQKIzzzJWDIxgoHf4KrYWzWgolISWRgFS1fN0vRprnNkcGA9HTODoDwmrfU47C
	eMai8Ilw7AxGhPCMWO6oGs0+Fwa4ZtXEX+98DYe7iRKAA7k/Pc2dy2Mzbm/e8R0hVILBxM
	fGNUlWyfs/7sVCUtcMkdK3zpn4r3OmQqBgMLkhnUrWlel2a+BNWaVQKoVLZ49g==
Date: Mon, 13 Jan 2025 09:24:16 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Junhao Xie <bigfoot@classfun.cn>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas
 Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki
 <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
In-Reply-To: <54b5dac0-5791-4b20-a237-dac6fd03c259@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
 <20250112073344.1976411-4-bigfoot@classfun.cn>
 <1e72cc9cdc390e79e97806fe4f7d8abf@manjaro.org>
 <35f8fe37-b06f-49eb-b0c2-430421f1ff3b@classfun.cn>
 <7b55c7469774c41d9896df3100df1630@manjaro.org>
 <54b5dac0-5791-4b20-a237-dac6fd03c259@classfun.cn>
Message-ID: <3ee25756b12e999631bd959d787ff248@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_002420_482874_8C39A5A4 
X-CRM114-Status: GOOD (  13.72  )
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

Hello Junhao,

On 2025-01-13 09:18, Junhao Xie wrote:
> On 2025/1/13 12:25, Dragan Simic wrote:
>> On 2025-01-12 23:16, Junhao Xie wrote:
>>> On 2025/1/12 16:47, Dragan Simic wrote:
>>>> Unless the design of the board is proprietary, it would be good
>>>> to provide a link to the board schematic, for those interested
>>>> in verifying the board DT file.
>>>> 
>>>> As a note, I already tried to find the board schematic with no
>>>> success, so the design might be proprietary.
>>> 
>>> Yes, this board is proprietary. I asked the manufacturer and
>>> they don't provide schematics.
>>> 
>>> But I found a partial schematic diagram of some of connectors
>>> on the board here
>>> https://dl.ariaboard.com/photonicat_rk3568/Photonicat%20rk3568%20EVB%20Board%20spec.pdf
>> 
>> Yes, I also found that PDF file.  It's somewhat similar to what
>> Raspberry Pi provides with its reduced schematics -- helpful to
>> an extent, but still leaving a lot to be desired.
>> 
>> Out of curiosity, what did you actually use as a reference to create
>> the board dts file?  Perhaps some downstream dts file provided by
>> the manufacturer or found in some operating system image?
> 
> I wrote this device tree based on other rk3568 devices in mainline,
> and downstream board dts:
> https://github.com/photonicat/rockchip_rk3568_kernel/blob/novotech-5.10/arch/arm64/boot/dts/rockchip/rk3568-photonicat-base.dtsi

Thanks for the clarification.  It would be good to include that
link in the description of patch 3/3, for future reference.

