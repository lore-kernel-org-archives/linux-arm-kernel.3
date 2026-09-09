Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A27C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQJdynXsODCNzrfM0pBEb3urha8CodX3nldpSKp+/4o=; b=VAx69WTznBXumTa5wF0GQqS0Bb
	0V1rAZKBeRWRotuHwB/BECS11tRCLPE7xESoxcP9Ow8RmmBBrfHITrDoy0MyENF1Y4t9g9wcvTfu2
	dDVlNTbjYscfXRPN2aLEro3oUjkIFVuCCbHFSvroISQpwt3oeMgRfIp1M/z+Pe1ECRp1NBWruCNG0
	dMajj31KzpND2LFT/A8i/wD3POtzHY11yFZP8mSx+a/pKybwBFV3MjGCU4t3kskqiMFlh34YNIysj
	4flNKu79uKDDoXy7lBUULHJOn42HZFWeN/JiSguf4Xud4huT45wGmY9moN3q9JTEdbQOMhZ6K9m+Y
	pgyOwr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K6N-0000000C7kP-0BKf;
	Wed, 09 Sep 2026 15:20:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K6L-0000000C7k7-3Ylb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:20:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64B9B40AF0;
	Wed,  9 Sep 2026 15:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B93E1F00A3F;
	Wed,  9 Sep 2026 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967241;
	bh=kQJdynXsODCNzrfM0pBEb3urha8CodX3nldpSKp+/4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TQBA9e7MvlZ7sOIrD1neyNl+pqrAZPH8LNG/btP6Yy5EMjt4Rn04aX8uRnkkFwQFA
	 cd1fdYK/VlagxXXrH5oxjCHkwHdG3cEMdRPBIxK52bW4646SK8ppb535qvJ2u6AJkq
	 a6S4yGbSvwRy24oQAuETgWB+Q2anqPEWz6B8d41Z5AJdp6jZbu5EaAG5hcIFG1o/oG
	 2qAlBAzqLNsWlfDsa+GzKoyoFCxRnqTuxYrJYIWrjO6VWaktvgj/yiynQcNJMId/hZ
	 +n5ODGbUsMIBecNWASJhuRIuOZhfxK/pULCQ/v2PX+AB43g/I2hhuqvnUo9iTCrYrt
	 6k6mo83j2+Kfg==
Message-ID: <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
Date: Wed, 9 Sep 2026 17:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260909060615.GJ106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 09.09.26 08:06, Mika Westerberg wrote:

[...]

> 
> If it is possible, I suggest to use the same way we do in ACPI side here:
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> 
> It was specifically designed so that it should support DT as well (that's
> why it uses the device properties _DSD).

Oh, nice, I didn't know those existed. Konrad already has a PR open to 
add these to dt-schema [1] and a PR that already makes use of these for 
dwc3 [2].
I can just write generic code similar to the ACPI one then to add the 
device links and split it off from this series, though I think that 
dt-schema PR must be merged before we're allowed to use that representation.
I'll adjust the dt-bindings here for v3 to just drop the representation 
as OF ports/endpoints as well.
For the PCIe/DP tunnel notifications I should be able to use the same 
representation, possibly with an additional usb4-adapter-index property 
or similar to differentiate between the two DP IN adapters, once I get 
to that then.


[1] https://github.com/devicetree-org/dt-schema/pull/196
[2] 
https://lore.kernel.org/linux-usb/20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com/


Sven

