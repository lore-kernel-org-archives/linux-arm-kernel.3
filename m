Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CFDCDE00D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vELGL+YLg67WURvnTEyN9CZyoywwF35KjCPfH+omGCM=; b=PbQ5n7EdIN4glgwTaoDpFFvSGE
	k+/VZE73FY5zrd+RWgiHGsKQ/JJBO/Y8tQ8ugFE+COjg04EDTCAE6lRhdEszWgrSHA6VoUxeVslwy
	tugKbJEWTJ1/ekYDOd/QFj+PmyeadVn8/irUbZehU+G0NevtjBcPcSW97lTz0U67BX975B8RYXFhE
	PxsbodzDt7guBVWFQ1UVOMKBfq0oVwcjQg/rs84LWVo3WGHjo02AYn1RIby3Jp4LMhtAxRnGLqS0p
	jIQHZeELh1Dsq1NGhwjtP0YdTZHhosjhTgm/tZrfXfZJPC3EwE3S8oUkdbiyD8Lu5QhGQ1ZI8BokD
	k5fs2hsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsh6-0000000CBDu-3kDS;
	Fri, 14 Nov 2025 12:14:24 +0000
Received: from mail-m19731100.qiye.163.com ([220.197.31.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsh3-0000000CBDJ-1PG7;
	Fri, 14 Nov 2025 12:14:22 +0000
Received: from [172.16.12.211] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 299e2ff87;
	Fri, 14 Nov 2025 20:14:14 +0800 (GMT+08:00)
Message-ID: <3233894e-9409-4b74-a954-0b30064c3c8c@rock-chips.com>
Date: Fri, 14 Nov 2025 20:14:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] net: can: rockchip: add can for RK3576 Soc
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-rockchip@lists.infradead.org, cl@rock-chips.com,
 kernel@pengutronix.de, krzk+dt@kernel.org, mailhol.vincent@wanadoo.fr
References: <20251113075419.482940-1-zhangqing@rock-chips.com>
 <20251113075419.482940-4-zhangqing@rock-chips.com>
 <20251113-slim-foamy-gecko-2dc389-mkl@pengutronix.de>
 <176d96b4-397c-49d4-8e8e-2f77a5d59c12@rock-chips.com>
 <20251114-utopian-cheerful-otter-33c1d5-mkl@pengutronix.de>
From: zhangqing <zhangqing@rock-chips.com>
In-Reply-To: <20251114-utopian-cheerful-otter-33c1d5-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8249a13403a3kunmc0d95d2fbc54e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1KGVZCSEJKTkpOTh4fGEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WxS7EliwFNkkh/33Nso4byD6TZWgb1CUuJsWPOaGt2An9EnsKLuKeJesM+qdTGK3hXG3fuS3alEjq9Lpve+Xpd8wQDadX8jGOI1mq31E6Krw1bwnjhvML7vSjUFsvSFswwKUFouA07AMRUS2L3ei9BoaJF7Intm5rZq9qOheG5I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vELGL+YLg67WURvnTEyN9CZyoywwF35KjCPfH+omGCM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_041421_552856_3B3F7948 
X-CRM114-Status: UNSURE (   9.01  )
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


在 2025/11/14 19:01, Marc Kleine-Budde 写道:
> On 14.11.2025 17:55:53, zhangqing wrote:
>>>> +/* The rk3576 CAN-FD */
>>>> +static const struct rkcanfd_devtype_data rkcan_devtype_data_rk3576 = {
>>>> +	.model = RKCAN_MODEL_RK3576,
>>>> +	.quirks = RKCANFD_QUIRK_CANFD_BROKEN,
>>> Is CAN-FD mode broken on the rk3576?
>>>
>>> Please test CAN-FD and please do the tests documented near the
>>> definition of RKCANFD_QUIRK_CANFD_BROKEN:
>>>
>>> | Tests on the rk3568v2 and rk3568v3 show that receiving certain
>>> | CAN-FD frames trigger an Error Interrupt.
>>> |
>>> | - Form Error in RX Arbitration Phase: TX_IDLE RX_STUFF_COUNT (0x0a010100) CMD=0 RX=0 TX=0
>>> |   Error-Warning=1 Bus-Off=0
>>> |   To reproduce:
>>> |   host:
>>> |     cansend can0 002##01f
>>> |   DUT:
>>> |     candump any,0:0,#FFFFFFFF -cexdHtA
>>> |
>>> | - Form Error in RX Arbitration Phase: TX_IDLE RX_CRC (0x0a010200) CMD=0 RX=0 TX=0
>>> |   Error-Warning=1 Bus-Off=0
>>> |   To reproduce:
>>> |   host:
>>> |     cansend can0 002##07217010000000000
>>> |   DUT:
>>> |     candump any,0:0,#FFFFFFFF -cexdHtA
>> There is no doubt about the other modifications above. They will be
>> corrected in version V10.
>>
>> CANFD requires authorization and is not supported by default.
> Can you explain what you mean by authorization? What do you mean by "not
> supported"?
For RK3576 SoC, the IC hardware design supports CANFD.
However, a license application is required before it can be used; 
otherwise, there will be legal risks.
>
>> After obtaining authorization, it can be used, so this place is not
>> considered broken.
>> What's the best way to handle this situation?
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


