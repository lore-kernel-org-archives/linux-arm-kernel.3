Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97746C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwJBmCRtBPr279bswslshLIRoVTVjLdcj1Wo5iFAM3w=; b=mDN/tNOFANkLxR4wbk02Hu0lol
	0mIPb6WQmI2nmlRXebvsGMeSz9KzRV64co+GD0A9zVSC7gLZttbEuVGd4VIbhCM2ExiIpOwCECUAP
	/fTpTuP8CFaiiGAEkJbzdWzbKWbZyREgu+hCPtgIzywjqGVeNQER+psWFO0iZUQinUF/EcpbBXbC6
	TaEpbvoCTSa/R4KNKFwUqGFoyIWM6Ua72nf0Jp7EU8CgoPKKIUrS4F3DFJoXVX2pH9+AUtI49nzOu
	Z7ksstrbtsgotAb2z/tXdhNFM8aNMmn1tosl/iGgpDSp+LUqF3et4CTtEuZ5bv62ksgNpXmuVYw6Z
	pcH+Q3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1togiP-0000000FpFd-3BPW;
	Sun, 02 Mar 2025 10:38:33 +0000
Received: from mail-m32100.qiye.163.com ([220.197.32.100])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toggf-0000000Foq0-1nsK;
	Sun, 02 Mar 2025 10:36:47 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id ca2fcbb2;
	Sun, 2 Mar 2025 18:36:37 +0800 (GMT+08:00)
Message-ID: <1d066210-3d24-4d17-a51c-115f305c5de9@rock-chips.com>
Date: Sun, 2 Mar 2025 18:36:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v7 09/15] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Doug Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 boris.brezillon@collabora.com, l.stach@pengutronix.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-10-damon.ding@rock-chips.com>
 <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5KQ1YdQk9LH0tNSB9OT0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95566de61f03a3kunmca2fcbb2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohw6Iio6LTINI0sWTxgtPSJL
	PCswCwNVSlVKTE9LQkpKTEJCTUtIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITU9CNwY+
DKIM-Signature: a=rsa-sha256;
	b=kZPZ5ZGSqT9O0E2P1zhbCBACC65/xnByw/wawoT8NmV3MJGsm5Vz/EmaIjjh31vQRVM1tvBiEyj3p3KLGQgzMaS6gwrwRnMh7yLnL3f5XjBUBSwCEZ6Oc1659x4UvaUdCJY3VcYjO8WO8bKPkSI2atxfzX5FRoenqvW6jNTmd2k=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gwJBmCRtBPr279bswslshLIRoVTVjLdcj1Wo5iFAM3w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_023646_014976_05B52A3C 
X-CRM114-Status: GOOD (  25.09  )
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

Hi Doug,

On 2025/2/25 9:41, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 24, 2025 at 12:14 AM Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> The main modification is moving the DP AUX initialization from function
>> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
>> eDP panel during probing, it is also needed to advance PM operations to
>> ensure that eDP controller and phy are prepared for AUX transmission.
>>
>> Additionally, add support for &drm_dp_aux.wait_hpd_asserted() to help
>> confirm the HPD state before doing AUX transfers.
> 
> Maybe move the addition of the analogix_dpaux_wait_hpd_asserted() to a
> separate patch?
> 

It would be a good idea.

> 
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v4:
>> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>>    component_add() when getting panel from the DP AUX bus
>>
>> Changes in v5:
>> - Advance PM operations to make eDP AUX work well
>>
>> Changes in v6:
>> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
>> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>>    operations
>>
>> Changes in v7:
>> - Fix the misspelling of word 'operations' in commit message
>> - Remove the check related to CONFIG_PM
>> - Remove the unnecessary call to pm_runtime_dont_use_autosuspend() if
>>    devm_pm_runtime_enable() fails
>> - Remove unnecessary function analogix_dp_remove()
>> - Add new function analogix_dpaux_wait_hpd_asserted()
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 37 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index a57e06d303a1..ff81c37dbe1d 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1548,6 +1548,22 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>>          return ret;
>>   }
>>
>> +static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us)
>> +{
>> +       struct analogix_dp_device *dp = to_dp(aux);
>> +       int val;
>> +       int ret;
>> +
>> +       pm_runtime_get_sync(dp->dev);
>> +
>> +       ret = readx_poll_timeout(analogix_dp_detect_hpd, dp, val, !val, wait_us / 100, wait_us);
> 
> More than happy if someone else wants to overrule me, but it seems
> weird that you're looping over a function that already has a loop.
> Shouldn't you be calling analogix_dp_get_plug_in_status() directly?
> ...and if "dp->force_hpd" you probably shouldn't be polling at all. If
> HPD is not hooked up I think we decided in sn65dsi86 that we should
> just sleep for the maximum time (choosing a conservative value if told
> to wait forever).
> 

Yes, I think there is no need to use analogix_dp_detect_hpd(), and the 
code as you recommended is better:

static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, 
unsigned long wait_us)
{
	struct analogix_dp_device *dp = to_dp(aux);
	int val;
	int ret;

	if (dp->force_hpd)
		return 0;

	pm_runtime_get_sync(dp->dev);

	ret = readx_poll_timeout(analogix_dp_get_plug_in_status, dp, val, !val,
				 wait_us / 100, wait_us);

	pm_runtime_mark_last_busy(dp->dev);
	pm_runtime_put_autosuspend(dp->dev);

	return ret;
}

> 
> Aside from that and the idea of moving
> analogix_dpaux_wait_hpd_asserted() to a separate patch this looks good
> to me.
> 

Best regards
Damon


