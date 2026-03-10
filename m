Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6E0EB104A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppjb9j47yslvcid+DX8q6bFEIbk65jKNXP8aELcAr9o=; b=zNFXfYq/tpx9TFBSnSgtfSxr+3
	AkYO0sFrUKurtixjihcFr/QHshwTFcXfdpxHK9TvgNPVy5pEPSiXpm9E8iEPF7AdrmPE/vcIk2mP8
	9DYbUONCzO5aDacB979K9JVVpr7GwkOoEFXAy36mjjiS0P+OIulAIDAR6U0hmmAgfph9fLDmDRcTD
	jKFMyam1UqplZ6BZeZLINMwhzF/5HUl8tfWAMXmCuBk0Oignq81NqtjD306R44b9Hd5H1QrHrurCN
	bs3v4y6xmBI7QQkH1ScpUBUIczxY7BodTpMwp/rNx7G6i3YTxfGhAdex1fqzsTkVKPQzEsHz11zRt
	YAe8nBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv1w-00000009G0S-1qLJ;
	Tue, 10 Mar 2026 11:13:40 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv1u-00000009Fzb-1yoi;
	Tue, 10 Mar 2026 11:13:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4C08294E29;
	Tue, 10 Mar 2026 12:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773141212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ppjb9j47yslvcid+DX8q6bFEIbk65jKNXP8aELcAr9o=;
	b=FhYD7FkxVdjaKA9J/WpxISceZjzTFPOD/2RXU5lPSgSvOIDYQJGkBo2m8dN3kQxuwPb0+4
	drLFzl+7KYPS4ilJainCA8MI3Kkp8uGJYqtQsjUbca4kCALBXeyW0cxlKia1z+yvz0NF1X
	bZ4Y770R8Q3E91oPiwDkfVRYummRq1X4tl5oMbGAq4nihPmBwCHlZL+gyljm7JmHy2zwgi
	mlWP6e6t1ZViR0DlaugoRmNG4TcqMyVeJzAnmFYpeMJ9NKrI0aPd6s0muisTzp3cIwMR+/
	r0EatcYhb8hH72h4TsjUpF1RWZjzD1miUUFocbTgi3plasjxeyNsr2nAGxVDeA==
Message-ID: <36710cc5-5a80-49fc-a9e8-0cac5c554ed2@cjdns.fr>
Date: Tue, 10 Mar 2026 12:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nbd@nbd.name, ansuelsmth@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-4-cjd@cjdns.fr>
 <20260310-scrupulous-fat-ara-eab47c@quoll>
 <1611d3d5-8c3b-4298-bf50-55ab2c2db0e7@cjdns.fr>
 <05b0fc76-4cdb-4aff-815c-1aad500837b2@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <05b0fc76-4cdb-4aff-815c-1aad500837b2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_041338_691896_92680EF0 
X-CRM114-Status: GOOD (  15.88  )
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


On 10/03/2026 11:40, Krzysztof Kozlowski wrote:
> On 10/03/2026 11:37, Caleb James DeLisle wrote:
>> On 10/03/2026 09:24, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 09, 2026 at 01:18:13PM +0000, Caleb James DeLisle wrote:
>>>> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
>>>> which behaves slightly differently because one slot is Gen1/Gen2 while
>>>> the other is Gen1 only.
>>>>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>> Still, four separate subsystems unnecessarily merged into one patchset.
>>> Split independent parts of your work per subsystem. See also submitting
>>> patches.
>>
>> I asked for clarification last time and didn't get a reply. I'm not
>> against changing it but need to understand exactly what's expected b/c
>> the way I'm imagining it seems way worse. submitting-patches.rst only
>> says of patch sets "only post say 15 or so at a time", obviously not the
>> case here.
>>
>> If you're asking for one patchset for phy, one for clock, one for PCI,
>> and then one to introduce them to the device, I can do that. I just want
>> to be sure because introducing unused code, and patch sets that depend
> What is "unused" code? Or how is it unused? Do you understand this will
> go via different subsystems and nothing will be "used" anyway?


Unused in the sense that you can't exercise that code without additional 
code which is out of tree - at least until the subsequent patch set lands.

>> on other patch sets both seem like anti-patterns to me.
> And asking four different maintainers to manually pick up individual
> bits with multiple commands, instead of just applying entire set
> targeting their subsystem, is pro-pattern here? No. Why adding more work
> to maintainers?
>
> Think how this is seen by individual subsystem maintainers and how they
> should handle it.


Okay I think I see the goal, thank you. And you know I'm not smart 
enough to have an actual opinion on this, I just needed to understand 
the "why" so that I can do what's expected w/o goofing it up.


Thanks,

Caleb


>
>
>
> Best regards,
> Krzysztof
>

