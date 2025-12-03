Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E93ED1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6mxjAhqN52fQLJBVjoKMe25fLU7L+nNfg1TFd0Xx6k=; b=udTM5y7GAig1q9SLWlOTe2aWsc
	TIB3AIAjfFfoQH5gMWi8xjv0nUM5slf6ozzAlL/p17Mfr6yU1s2JRuUbiq1FkhqHIO5Jm5dSM7E5/
	Cbf1T5fIT4ZKvfO9TkhIMTqhK1KOtGSyH2jLzX/zdg8Al8932HTtuZd2JzvsSt+P6eakghU4FeDd2
	gT+QFMoG+fFqwLJyd81dQMvUlmgVz+mSMlPtd3NXIiAlyoa43goE+A8vS3lVn0tIq5mLkzf+8xG1R
	ppvhWruHAbD4W60LMFHd7ALoDxareUKMIZSl0sl9AVr3m9fBL3EsBJlhte0/5MI4UFzNeIP0PXV8e
	OKn4UZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdtG-000000065hu-49RH;
	Wed, 03 Dec 2025 03:50:54 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdtE-000000065hG-0t8G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 03:50:54 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLkFL3gd7z9tTX;
	Wed,  3 Dec 2025 04:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764733846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6mxjAhqN52fQLJBVjoKMe25fLU7L+nNfg1TFd0Xx6k=;
	b=CQB0p/y/26lKNS6WXnrwX5QZ/QKv8bOAU7fnPVorPqGzkrNkDcw+dT5G55q7MnKUrC109l
	R+8+EBAYf9iq+4fE/he/smzs7UTEHV67WU/IgDcHVji5wtxQjEBf3iFjdRLFYXRapimyey
	uTWTC8iPhM9UgR5B6lwxNFseODyrK17OPNn9zLoVHn7kh/5FMy/iQd1wXCaBEskq/tsM8n
	XHr69HUKoe2dLsfuc13mIRpDr83Do9kScbON7nPQsnzAQ77AzlBjk6wG1kCXaLA5KcVa2B
	lmi3URiVQ3mfGkTuJqvMqEdO1V+py4vcXIWdKYvBvBddXEMeJuwgPx62WGvWTQ==
Message-ID: <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
Date: Wed, 3 Dec 2025 04:38:19 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aS-lEibp3zTsaR6T@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 52256cf8b3a3eab14fc
X-MBO-RS-META: z5ckj1br1pp63h1rmuzx38dn6pe8qedj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_195052_400640_FDBE51CD 
X-CRM114-Status: GOOD (  13.71  )
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

On 12/3/25 3:48 AM, Rain Yang wrote:

Hello Rain,

>> diff --git a/arch/arm64/boot/dts/freescale/imx95-clock.h b/arch/arm64/boot/dts/freescale/imx95-clock.h
>> index e1f91203e7947..22311612e4403 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-clock.h
>> +++ b/arch/arm64/boot/dts/freescale/imx95-clock.h
>> @@ -183,5 +183,6 @@
>> #define IMX95_CLK_SEL_A55P                 (IMX95_CCM_NUM_CLK_SRC + 123 + 7)
>> #define IMX95_CLK_SEL_DRAM                 (IMX95_CCM_NUM_CLK_SRC + 123 + 8)
>> #define IMX95_CLK_SEL_TEMPSENSE            (IMX95_CCM_NUM_CLK_SRC + 123 + 9)
>> +#define IMX95_CLK_GPU_CGC                  (IMX95_CCM_NUM_CLK_SRC + 123 + 10)
>>
>> #endif	/* __CLOCK_IMX95_H */
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 6091c2713fa48..47f20e501315f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -2874,7 +2874,7 @@ netc_emdio: mdio@0,0 {
>> 		gpu: gpu@4d900000 {
>> 			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> 			reg = <0 0x4d900000 0 0x480000>;
>> -			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> 			clock-names = "core", "coregroup";
>> 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> -- 
>> 2.51.0
>>
> Hi Marek,
> 
> Thanks for integrating this downstream patch.

Which downstream patch do you refer to ?

> Please note that CLK_GPUAPB and CLK_GPU are
> always-on, so the commit message should be amended accordingly.

The GPU clock do not seem to be always-on, neither do the GPUAPB . It 
seems the SM can turn those clock off perfectly well.

> Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
> in the frequency table, this also helps minimize differences between downstream and upstream,
> reducing maintenance effort.

Downstream kernel forks are not relevant to this discussion, upstream 
your content and then you won't have to spend maintenance effort on 
downstream stuff.

