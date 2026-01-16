Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72D9D4898A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WyQQMGHGz4l8RtlIs7wG4/qrWtgpu4ySXORX9EAt7M=; b=NkGq8N3DnEpBz32vrgg32UHEgp
	MnW4IEB17k7gfqutCBUSXg7HdkWBe/64AhRI8Lj6Cpc9gVOGHFPIra2O+dbF8mQ4AgbkFFmYTggB2
	n/sQEvRHi0KlA9aG02Mqv5XOKbPkxQWSn1JArDJeq8jcbvzGWFJeCiwaRpbsS5VJ62PgQsxyIDExJ
	QVhJ8nLiQVRh9GJ/27vYhsFzJahdwHAuYVWiGr9+yDCrjdmb1EAbuAg/fGXxs1jtnAUBFByfKzUXr
	+Ei1qESeQr51mprusqvvGm7mLp/hr28IyTnnVMu8yG/vZAwZEdJag+CNXwJsdu9GqZj4t2/3uAb5n
	CoqzWxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiNx-0000000E4US-3Csa;
	Fri, 16 Jan 2026 11:53:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiNv-0000000E4U5-2k4T;
	Fri, 16 Jan 2026 11:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768564376;
	bh=nknwdjwlTfZ9RlS5zqZbBOK2l5l0+b+5NYdaA3MTaNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dACYW8d7AN3fQWTePdA4eEQBJQXLG2fJ/HAc/QkTzGo2/XN6vbf6Wbq6KGqwKOdMY
	 jcX+dVMgcqhVrzvYzyA9dgYgfrs1NrGhxkRmHTvMCw8Pgh9dp27XMd4Mnhj+kRIkCM
	 SE+rCM+Snyn7GOWfAilrggBo7dmX/8emiA0AESpkZ+orwNJSOXrmHmGyyfR6+3lwtO
	 Bv1KFQ+ykohO3Qp1ORsyxAHFDDCdBRKR1oWTj2UJ6ljHZKn0R7CNHmNEo7tdN4U0EP
	 z6X6d/ffCqqYbFX2G+0BRdmKa53YnsBql1O5+8RUECR6jtyMbSryfMJmIFDT6W/Zpk
	 U5kRswXfAb5DQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5037017E1380;
	Fri, 16 Jan 2026 12:52:55 +0100 (CET)
Message-ID: <03547127-6903-4925-bb49-c77a377bf177@collabora.com>
Date: Fri, 16 Jan 2026 12:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-2-a9c86fecd052@collabora.com>
 <aWoOoBS_hWRQP7ac@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aWoOoBS_hWRQP7ac@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_035259_876344_FB03F34B 
X-CRM114-Status: GOOD (  20.81  )
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

Hi Sakari,

Thanks for your review!

On 1/16/26 11:10, Sakari Ailus wrote:
> Hi Michael,
> 
> Thanks for the update. A few minor comments below...
> 
> On Thu, Jan 15, 2026 at 07:26:08PM +0100, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
>> one input port and one output port. It receives the data with the
>> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
>> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>>
>> Add a V4L2 subdevice driver for this unit.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  MAINTAINERS                                        |   1 +
>>  drivers/media/platform/synopsys/Kconfig            |   1 +
>>  drivers/media/platform/synopsys/Makefile           |   1 +
>>  .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
>>  .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
>>  .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
> 
> How about dw-mipi-csi2rx (or dw-csi2rx)? There might be a tx chip, too...

Heiko and I had an offlist name bikeshedding discussion, and he already
responded to that concern. Please find the rationale for this there.

> 
>>  [...]
>> +static int dw_mipi_csi2_disable_streams(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_state *state,
>> +					u32 pad, u64 streams_mask)
>> +{
>> +	struct dw_mipi_csi2_device *csi2 = to_csi2(sd);
>> +	struct v4l2_subdev *remote_sd;
>> +	struct media_pad *sink_pad, *remote_pad;
>> +	struct device *dev = csi2->dev;
>> +	u64 mask;
>> +	int ret;
>> +
>> +	sink_pad = &sd->entity.pads[DW_MIPI_CSI2_PAD_SINK];
>> +	remote_pad = media_pad_remote_pad_first(sink_pad);
>> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>> +
>> +	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2_PAD_SINK,
>> +					       DW_MIPI_CSI2_PAD_SRC,
>> +					       &streams_mask);
>> +
>> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
>> +
>> +	dw_mipi_csi2_stop(csi2);
>> +
>> +	pm_runtime_put_sync(dev);
> 
> How about just pm_runtime_put()?

Ah right, for some reason I used the _sync variant in the error path of
_enable_streams and used it here, too.

But I can change both instances to plain _put.


> [...]
>> +static struct platform_driver dw_mipi_csi2_drv = {
>> +	.driver = {
>> +		   .name = "dw-mipi-csi2",
>> +		   .of_match_table = dw_mipi_csi2_of_match,
>> +		   .pm = &dw_mipi_csi2_pm_ops,
> 
> Just tabs, please.

Oops! Not sure how this could happen. Sorry for that, will fix!

I'll send out v5 soon.

Best regards,
Michael

> 
>> +	},
>> +	.probe = dw_mipi_csi2_probe,
>> +	.remove = dw_mipi_csi2_remove,
>> +};
>> +module_platform_driver(dw_mipi_csi2_drv);
>> +
>> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
>> +MODULE_LICENSE("GPL");
>>
> 


