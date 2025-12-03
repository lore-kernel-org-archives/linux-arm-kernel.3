Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ECFD1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLOqfJ8See9aWRpeuv8zbGISxu+ElubaVwiRCHg5i7k=; b=zTSxHiXPe3fnRSxZACg4cFGnoL
	1lIM+Sl9fTsFktue0/KiYSAtaPdwdEIsdbmfFyQknlE1s6OLDGsT2W2DVmuOwvtOvQLYAq/ewmGFE
	k0bJyjodOpjb+qFQuqHyXIJyULtVUBu0nPwS7/L003tu3U3jg9r377E+bVT1IEKgiH1pGNQ8ZrCD4
	J/lOUxNVKVCP4R2Jiu7nW0pASeeHBCMFM8+qKrJWO9K8aFXbiVag6elFR2oO/WncBlcUBybt137X1
	c5SRJUukdBL2Ev4ZDGmn7Ry3iAnp+VXTHkGpLzkdC3xrlnQ78t5YKLY5Uchxol/bu60Sz0VnFDiVC
	Kp55c20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuI1-000000077o1-2Xis;
	Wed, 03 Dec 2025 21:21:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHy-000000077kT-3Xrj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:31 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQuHg-0000gJ-5X; Wed, 03 Dec 2025 22:21:12 +0100
Message-ID: <1db3a9ee-ae09-431f-93ac-680bac088f79@pengutronix.de>
Date: Wed, 3 Dec 2025 22:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
To: Krzysztof Kozlowski <krzk@kernel.org>, Jacob Chen
 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
 <20251203-spu-rga3-v2-1-989a67947f71@pengutronix.de>
 <81593c42-fcc2-47ad-8d0f-69a2d17664a6@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <81593c42-fcc2-47ad-8d0f-69a2d17664a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132130_880471_77FED9F7 
X-CRM114-Status: GOOD (  16.74  )
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

Hi Krzysztof,

On 12/3/25 9:28 PM, Krzysztof Kozlowski wrote:
> On 03/12/2025 16:52, Sven Püschel wrote:
>> Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
>> peripheral found on the RK3588 SoC.
>>
>> The existing rga node refers to the RGA2 peripheral. The RK3588
> What is "existing rga node"? There is no node here. This is a patch for
> bindings, so you say which hardware existing binding describes and what
> are the differences against that older hardware.
Yeah that is misleading. I refer to the existing binding/compatible 
values of rockchip-rk3xxx-rga which describe the hardware named RGA2 in 
the rk3588 TRM.
>
>> contains one RGA2 core and two RGA3 cores. Both feature a similar
>> functionality of scaling, cropping and rotating of up to two input
>> images into one output image. Key differences of the RGA3 are:
>>
>> - supports 10bit YUV output formats
>> - supports 8x8 tiles and FBCD as inputs and outputs
>> - supports BT2020 color space conversion
>> - max output resolution of (8192-64)x(8192-64)
>> - MMU can map up to 32G DDR RAM
>> - fully planar formats (3 planes) are not supported
>> - max scale up/down factor of 8
> "differences" in meaning nothing above is supported by RGA2?

except the last two points yes. The RGA2 supports fully planar formats 
with 3 planes and can scale up to a factor of 16. For the scaling I can 
add a note to make it more obvious that the RGA3 is worse in this regard.

Sincerely
     Sven

>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
>
> Best regards,
> Krzysztof
>

