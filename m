Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBE8CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qkvYLHiPQK3YQ/bggKAhUgUK3vQbS1Kelw2b8UZ/Jg=; b=aLy8kPlhkX+OoJze/o5X6hXlAb
	JeC5GW16VB7hQ+yDnSsP4Hni7K1sKKiYS2pEHbFwpZCAPg/OX0PPOhkOEO1m/mSRNCWAT/o9gXlUV
	bF3PTtPJGxl4nPOC85wX2rWbgPYLdOg+/rFgfCRVcMbx3dbpmX+aHLGpxSjO0d3nFAJcJjenOjf+A
	nAenUFXJjgx/X0BAjqbrilwDmODdgcmd/7hBJ6HqHLX8Ia2QZqtW9WWGg20WgedEEz7x5j3VVFS5o
	LzhbpPcfRyb0E/astBh83Z+V89j4ikRqGTeTdvNzSPefVkOwF+QEudGZkYPTLWT5E9eHqMq6ytL+0
	YpiPXn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4xG-0000000BFC4-45G2;
	Fri, 26 Jun 2026 11:42:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4xE-0000000BFBU-2fEj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 11:42:42 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C911E6;
	Fri, 26 Jun 2026 13:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782474114;
	bh=BM4hFHiFsObK0LIS+fIVKgawCpiGQpH+mXX2lBxwRJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dp3NNdvW1pGAEnSKWCxg2578oLJ6i0AisKoebBSSrScvuDG0WEWSdGx/Wj8MHWwOQ
	 P6WeNBn/2U4LN/5Vbsuc7XrYurGyDkqHrnEFiEQVXDNd0NhxnXHWUl5xdy5YWePj4x
	 Dd6NfsJJjmNzoUiy3kIbQQrZ08/1qFbUZ7SGcI/E=
Message-ID: <15d76a14-4deb-4f4e-a14e-2094df75bf75@ideasonboard.com>
Date: Fri, 26 Jun 2026 14:42:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: ti: Use syscon for the Control Module
To: Andrew Davis <afd@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abraham I <kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_044240_832299_EE6D33D0 
X-CRM114-Status: GOOD (  18.58  )
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

Hi Andrew, Krzysztof,

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
> 
> The only reason we didn't get rid of `ti,j721e-system-controller.yaml`
> completely from the older SoCs was we were told it would be an ABI
> break to correct those DT files. Let's not spread that problem to
> new SoCs.
I'm still stuck on this issue.

So, to summarize, we have the big control module memory region from 
which various drivers need "random" registers. In my particular case, 
the display subsystem (DSS) driver needs to access a single register 
from the control module, but as the control module contains a lot of 
registers, there are other similar cases too (I've seen at least one 
other series, trying to add access to control module registers).

Taking AM62 SoC as an example, we have this in upstream:

https://github.com/torvalds/linux/blob/4edcdefd4083ae04b1a5656f4be6cd83ae919ef4/arch/arm64/boot/dts/ti/k3-am62-main.dtsi#L44

"main_conf" (simple-bus) node representing the control module, and nodes 
under that representing either small things like clocks or, in 
dss_oldi_io_ctrl case, a syscon.

I'm aware of three options on how to handle this.

1) Adding small syscon nodes under the main_conf, similar to the 
existing dss_oldi_io_ctrl.

I did this in the earlier series: 
https://lore.kernel.org/all/20260420-beagley-ai-display-v1-3-f628543dfd14%40ideasonboard.com/ 


2) Making the whole control module a syscon, as I do in this series.

3) Adding the required registers as a new 'reg' block under the dss' DT 
node.

Both 1) and 2) have been nacked or at least very strongly questioned. 3) 
doesn't feel right, the register is not a register for the IP but an 
external SoC integration register.

Is there an option 4)? In your opinion, is one of the above the one 
clear choice?

  Tomi


