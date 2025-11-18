Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A8CEE343
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsjITLeTmFB4t/a/WwBEIib9Wiw7mOIaYtPmz8XMYbs=; b=UbPts7POW7CQA+FVA+6XMpjW7A
	xUSQiBFaoRxrRde/t0M+CUjPnWMceOCW6azkQkpfMTQs0PYwgehwx0C2pOZOt77olly+hxYfXx1tc
	1K37QJTJbJBh+EWExD8Gy9kv0ZaeVD6uL1rbWPMaai0kQV1qp550cGa3ccYTIgAjvUiPueRHOq71U
	yfwMrj2UwxdwBNkBScUpGnQcaHxYNgRj/W2PFxqu6EmiaUSM4rPmo1Tpxg888IlDYSb7ZDoIQilJI
	7hBFjzawpDshZQrq2kw49sKG4V6wqlTFT5jS+rZSg1mx2NgS3uU7neEiblZYPNVuDEFWTDFjzH6ML
	JuCzXmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLQvL-00000000zdh-08AU;
	Tue, 18 Nov 2025 18:59:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLQvA-00000000zZY-1DXi;
	Tue, 18 Nov 2025 18:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763492355;
	bh=zJNUrRj587FQsGyE0czCnjJ6PtuOY81WP+YvMy5Ka1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qdjIFpj9XfKyHjeibzt+NBM1a2vqzFfX4V3QdUbParRXtar/U765arJQycLvPXCVz
	 pdknpJnXYbqYoMsnkVQw78Fdt07QKs13NmgXRe7B0pZqNI1qo1UKCAEq+EdCjBBFxW
	 gIucdl8H02k9UBV3kFDur6ccv5FMWCvRQ0GLFEjw/tavAHeJ34EY/WbR5fdxJawwOV
	 HKu+zspSn5oqfoWg04OxZH5FqXS/laOaFeYSLU/q/2VXk03GXG7jHmYeZuuYm+F0gq
	 JoZEgCfwNy3D7kf2Syu61p0oczWw9FdRQNIpDT/QiFDCZAan/4xqrxUZdh+RjXOiDC
	 es6QJjaF9ERkQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DCD8E17E0117;
	Tue, 18 Nov 2025 19:59:14 +0100 (CET)
Message-ID: <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
Date: Tue, 18 Nov 2025 19:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
To: Frank Li <Frank.li@nxp.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
 <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_105920_492705_615B291D 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Frank,

On 11/18/25 18:15, Frank Li wrote:
> On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>>[...]
>> +#define CSI2HOST_N_LANES     0x04
>> +#define CSI2HOST_CSI2_RESETN 0x10
>> +#define CSI2HOST_PHY_STATE   0x14
>> +#define CSI2HOST_ERR1	     0x20
>> +#define CSI2HOST_ERR2	     0x24
>> +#define CSI2HOST_MSK1	     0x28
>> +#define CSI2HOST_MSK2	     0x2c
>> +#define CSI2HOST_CONTROL     0x40
> 
> Look like that is designware CSI2 controller, can we build common library
> for all dwc csi2 controller, instead of every vendor create individual one.
> 
> First try at
> https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/
> 
> Toshiba have similar patch
> https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/
> 
> Frank

This has been discussed already a while ago:
https://lore.kernel.org/all/20250507083837.GA11152@pendragon.ideasonboard.com/

Bottom line from Laurent:

"Let's keep this driver Rockchip-specific then. Thanks for checking."

>  [...]
Best regards,
Michael

