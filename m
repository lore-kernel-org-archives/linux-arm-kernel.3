Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CDACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EgudNb1t2H04X3Uxf3sckikMBJDc7XWFtowvqn87DA=; b=J6UjO/5qwTeZmE0CeVFF6bmH3o
	UuZRTMKHye+Nu+QTCvUQ8FwNMUxOUIxWwxPxk+D8Vnj20zT/hW9n1FxOIB32GOZ3G4EoWQj+bB+pB
	+W1qpPytLz8TBapW9nHzFTzpF4dlSNrqKPqWiBixfZeOqbKBaY0kLlqkhCgHchXC54A3Pmu9mWcWU
	2G5v/FY0kr/srkhP0IOX6643tnCkdlLavCQb2otnn/evPMOzhDAuVhR7ib+fiP/+NljC6fd2XlcAp
	oWiiijJFYlTJFM4CclmgPX/PNl8f//bK9ShrZtPUmeyX6vrtXOLs3elqH0E9zwTdLzDPkvlvwgsel
	6cnSzXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8oSn-000000002hg-0iG1;
	Tue, 14 Oct 2025 23:29:53 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8oSk-000000002hE-3nZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 23:29:52 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmVmm55FMz9t55;
	Wed, 15 Oct 2025 01:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760484584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EgudNb1t2H04X3Uxf3sckikMBJDc7XWFtowvqn87DA=;
	b=MvC2hoFmjRlE08Z2cpHd91R496RZQ73YHbMmRpbQ8bRaEwPs/YKcfYcU5Oa02aHUqu/hhp
	kudwEr50YG+idlJGiVkH+q5YzmmDRFXBR47vXIsg/e9PEicA/XZcrfLJCor89jJozhEL1o
	WQq0jzaM2fMo2+IiZ2CM1cUoZzzYW0p7MMFUx/KIihW6UnJ4kDCWDeZpdHtv3iueBPnioG
	XunJSCHsXoGoQfY3+1WC7pI4t+RqCzp0BBNNmcBBOIWBTWnlCGFcDFFR7eLTHeyY29Rhi2
	RhT7MPyrDaIYzo+Z8CPwApX3rhCQauOrs5by6uJR+Y+jMVbyFxBFuAwxCikXdQ==
Message-ID: <24287186-1b97-434f-929f-a391a2fd9784@mailbox.org>
Date: Wed, 15 Oct 2025 01:29:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] ARM: dts: imx: add power-supply for lcd panel
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
References: <20251014-imx6_dts_clean_2-v1-0-508b36e5a3fd@nxp.com>
 <20251014-imx6_dts_clean_2-v1-1-508b36e5a3fd@nxp.com>
 <ddc44948-4816-452f-8b78-b1dfe44d507b@nabladev.com>
 <aO7IOCdq013j3rre@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO7IOCdq013j3rre@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1gdpq4cmtt4pmqpa7trd33o7sk81o6h4
X-MBO-RS-ID: 93991c12fdee1fd4b15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_162951_106228_79B2ABCC 
X-CRM114-Status: GOOD (  12.83  )
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

On 10/15/25 12:01 AM, Frank Li wrote:
> On Tue, Oct 14, 2025 at 10:46:56PM +0200, Marek Vasut wrote:
>> On 10/14/25 9:38 PM, Frank Li wrote:
>>> Add power-supply for lcd panel to fix below CHECK_DTBS warnings:
>>>     arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: panel (sharp,lq101k1ly04): 'power-supply' is a required property
>>
>> ...
>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts
>>> index b29713831a74489e8cc0e651c18a40d85f9f9113..04e570d76e42cd67a38e0f3b2301598f712e6bd4 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts
>>> @@ -199,7 +199,7 @@ touchscreen@38 {
>>>    		reg = <0x38>;
>>>    		interrupt-parent = <&gpio5>;
>>>    		interrupts = <4 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
>>> -		power-supply = <&reg_panel_3v3>;
>>> +		vcc-supply = <&reg_panel_3v3>;
>> This looks like a different kind of change ?
> 
> It is touchscreen, It needs sperate patch fix it to align
> edt-ft5x06.yaml.
Can you please split this fix from the series, include the error message 
you get from DT check, and possibly add Fixes: tag ?

Thank you

