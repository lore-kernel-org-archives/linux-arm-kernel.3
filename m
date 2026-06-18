Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB68FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5v08WKNwGmYUGdtUiZ9afvSoR3TpkA2HvknteopE5Q=; b=oABmcxPdTW6hGEf4a80BYZM88u
	b2SAGKXtq3+vEgxpOvIk4EJa6qmDYWTg98F/22UOjaKIiPmH+e3o8/kvxn3FVMNxN0F57+BQ6LZRv
	O3m9PaZ4JdDpA8vlJkTs1p8RcLTMsxu5T5RaXHBpqFY7H94V7Nsf0RIm4v8WtFIfEAxm0HHDO+tvL
	kDMQ4WqtbtqYH/pVp96jPtagjTScXzkVowX1ctzv8LC/CYzH43scAzRaHXTSxBGa9lAHY7Myuovy+
	EBBmOILmh5Bfc1ztreVjWSLn8faO+VDB/btbsWEGuPLnkDVjD/QvIGpU6WSArkFMPLdGwfjgt+os6
	BDHuS+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8HR-00000000rRA-3OBp;
	Thu, 18 Jun 2026 08:39:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8HP-00000000rQT-1RuN;
	Thu, 18 Jun 2026 08:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781771955;
	bh=00Sh3h7guBWY5L2puvf4zlaEaH/SsYgyBTF6Tbvqf10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hzcvqf7GuKHpdHlXk2wp0uWxEnywUQE5XOLR4Qi5aLbyJU5+IpgYUYwTwNWqBRnr4
	 lXDy+UR9gQb4JO5rI0JuckPmTPgC1ZhGImgZ1BrEZLq3BFNWOb8rH9LHUh6fYqSOWA
	 AoTCuEB3aW8WJfm/O0fJdxn+24bVVqy3Mw+0ibEcrP5btrCOCYrjst8zWINPzouYsk
	 uld2UHSmgRmuGyblJP51TUv784fFUvdhTDnK4GNVyg3VkGSiPRJIFTmyvH7xZkD+om
	 4xXsiDMLuZ/SjppHamWcOXOFAXxvU9jbGJfMDjPDCFqFKocc8pSQLhZQNAXlREwnj4
	 mAsGjpwQx0m8w==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC13917E05DE;
	Thu, 18 Jun 2026 10:39:14 +0200 (CEST)
Message-ID: <fe8038fe-940a-4c61-a551-082534ef9c51@collabora.com>
Date: Thu, 18 Jun 2026 11:39:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: display: vop2: Add missing reset
 properties
To: Diederik de Haas <diederik@cknow-tech.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
 <DJC0L3CRJ0WL.IZEYVLPROMM1@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DJC0L3CRJ0WL.IZEYVLPROMM1@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_013919_541869_A4958064 
X-CRM114-Status: GOOD (  14.74  )
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

Hi Diederik,

On 6/18/26 10:58 AM, Diederik de Haas wrote:
> Hi Cristian,
> 
> Thanks for this series :-) Just 1 nit (at the end) ...
> 
> On Wed Jun 17, 2026 at 8:52 PM CEST, Cristian Ciocaltea wrote:
>> Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
>> clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
>> provided only on RK3588.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>> index 93da1fb9adc4..d3bc5380f910 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
[...]

>> @@ -289,6 +321,16 @@ examples:
>>                                "dclk_vp0",
>>                                "dclk_vp1",
>>                                "dclk_vp2";
>> +                resets = <&cru SRST_A_VOP>,
>> +                         <&cru SRST_H_VOP>,
>> +                         <&cru SRST_VOP0>,
>> +                         <&cru SRST_VOP1>,
>> +                         <&cru SRST_VOP2>;
>> +                reset-names = "axi",
>> +                              "ahb",
>> +                              "dclk_vp0",
>> +                              "dclk_vp1",
>> +                              "dclk_vp2";
>>                  power-domains = <&power RK3568_PD_VO>;
> 
> Place reset* props below power-domains (like in patch 9) ?
> So everyone who copies your example has the correct sorting order.

The example doesn't strictly follow that ordering either — see e.g. the iommus
property — so I placed the resets right after the clocks, which keeps the
related properties grouped together.

That said, I don't have a strong preference. 

Heiko, is there a convention you'd like the Rockchip bindings to follow here?
Happy to reorder if so.

Regards,
Cristian

> 
> Cheers,
>   Diederik
> 
>>                  rockchip,grf = <&grf>;
>>                  iommus = <&vop_mmu>;
> 

