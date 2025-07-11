Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9403C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f/SyxPB0VfACu7tJD6T5FVMoYuITfLiK8Gntfmm160=; b=Tjj67W7hIurYP2Fm5QCD6ftGUb
	Hj1O9yQud+CLKI1+OMAAm+8vm0rgNVLGNFYo5vvVJgxAnNC0a0EOnbjqXtxLOPz5RCr9TkHHLhXCL
	lRTRSzmKJCAQlvNNldzxSA5i2KSxkPT5OHvBKZDbbuL29GiWtN+GDm5w3CnA0YHFzOSQiykY3xYvO
	4lSYZXeH2tVAONoVflpNMFv+32HDc70h/em9JB2oqimwezG7VCAqPZm4VR3Y8M2khg4kDCTXGn1Ui
	d3M4ftjopuim2qc8fM1S8dhhiCAVSdFVguGTIJIWnVCZfItY+nMZp99NvdN3GNTTESXtx1K1QKr2L
	6G2/mCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Pi-0000000E0hR-2u8c;
	Fri, 11 Jul 2025 07:43:22 +0000
Received: from mail-m21469.qiye.163.com ([117.135.214.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua89x-0000000DyA4-2yHT;
	Fri, 11 Jul 2025 07:27:07 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1bae50b4c;
	Fri, 11 Jul 2025 15:26:58 +0800 (GMT+08:00)
Message-ID: <ec271884-87a1-4117-a7f7-45e423b9de8a@rock-chips.com>
Date: Fri, 11 Jul 2025 15:26:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] drm/exynos: exynos_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
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
 <20250709070139.3130635-6-damon.ding@rock-chips.com>
 <6306541.2iPT33SAM4@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6306541.2iPT33SAM4@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0saQ1ZPTxhIHh8aQx1OS0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f86155fa03a3kunm5a905d91f32139
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MC46TRw5ATE0Qh8eE1ZDGTwX
	PEIKCy9VSlVKTE5JSUpDQ0lLSUpNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQk5INwY+
DKIM-Signature: a=rsa-sha256;
	b=MVDBP+MlXmQIBids0j03Vrslb0E7yHyCGuZ7vavVT9bPeByoPFrna+SYZtUEzpKc162OMDNeixdHM2x4Lyi7dBzfmK8GzfH9YcN70K/4VBtbxnDPFtyKHshIarOPguVv7/6s15pne+vD4nRZd1JOoUilcMrtPA7VZP8FsUR2+wQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3f/SyxPB0VfACu7tJD6T5FVMoYuITfLiK8Gntfmm160=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_002706_001446_D1EC2E78 
X-CRM114-Status: GOOD (  14.20  )
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

On 2025/7/10 3:58, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:32 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> The &analogix_dp_plat_data.skip_connector related check can be replaced
>> by &analogix_dp_plat_data.bridge.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
>> index 9d7d3f009e58..9e1313fdecad 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>> @@ -237,7 +237,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
>>   	dp->plat_data.power_off = exynos_dp_poweroff;
>>   	dp->plat_data.attach = exynos_dp_bridge_attach;
>>   	dp->plat_data.get_modes = exynos_dp_get_modes;
>> -	dp->plat_data.skip_connector = !!bridge;
>>   
>>   out:
>>   	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
>>
> 
> I think you might want to merge
> - drm/exynos: exynos_dp: Remove redundant &analogix_dp_plat_data.skip_connector
> - drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_connector
> 
> Because when separate this creates a bisection issue.
> Like when a bisect happens to land directly on this commit, you already have
> removed the exynos assignment, but the updated check from the following patch
> is not yet in place.
> 
> 

Oh, I see. Squashing related commits together would be better.

Best regards,
Damon


