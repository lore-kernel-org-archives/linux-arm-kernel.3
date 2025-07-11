Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BFAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47mqYoiKeZ/zqm9N6N2f/Tu0kYWZlKHaQ/Ixw2H+aSk=; b=QJdUX5sAMCwL77pZwpzBjg37jl
	MvY1P+f0Xf68BcbMFjD0X+jCtnwOizcxL1fZGV9yeo53mqHCMNa4JShBisQ9714YsQ225gdUXSs0r
	mWAmIM9V5r0I7Bg2Mu86GQWIDCnZ3Di6389dffmco0147Ntlm9l9v0Wfwe/QIyEFzhdFgPSpj/b3R
	NKy32rUkDnd2jdTxn6/8TjX21L7CdB/DReuR7WHOOdRTXaomuMFIc6F/7c8j6DGZTI9k48RG15dy4
	Ko0jY30TPSTwtp6VFsAkguDzEAglOVx5eAW0maIG5whRfuzJ5cg2Gs4Wgny6LDuwPpLiIJICGSbIn
	bci/6wlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8GR-0000000DzQU-1hfL;
	Fri, 11 Jul 2025 07:33:47 +0000
Received: from mail-m3291.qiye.163.com ([220.197.32.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua83F-0000000DwS8-3Xeg;
	Fri, 11 Jul 2025 07:20:11 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1badf1316;
	Fri, 11 Jul 2025 15:20:05 +0800 (GMT+08:00)
Message-ID: <600f723d-1ec7-4e67-b6f1-316ac8c09235@rock-chips.com>
Date: Fri, 11 Jul 2025 15:20:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-5-damon.ding@rock-chips.com>
 <4596850.bcXerOTE6V@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4596850.bcXerOTE6V@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxNSFYaH0NKSk8YGU9PHUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f85b090603a3kunm38f22b26f2f422
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Ijo*FzE5HR8KEzA*Czwu
	HwowCQtVSlVKTE5JSUpDT0tMT0tCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSUtPNwY+
DKIM-Signature: a=rsa-sha256;
	b=Aa+3MMGCvohGN1l0oGiN9mPE9+buYJEnl7ehbJtNvS297qP4+L7vINeEZPucXb9o8A4JzLAXyJsHSJEQslBF+pchRkHo/Eum2OyZKRYcPQ6U1nEYgyo+L5wX146JCFtmGeuaa1OuwRzenz3aIxjmbCmDgLQJwoJopLf5Na7YYzg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=47mqYoiKeZ/zqm9N6N2f/Tu0kYWZlKHaQ/Ixw2H+aSk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_002010_035249_E0647195 
X-CRM114-Status: UNSURE (   8.04  )
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

Hi Heiko,

On 2025/7/10 3:55, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:31 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
>> directly.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
>> @@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>>   
>>   	dp->drm_dev = drm_dev;
>>   
>> -	if (!dp->plat_data.panel && !dp->ptn_bridge) {
>> +	if (!dp->plat_data.panel && !dp->plat_data.panel) {
> 
> typo. The second test should be for dp->plat_data.bridge

That was so careless of me! I will fix it in the next version.

> 
> 
>>   		ret = exynos_dp_dt_parse_panel(dp);
>>   		if (ret)
>>   			return ret;
> 
> 
> 
> 
> 

Best regards,
Damon


