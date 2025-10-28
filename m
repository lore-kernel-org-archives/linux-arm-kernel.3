Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99A8CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWFZ7wFU0oJn0xlF0a8hdwI8bFTvAeFwgQl1T8susj4=; b=zMGohkqrLQiqApTkBwXhPR4RAM
	72YSb3BrrWpBKtBbHlGJGCjimf/DCqg5RFAj+PJtl0PD4MFM+NQ/v/qqoiDzd8WXuMSXXqfPoj8CI
	WDdG3S25SDCXA6+k1ISgmCzkqShENafFHY531JpIqcNSZIkkYYX4LRFdtUKOuJetLO+MT+pQdWb5e
	rXmwLGVCPWGpjqbjh5kD20WJFWzYF/Lxxpm5lefkuO8/xOIexynm/c3KkeThALXrD+UpKRP7oofWL
	BWE7sN7lWO2tMVTy2gJqXZTh4XbBxMysWo7aCHzoifnyu1yVFwI2O6RPEp9tgTa3NKawLBJTJmODd
	uJCKwBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhAK-0000000FmVE-3pfA;
	Tue, 28 Oct 2025 10:43:00 +0000
Received: from mail-m19731104.qiye.163.com ([220.197.31.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhAH-0000000FmUJ-26PJ;
	Tue, 28 Oct 2025 10:42:59 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 277b7c941;
	Tue, 28 Oct 2025 18:42:52 +0800 (GMT+08:00)
Message-ID: <dbb5f7b4-7dac-413e-8c0a-4f962b79eae0@rock-chips.com>
Date: Tue, 28 Oct 2025 18:42:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
To: Conor Dooley <conor@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>,
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20251027-rk3576-pwm-v3-0-654a5cb1e3f8@collabora.com>
 <20251027-rk3576-pwm-v3-1-654a5cb1e3f8@collabora.com>
 <ff9631f5-8fff-4be8-8b6f-807c29943ef6@rock-chips.com>
 <20251028-favored-dynamite-fa626b96ecba@spud>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251028-favored-dynamite-fa626b96ecba@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a2a69de4503a3kunm3a0251b715b88b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlMHVZKGkkeHR5DSUMZH0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=S1mtYRFF6hi+IK7RpvYsFRyQjzX9G+C1YGR+qZrW7CHGySfkhkjEJ6cltXdZZ5ZnbzFXXAyotA4NNbci43z7eiXayHbWdngregdEBj7/lEfAf2r4yQn0YVx5aR/TJErMMP3zqlDTE2SMXXNZJ7JDijcgo9+npF4OSioc323AKx4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=gWFZ7wFU0oJn0xlF0a8hdwI8bFTvAeFwgQl1T8susj4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_034258_043686_08058D4F 
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

Hi Conor,

On 10/28/2025 4:50 PM, Conor Dooley wrote:
> On Tue, Oct 28, 2025 at 11:06:15AM +0800, Damon Ding wrote:
>> On 10/28/2025 1:11 AM, Nicolas Frattaroli wrote:
>   
>> The RK3506 and RV1126B platforms that are about to be upstream also use this
>> PWM IP. Would it be better to name the yaml file "pwm-rockchip-v4.yaml"?
> 
> No. Files should be named to match a compatibles.
> 
>> Then subsequent platforms only need to expand the compatible property.
> 
> That's all subsequent platforms need to do anyway!

Got it.

Best regards,
Damon


