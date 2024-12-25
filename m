Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1214EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txPoZjhS7WmZRPL5mk+VeO5MESw98jX31iKdCOFZ2WY=; b=rSFDqJotJwqkEtHp1ODO9AxAuV
	/k4X0acNHLp6Q+eN2JL28sB8UfGHnQFQ4eZcuRQfBxbCdAeqTV32oyANzKMurHPTr/92rrfwwdsIh
	o31zH5wgaYiKqTRlyh7w+65LFoCYBHUTuYqY2fSInOi3XCUNbh+HPzSf+aBMN3y4sJxxP1jvvvmBE
	QqFkMeyLu8afPu0EayGyvrkwD85/3mK2HBk/YfPOQW5vnjmQDGu8jsShzW+TDOiNdQ5hgLpEEE56C
	hOc422qyKIj9GHBJ5wsAqqdt97CNy/Ec0LAdmH/+SaeO7fUP/USE2r6cue65odgOtKy98ZyNSIrk7
	DSgz8rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMlN-0000000DRui-3cpa;
	Wed, 25 Dec 2024 08:29:05 +0000
Received: from mail-m49245.qiye.163.com ([45.254.49.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMju-0000000DRVi-1FQl;
	Wed, 25 Dec 2024 08:27:36 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6c497887;
	Wed, 25 Dec 2024 16:27:23 +0800 (GMT+08:00)
Message-ID: <affff5b9-95fb-4d0a-ab09-371545e8450b@rock-chips.com>
Date: Wed, 25 Dec 2024 16:27:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
 <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
 <654c30ec-7d7e-4956-9a48-15bfcea34acc@rock-chips.com>
 <CAA8EJpqk-iim668ZTzQaROJmkTr2COBwA5G9Eg73uLE28XHYpg@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAA8EJpqk-iim668ZTzQaROJmkTr2COBwA5G9Eg73uLE28XHYpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ04YT1ZOGEIfTBlKSB8fSk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93fced818603a3kunm6c497887
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Tjo5GjIcEE8YDys4KEMj
	Kj0aFBBVSlVKTEhOSkpOSU9OTEtNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNQk9LNwY+
DKIM-Signature: a=rsa-sha256;
	b=UPC0f7qcrwZe5+4cW9Y0k24vj4hFwCwq07GzJZR1NrL6UI77q+ZweU392GftAMLQYVyu/1jerhQCLTGDsIal4GHLyxA42x6uoOCFIy7dxZQD+xAhAIDn9gWTzPeA6c3aqMnzyEPmEElCv3pN2qgse8lKl+SP0u9RYeUgWfwByXY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=txPoZjhS7WmZRPL5mk+VeO5MESw98jX31iKdCOFZ2WY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_002734_882929_AA6C8DA5 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Dmitry,

On 2024/12/20 13:37, Dmitry Baryshkov wrote:
> On Fri, 20 Dec 2024 at 05:37, Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 2024/12/20 8:13, Dmitry Baryshkov wrote:
>>> On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
>>>> Add support to configurate link rate, lane count, voltage swing and
>>>> pre-emphasis with phy_configure(). It is helpful in application scenarios
>>>> where analogix controller is mixed with the phy of other vendors.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - remove needless assignments for phy_configure()
>>>> - remove unnecessary changes for phy_power_on()/phy_power_off()
>>>> ---
>>>>    .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>>>>    .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 56 +++++++++++++++++++
>>>>    2 files changed, 57 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> index 6f10d88a34c5..9429c50cc1bc 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> @@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
>>>>       if (dp->plat_data->power_on)
>>>>               dp->plat_data->power_on(dp->plat_data);
>>>>
>>>> +    phy_set_mode(dp->phy, PHY_MODE_DP);
>>>>       phy_power_on(dp->phy);
>>>>
>>>>       analogix_dp_init_dp(dp);
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>>> index 3afc73c858c4..613ce504bea6 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>>> @@ -11,6 +11,7 @@
>>>>    #include <linux/gpio/consumer.h>
>>>>    #include <linux/io.h>
>>>>    #include <linux/iopoll.h>
>>>> +#include <linux/phy/phy.h>
>>>>
>>>>    #include <drm/bridge/analogix_dp.h>
>>>>
>>>> @@ -513,10 +514,25 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
>>>>    void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
>>>>    {
>>>>       u32 reg;
>>>> +    int ret;
>>>>
>>>>       reg = bwtype;
>>>>       if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
>>>>               writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
>>>> +
>>>> +    if (dp->phy) {
>>>> +            union phy_configure_opts phy_cfg = {0};
>>>> +
>>>> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
>>>
>>> Should not be necessary, you are only setting the .set_rate.
>>
>> Indeed, this can be dropped.
>>
>>>
>>>> +            phy_cfg.dp.link_rate =
>>>> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>>>> +            phy_cfg.dp.set_rate = true;
>>>> +            ret = phy_configure(dp->phy, &phy_cfg);
>>>> +            if (ret && ret != -EOPNOTSUPP) {
>>>> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>>>> +                    return;
>>>> +            }
>>>> +    }
>>>>    }
>>>>
>>>>    void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>>>> @@ -530,9 +546,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>>>>    void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
>>>>    {
>>>>       u32 reg;
>>>> +    int ret;
>>>>
>>>>       reg = count;
>>>>       writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
>>>> +
>>>> +    if (dp->phy) {
>>>> +            union phy_configure_opts phy_cfg = {0};
>>>> +
>>>> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
>>>> +            phy_cfg.dp.set_lanes = true;
>>>> +            ret = phy_configure(dp->phy, &phy_cfg);
>>>> +            if (ret && ret != -EOPNOTSUPP) {
>>>> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>>>> +                    return;
>>>> +            }
>>>> +    }
>>>>    }
>>>>
>>>>    void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>>>> @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>>>>    void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
>>>>    {
>>>>       u8 lane;
>>>> +    int ret;
>>>>
>>>>       for (lane = 0; lane < dp->link_train.lane_count; lane++)
>>>>               writel(dp->link_train.training_lane[lane],
>>>>                      dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
>>>> +
>>>> +    if (dp->phy) {
>>>> +            union phy_configure_opts phy_cfg = {0};
>>>> +
>>>> +            for (lane = 0; lane < dp->link_train.lane_count; lane++) {
>>>> +                    u8 training_lane = dp->link_train.training_lane[lane];
>>>> +                    u8 vs, pe;
>>>> +
>>>> +                    vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
>>>> +                         DP_TRAIN_VOLTAGE_SWING_SHIFT;
>>>> +                    pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
>>>> +                         DP_TRAIN_PRE_EMPHASIS_SHIFT;
>>>> +                    phy_cfg.dp.voltage[lane] = vs;
>>>> +                    phy_cfg.dp.pre[lane] = pe;
>>>> +            }
>>>> +
>>>> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
>>>> +            phy_cfg.dp.link_rate =
>>>> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>>>
>>> This two should not be necessary, please drop them.
>>
>> These two are necessary for rk_hdptx_phy_set_voltage(), so they cannot
>> be dropped.
> 
> Please review the documentation for struct phy_configure_opts_dp and
> fix your PHY driver to skip the values for which the .set_foo isn't
> set. Then you might have to change this part.
> You are setting just .set_voltages. It means that the rate and .lanes
> shouldn't be changed and can be used as they were set by the previous
> calls to phy_configure().
> 

Indeed, I will store the previous &phy_configure_opts.dp.link_rate and 
&phy_configure_opts.dp.lanes in the struct rk_hdptx_phy, and will not 
use both of them during the configuration process of the 
&phy_cfg.dp.voltage[] and &phy_cfg.dp.pre[] in next version.

>>
>>>
>>>> +            phy_cfg.dp.set_voltages = true;
>>>> +            ret = phy_configure(dp->phy, &phy_cfg);
>>>> +            if (ret && ret != -EOPNOTSUPP) {
>>>> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>>>> +                    return;
>>>> +            }
>>>> +    }
>>>>    }
>>>>
>>>>    u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
>>>> --
>>>> 2.34.1
>>>>
>>>

Best regards,
Damon


