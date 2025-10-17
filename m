Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A789CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTfWmnLQ6ukMdEbgfBMNWGOo7KjRgWEeSGa22YoD+80=; b=FbUK+nolI6cWfG8yNdfYDGAPDX
	b0spgF8W3P9OLxEA4X3TcSOm8eG8l09yK+z8dVcuDkL1iacKVsXn7+S6W2kWK5IKl0hqTZ1TfrZId
	fWyURWF0eFpiC9/NuN5hsG9XYSyvV7XRg4bY8nz8+1CNw446DHixhYI1w8v2YQB/QRmpfBxRAw3Ka
	OdpTaWxobPBillLFK7IObcKBeKEb5QDOAci+xAVO/4NKedsod/McwUNnlIdRUcJLkUnPKiwJdMLhP
	UVMXFTFSaQAmM37w/B/jixjQdNNHLcohlfS6y+xNQ1240jmwWAAS3qZTfGjWdzCam40wlc9ObhZ9Z
	f89jWvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfp-00000008V9B-0SPI;
	Fri, 17 Oct 2025 16:51:25 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfT-00000008UuM-2PQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:05 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cp9nF6NMLz9tRR;
	Fri, 17 Oct 2025 18:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTfWmnLQ6ukMdEbgfBMNWGOo7KjRgWEeSGa22YoD+80=;
	b=KlzpCtN7V0epBRmPwHiyo4tjl0KakccxsblOcYYkMP3qUvr3HC6kMRrRo8KK+aW7dqVhJH
	jmciNwC5gtkHsA3YxnTDDVtGrI2cGpAELXQDfXsXP7kArwVkEz5bncWkMg37XJMeQcMwVe
	ORLIIw4qn4FucHm440UjqPXe9PWmqhntt/beNEL2j9CfaHU8BVDuum3Ov3LiQxTP/Jdnd5
	WnryxYoyr8TCOeIlSWrFes9pDNy+cWxde7a0G/YHgbwrehOEuFAUeBXxt1Hd/YzM9pW8nC
	ShxQ5ahm4wcfyaTLT8wUKMMmga8Uohqtx4G16YbxD2nNrG3I7AW8zV2JZ2Kl0w==
Message-ID: <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
Date: Fri, 17 Oct 2025 17:15:35 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1e9bf3970d21c759542
X-MBO-RS-META: xtxht9rdhwbcun9qqmd7dk9na8uqmrzb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095103_765079_2BDB2CAC 
X-CRM114-Status: GOOD (  14.28  )
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

On 10/16/25 4:07 AM, Liu Ying wrote:

Hello Liu,

>>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Freescale i.MX95 Display Controller Domain Blend Unit
>>> +
>>> +description: Combines two input frames to a single output frame.
> 
> I'd like to comment on patches in split patch serieses(to be sent if needed).
> But, since I provide the below interrupt information, anyway I take the chance
> to comment more:
> 
> Add more description about the unit according to i.MX95 DC IP spec:
> The unit operates in four modes:
> - Primary mode: The primary input is used for output.
> - Secondary mode: The secondary input is used for output.
> - Blend mode: Primary and secondary inputs are blended, according to the
>                programmed blending functions.
> - SidebySide mode: Primary and secondary streams are projected side by side,
>                     i.e., primary video on the left side and secondary on the
> 		   right.
> 
> BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they don't
> exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
> modes, this would impact how an OS implements a display driver a lot, especially
> Blend mode and SidebySide mode.

There is one thing which specifically concerns me about the DB, it seems 
to be capable of blending two inputs from different security domains, is 
that correct ?

>>> +maintainers:
>>> +  - Marek Vasut <marek.vasut@mailbox.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: fsl,imx95-dc-domainblend
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>
>> No clocks or other resources?
> 
> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
It seems we currently do not use either clock or interrupts on either 
domainblend or layerblend IPs, but maybe DB and LB are different and LB 
really has no clock/interrupts ?

