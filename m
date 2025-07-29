Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BDAC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy5UWCAEJ8QpZLBQjuKhMArV1bapCPsMjvUUWG3LcSY=; b=S+4C1IHZJ6gl4d6J3iIWLlzUBm
	PTJLlfvm2fT6erny5RxvA0Pl6QgoNH7HjduX3iscnBzyBWfzYrCHzZeEQqxqMr6H9y5nmKzv0BT3U
	+trBY56SwQnDgxa/ssnkGXZZQgEv+Wt9N1Yul3/NptzkxOdEs0ZxNppTgeFLjeQgOD+MAFWJnntYZ
	5WXi68IYU0aghTZdO6RXI3xLSig8RnFOr3eVgv9+bh3RXAkDgBq2lR7DRayZVyu4clkcZTecs5iPO
	N1zbIkrZXExPfAsY7AgkPRaIiYbVwCAkS7yUnWxlfTkK1DpwNDOJmnkk9R4OgUOhPHbTDEWmBFfZM
	rFndKKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfmm-0000000GGZp-0y5C;
	Tue, 29 Jul 2025 08:34:12 +0000
Received: from mail-m19731116.qiye.163.com ([220.197.31.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfkG-0000000GGDz-04fp;
	Tue, 29 Jul 2025 08:31:39 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d9827a9b;
	Tue, 29 Jul 2025 16:31:28 +0800 (GMT+08:00)
Message-ID: <7445b3d4-0e88-40e5-bcbd-8ea60c35d5bb@rock-chips.com>
Date: Tue, 29 Jul 2025 16:31:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
 <20250729-wooden-opalescent-baboon-f24fa2@houat>
Content-Language: en-US
In-Reply-To: <20250729-wooden-opalescent-baboon-f24fa2@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a98554edd1703a3kunma08ba3a841d6e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNMGlYaGh1JSElDSR5MTBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Q80s3a/tV4F2URBBklVXAzRfnVtfBo4yEdM/EZTEwDhDT0yBlKMCM/g4YkEMUHGcQZuzRB36AwgHJagRlvr2/emhFxN1gxf3dbNEzpE1/e+oHBfC3qFnlFMNZKoKPzivDTWL1SsMk8EJefvVkEZjqfv+ae5P4YR/7x2BVNQkl2g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hy5UWCAEJ8QpZLBQjuKhMArV1bapCPsMjvUUWG3LcSY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_013136_538795_BCCD87E7 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Maxime,

On 2025/7/29 15:30, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
>> In order to move the parnel/bridge parsing and attachmenet to the
>> Analogix side, add component struct drm_bridge *bridge to platform
>> data struct analogix_dp_plat_data.
>>
>> The movemenet makes sense because the panel/bridge should logically
>> be positioned behind the Analogix bridge in the display pipeline.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   include/drm/bridge/analogix_dp.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index cf17646c1310..15cb6b706e9f 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype type)
>>   struct analogix_dp_plat_data {
>>   	enum analogix_dp_devtype dev_type;
>>   	struct drm_panel *panel;
>> +	struct drm_bridge *bridge;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>>   	bool skip_connector;
> 
> So it's not the analogix_dp bridge, but the bridge after that if any?
> 
> You should probably change it to next_bridge to avoid any confusion.
> 

Yes, &analogix_dp_plat_data.bridge is intended to be the next bridge 
after analogix_dp bridge.

I will rename it to &analogix_dp_plat_data.next_bridge as suggested and 
update it in the next version.

Best regards,
Damon


