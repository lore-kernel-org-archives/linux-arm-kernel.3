Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C1AC02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1w0LAq2M+/NtKCh0lzYTdc188jbF90/W0yNry5dtdc=; b=CHbwn8Fz8T5c+t7dpRXejkG/6p
	uHk7kWXoFaMLIOFzQcJFDOd6iRT+o/l1AYoDUelqchytisPzB0ztHWQcgu9qctZ4PGkjs+b7uaTLe
	yJSNtMpRv5tKEJsNhgVpc3qFcFtn5foossdFMTuthnHUCmXjxWVwJprHIzweadbmJMQLwzEWU5Vjq
	omKvYSUJLcBtByYyEkn96kyAN8Lqt/VR3eF/Rq37UiHxYuxcFzMfr3xb5FgNVWMmtGHfpp0xw3Jzu
	WAX28HhWloQkd+WPaRTDE8PZFPAIhSXpWlyJ+fkbpCd4orHGgWc8oRJQR8IuasRHRQsszKx2C0kgF
	evYdKTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfV1H-000000027KO-251h;
	Wed, 05 Feb 2025 02:20:03 +0000
Received: from mail-m3295.qiye.163.com ([220.197.32.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfUzr-000000027Ca-3CRq;
	Wed, 05 Feb 2025 02:18:37 +0000
Received: from [172.16.12.30] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a2f6aecf;
	Wed, 5 Feb 2025 10:18:31 +0800 (GMT+08:00)
Message-ID: <b85a4449-f178-4877-9ba7-65ddcc231052@rock-chips.com>
Date: Wed, 5 Feb 2025 10:18:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Revert "arm64: dts: rockchip: Increase VOP clk
 rate on RK3328"
To: Jonas Karlman <jonas@kwiboo.se>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
 <20250125011545.15547-3-zhangqing@rock-chips.com>
 <d1ddec89-08d5-4eed-8ecc-7df47294230a@kwiboo.se>
From: zhangqing <zhangqing@rock-chips.com>
In-Reply-To: <d1ddec89-08d5-4eed-8ecc-7df47294230a@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk9NTFZPGUtISk1NTUxLHh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	9VSktLVUpCS0tZBg++
X-HM-Tid: 0a94d3e6e17103a3kunma2f6aecf
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46Pyo6EjIJGhQyFyMPGg09
	TEIaCUxVSlVKTEhDTElKQkpJTUNOVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9LTUk3Bg++
DKIM-Signature: a=rsa-sha256;
	b=btvd4bzt9LMDt9sePPl5TCU6js+OoOuX0XD0PnJMAA5dUVJif3cBsEOSWfFan99MzUBSvi5QTyGysRWh1s7jo2pfiS7gSJz3h2jiekDJaTNIAMNbhpDOGj7PDLa+aC0GdK5I0mzeyP7vrtTNgkc3wi/txmf0CmlAFb8S6ewZGt8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/1w0LAq2M+/NtKCh0lzYTdc188jbF90/W0yNry5dtdc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_181835_984780_DA3B38E0 
X-CRM114-Status: GOOD (  21.23  )
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


在 2025/1/26 5:39, Jonas Karlman 写道:
> Hi Elaine,
>
> On 2025-01-25 02:15, Elaine Zhang wrote:
>> This reverts commit 0f2ddb128fa20f8441d903285632f2c69e90fae1.
>>
>> Before changing the PLL frequency, in order to avoid overclocking the
>> child clock, set the child clock to a large div first, and then set the
>> CLK as required after the PLL is set.
> This commit message does not match what this patch does. In this patch
> you revert a change and in next patch you re-introduce same thing
> slightly different.
>
> As mentioned in v1, see [1], you should merge both patches as a single
> fix, if a fix really is needed.
Ok, This will be fixed in the next release.
>
> Testing on a rk3328-rock64 I see no difference before or after these
> changes. Please describe what this fixes because clk_summary show same
> clock tree and rates before and after this fix.
The clock tree might see the same result.

It is not safe or correct to set the child clock frequency before 
setting the PLL frequency, and the parent clock PLL frequency may not be 
the final expected value at this time.
Therefore, the correct setting of the child clock frequency should be 
after the PLL frequency is set.

The partial clock is set before the PLL setting frequency, which is to 
prevent the child clock from overclocking when the PLL is set, so ensure 
that the child clock is at a safe frequency before setting the PLL, and 
reset the child clock frequency after the PLL is set.
>
> Also for next revert patch you send, please include the patch author in
> the recipient list :-)
>
> [1] https://lore.kernel.org/all/cae9cb0a-1500-4fbc-bbf4-a6266549bcb9@kwiboo.se/
>
> Regards,
> Jonas
>
>> Fixes: 0f2ddb128fa2 ("arm64: dts: rockchip: Increase VOP clk rate on RK3328")
>>
>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> index 7d992c3c01ce..f3ef8cbfbdae 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> @@ -852,8 +852,8 @@
>>   			<0>, <24000000>,
>>   			<24000000>, <24000000>,
>>   			<15000000>, <15000000>,
>> -			<300000000>, <100000000>,
>> -			<400000000>, <100000000>,
>> +			<100000000>, <100000000>,
>> +			<100000000>, <100000000>,
>>   			<50000000>, <100000000>,
>>   			<100000000>, <100000000>,
>>   			<50000000>, <50000000>,
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


