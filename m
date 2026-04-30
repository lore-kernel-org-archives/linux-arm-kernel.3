Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA53CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWhfcRHijwSe0odfRKNMuXynxNBJeEvAzq2ape1x29s=; b=N36bBp+qRytmz/5lBAfMOpo6HD
	LwRAc472ynxHiuZOWCCm11IQMCPfq8w8fjcxKaHQfBoq1Std1ArF3Fs+D4yOiTavGYJJEmMYtDYEO
	I+jF96ez12dQdTLCyvjliDnpwHgy0spDn8D+TRUjl7DE0l8XVePI1RVgJzQoUrzbbVatKyrnVynLu
	U5dS44pBhx+yWR8Q65mE9n5IIq18i1h9MyilkuIEGwgUS8FGbHPkK3f2vJJT0D1rwP1zM0h1fIB6r
	Y8aFJ2Vchojb6pRuAkRZMq9w3hKV6r8QZTmpq0pbNQ/WVvB03YNDxxF0QGKEJqgfMfIRUu+9dQK33
	pOhvFyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOxW-00000005Djt-1NTY;
	Thu, 30 Apr 2026 10:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOxU-00000005DjB-3S8F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDEF460180;
	Thu, 30 Apr 2026 10:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76460C2BCB3;
	Thu, 30 Apr 2026 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777546167;
	bh=/vWvGqgbRW7X36x4tSAyZn55Y2G5HU9FVbNdqlcPZPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SS5qTBCrhrzxRgCCwUuVePyx2nclcCfq0UGYc/k7yPK9nKOZzffLTU9CUXX9f8ia6
	 ckPCwhd2TOQeYq3IZ+1P4QSU79wa9whOA5VKuvvFTH/kb81aWzRA7WJXxTAFXKAh6W
	 vm/8mdw+e/PmveAMSUQXX5zpQVR/cOFcVdxN+nu7+jbrb+W/ZGoVplHLVn7ekbyjVC
	 XmJfP/Ke8nTmwtMU2OnRLv/L9pR8kxhhHB8uc8877HHzS0gIb26GJW1Ja0wduNB4PF
	 wvMIG8Lm9x6WaNsrv2W6bmES81O38D2iL0tZBF14P6Hs1Y1YysnO9WaBB9BY74gp+w
	 4yopL2jo4ZJTg==
Message-ID: <866455eb-5886-4d6a-b384-2cbed18b67b6@kernel.org>
Date: Thu, 30 Apr 2026 12:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: imx95: Add dma, intr, aer and pme
 interrupters for pcie{0,1}
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Frank Li <frank.li@nxp.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260430050954.3467984-1-hongxing.zhu@nxp.com>
 <20260430050954.3467984-3-hongxing.zhu@nxp.com>
 <20260430-adaptable-wonderful-hoatzin-e1056f@quoll>
 <AM0PR04MB52208A6081E971A8BF05B2888C352@AM0PR04MB5220.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AM0PR04MB52208A6081E971A8BF05B2888C352@AM0PR04MB5220.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 30/04/2026 10:37, Hongxing Zhu wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, April 30, 2026 4:05 PM
>> To: Hongxing Zhu <hongxing.zhu@nxp.com>
>> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>> bhelgaas@google.com; Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
>> lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; linux-
>> pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v3 2/3] arm64: dts: imx95: Add dma, intr, aer and pme
>> interrupters for pcie{0,1}
>>
>> On Thu, Apr 30, 2026 at 01:09:53PM +0800, Richard Zhu wrote:
>>> Add dma, intr, aer and pme interrupters for pcie{0,1}.
>>>
>>> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
>>> ---
>>>  arch/arm64/boot/dts/freescale/imx95.dtsi | 16 ++++++++++++----
>>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> index 71394871d8dd0..6896d9c15bf53 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> @@ -1861,8 +1861,12 @@ pcie0: pcie@4c300000 {
>>>  			bus-range = <0x00 0xff>;
>>>  			num-lanes = <1>;
>>>  			num-viewport = <8>;
>>> -			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
>>> -			interrupt-names = "msi";
>>
>> Why there is no fixes tag if this is here for two years and you claim that IT
>> CANNOT work without these interrupts?
> Regarding the Fixes tag: I think that it is not needed here because this is not
>  a bug fix.
> 
> The driver has been functional for two years using only the MSI interrupt. The

That's not what your binding said. Get your patchset straight including
proper ABI impact explanations.

Best regards,
Krzysztof

