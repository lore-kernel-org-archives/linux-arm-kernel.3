Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF2AEF8FF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qrJMdF9h8gbbgFQvYeTOxrUSSem+/TJbnWZqRGleYg=; b=3a1fbgpQeZnS5AUVghSizTcpt4
	w/+J+2ufDv0RvmYUDzn8gyhqdh4V/XpfyQxHtUR08tAO0q49BkdP93CRaB4/yUNzYfAdB5heE5yog
	NzLK1H4gKh8F2pih1lg0T1VbHtNCBt2+lv/AWtCDIH1m3/gTelPn0rPw0ZfobL7puL5agB0VW24pr
	WpZ8H5hZnEeV+sw0xw2POkDhYlQ2L5wedjibzMzOeHzlak80IoHHLti/7n3v9HRpOk2uvA60lqoOe
	Y/sro/9+rBIrC+/PwtItUlotCVhDCLMIlBRwF///pX0fCyHHnmyuG3aNSNkszkxvbXAhfWtnPX23g
	Rw8sQUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoPL-000000000H9-2eQ1;
	Wed, 04 Mar 2026 15:45:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoPJ-000000000Gb-0ICS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0605439F1;
	Wed,  4 Mar 2026 15:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464F4C4CEF7;
	Wed,  4 Mar 2026 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772639104;
	bh=eQP+I2VmJlyUen2EhU3bAE6OPGTquPaPdCDtn+B02as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=erJq6SW2h/GqYuLfAPmYJkLtPS/UVvgiMSGRvcGNhJbvMnYlbMB3tipWXZKgmNmTJ
	 3mvdc6c66t4O8M7EeAaa812VDPzaeqz7zgkJDoBm9h2xJ3A4hEp5K4HT0uenRRdK5g
	 AYFASxeEWroPeDVvP1NDQ1mKdWnqBstuZJtYv9W8xNJsuoZNSOCznSsFmAvA+Y90/L
	 2cgbcTdKf0tddihbXXHMdvJgrsb1QmcrbxO+6pnTMINHuYDcHJV67kraObwuCG11/5
	 GgsvcVsmwA3hN8Ly8+v5w1wIefTT6iBFCcHQ6oaWnP2Kv9vV+jCPSXqxetaZOaGcaw
	 M/QOx97NJw03Q==
Message-ID: <e787a907-f8cc-4f31-9019-c07f5f1d4fdd@kernel.org>
Date: Wed, 4 Mar 2026 16:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add ICSSG0 dual EMAC support for AM642 EVM
To: Daolin Qiu <d-qiu@ti.com>, Meghana Malladi <m-malladi@ti.com>, nm@ti.com,
 vigneshr@ti.com
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 kristo@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, srk@ti.com,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
References: <20260228113203.498839-1-m-malladi@ti.com>
 <811312d5-a48a-4ce9-80a2-7c04d0b34a67@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <811312d5-a48a-4ce9-80a2-7c04d0b34a67@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_074505_157247_72C8A905 
X-CRM114-Status: GOOD (  14.30  )
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

On 04/03/2026 16:32, Daolin Qiu wrote:
> 
> On 2/28/26 05:32, Meghana Malladi wrote:
>> This series adds device tree overlay support for enabling ICSSG0 dual EMAC
>> on the AM642 EVM, along with the necessary PHY driver configuration.
>>
>> The overlay enables both ICSSG0 Ethernet interfaces (port0 and port1) in
>> dual EMAC mode and can be combined with the existing ICSSG1 overlay to
>> enable all four ICSSG interfaces if needed.
>>
>> The series also enables the DP83TG720 PHY driver required for the
>> DP83TG720-IND-SPE-EVM daughter card used with the ICSSG0 interface.
>>
>> Meghana Malladi (2):
>>    arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC support
>>    arm64: defconfig: Enable DP83TG720 PHY driver
>>
>>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>>   .../boot/dts/ti/k3-am642-evm-icssg0.dtso      | 203 ++++++++++++++++++
>>   arch/arm64/configs/defconfig                  |   1 +
>>   3 files changed, 208 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
>>
>>
>> base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2
> 
> Tested both ipv6 and ipv4 ping to be functional with the following 
> topology.
> 
> DUT 1 eth3 <---> eth2 DUT2
> 
> DUT1 log: https://gist.github.com/dao-qiu/f261147110b6b05d1fb989ee74e1d694
> 
> DUT2 log: https://gist.github.com/dao-qiu/3add536e2370d6afe36145f46df784e6
> 
> Tested-by: Daolin Qiu <d-qiu@ti.com>
> 

You cannot test defconfig, so please don't post it to cover letter. Same
effort for you - one Tb tag - but now you require maintainers to handle
it specially when applying.

Best regards,
Krzysztof

