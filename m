Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02093C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W782AbfO1D1R5eEJlgStJCNw/OtsvmDShB2b7uB9ZM8=; b=4XYzo9NN1fp5U/du34uvS8At7i
	HRc3UGPNHgckEv1TYI7aDP1OvxyramKUhqEAcKSdmopTN7+ZhTjWbGOKOwmy9/cb0SZ5VzZZkZ/sM
	TGTGb9mgNi7kPbVjMiX1WC+thE8+B8soic8ddL8mXhfuXKWSvQRYoT77rHMrB2kGtBhZ3iEuiGT39
	Pa6tatueMalcGmJJ8KF1SLNY1BYlCRMsh4TOZq3wICtGbNzINTfHekxx6V0iViqaE0h/gBBTQe8Op
	3Eolr2ErnmgWh5GB+yRu7Ryk8eA4Vz+wtyUQ07SR4TmB1TEz9x0ehD62nq0y70e98/o2LSKZI77bn
	mSMRGR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1BX-0000000DYPS-3PUQ;
	Mon, 29 Jun 2026 01:53:19 +0000
Received: from mail-m82213631.xmail.ntesmail.com ([8.221.36.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1BQ-0000000DYOL-1wst;
	Mon, 29 Jun 2026 01:53:18 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4414d26eb;
	Mon, 29 Jun 2026 09:53:02 +0800 (GMT+08:00)
Message-ID: <cb533b04-e550-4eb4-8a8f-6d17c3d43a48@rock-chips.com>
Date: Mon, 29 Jun 2026 09:53:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
 <20260604085220.2862986-4-damon.ding@rock-chips.com>
 <178249136513.1374898.11400378046460567437.b4-review@b4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <178249136513.1374898.11400378046460567437.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f11147a4003a8kunm26f77d9422c470
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGExMVh5DSUkaHRpOSUtLT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Jy7T/u28jP/+4T2VA2B9kxcFXAX9Dsq0ShxLHsURI3PTBcA0yO9T5KXoRBqEUSEuSuuttXE1GmOzP+PWv7OtI23helQrMLrSBkS5sop9hRxcLvUyMJF8AERH+JkKsMXw9cy7+oLAcg8pQYGhVPkRyg/D5ZPafYOGQAK8JHC5ptI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=W782AbfO1D1R5eEJlgStJCNw/OtsvmDShB2b7uB9ZM8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_185313_834655_9A72A425 
X-CRM114-Status: GOOD (  18.75  )
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

On 6/27/2026 12:29 AM, Luca Ceresoli wrote:
> On Thu, 04 Jun 2026 16:52:19 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> 
> Hello Damon,
> 
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 7a85774aaac1..e120ef3320c1 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1261,8 +1262,11 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>>   		 */
>>   		of_property_read_u32(dp_node, "samsung,link-rate",
>>   				     &video_info->max_link_rate);
>> -		of_property_read_u32(dp_node, "samsung,lane-count",
>> -				     &video_info->max_lane_count);
>> +		ret = of_property_read_u32(dp_node, "samsung,lane-count",
>> +					   &video_info->max_lane_count);
>> +		if (ret || !drm_dp_lane_count_is_valid(video_info->max_lane_count))
>> +			return dev_err_probe(dp->dev, ret ? ret : -EINVAL,
>> +					     "failed to parse samsung,lane-count\n");
> 
> I think this report by sashiko makes sense:
> 
>    >  sashiko-bot@kernel.org <sashiko-bot@kernel.org>:
>    >
>    >  [Severity: High]
>    >  Does this make the optional and deprecated samsung,lane-count property a
>    >  strict requirement?
>    >
>    >  If samsung,lane-count is absent from the device tree, of_property_read_u32()
>    >  returns -EINVAL. This causes the condition to evaluate to true, aborting the
>    >  probe with an error.
>    >
>    >  According to the device tree bindings
>    >  (Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml),
>    >  this property is marked as deprecated and explicitly optional because the
>    >  lane count can be read from the monitor. Does this patch break compatibility
>    >  with device trees that rightfully omit this deprecated property?
> 
>   (via: https://patch.msgid.link/20260604090935.7FC051F00898@smtp.kernel.org)
> 
> Can you comment on this?
> 
> 

I was also confused about this handling at first. From commit 
0d0abd894ead ("drm: bridge: analogix/dp: add max link rate and lane 
count limit for RK3288"), its commit message does not explain why 
samsung,lane-count was changed from a mandatory to optional property.

After digging into the code flow, I found that 
analogix_dp_full_link_train() picks the smaller value between the 
platform-supported lane count and the lane count retrieved from sink 
DPCD for link training. If the samsung,lane-count property is 
missing/invalid here, link training will end up using an unexpected lane 
count configuration.

Additionally, I checked Samsung’s upstream device trees that utilize 
this DP controller, and all of them carry the lane-count property. Based 
on this observation, I believe restoring the strict mandatory 
requirement for this property makes sense.

Should I create an independent fix patch to revert these two properties 
to mandatory, instead of bundling the fix in this series?

Best regards,
Damon


