Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C85CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 03:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaummfnzPtyabIhQrawAEZGn0WmOzI9XiKr6uYhqAdM=; b=Rwdw4fskKCwfCucox5RF5sc2eT
	h6KyRjBjiR+zeV4SfOUqyXzqbdXAhEduCU9dqYkbOd+iL/BJ+NDToY4XlUXRhsECDZXezRWA0EZus
	QlnybpR/Xo2dHjzt/rntElwOydu/ETjUjhcw10WWkFj48ix0G2diETHqRjXhu/6NVT6fUhzWm7hVR
	H9uySt4PchS1/V/usWUZOG1zg+k9mWZOOLA7WPotYBLJGkuBTZdwCM2XUxK4dZglzB0BOReuud3Ke
	s9Fp7dJy3D9TutOfohGV2fKU0/k6vZKv7grMgsPcOoqT1hI4EIwsp6q+mE05S54F/BeDeg5RikXIW
	6eDtjlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3Jx-00000000Z6R-3UGs;
	Thu, 18 Jun 2026 03:21:37 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3Ju-00000000Z5v-3dQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 03:21:36 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ggmGg0dq8z9vDJ;
	Thu, 18 Jun 2026 05:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781752891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaummfnzPtyabIhQrawAEZGn0WmOzI9XiKr6uYhqAdM=;
	b=VlxnlGk5x98IFPAPb+Uxk7JXYgFvupUY7xvz5F5ucOm5LM0Dvp5fQxiM/lYTOk0QWbeP3u
	Vx3rrQwQBCOM2+81sLTZx5yQRLyz+X6q2PdqxZoOsW3fy6PlaDHzdQpATyevYz8xAKfpgA
	M2JUj+f52aORUcJ7j6P2JiGNFXTOYlBq+YF+eLpDR0CfXJh9FgyfyfPv1xJssw4wdK4Zwj
	ltiTzPf3hHvfU9aaEU13HJnBhOUHwFuvd9waUkyAiIP/8XoUgUBN9JCxfSVVd9BW/kp/Sp
	rL4iGZn3jqne16CobF1XNqm8mDRphLLCrSVPjxoi1ledW/RE0pSD+EYNRDa33Q==
Message-ID: <eef933e9-7e14-4885-9179-4bfa500a22e4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781752889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaummfnzPtyabIhQrawAEZGn0WmOzI9XiKr6uYhqAdM=;
	b=A0eftJREloi7497i69ik2WjlGnYuWTpsYSeRMoAGCA6+ljZbaefGEOW8V53t3mQX0wotvG
	FevspN8s8r51fogSI9tMALw2cCD5TMHxBAliegQHFiMc5Fx7rU3RmFrvXfwmesTDwVU7dj
	sP7QulEJE4e2HNAc/2rklIs5NBlI/fiYYATo3kPcY/a7887cDHQFmun4YRpvpsu2bwwaOH
	rap45L7gIWe0UlOfN+A5pcs+6dsVJ4HV4eQ03wt7lnxIPamsZRRh2ckAWKN/JoYeGMzb9y
	Er0B4Todz74yEKqoSYzL4E5sBWEBUjBpltpwmXBVlOa8owNesmMOeOLQSo7c1A==
Date: Thu, 18 Jun 2026 05:21:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Manivannan Sadhasivam <mani@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <lstafqaogzunb2azyqwvtt3swrk42nu3n5zyct2la5fqxomaqg@wyrz3qolhist>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lstafqaogzunb2azyqwvtt3swrk42nu3n5zyct2la5fqxomaqg@wyrz3qolhist>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4sd38nnow6od9mw6adg44nq3ip514b31
X-MBO-RS-ID: b17926727949ac9f6e5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_202135_089117_426F5695 
X-CRM114-Status: GOOD (  14.71  )
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

On 6/17/26 12:33 PM, Manivannan Sadhasivam wrote:

Hello Manivannan,

[...]

>> +/* INTC address */
>> +#define AXIINTCADDR		0x0a00
>> +/* GITS GIC ITS translation register */
>> +#define AXIINTCADDR_VAL		0xf1050000
> 
> As Marc pointed out, this address should be fetched from DT, not hardcoded in
> the driver.

I will reply to Marc when I have this ready for V2.

>> +
>> +/* INTC control & mask */
>> +#define AXIINTCCONT		0x0a04
>> +#define INTC_EN			BIT(31)
>> +#define INTC_MASK		GENMASK(11, 2)
>> +
>>   /* PCIe Power Management Control */
>>   #define PCIEPWRMNGCTRL		0x0070
>>   #define APP_CLK_REQ_N		BIT(11)
>> @@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>>   	return rcar;
>>   }
>>   
>> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
>> +	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
>> +	u32 val;
>> +
>> +	/* Make sure MSICAP0 MSIE is configured. */
>> +	val = dw_pcie_readl_dbi(dw, MSICAP0);
>> +	if (pci_msi_enabled())
>> +		val |= MSICAP0_MSIE;
>> +	else
>> +		val &= ~MSICAP0_MSIE;
>> +	dw_pcie_writel_dbi(dw, MSICAP0, val);
>> +
>> +	if (!pci_msi_enabled() || pp->use_imsi_rx) {
> 
> If MSI is not enabled, then what's the point in clearing these registers (also
> above)? I see it as a redundant code. Is there a necessity to clear them?
AXIINTCCONT INTC_EN should not be set if MSI is disabled, this code 
makes sure it is not set, even if it might have been left set e.g. by 
prior stage. So no, this is not redundant code, this makes sure the 
controller is correctly configured.

