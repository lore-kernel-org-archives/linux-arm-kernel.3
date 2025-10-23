Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DE3CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaTVtJ4OrJzYKggTYWIJ1AL/0/t292AjyM4TtlZT+cM=; b=hCiRcpIa1mpKvcl+VS+IyTjbQ1
	Q+5yFE4RP7itYWgdN1NeB9zsXq1cYvowdzbiTO8PTqcecJ7Rkq2jHjwhs33Q7yvX522hd7lltkpc4
	Y5UYws8fh58uUhH2fWr+igkMz8dTTg5qC/dAbS1AW0b21NV/pdNa1+W+Bt5rjSGnZ/ROIRQGrMYua
	emVNHDCfpH33Pa3i9EIB9sBI0SC1Aos5eBtZb1qH+HUOWh2GZSKPfI1tk6a9bHKGqwZymUu+walgu
	vyYo+XNttdoUnvRrnn2t5BSzo1tNdx9ekYE9g9G+loJoCncq2ZYn493hZBWviJJbv77yuB7OLq9O0
	FwVdYuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxEV-00000006lBy-2jvh;
	Thu, 23 Oct 2025 15:28:07 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxET-00000006lAT-1AyD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:28:06 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4csqfk5fYHz9smZ;
	Thu, 23 Oct 2025 17:27:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761233279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaTVtJ4OrJzYKggTYWIJ1AL/0/t292AjyM4TtlZT+cM=;
	b=Ftyvr8PdNZPcW37381mPmDju2UQ0q/6HFsKMzF0ry/wHjLtBkTq5T7DYF9AhnxRW4UCHM7
	R6MAC+w/0U33kwfH9embjLBMJY+l9DOAj0cDIkx6OVnXi1p+ehvg+bPsEpZVm7BfDCx09+
	3IAgnZi+ZncU7457fm9WS03PX1uML51xpIeYS7KJZvRIQ9DvIODkho7spdjCghkL8TotNv
	27fJbVWl8ey95DHMQEQRWzHDvOgm6qmVKvtW+FjjTK6QjF4/h82/RZyNyP0x7uNEtqWeOo
	lEt3feRl7aDA2uTF+wAkQHurbWDLxDwzmUyLj7B1jCgQm/9+TuiGOaErxrYu/Q==
Message-ID: <5d042f21-274e-4b69-849a-3342d77942eb@mailbox.org>
Date: Thu, 23 Oct 2025 17:27:55 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <3381308.aeNJFYEL58@steina-w>
 <e6b282cf-e9de-43b7-a8d4-30e67cefe430@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e6b282cf-e9de-43b7-a8d4-30e67cefe430@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fcjaid5riwda4hyq9u9xigyobbg4aqdu
X-MBO-RS-ID: 0cdc8df6d33fff8a636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_082805_666469_65317988 
X-CRM114-Status: GOOD (  12.06  )
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

On 10/23/25 5:22 PM, Krzysztof Kozlowski wrote:
> On 23/10/2025 16:03, Alexander Stein wrote:
>> Hi,
>>
>> Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb João Paulo Gonçalves:
>>> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>
>>> Enable the necessary missing configs for the i.MX95 to boot and also
>>> have Ethernet working:
>>>
>>> * CONFIG_NXP_ENETC4 for the network controller driver
>>> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>>> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
>>> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>>>
>>> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
>>>   CONFIG_FSL_DPAA_ETH=y
>>>   CONFIG_FSL_DPAA2_ETH=y
>>>   CONFIG_FSL_ENETC=y
>>> +CONFIG_NXP_ENETC4=m
>>>   CONFIG_FSL_ENETC_VF=y
>>>   CONFIG_FSL_ENETC_QOS=y
>>> +CONFIG_NXP_NETC_BLK_CTRL=m
>>
>> Are you sure this should be module? Shouldn't NFS boot be supported by
>> default? I might be wring here though.
> 
> 
> NFS root is supported already with this being module. Yes, it must be a
> module, cannot be built in.
It seems I am using it as built-in on MX95 Verdin (patch is posted on 
the ML), and yes, I do boot from NFS root without any initrd/initramfs. 
It has to be built-in for that use case to work.

