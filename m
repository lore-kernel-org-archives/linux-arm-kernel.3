Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0AC107BCE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4K1x/xDt/NxS8Q9BVBkV+cMrs0Twad+ANE3NSy0F94I=; b=JGxBOVh/bo5El112sGbZob0JIE
	nn/JtE5bFkTk4DsAdMoQFiyoU+bqoqWM2D0ttZ/Qe1MXRyWhHMLfP5kX9JkJnebj+TKQH4jciHO6k
	60DBjxrpecomMLFNtmT5cxOsMQjdrZQ+i/YGLgF4jkfPsYPohljrMAIH7DQIlYEuQW6lSxpdZbLEo
	qC9RZmQzuZc5LTmkAlkYd9uCdr17G4u2RJMF8+EgjtbwfP09Ux0rLym2VZoTKQBlJqhgyDf2kft1F
	2T3OMV6Uw37zWePhf2JSIibyxgrtARWcwcHE2w1R5+JpjUYsebS+oDy3MdOcs7PhNFjvD4arN+dEX
	Ao36XE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18ge-000000019Qn-1Ata;
	Fri, 13 Mar 2026 20:00:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18gb-000000019PX-2p73;
	Fri, 13 Mar 2026 20:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773432038;
	bh=7y5xiInZCWmmHEw1menCYPBGJisRe/lJxFo8cH20mis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rk/7P1tc2/5uFwKiov74BGEb8RCgKEmBskn1txNGp5nOdDabX6F9uBWC5DGKJaAbJ
	 qHM1Bq13agSKpEOLatcRPLD+TAsXO9Kwaqlebhhxpn64r1H2BMsms01h9GnECeKcgi
	 PUsZqq2KO2l4ecS+HEq8tzXYLkvJqA+enVSU/7USCarlTf2XNl2Syj7q2Dy8p4tshz
	 1z7wCXXpisV0YDT/dT3ca2HDvXIm9d3xXBLqxxTYCa+TYMMyyoiM1m5z2aShZc/VbO
	 lx0GwJE/HdtlOZy988O9SkW423YeSfKFl19AoImYAx6HrxbFYQs4q2iNKvwmX/gcrE
	 fKhRfRZfO90Vw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8D0417E0222;
	Fri, 13 Mar 2026 21:00:37 +0100 (CET)
Message-ID: <e064b4f2-a138-4ea9-aee4-93ac8af38f64@collabora.com>
Date: Fri, 13 Mar 2026 21:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
To: Conor Dooley <conor@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?=
 <mai.kuznetsov.misha@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
 <20260313-quickly-imperial-47638c9f0d4f@spud>
 <20260313-coyness-jab-ff0c85654555@spud>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260313-coyness-jab-ff0c85654555@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_130041_897003_29626CBA 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Conor,

On 3/13/26 17:57, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 04:56:29PM +0000, Conor Dooley wrote:
>> On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay wrote:
>>> From: Michael Riesch <michael.riesch@collabora.com>
>>>
>>> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
>>>
>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>> ---
>>>  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  2 files changed, 257 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
>>> new file mode 100644
>>> index 000000000000..7fd4214921cb
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
>>> @@ -0,0 +1,256 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Rockchip RK3588 Video Capture (VICAP)
>>> +
>>> +maintainers:
>>> +  - Michael Riesch <michael.riesch@collabora.com>
>>> +
>>> +description:
>>> +  The Rockchip RK3588 Video Capture (VICAP) block features a digital video
>>> +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. It receives
>>> +  the data from camera sensors, video decoders, or other companion ICs and
>>> +  transfers it into system main memory by AXI bus and/or passes it to the image
>>> +  signal processing (ISP) blocks.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - rockchip,rk3588-vicap
>>
>> Curious why this cannot share a binding with the existing 3568-vicap.
>> Looks pretty similar binding wise at least.
>> If it's an entirely different architecture or whatever, please mention
>> that in your commit message.
> 
> Looking further, it's using the same driver too...

It's not an entirely different architecture (indeed it uses the same
driver). There are some differences to the RK3568 and the PX30 (which
uses its own binding as well BTW): apart from different resets and
clocks that's mostly the notion of the connections to the ISP. But to be
fair, as it turns out this boils down to two additional ports.
Other recent SoCs (e.g., RK3576 or RK3562) will be a good match for the
RK3588 binding, but then again exactly resets, clocks and ports may vary
in that variants as well.

Personally I find this variant-specific DT binding magic hard to read,
and thus I went for a separate binding. That said, please let me know
what your preference is and I'll arrange it that way. Not a hill I'd
want to die on.

Best regards,
Michael


