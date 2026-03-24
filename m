Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95176E9A74F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8AWneB8OBhHUTqMQ4ayFDtiep4R2MIckpZOflriF0E=; b=3WxgOXpNrMHIjG650bIajwmomJ
	F4rxvxaVnkhoOu0BbAx1O1BvVNH6+rekWDIk2dJ6K3S+sGBWSSQ2vd6xwY2LatLIoxBx3cv1ZPfAv
	ECM+sDaoeqnFks0dHbGk74ZuJQBBIbAzkQGuEvx3eSy5xdGVczP9c6G7OVaTIXHKcKJmRKlPmNmsh
	p8435ru3thK6U5K4iA+vPNUiSgXaU7VbB51vKu/yd6TOzAa3sxl0fcuCDTXHZ7ag5ovIZitrA8zln
	8bTnnanJMfQ6IpRmSPyXXUtYD7P/T0bBvDZDqJjorlS0WaFvA6K9h/fpRe9VlntwU+jh2M0dwtxr4
	DFpMgAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yLi-000000017uC-2k9Y;
	Tue, 24 Mar 2026 09:46:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yLf-000000017td-1gQk;
	Tue, 24 Mar 2026 09:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774345610;
	bh=BcODXoQlJ1DFAkNcgiG6uPX6+uutgiyM2xoSaFfQjCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E1EOoVFqk7hSh/rshO7Pa1QiIU0Du1HE7HQfvvtfsyQ6zzNEPkAy5l7bfcdo69RiD
	 YtRGgkWq1GMUSoT23DQKLNQzLdTcJC2tUsVkcCAP2XN7C14srnElu06hy/eHjqk2UP
	 AkECqguGwZUS+BxoPghVSrSg9wTX+M09VbOTF0SP9hiIB6+ykl1iQ8uYBTnkPAF6U3
	 lU+8Ohxe9KMmIcDs2NwfcsxnS8qd3iHZGExmhR2/PD7FdBITOAGQ1sK12tU7XvFbgV
	 zUjUHRU6KPTbCS47GA/eWBiw2IbPoLwkE2w+EVdYQKwY/N67rDnnewv4fTfSu33d8a
	 ilpRq+sMx/IOQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8D1717E4BCD;
	Tue, 24 Mar 2026 10:46:49 +0100 (CET)
Message-ID: <08e6b649-61ac-4059-a914-c537b5c4da7e@collabora.com>
Date: Tue, 24 Mar 2026 10:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
To: Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
 <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_024655_621127_4544ED97 
X-CRM114-Status: GOOD (  10.33  )
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

Hi all,

On 3/24/26 09:18, Sakari Ailus wrote:
> On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
>> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
>>> This 3rd time try to support DW CSI2RX support for imx93.
>>>
>>
>> Laurent Pinchart and Sakari Ailus:
>>
>> 	I am not who will take care this patch?
>> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
>> by Sakari Ailus
> 
> Michael seems to have questions on the last patch, too.

I.. don't.. think so. After digging a bit in my memory and lore, I found
a v3 of that series with my Reviewed-by [0]

[0]
https://lore.kernel.org/all/20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com/

Best regards,
Michael


