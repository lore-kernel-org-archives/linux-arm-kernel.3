Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457E0CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSV1EkXETB3zud4jm/sn7W8OLUZIPf6/pzd46gwys5s=; b=27rjIVcNMl3jokS7Ea1PAklWJL
	Xa/OpFGnveLH8lOdevDHqT2KWDaNFK9UmUvOyixVvP/zM73nAJyRo3dAuBQgSMwMm9zH4gF9C2gTK
	edPgphsHF9ckEngW/G/RMspYXE8IFxGckMZo6oRQRHohUtJZ4/v31umMqQCxlAvXmeynqtSJmLGSy
	dI6ACXKjfEpqdp8q1/B7IjL79+Ib9BsED7mR4eqixsS6/Dln563K/t/ciWaghG3hE8Dcui4JAzaJL
	CW6a5sybTwkfduOfr4lD5+0YK7dy8JsqDKx8SyEYSekCzld6viOfeL4nil+pSDlkGtnmTl611+miA
	rnEJ7NSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFYW-00000003cm8-1gRD;
	Wed, 13 May 2026 19:47:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFYU-00000003clp-0xsI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 19:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 415A860052;
	Wed, 13 May 2026 19:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9F0C19425;
	Wed, 13 May 2026 19:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778701661;
	bh=rrQKK03WIh8RzNQzNNWa6G/QbwuSw5FsrXzHFJ5OZP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bN/HiWZfchkfVCMz6r6hXBjLdJUzCz9l8i5iQi7jF9IRwIfKnQOCND+WB6AnKmgGm
	 eRJMCB/EALxc12F6qoqhfFRIwTqmLdARf/fEAMkWptJ29Dn7kmlcE0Ulktb8iRsxZi
	 8KIlACcQDULnRO+SfGm1LEIkexQysdDzMsMwMl1BbT+6kaQTKhiECjfKeqwZVmYDaZ
	 StbCV5ENh+L1X2N1p4+7asgk5QNNMxVRmrwbzv6ejlagd9R+ifoCsWh/puaoWFhbhz
	 lSFPfwQY210eF2Ti7QxWycBNlMrl9iAYNyOKEOFF1X/aOQdOddnCt6lwFDwPQrGJBc
	 x5z7nLd7yXnpQ==
Message-ID: <16e82bc7-7c19-461a-8c5e-9dfc5e91a2b9@kernel.org>
Date: Wed, 13 May 2026 21:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
To: "mani@kernel.org" <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Frank Li <frank.li@nxp.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
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
 <20260430050954.3467984-2-hongxing.zhu@nxp.com>
 <20260430-proud-ammonite-of-gaiety-abaafc@quoll>
 <AM0PR04MB52202A13D528B3AE16C3616A8C352@AM0PR04MB5220.eurprd04.prod.outlook.com>
 <55258a51-9cdb-451c-be06-74b9b3020cbc@kernel.org>
 <GV2PR04MB12019F5425D6EB9AE52FC32CE8C3C2@GV2PR04MB12019.eurprd04.prod.outlook.com>
 <t3d2s6rl25ywobis4xiwwdvjrccua2qrpwfsxqpvp6qw5pzofa@kjm4wzcpjcli>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <t3d2s6rl25ywobis4xiwwdvjrccua2qrpwfsxqpvp6qw5pzofa@kjm4wzcpjcli>
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

On 12/05/2026 15:26, mani@kernel.org wrote:
>>>>>>
>>>>>> These interrupts are optional for existing variants (imx6q, imx6sx,
>>>>>> imx6qp, imx7d, imx8mq, imx8mm, imx8mp) to maintain backward
>>>>>> compatibility with existing device trees.
>>>>>>
>>>>>> For fsl,imx95-pcie, all 5 interrupts (msi, dma, intr, aer, pme) are
>>>>>> mandatory due to hardware requirements.
>>>>>>
>>>>>> This introduces an ABI requirement for fsl,imx95-pcie. The i.MX95
>>>>>> hardware requires dedicated interrupt lines for AER, PME, and
>>>>>> general controller events due to its redesigned interrupt
>>>>>> architecture. i.MX95 cannot function correctly without explicit
>>>>>> interrupt routing for error handling, power management and link event
>>> detection.
>>>>>
>>>>> fsl,imx95-pcie was added more than two years ago, so how it cannot
>>>>> function correctly? Are you saying that for two years you had here
>>>>> completely broken code?
>>>>>
>>>>> If this wasn't tested for two years, how can we believe anything is tested now?
>>>> The basic PCIe functionality has been working since the initial
>>>> fsl,imx95-pcie support. However, AER (Advanced Error Reporting) and
>>>> link up/down detection were not previously enabled. This patch-set
>>>> adds and verifies support for these advanced features.
>>>>
>>>
>>> That is not what you said in the commit msg.
>> Hi Krzysztof:
>> Sorry for the delayed response due to a holiday.
>> After reviewing this patch-set again, I'd like to suggest an alternative
>> approach: would it be possible to mark these newly added interrupts as
>> optional?
> 
> Yes, since even without these interrupts, PCIe functionality still works. Only
> issue is that it cannot report error and recover from LDn.

Yes. Please mention how the hardware or SW implementation behave when
these are missing, which is then serving as proof why they can be optional.

Best regards,
Krzysztof

