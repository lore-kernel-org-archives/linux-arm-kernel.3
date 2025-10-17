Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F49ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83oU0Nq5xnzMAjUkw90tTt3G6GepsINo4gg9dQdexT0=; b=k8jkpuoHSRNUHMqeqI0J4Uvae0
	HVzZ95YvqRgLKm+YRuKGvrPDa5xPvFmW4m9NRfTo8c4L0WjGG8k9MyRyT+S/8NlN8ravp4oPd5dYI
	M3uUusQZ6Rytpf9x+YP9i0eHsdSbeIh4KHehOpOGI7x00YXUZhkD4pIRZxlS/e+ubyHo8uw8cTbea
	5Y90NXCFXJDc0tJslgvfFSgShjli95JcBgJtE7cTcjk6gLoXzjgc6cmcXPWxa4nW9klmwWbO2JWK/
	iG+sstfo9AYHXvLRQ2yUCIINZlvWpCM73bP1fCMf/hYlAwuQAHganRsT7A9ZS684ma1rcSTfeYy9s
	9SodhaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfq-00000008VAP-02fG;
	Fri, 17 Oct 2025 16:51:26 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfa-00000008V16-3C6Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nR3rnfz9sSq;
	Fri, 17 Oct 2025 18:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83oU0Nq5xnzMAjUkw90tTt3G6GepsINo4gg9dQdexT0=;
	b=Jw3J8SISIni0bCg4/v9AwVeE1UpeeKVWJcpg85mRTFP1MGZQ5MYCcOT/+h5iaSVGnZDmwm
	h6jXiQV7dC7DBtlGmfwNEHe1PGe+AabvPVH+5zszpTlv+h71y/B5AaG3ChalIBP7EtFyxK
	j0RsFTEFjuQKA060wQ5h0TiBcmIYFmn+1SrQyX59JXaN/iCWrVGeV0dNdv0+lQqT6E5PvH
	1MVoMdr5lEK59FFCpm1QmdUvYOIr+J9faQ78jkmF8Ozuc4FkFOujo+aN1st4eh0ErRTMtC
	QoSA11k2vcxsVeB4+ZPtTLWI4kfIyHYM08CpXgmz/cRSsYqW5uaandpJpQuOHg==
Message-ID: <94e3984d-9bda-4fd5-aad6-61157c23657d@mailbox.org>
Date: Fri, 17 Oct 2025 17:37:15 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 29/39] dt-bindings: display: bridge: Document Freescale
 i.MX95 MIPI DSI
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-30-marek.vasut@mailbox.org>
 <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a5560825f52d16d9234
X-MBO-RS-META: pu6rccg5i194n7adfs18zjzuqp64mx16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095110_943263_2AE264FE 
X-CRM114-Status: GOOD (  10.21  )
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

On 10/13/25 9:13 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:44PM +0200, Marek Vasut wrote:
>> Freescale i.MX95 SoC embeds a Synopsys Designware MIPI DSI host
>> controller and a Synopsys Designware MIPI DPHY. Unlike the i.MX93
>> PHY, the i.MX95 PHY uses more syscon interfaces to configure the
>> PHY.
> 
> Any common driver for Synopsys Designware MIPI DSI, suppose many vendor
> use this IP?

Sure, the IP is common, the "glue logic" is SoC-specific.

>>   properties:
>>     compatible:
>> -    const: fsl,imx93-mipi-dsi
>> +    enum:
>> +      - fsl,imx93-mipi-dsi
>> +      - fsl,imx95-mipi-dsi
>>
>>     clocks:
>>       items:
>> @@ -46,13 +45,52 @@ properties:
>>         controller and MIPI DPHY PLL related configurations through PLL SoC
>>         interface.
>>
>> +  fsl,disp-master-csr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      i.MX95 Display Master CSR is a syscon which includes registers to
>> +      control DSI clock settings, clock gating, and pixel link select.
> 
> why not go through standard phy interface?
> 
>> +
>> +  fsl,disp-stream-csr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      i.MX95 Display Stream CSR is a syscon which includes configuration
>> +      and status registers for the DSI host.
> 
> why not go through standard phy interface?
These are aux control signals , these registers are not PHY .

