Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F77CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 01:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUVBUOz5sUDHUQetR7revEkMQrBOhxD0zn0dGzL4myk=; b=WN/AGCoo5WRXs+WQ+K1qEHFAo2
	0tZeX37Gy5VUWCffrHdvWBRJIoZ0vnGuxAvoPjsQZPmT1+18k7yuwKqDcBAp7IBvWUwp411L2ySVt
	BC0Iydg4rA5hNXysoruvnrPobCyy3ZF5/4xIQ0yYA4vgNJQxaLjRVri/gZMgaZhKCeZvuPoRz9YYv
	9fANaaBy4/fyX0DDbcNxYw/xU2hUlqN83cvDFN1caiUbna+QcNufvK93kBFKfSArGyizruyw8ERCd
	pd12d2G63gcfbzGaSn4o1XuHxDTMl9L+dxj8svFX4qeRevEELDAxKm8NG5vA3lGI6gzrj0VZ6tCrd
	ScAXtKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLA9a-00000005IJS-3876;
	Fri, 08 May 2026 01:37:22 +0000
Received: from mail-m49232.qiye.163.com ([45.254.49.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLA9X-00000005IIY-3tRS;
	Fri, 08 May 2026 01:37:22 +0000
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d8e35828;
	Fri, 8 May 2026 09:37:09 +0800 (GMT+08:00)
Message-ID: <dd63b7f7-e891-49f1-a795-861d11c55e48@rock-chips.com>
Date: Fri, 8 May 2026 09:37:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] dt-bindings: display: rockchip: analogix-dp:
 Expand clock-names "hclk" for the third clock
To: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
 <20260507112948.1115003-2-damon.ding@rock-chips.com>
 <6496645.8F6SAcFxjW@phil> <4528155.7s5MMGUR32@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4528155.7s5MMGUR32@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e053b3f2703a3kunm1660029036bf9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkkeVh5KS0sYTx9CTktMSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=AcZjUBiyGiz3rie6u5vJ2JopoUch7T3yj8wOtjUtZVppBrALf6lZ9KkR60NM7+TvXv3TdxiPfBRhjsoUTKsslGeSQWWSSudjzo89u+oReBsxSUu72iTVYk5kfduS5SbTrBfwMl0OLw7cvi/YTZtLHr2F2eKmEYQz9peqCUnRqRI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=BUVBUOz5sUDHUQetR7revEkMQrBOhxD0zn0dGzL4myk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_183720_489596_9D855742 
X-CRM114-Status: GOOD (  13.14  )
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

On 5/7/2026 7:42 PM, Heiko Stuebner wrote:
> Am Donnerstag, 7. Mai 2026, 13:40:09 Mitteleuropäische Sommerzeit schrieb Heiko Stuebner:
>> Hi Damon,
>>
>> Am Donnerstag, 7. Mai 2026, 13:29:39 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>>> The RK3588 eDP controller needs the video datapath clock "hclk" to work
>>> well. Previously, it works without explicitly adding this clock because
>>> the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables HCLK_VO1.
>>>
>>> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> ---
>>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>> index d99b23b88cc5..d2bc8636b626 100644
>>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>> @@ -26,7 +26,9 @@ properties:
>>>       items:
>>>         - const: dp
>>>         - const: pclk
>>> -      - const: grf
>>> +      - enum:
>>> +          - grf
>>> +          - hclk
>>
>> are you sure about that?
>>
>> The edp uses the vo1-grf - so what enables its clock?
>> For example the hdmi controllers on rk3588 also use the vo1-grf and
>> explicitly handle that clock.
>>
>> So who does it for the eDP?
> 
> Ah, ... found the hclk_vo1 in the following patches.
> 
> Still the binding commit message could use some more words about what that
> clock is, and why it can "replace" the GRF clock from earlier SoCs.
> 
> 

Yes, I will add more descriptions about this in next version. :-)

Best regards,
Damon


