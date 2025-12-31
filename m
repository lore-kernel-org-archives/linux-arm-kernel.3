Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E1FEE57E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJXRdk/Jm/8W9JuE53zA910TazhkvqSxi7iqm+rHlCQ=; b=lf8ilm0dEZ+ISzol8ZH9tpWgrs
	BouE0d5ESnzki7jUhy9V1Y5SwJOh1c49HGpaufp+QgQ/bmmMoOcAsqwEsy5/d6e26gQprsDW3JMKu
	RBStLX26xR89A6qgYUC+b35N3buIBl1FZKiXEVK6jhJ9QeFWe2fu01I7lUCLRWfk7d8oZ20lUhcH4
	fnnQ/9ecqhz8dlskFCqWNpl5fNstKAq0aUvd506xR0CRwEJQNiPKQOR+5W7X2LDxiPkfWajuxmQwV
	xXyMMLeIXK0b36kZFUmbD4UtXwY6NDaoaN36eRRiAe9Cg4uS1J3wgQcaFMy2XGFaSWdEd5Sz8pO0x
	3yJduVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varKC-00000005mcp-2t4m;
	Wed, 31 Dec 2025 08:12:56 +0000
Received: from mail-m32108.qiye.163.com ([220.197.32.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varK9-00000005mcH-0YgF;
	Wed, 31 Dec 2025 08:12:54 +0000
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f223fb0b;
	Wed, 31 Dec 2025 16:12:33 +0800 (GMT+08:00)
Message-ID: <0de0f505-5858-4ea6-85a7-4c386ac205e9@rock-chips.com>
Date: Wed, 31 Dec 2025 16:12:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-8-ye.zhang@rock-chips.com>
 <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b73773f5d09d8kunm7d1b63c029b1073
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhNQlZCH09PTEMYT0IeHkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LlMTtoudwY0r8GtTq3kRlvFU7O9LrvHrzRYkwTvLuJkRNjj1JKUg8aTA2zm1GVSnbB29fNF/sO5ZNrbHF630uTJfymHO6MMom80zaV5fR4MvcHbT3Q7Z2oGbuWhzpyiLPBMMVoNSi4y6+caIs3cWB/JBkJ9NjVt0dG5DjCS22M8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PJXRdk/Jm/8W9JuE53zA910TazhkvqSxi7iqm+rHlCQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_001253_650304_A2B2E6B2 
X-CRM114-Status: GOOD (  10.53  )
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


在 2025/12/28 18:37, Krzysztof Kozlowski 写道:
> On 27/12/2025 12:49, Ye Zhang wrote:
>> +		/omit-if-no-ref/
>> +		rm_io28_touch_key_in6: rm-io28-touch-key-in6 {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 49>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_touch_key_in7: rm-io28-touch-key-in7 {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 50>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_mclk: rm-io28-sai0-mclk {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 51>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_sclk: rm-io28-sai0-sclk {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 52>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_lrck: rm-io28-sai0-lrck {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 53>;
>> +		};
>> +
>> +		/omit-if-no-ref/
>> +		rm_io28_sai0_sdi0: rm-io28-sai0-sdi0 {
>> +			rockchip,pins =
>> +				<1 RK_PC3 7 &pcfg_pull_none>;
>> +			rockchip,rmio-pins =
>> +				<0 28 54>;
>> +		};
> Why are you defining all pins? This is wrong, your driver has to do it,
> not DTS. All these definitions when not used are just pointless.
>
This file is auto-generated to provide a complete set of RMIO 
configurations.   Our intention is to offer a generic library for all 
future board developers, so they can simply pick the needed nodes by 
phandle without manually looking up register values in the datasheet 
every time.   This improves usability and standardization.

We also used the /omit-if-no-ref/ tag, so this will strictly not 
increase the size of the compiled DTB binary at all.

Could you please reconsider if this  approach is acceptable given the 
usability benefits?

If you still consider the ~25k lines of source code bloat unacceptable 
for upstream, we will have to drop this generic dtsi file and let users 
manually define only the required nodes when adding board support.

Best regards,
Ye Zhang

