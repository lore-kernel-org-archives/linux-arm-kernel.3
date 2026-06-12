Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLoQHEYgMDts8PaREYdyuIclaSf1yNKukBVuA2wOHpQ=; b=mmI+2hpitNDu4N1162KrxaTIMy
	8n0Ses5QZI8BOCtb8KBnkGrqGoVQbXCbI/qb0RX4fhXXLl+4TAJnsvxDK7iK1nweSpbOFjCH7qpxH
	/wq9mI5HQm3Wua+JK/BqN2EEfBWC8ZnFyZcdR5fey5DbKSsdNeR38puMyWtpCt4+i/QX23z+MsVEH
	ARe9EFbbvwziqQiVr8d+fWxbE+CydIpOUq016PGI84QIkSwMFJbv4kYNOITHltlZtr5ADVyMVCHR2
	WZ9KRcoLUHONCn8gps2JDbPpLbTQaNwFLqYXrP4CMXWZ8jUzRUHzQuct5CSi5erRzth8yroMLANI5
	kepCg12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXymI-0000000AjFj-02Oh;
	Fri, 12 Jun 2026 10:06:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXymD-0000000AjD2-447c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 10:06:16 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A346F8D4;
	Fri, 12 Jun 2026 12:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781258737;
	bh=nVO1wcbg8Vyx+jEaPD7eQL4wlG4suC+xgJm3XjJHzpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jhmgg5IwvBUCs/OSuHJNsZIzZlsohD32QTJgQASAhzb9brW3FYhPMeYd3GRJOQpcK
	 0oZ63Hs4/bd3Xrf8drPKsYfOU/fch0EOrnnqa44sgCHh9R7RvCVbcC/LESDnUQJxbF
	 yIAVIgFaGOzp6hkm/qJJ68/VgAGTO/UqwDEF8ygw=
Message-ID: <059f2866-b39d-4c26-8889-b5acff5372ad@ideasonboard.com>
Date: Fri, 12 Jun 2026 13:06:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: ti: Use syscon for the Control Module
To: Andrew Davis <afd@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>,
 Swamil Jain <s-jain1@ti.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_030614_456302_AB6E99DF 
X-CRM114-Status: GOOD (  12.52  )
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

Hi Andrew,

On 29/05/2026 01:59, Andrew Davis wrote:
> On 5/28/26 7:53 AM, Tomi Valkeinen wrote:
>> I have been trying to get BeagleY-AI display support to upstream:
>>
>> 20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com
>>
>> One difficulty has been the handling of the Control Module region, as
>> we need access to a single in that region, surrounded by registers for
>> other subsystems. In my series I made the related node a syscon, thus
>> allowing versatile access to the registers:
>>
>> https://lore.kernel.org/all/20260513-beagley-ai-display- 
>> v2-14-9e9bcefde6bc@ideasonboard.com/
>>
>> However, that's not a correct way to handle it. I realized we already
>> have ti,j721e-system-controller.yaml binding for older SoCs, which has
>> syscon but it's not used for the newer TI SoCs. This series takes the
>> same binding into use for the newer SoCs.
>>
> 
> We moved away from this system-controller thing because it was always
> a hack to allow us to poke into random control registers from nodes
> throughout the DT. This was a mess and also caused issues with multiple
> mappings to the same registers (some sub nodes inside the control space
> also make their own mappings). If you need access to registers then make
> a node with those registers in the `reg` property.

Like in this patch (dss_dpi0_clk_ctrl)?

https://lore.kernel.org/all/20260420-beagley-ai-display-v1-14-f628543dfd14%40ideasonboard.com/

My understanding is that that's NACKed, as we end up adding new syscon 
compats and syscon nodes for (possibly many) single register blocks.

  Tomi


