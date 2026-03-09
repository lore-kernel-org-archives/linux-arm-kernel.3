Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1DCEFCD9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hduUfmGwgnKMskaDKeGcgwJWohiGVW+qVStYTESGB2U=; b=cb1aMetEGGtHd3gDbYkoU9FYF8
	PclAQ7kYzWLNP4JFyBqTa6Xm+xWigxdBnhHvHuYxsiIclF5jRGY1TM7W7hrGAuOLD37S87jD/13F8
	nKbyqBAnrTLneXjaELk08WRrPFDQGhiy7VS2ZxucT6sWeadqVZRFwLA6/9FCKoK4c9GJyhei4FubF
	m+4v8ynJPsM55h/XpGmOuAgX4PcokQT6IhaWeZkzVcE2ID447wI98oLYVIW38moP6aIKUiaQJ9mjA
	QqaOOoDNx4uHWAwNY6ge96mkBnn/TIDCYtfR/YTjZzwuX/MTPMlgLxyUb92863evpKmnTKFPclQCX
	4YPA4anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ92-00000007EO0-3BSs;
	Mon, 09 Mar 2026 11:51:32 +0000
Received: from mail-m3269.qiye.163.com ([220.197.32.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ8y-00000007EMy-37O2;
	Mon, 09 Mar 2026 11:51:30 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36434b970;
	Mon, 9 Mar 2026 19:51:23 +0800 (GMT+08:00)
Message-ID: <01983e92-dabb-47f7-ba01-988ea41641db@rock-chips.com>
Date: Mon, 9 Mar 2026 19:51:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/15] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-11-damon.ding@rock-chips.com>
 <DGT20ZJ3Q4WP.3OTQJYWGSYGUD@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DGT20ZJ3Q4WP.3OTQJYWGSYGUD@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9cd270098c03a3kunm26e3dc7b2d81c9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ05OS1YeHkxLSkgYQkNDTE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=C4os9YqNIUC3dEyjyzM/hCxvk1F4fWa1S7B31zMJjMRFJW7ZEsZL+m85ptIf9IWCeuLLhar9IN001x4s5PBLTMGuQlDb+GzAX3aXtbXJrDmPNAb2GPzyOvS/jIXmdi0MK0cJdB+IiAiLNeWa/7D2wdMUSjFWtZYZZb4qvAyF1AM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hduUfmGwgnKMskaDKeGcgwJWohiGVW+qVStYTESGB2U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_045129_339413_7FDE15BD 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Luca,

On 3/3/2026 5:54 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>> Since the panel/bridge should logically be positioned behind the
>> Analogix bridge in the display pipeline, it makes sense to handle
>> the panel/bridge parsing on the Analogix side. Therefore, we add
>> a new API analogix_dp_finish_probe(), which combines the panel/bridge
>> parsing with component addition, to do it.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
> 
> ...
> 
>> @@ -1581,6 +1583,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>>
>> +static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
>> +{
>> +	struct analogix_dp_device *dp = to_dp(aux);
>> +	struct analogix_dp_plat_data *plat_data = dp->plat_data;
>> +	int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
>> +	int ret;
>> +
>> +	/*
>> +	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
>> +	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
>> +	 * mode applications.
>> +	 */
>> +	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
>> +					  &plat_data->panel, &plat_data->next_bridge);
>> +	if (ret && ret != -ENODEV)
>> +		return ret;
>> +
>> +	return component_add(dp->dev, plat_data->ops);
>> +}
>> +
>> +int analogix_dp_finish_probe(struct analogix_dp_device *dp)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
>> +	if (ret) {
>> +		/*
>> +		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
>> +		 * not be called because there are no EP devices. Then the callback function
>> +		 * analogix_dp_aux_done_probing() will be called directly in order to support
>> +		 * the other valid DT configurations.
>> +		 *
>> +		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
> 
> Uhm, if it is allowed to return -EPROBE_DEFER...
> 
>> +		 */
>> +		if (ret != -ENODEV) {
>> +			dev_err(dp->dev, "failed to populate aux bus\n");
>> +			return ret;
>> +		}
> 
> ...then you shouldn't dev_err() when -EPROBE_DEFER is returned.
> 
> Either use dev_err_probe() (which would also simplify your code) or check
> for if (ret != -ENODEV && ret != -EPROBE_DEFER).

Will fix in v10.

> 
>> +
>> +		return analogix_dp_aux_done_probing(&dp->aux);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
>> +
>>   MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>   MODULE_DESCRIPTION("Analogix DP Core Driver");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index 3428ffff24c5..bae969dec63a 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>> +	const struct component_ops *ops;
> 
> Is adding a new stored field a good idea? Can it be instead passed as an
> argument to analogix_dp_finish_probe()?
> 
> Note I don't have a strong opinion here, just the added struct field seems
> overkill for being used just once.
> 

I agree this is a better approach, since the &component_ops is only used 
during probing.

>> @@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector);
>>
>>   struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
>>   struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
>> +int analogix_dp_finish_probe(struct analogix_dp_device *dp);
>>
>>   #endif /* _ANALOGIX_DP_H_ */
> 

Best regards,
Damon


