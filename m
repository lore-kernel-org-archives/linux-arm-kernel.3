Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACD5CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnKzCwUVh/Raf+TNrxRQ6zRfh+XWAQ3WLV1fli1/n1o=; b=z1oum/No1tMNFc+RArAPuaVV5+
	IkmiOOtyLUMlO+L7ki9gluDsVwhfMIviiHGAoQKCE/CmMD+IpGJkP8YfRId1wk2lXqTTlqlFYxyvn
	zTslpHOkMVViWA1mmM5pwMorzgXYo7i0Uzmfob7BiSZtJH0vz602enwOST6tbOAx0z6jRE4phHI3V
	XN3HnL4iWyCEKJ7U9zqJmjEqJhxWdq/M0F55r3USLXm8X3ZzF1j+SdaWEKfhWzvTp2p2y42J13cIf
	jnAWVuQcT/dHJtqEbZ7IGjXQP9NDpeHBEoKNSlVXhYLHZ2oNkzrfaANPmns87khZxhG+BvmeJh0rA
	aslhRR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DSK-00000008apU-1cao;
	Fri, 10 Oct 2025 13:46:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DSH-00000008aoq-25kE;
	Fri, 10 Oct 2025 13:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760103999;
	bh=j+7Q50v1WcbolonU2FwjWi93Z0/pQgPtjDDj72dphGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nlVtMYQSaBTbBqEzskyVDW3uqVSg0BCrNtKS6VAG5QXDRwNiNzeITlsWwvFtu4i3P
	 1WRK4yb5kYm82Yr9g+ZWRTiMYKA1C2CFvEQExtAob4eMz7/oxBRsVGvVig9gHxGKMv
	 cJSGz3ReDwM9SWWa8y+iywpSRmJai4H3rrgzGKXFCus8YGZpxDf9uFdiL+/4cb5E5b
	 6hIufXoENtW3maZaVUrwwSUfRJF5THUFM2+GEB48Z+bumAxZYvvx0LffQJ0FIApPkP
	 eomBRxbnJvZwqdTuQ7/SGm8xuhJzx2yjDb9rj2VAeCU02C1h2PcEySLiBEYWVBK6uV
	 OS+TrbwZCsFLg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8D8017E01F5;
	Fri, 10 Oct 2025 15:46:38 +0200 (CEST)
Message-ID: <de1a1dce-f60e-48a1-9945-d2c91b328df5@collabora.com>
Date: Fri, 10 Oct 2025 15:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/17] media: rockchip: add a driver for the rockchip
 camera interface
To: Bryan O'Donoghue <bod@kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <HSTnNzc6MTLHGWih5qjlI2nvVECP8FVdcQVeBON4KlWYLtEaWIlNmEpKTU_vlqitbIIHMpabKnvnmpEQFqHYxQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_064645_711862_388E27B8 
X-CRM114-Status: GOOD (  24.09  )
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

Hi Bryan,

On 10/10/25 14:15, Bryan O'Donoghue wrote:
> On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
>> Habidere,
>>
>> This series introduces support for the Rockchip Camera Interface (CIF),
>> which is featured in many Rockchip SoCs in different variations.
>> For example, the PX30 Video Input Processor (VIP) is able to receive
>> video data via the Digital Video Port (DVP, a parallel data interface)
>> and transfer it into system memory using a double-buffering mechanism
>> called ping-pong mode.
>> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
>> DVP and a MIPI CSI-2 receiver that can receive video data independently
>> (both using the ping-pong scheme).
>> The different variants may have additional features, such as scaling
>> and/or cropping.
>> Finally, the RK3588 VICAP unit constitutes an essential piece of the
>> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
>> units, and a data path multiplexer (to scaler units, to ISP, ...).
>>
>> The v11 of the series adds a media controller centric V4L2 device driver
>> for the Rockchip CIF with
>>   - support for the PX30 VIP (not tested, though, due to the lack of HW)
>>   - support for the RK3568 VICAP, including
>>      - capturing frames from the DVP
>>      - capturing frames from the MIPI CSI-2 receiver
>>   - abstraction for the ping-pong scheme to allow for future extensions
>>   - abstraction for the INTERFACE and CROP parts to allow for future
>>     extensions
>>   - initial support for different virtual channels (not tested, though,
>>     due to the lack of HW)
>> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
>>
>> The driver can be readily extended to provide support for the RK3588
>> VICAP variant. In order to keep things simple, however, this extension
>> shall be submitted separately.
>>
>> Looking forward to your comments!
>>
>> To: Mehdi Djait<mehdi.djait@linux.intel.com>
>> To: Maxime Chevallier<maxime.chevallier@bootlin.com>
>> To: Théo Lebrun<theo.lebrun@bootlin.com>
>> To: Thomas Petazzoni<thomas.petazzoni@bootlin.com>
>> To: Gerald Loacker<gerald.loacker@wolfvision.net>
>> To: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> To: Markus Elfring<Markus.Elfring@web.de>
>> To: Sakari Ailus<sakari.ailus@iki.fi>
>> To: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
>> To: Mauro Carvalho Chehab<mchehab@kernel.org>
>> To: Rob Herring<robh+dt@kernel.org>
>> To: Krzysztof Kozlowski<krzk+dt@kernel.org>
>> To: Conor Dooley<conor+dt@kernel.org>
>> To: Heiko Stuebner<heiko@sntech.de>
>> To: Kever Yang<kever.yang@rock-chips.com>
>> To: Nicolas Dufresne<nicolas.dufresne@collabora.com>
>> To: Sebastian Reichel<sebastian.reichel@collabora.com>
>> To: Collabora Kernel Team<kernel@collabora.com>
>> To: Paul Kocialkowski<paulk@sys-base.io>
>> To: Alexander Shiyan<eagle.alexander923@gmail.com>
>> To: Val Packett<val@packett.cool>
>> To: Rob Herring<robh@kernel.org>
>> To: Philipp Zabel<p.zabel@pengutronix.de>
>> Cc:linux-media@vger.kernel.org
>> Cc:devicetree@vger.kernel.org
>> Cc:linux-kernel@vger.kernel.org
>> Cc:linux-arm-kernel@lists.infradead.org
>> Cc:linux-rockchip@lists.infradead.org
>> Signed-off-by: Michael Riesch<michael.riesch@wolfvision.net>
>> Signed-off-by: Michael Riesch<michael.riesch@collabora.com>
>>
>> Changes in v11:
>> - rkcif: split large driver patch (6/13 of v10) into smaller
>>    patches (6-11/17 of v11) (Bryan)
>> - rkcsi: replaced devm_reset_control_array_get_exclusive with
>>    devm_reset_control_get_exclusive (Philipp)
>> - Link to v10:https://lore.kernel.org/r/20240220-rk3568-vicap-
>> v10-0-62d8a7b209b4@collabora.com
> 
> I believe it is the case and please feel free to correct me if I'm wrong
> that you've dropped a long list of sob/co-develop-by, I think we
> discussed that too, because of the level of change, it seems reasonable
> too.

Correct. The tag list used to be quite complicated [0] due to the
complicated history of this driver. Maxime worked on the driver up to
v5, Mehdi up to v14, I added RK3568 support on top of Mehdi's v14 (with
some valuable contributions from Gerald) and submitted that as v1. v2 of
my work incorporated Mehdi's v14, and here we are, after several rounds
of feedback, at soon-to-be v12 (or, in fact, v25).

> On question on that, are these people aware of the change and cc'd on
> the list of recipients/contactable/agreeable to the change ?

I announced this plan as a response to your comment to v10 [1] with
Maxime, Mehdi and Gerald on Cc: and did not hear any objections.

Hope that this is still OK for everybody!

Best regards,
Michael

[0]
https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com/
[1]
https://lore.kernel.org/linux-media/23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com/


