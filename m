Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C9FE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 01:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfU0BRy6UxjKGOBHhFm9jV2l7Tlz/ThMRo8XbQs5bSE=; b=c/qnCwt8iOzQBsJByYy23k1DMI
	nuePDqC35kkUL0kr3uV8Ja6pTIgZ7FOEuVjgyjS/brphUfSBX+Qra3tSyXz3+PCvXaw5nNrRdApL5
	YtzTcbiUtKN7g8NoyQfMGFnK/tiMCgoNyFPIpxN5k4WxlYwoFxoty3UkC/Ps2Rl4ySXKr6h4ki7Ep
	FswUTBTmmXMTiyfz4OwgslrxcXZigcCh0fNd1uf5WEh+cYKdFBOE8hqwdwr3N+iJqTwk4nng9mOb7
	C8ZVKQpxHNTFT6wiuX/FIdOegbV7G1bLCXnUvFzwDSHh09qjOPLTMjFninBl+4DhhQYqukma1Gty6
	WiAhBu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5Si-00000000VlO-3W96;
	Thu, 19 Dec 2024 01:36:24 +0000
Received: from mail-m49230.qiye.163.com ([45.254.49.230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5Rc-00000000VdX-2Q4H;
	Thu, 19 Dec 2024 01:35:18 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6277199f;
	Thu, 19 Dec 2024 09:35:12 +0800 (GMT+08:00)
Message-ID: <7fa672bb-7263-468b-ad7d-f1585459dc67@rock-chips.com>
Date: Thu, 19 Dec 2024 09:35:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-5-damon.ding@rock-chips.com>
 <867267676.0ifERbkFSE@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <867267676.0ifERbkFSE@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMZH1ZMSUpOGkNMT0gZTENWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93dc8dfa8a03a3kunm6277199f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDI6DAw5PDIJEBc2GhccPS45
	DAkaCxxVSlVKTEhPTkxJSkpPSkpOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSENINwY+
DKIM-Signature: a=rsa-sha256;
	b=XhyWv9FByJopn3syCU++lxNWmISu60bEdehFbK8P7AGggwYo/a1h0s5S04Av3Zl1vVlfWXvSlNoMA0oNgGTx/sLizcbW9E6W/wCWrhIWOdbdVtnI8XBJaPUxahn0qXYxWxQXK6HnXmwTCVGXVtiEMPOh3/JdZ3vFkdE3C9G0O/k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=JfU0BRy6UxjKGOBHhFm9jV2l7Tlz/ThMRo8XbQs5bSE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_173516_781203_60885E10 
X-CRM114-Status: GOOD (  10.88  )
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

Hi Heiko,

On 2024/12/18 20:35, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Montag, 16. Dezember 2024, 04:12:18 CET schrieb Damon Ding:
>> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
>> pre-emphasis configurations of each link rate have been verified according
>> to the eDP 1.3 requirements.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the module author
>> ---
> 
>> @@ -255,6 +364,19 @@ struct ropll_config {
>>   	u8 cd_tx_ser_rate_sel;
>>   };
>>   
>> +struct tx_drv_ctrl {
>> +	u8 tx_drv_lvl_ctrl;
>> +	u8 tx_drv_post_lvl_ctrl;
>> +	u8 ana_tx_drv_idrv_idn_ctrl;
>> +	u8 ana_tx_drv_idrv_iup_ctrl;
>> +	u8 ana_tx_drv_accdrv_en;
>> +	u8 ana_tx_drv_accdrv_ctrl;
>> +	u8 tx_drv_pre_lvl_ctrl;
>> +	u8 ana_tx_jeq_en;
>> +	u8 tx_jeq_even_ctrl;
>> +	u8 tx_jeq_odd_ctrl;
>> +};
>> +
>>   enum rk_hdptx_reset {
>>   	RST_PHY = 0,
>>   	RST_APB,
> 
> not a full review (yet), but this part conflicts with
> commit f2dbca169790 ("phy: phy-rockchip-samsung-hdptx: Don't request RST_PHY/RST_ROPLL/RST_LCPLL")
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f2dbca169790ea1e436ffdd9ef37d7c3a4401c46
> 
> 
> 
> 
I will update to the latest Kernel branch and fix this conflict in the 
next version.

Best regards,
Damon

