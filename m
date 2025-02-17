Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B5C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 23:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA0APYcabAYrh/4s0jixfZJ0G+/GdpWGPCJ8xYmKg5M=; b=RtoIxGrAAjzSA4aDXhWlPyfBVy
	JfhlbZTBMkeMdLRvy6hcxU6QV7ZCFboiRUrEmKpONh09PU3o9rMDbb/vlmuj8Xl75VESz1ynhajAG
	7OzhcBAIfN9KXsO8VJ7eiSleFPc9LkNxTofRKRhijoLFuBNw5i+EB2S86SKerzeDjmuTYEaWfa/ty
	zi/L62PCr4R0AAF+mkGEgjiecLFy0cee0ovTDywgbYhuTqTFLE/J2NxeyoVnJKsJD1MsgwMwTtXYv
	3epySOl7OrCgxA7pH3sn+5qBPMxAv+dBMpigW/orjKly3EoPoGWYk6VNOz4GdgLwINyZ0CcpK+QzG
	cNmnzOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkAdq-00000006Fvm-2fhQ;
	Mon, 17 Feb 2025 23:35:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkAcO-00000006Fmj-0AjA;
	Mon, 17 Feb 2025 23:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739835218;
	bh=LdoZzq7qtMiglzhu00kRaJtsesikQFQgmqj4oShgtzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JEO/bCNBZRdX7mbbM65vYVr4iQyWDeUcojAo9kKT3nJWtW9bZsprxtF2kpXRSeUpO
	 /v4uzzlJeo1l68SC389qUGWLSL8D6a8q76DWWoSw/OMbq4l+yvrPP+AreJPqV5eW2b
	 V1ISv89z9tPP8yI8Ggb/BYCgu98EnxTtmOrDhmAobhI5omeOMTJiO/4OOmEajWUCpH
	 JY7KP94rvSz5hip/8oAZ//z4w1Ef1MPWauAagzgqzWqB+Ojmk0NTJZpQq71/SC7N4I
	 hsZ76kKXobhqrhEza/hNUdtDeue+AWq3nAGeOhWg7gpZMDpA1OtoDkdjYn13cX5lbw
	 lCGnQBTCaDC2A==
Received: from [192.168.1.143] (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D17617E1553;
	Tue, 18 Feb 2025 00:33:36 +0100 (CET)
Message-ID: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
Date: Tue, 18 Feb 2025 01:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
References: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
 <20250217024437.35155-1-liujianfeng1994@gmail.com> <5190979.MSiuQNM8U4@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <5190979.MSiuQNM8U4@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_153340_229731_3CFAB67C 
X-CRM114-Status: GOOD (  12.04  )
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

On 2/17/25 4:33 PM, Heiko Stübner wrote:
> Am Montag, 17. Februar 2025, 03:44:37 MEZ schrieb Jianfeng Liu:
>> Hi Cristian,
>>
>> On Sat, 15 Feb 2025 02:55:39 +0200, Cristian Ciocaltea wrote:
>>> The HDMI1 PHY PLL clock source cannot be added directly to vop node in
>>> rk3588-base.dtsi, along with the HDMI0 related one, because HDMI1 is an
>>> optional feature and its PHY node belongs to a separate (extra) DT file.
>>>
>>> Therefore, add the HDMI1 PHY PLL clock source to VOP2 by overwriting its
>>> clocks & clock-names properties in the extra DT file.
>>
>> There are boards that only use hdmi1 such as ROCK 5 ITX. So there are two
>> choices for this board:
>>
>> 1, Enable hdptxphy0 as dependency of vop although it is not really used.
>>
>> 2, Overwrite vop node at board dts to make it only use hdptxphy1 like:
>>
>> &vop {
>> 	clocks = <&cru ACLK_VOP>,
>> 		 <&cru HCLK_VOP>,
>> 		 <&cru DCLK_VOP0>,
>> 		 <&cru DCLK_VOP1>,
>> 		 <&cru DCLK_VOP2>,
>> 		 <&cru DCLK_VOP3>,
>> 		 <&cru PCLK_VOP_ROOT>,
>> 		 <&hdptxphy1>;
>> 	clock-names = "aclk",
>> 		      "hclk",
>> 		      "dclk_vp0",
>> 		      "dclk_vp1",
>> 		      "dclk_vp2",
>> 		      "dclk_vp3",
>> 		      "pclk_vop",
>> 		      "pll_hdmiphy1";
>> };
>>
>> What do you think of these two method?
> 
> Going by the code in patch1 (+drm-misc) we have:
>   vop2->pll_hdmiphy0 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy0");
> +
>   vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
> 
> So the clock-reference to hdptxphy0 should just result in vop2->pll_hdmiphy0
> being NULL and thus ignored further on?

Yep, that is the intended behavior.

@Jianfeng: Did you encounter any particular issue with the current approach?


