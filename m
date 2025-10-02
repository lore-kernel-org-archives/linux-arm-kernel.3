Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CAACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWQiPW9Wbi5Jgbs8x0eTvSUPclkJj1xMPMESA1LngoY=; b=Uq44yV5XkSr3wu7KSo3ucEPOkZ
	GD8oFe7FnAW+6vkudi8XNsQ+Yik7+SkXeNtaqZcvfkXTpGj4Fs7WAPw7XWJ5hRVCSthr2c9TS5pV8
	mWT+Og1qFYJ7h0PccTOR7oFNrkz6R1mJV+PUdXF460SxzSRHt5UZ51Qkx4Kbfz0VgARR0uSIUA1fF
	N65AnN/sjaU51p+3Kr4OGiUIpWjgQg/dUyrz+1bBR57iubf+hGchNOgYN+dW2rID9aDbtSklpVQy6
	3bb4fYa4SYmtK3UGajlZ/qtGJA/oK9u5zIn+8aWjnB3MzQzDrcmITNdUPZqMWPHSre6yIUXHPgKgJ
	6WQL4Fbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4RIA-0000000BKdB-43jI;
	Thu, 02 Oct 2025 21:56:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4RI7-0000000BKck-3r7w;
	Thu, 02 Oct 2025 21:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759442205;
	bh=ShPhllfzrcEjHAglwp5h9FU1kRG9OTc0vV3QUF6vOPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMJuhrHkNJWgvMTKAZu7VN98y+ZmDJ1zCVAqZ0jWvpy0Q2gKRL3xvaTuP1T6O0BrR
	 c8e5svsZ8rG0uzmGXeJJ4UP5sXxQnK1PGjNAgGZidLwG8Sr6WRWlmDNfTug43KWxHK
	 TKkXvTa65m4D1ZGLYL9tGJ5muPS8R8X9xQ+KAn9aCgA68DDI+kP1DUOCtZg9UP9qEp
	 LA0/FFG408O8oM3jNZuwI6yfv8j4oBPSQ8YIjWkyr2Y7vBcLoscF2Z+poMK8KYeAMH
	 o7cxY5d12wVik/lxnHDGJr8Jl1rESTuDvdGGMrOZu7+wl+ifhN5pPM8GyIT36tO+4/
	 YkXTfBG+VBDvg==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6EEFD17E12C0;
	Thu,  2 Oct 2025 23:56:44 +0200 (CEST)
Message-ID: <31187dc6-69ec-400e-9f01-2f3062092d26@collabora.com>
Date: Fri, 3 Oct 2025 00:56:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Add device tree for the Orange
 Pi CM5 Base board
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jimmy Hon <honyuenkwun@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Muhammed Efe Cetin <efectn@6tel.net>,
 Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
 <1964913f-8323-4714-a061-5fa09ce0983c@collabora.com>
 <20251002205240.GF16185@pendragon.ideasonboard.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251002205240.GF16185@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_145648_139021_B769DD2E 
X-CRM114-Status: GOOD (  23.87  )
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

On 10/2/25 11:52 PM, Laurent Pinchart wrote:
> Hi Cristian,
> 
> On Thu, Oct 02, 2025 at 10:24:59PM +0300, Cristian Ciocaltea wrote:
>> On 10/2/25 6:47 AM, Laurent Pinchart wrote:
>>> Hello,
>>>
>>> This patch series adds a device tree for the Orange Pi CM5 Base board
>>> from Xunlong. This is a combination of a compute module and a carrier
>>> board, so the device tree is split in two files.
>>>
>>> The work is based on a combination of upstream device trees for other
>>> RK3588-based Orange Pi boards and the downstream device tree, all
>>> checked against the available schematics for the carrier board. The
>>> compute module schematics is unfortunately not available.
>>>
>>> The series starts by adding a new compatible for the board to
>>> arm/rockchip.yaml. The next patch documents a missing property in the
>>> rk3588-dw-hdmi-qp bindings that the device tree needs. Finally, the last
>>> patch adds the device tree.
>>>
>>> Patch 2/3 may be slightly controversial as the new DT property could be
>>> better named. 
>>
>> Indeed :-). As a matter of fact I've already planned to introduce it as
>> "tmds-enable-gpios" [1], during my recent FRL related work.
>>
>>> It has been supported in the driver for a year now, so
>>> there could be users in the wild. I have therefore decided to keep the
>>> current name. I am open to alternative solutions.
>>
>> As mentioned in [2], this was "inherited" from downstream and hasn't been
>> really in use so far.  I intended to do some more testing before attempting
>> to send those patches upstream, as for now I couldn't notice any (obvious)
>> change in behavior when switching between TMDS and FRL, with or without
>> making use of it in DT.
> 
> Thanks for the links. The new property name is better. We may need to
> preserve backward compatibility though, how confident are you that the
> enabled-gpios property isn't used in the wild ?

I think we should be fine, also considering this doesn't seem to have a
negative impact on the functionality provided so far.

> I'd like to get the device tree for the Orange Pi CM5 merged sooner than
> later. Would you post those two patches, or should I take them in the v2
> of my series ?

Sure, feel free to take them if you wish to speed things up a bit.

>> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/5a32a84ee3e801daaeb974f967f6e213983feeb4
>> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/df4d94fdb94463dd4175338bf7044b40c5e559e4


