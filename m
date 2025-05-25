Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705DFC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 16:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge+Qb/J48yhxSaNKIMUsB1dyJ9dP97tIunM4dMdF9Q8=; b=NnZjl5PzRfKaWIn2/6Xo+WMzms
	i8eCKpgDNd5kGEjcuTospWwv9Wj72QmRxdbEsjJj6rH7hidG1X8J1gmzMuu0WmPVkS+p+zSobNL7N
	enGjkzvI4Rd7QNy1GueTZWdWvw0SLVx18FTL5N8SwenaoAdLrf0IiZuk6gRvfh5WlmDmXffTe1D+o
	3M4jphRMljmiBTtFJlSkzUIoLO1+KfAcC9/eW+HqlDdRy9wMswcrCajXf3Gd1TRXGBKKTztGNyhKz
	kDQfgdBtfHA1JereDq2qCQsY9v2GtMemyjpc071ZyNxoUXf0zmX5u3dcftjKV5ddCRaAJh0NRLMle
	HcE03Xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDxk-00000007KLW-0MEX;
	Sun, 25 May 2025 16:12:36 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDsh-00000007Jp1-0NLt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 16:07:24 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b53gs3Gq5z9t0p;
	Sun, 25 May 2025 18:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ge+Qb/J48yhxSaNKIMUsB1dyJ9dP97tIunM4dMdF9Q8=;
	b=LMl9xoOK8qJZ0Hort6KN20Qm+Zk1irqjt9p3XD+85pQNYzoki/LKQVZ592GgsT7Zo+LNvV
	YlrsBLPuzAPVZvSZllkLJsF3kGwzifwQ9HPxKzsqeJDKULQ8JgupYcv+FxGvP9whyUbrRx
	YhJOl4g9OD5OtPsZTvpAwiHArgCO+UDNt5cTOT2f/H4JFpnC++vgiPiPKikHRObwsyfnUe
	9KFsYDGG5s5WChJBSK0Hw6l1xh6ybdi4avqpUayyb8WxFOcQKbbTTwVbFE2KvA4QCW+h3R
	Y9JWPshmrS+i6ZwCPsxhSxnm3IkY1T3YJ/e7UKGsrMxXc6Zn5B9jsoja6/pruQ==
Message-ID: <cba4d5e0-b330-4af8-a96a-b501d523c6bb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ge+Qb/J48yhxSaNKIMUsB1dyJ9dP97tIunM4dMdF9Q8=;
	b=L0h/0n+zQgE4ChgBIXOoQfkfgHoTosE9YXEwXesvgwbkact2WCUQTHTTJYMLHw6TMIzGxe
	tpnsdwjFQnhwYcfuPo72eoWe9wz9rgDVtVBw1+0UaVX8J9lAw0lHlPR1l/fkp5X3Gw0Y/f
	iSv31hUaAPjoIgRzmtHB/ygZWK61I7Tjh6Yjwx6Ulvw0y08aD+iy4EE+FJ/vVWq+RvtTYf
	9bXlZTjzc48PBh+l+Hn+q7eNJ1IVhJI5E/KPDytBBsHUoXenDOXDKFcWK3bfGL9EIO2144
	p+GNgNaxnXu23Xitj4f4OPBDy8qFAS66fqv1/HJTy5J0E2E6zu96WJQzpOKzhw==
Date: Sun, 25 May 2025 18:07:14 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
 <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
 <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org>
 <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oiqd5n1xyzdecnbzqfywr8eedrmc9mzg
X-MBO-RS-ID: eacf1afced01bac336f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_090723_276380_17F360F3 
X-CRM114-Status: GOOD (  19.39  )
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

On 5/15/25 1:57 PM, Manivannan Sadhasivam wrote:
> On Mon, May 12, 2025 at 10:42:20PM +0200, Marek Vasut wrote:
>> On 5/9/25 9:37 PM, Manivannan Sadhasivam wrote:
>>> On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
>>>> Document 'aux' clock which are used to supply the PCIe bus. This
>>>> is useful in case of a hardware setup, where the PCIe controller
>>>> input clock and the PCIe bus clock are supplied from the same
>>>> clock synthesiser, but from different differential clock outputs:
>>>
>>> How different is this clock from the 'reference clock'? I'm not sure what you
>>> mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
>>> and the binding already has 'ref' clock for that purpose. So I don't understand
>>> how this new clock is connected to the endpoint device.
>>
>> See the ASCII art below , CLK_DIF0 is 'ref' clock that feeds the controller
>> side, CLK_DIF1 is the bus (or 'aux') clock which feeds the bus (or endpoint)
>> side. Both clock come from the same clock synthesizer, but from two separate
>> clock outputs of the synthesizer.
>>
> 
> Okay. So separate refclks are suppplied to the host and endpoint here and no,
> you should not call the other one as 'aux' clock, it is still the refclk. In
> this case, you should describe the endpoint refclk in the PCIe bridge node:
> 
> 		pcie@... {
> 			clock = <refclk_host>;
> 			...
> 
> 			pcie@0 {
> 				device_type = "pci";
> 				reg = <0x0 0x0 0x0 0x0 0x0>;
> 				bus-range = <0x01 0xff>;
> 				clock = <refclk_ep>;
> 				...
> 			};
> 		};
> 
> 
> and use the pwrctrl driver PCI_PWRCTRL_SLOT to enable it. Right now, the slot
> pwrctrl driver is not handling the refclk, but I can submit a patch for that.
I posted a new series now, you are on CC, see

[PATCH 1/2] PCI/pwrctrl: Add optional slot clock to pwrctrl driver for 
PCI slots

Thanks

