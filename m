Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EC0CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n0Y+NoH+kvwHdRXyYxizd4Ni80WNG4fVyyRdV90H6M=; b=3Ep9lDOWWpF3V0dcIP0gn0OHTd
	eimc8S5YO/zA8W+ZgC2Svxg8YcEybC/isjsrIxvC8bSEFNJGJC6IfLmsQuItMY/XSeAyP3jxN61u7
	SsBZSBNWqCogc69EjIZpegjd0Qwb+dCyGv6kqAZRoCAFnI5FHxmgNEsX9NlU5r10nG4mz1A1AHu6d
	Qfrh4S33yOkbvU8+XbTKeO6HP3NSsUTdHrVusPZosKsrlcxRThSoKn9stbf5TXPGJ9pChauhZvY5e
	m0RfLJ6WY3Srs05SD4m1+Mx5TrjbB8SZxXyl8jLvIgde4B84VaITNst3FWF8f1voDaPSW/P09nOV2
	cFY0ORyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7kJ-00000008Wfi-3bDm;
	Wed, 12 Nov 2025 10:06:35 +0000
Received: from mail-m49200.qiye.163.com ([45.254.49.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7kG-00000008WfH-470q;
	Wed, 12 Nov 2025 10:06:34 +0000
Received: from [172.16.12.30] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 295429862;
	Wed, 12 Nov 2025 18:06:27 +0800 (GMT+08:00)
Message-ID: <65ff0185-e471-40ba-8991-43b1a42b1d30@rock-chips.com>
Date: Wed, 12 Nov 2025 18:06:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v8 1/4] dt-bindings: can: rockchip_canfd: add
 rk3576 CAN controller
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com,
 linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251112015940.3695638-1-zhangqing@rock-chips.com>
 <20251112015940.3695638-2-zhangqing@rock-chips.com>
 <20251112-faithful-olive-orangutan-0dd207-mkl@pengutronix.de>
From: zhangqing <zhangqing@rock-chips.com>
In-Reply-To: <20251112-faithful-olive-orangutan-0dd207-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7787ea7c03a3kunmc052c1ea2aa6e8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMYTVZPSRhDT0IeSU0eQktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CUikGddO+ZN7whhA7uNkqz4Av3a3h3ecRTM839aDoNwjuOT1rwIvlBvuulvGqith6x6wghvs//J4PEegTy0+yeZjxi8SwbDF5kIi21lFqzQibcnJjjIhx3cu0PbBFOG9OjhGdhUCKwYl/KKZQSOJBth+Om6cVQWjzRsmv01d2KI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9n0Y+NoH+kvwHdRXyYxizd4Ni80WNG4fVyyRdV90H6M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020633_539513_8DC8B9FC 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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


在 2025/11/12 16:53, Marc Kleine-Budde 写道:
> On 12.11.2025 09:59:37, Elaine Zhang wrote:
>> Add documentation for the rockchip rk3576 CAN controller.
>>
>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>> ---
>>   .../bindings/net/can/rockchip,rk3568v2-canfd.yaml  | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
>> index a077c0330013..22e10494e7d1 100644
>> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
>> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
>> @@ -10,13 +10,12 @@ title:
>>   maintainers:
>>     - Marc Kleine-Budde <mkl@pengutronix.de>
>>
>> -allOf:
>> -  - $ref: can-controller.yaml#
>> -
> What happened to the allOf?
This is a misoperation and will be corrected in version V9.
To speed up the review of the current version, V9 will also remove dma.
>
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - const: rockchip,rk3568v2-canfd
>> +      - enum:
>> +          - rockchip,rk3568v2-canfd
>> +          - rockchip,rk3576-can
>>         - items:
>>             - const: rockchip,rk3568v3-canfd
>>             - const: rockchip,rk3568v2-canfd
>> @@ -43,6 +42,13 @@ properties:
>>         - const: core
>>         - const: apb
>>
>> +  dmas:
>> +    maxItems: 1
>> +
>> +  dma-names:
>> +    items:
>> +      - const: rx
>> +
>>   required:
>>     - compatible
>>     - reg
> regards,
> Marc
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


