Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96574CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 03:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipg6mZebV/FQJ02tqFTMP9sueHte0K5Fd4JfkmgRrwU=; b=pKr/Lhbxxp9Hd+lsrblSaHrIZa
	O4GA2J8MohCMreTWDwBAFI+LAypW7YhIc0Z/klpyPQbRNtV7gPqa3jFFqlISFIGKjKz/uKkxe8/Hg
	Fq8+8nZUMsg9jMJoNupwKMUaeazdAGD0Bs9zFuFnKwYNMd/WCTPRRZ1isHnPdL+KGw8U7lKrgA0ft
	Tp2ARFPsO04QXkW6HEZVf5r0Y+CD0zuSmDGr7ORmivqhlKrs89jQ89KGbtXQxBCSudAfmkEcnCaoT
	nB1QmP48I5bOaXUTd2VU2Oqgh9txZB5eY9OxRCavTY0BuNJU2+yLcwRXcE2l8rY57248oTOjm5ptt
	PauYqNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPQB-00000001Jjq-0CEr;
	Wed, 22 Oct 2025 03:21:55 +0000
Received: from mail-m21472.qiye.163.com ([117.135.214.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPQ7-00000001Jhq-0npG;
	Wed, 22 Oct 2025 03:21:53 +0000
Received: from [172.16.12.30] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26bd00351;
	Wed, 22 Oct 2025 11:21:43 +0800 (GMT+08:00)
Message-ID: <5a551943-141a-4842-a4d0-b66b32cf3e70@rock-chips.com>
Date: Wed, 22 Oct 2025 11:21:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: clock, reset: Add support for rv1126b
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
 sboyd@kernel.org, sugar.zhang@rock-chips.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com, Conor Dooley <conor.dooley@microchip.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
 <20251021065232.2201500-3-zhangqing@rock-chips.com> <4463339.ejJDZkT8p0@phil>
From: zhangqing <zhangqing@rock-chips.com>
In-Reply-To: <4463339.ejJDZkT8p0@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a09efd41b03a3kunm7b6dc5c66e4f96
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU8aGVYYTUsfQh5KGhlMSx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gGZPUQhJfHp4kvwOmpCT54yGpj+RvSNLLBZIvOwIq0JBMw+xfp4HUlM8CNWg2uS8J0FfRU9ovd2A3Ud1RGfHpJdw8CLVA/V/IZsTsItStaptUzEUDq3l2qRAuB4K9YLoMF5CoDJNFsG3cxVe6mb7EFKyp0QW2y6uMenc9a/zhaM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ipg6mZebV/FQJ02tqFTMP9sueHte0K5Fd4JfkmgRrwU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_202151_826189_761BA46E 
X-CRM114-Status: GOOD (  12.70  )
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

Hi, Heiko:

在 2025/10/21 16:38, Heiko Stuebner 写道:
> Hi Elaine,
>
> Am Dienstag, 21. Oktober 2025, 08:52:27 Mitteleuropäische Sommerzeit schrieb Elaine Zhang:
>> Add clock and reset ID defines for rv1126b.
>> Also add documentation for the rv1126b CRU core.
>>
>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/clock/rockchip,rv1126b-cru.yaml  |  52 +++
>>   .../dt-bindings/clock/rockchip,rv1126b-cru.h  | 392 +++++++++++++++++
>>   .../dt-bindings/reset/rockchip,rv1126b-cru.h  | 405 ++++++++++++++++++
>>   3 files changed, 849 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
>>   create mode 100644 include/dt-bindings/clock/rockchip,rv1126b-cru.h
>>   create mode 100644 include/dt-bindings/reset/rockchip,rv1126b-cru.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
>> new file mode 100644
>> index 000000000000..04b0a5c51e4e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/rockchip,rv1126b-cru.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip RV1126B Clock and Reset Unit
>> +
>> +maintainers:
>> +  - Elaine Zhang <zhangqing@rock-chips.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description:
>> +  The rv1126b clock controller generates the clock and also implements a
>> +  reset controller for SoC peripherals.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - rockchip,rv1126b-cru
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: xin24m
> I think we're missing the optional
>
>     rockchip,grf:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
>         Phandle to the syscon managing the "general register files" (GRF),
>         if missing pll rates are not changeable, due to the missing pll
>         lock status.
>
>
> because RV1126B_GRF_SOC_STATUS0 contains the PLL lock status.
The pll lock truly uses bit10 of the PLL_CON1 register of CRU and does 
not use grf. Does that mean there is no need to increase rockchip,grf？
>
>
> Heiko
>
>
>
>
-- 
张晴
瑞芯微电子股份有限公司
Rockchip Electronics Co.,Ltd
地址：福建省福州市铜盘路软件大道89号软件园A区21号楼
Add:No.21 Building, A District, No.89 Software Boulevard Fuzhou, Fujian 350003, P.R.China
Tel:+86-0591-83991906-8601
邮编：350003
E-mail:elaine.zhang@rock-chips.com
****************************************************************************
保密提示：本邮件及其附件含有机密信息，仅发送给本邮件所指特定收件人。若非该特定收件人，请勿复制、使用或披露本邮件的任何内容。若误收本邮件，请从系统中永久性删除本邮件及所有附件，并以回复邮件或其他方式即刻告知发件人。福州瑞芯微电子有限公司拥有本邮件信息的著作权及解释权，禁止任何未经授权许可的侵权行为。

IMPORTANT NOTICE: This email is from Fuzhou Rockchip Electronics Co., Ltd .The contents of this email and any attachments may contain information that is privileged, confidential and/or exempt from disclosure under applicable law and relevant NDA. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution, or use of the information is STRICTLY PROHIBITED. Please immediately contact the sender as soon as possible and destroy the material in its entirety in any format. Thank you.

****************************************************************************


