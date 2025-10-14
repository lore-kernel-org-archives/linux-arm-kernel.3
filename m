Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92001CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WPvMXyfk7VBI7X+mRHiQYyAv5fXTtHFceQzolFSsXk=; b=J9nFbYvB1pb1Xo9fgC0r6SZOqe
	pRkgNiRgXAX7FkcKbzN5eOycizoS5wLolVRb8S8eaSOsN7RHIphS7Svvsgxj5Kj1q1r5ENPFdzJVp
	DvEri5esWhK5wBNPzjQQ3IxMXXTAN2C9c0hA3JZMKjZ9iw59LqBIVx0FSSx2PcORdM1few7lpEGbV
	4EarFdIcck0fTaArLP7QgwvcppVcWHFlT7zkEDxldAfDzVfG9ZADUxX9EVCxCUKcJH2Tw6SsZDBaP
	8lvganK7MYMhQliZY/U89SDYCSbOi2Atj2CtS1rcFOCWq0LvoZdOMdoTzeMlCpY4caO60CgwcBesB
	InljUmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gkQ-0000000GmzY-1xyy;
	Tue, 14 Oct 2025 15:15:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gkG-0000000Gmwk-49b7;
	Tue, 14 Oct 2025 15:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760454922;
	bh=Gc9gPNIGe4cVGaM7/VR1c6hckG2H84TGLOzGhxUKmtc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=HvPyWdV1wxFBvZyKYK3CZn8nC/VkI2tIysn96BCFz5XzMqZhqLF+EJYt7bYehfEYF
	 yoK6MX1lb1DKoZuGGqne34tIlvIzbxtWvWg7ZgmL/EjLEDMr4uH4ByWdnp1fG6D+kL
	 SkqJl7/hrQVERBOne8VnHDTO/rJ60WLoqN4s4xRmW9GKRS6lDrlEPTt2R3VOFhi7RT
	 /MjiGfjUPQcPqxuiAE2GaL1wMQdU/7Q12PEJO2+BKIQCrbyHKgcv18UOk8cYCNgWK1
	 OC0djV0mm7rNaUwhdSSmq+Ucvrwkyl9b42aA0bjK8m1zowDBSVA/WzCVsmqbORV0Fo
	 F+pDy1WCE3STg==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C878F17E1292;
	Tue, 14 Oct 2025 17:15:21 +0200 (CEST)
Message-ID: <37c99206-4bd2-40e5-95f6-71c109bd031c@collabora.com>
Date: Tue, 14 Oct 2025 18:15:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <e030bed8-58d5-4a19-b81c-45193cb900d8@collabora.com>
Content-Language: en-US
In-Reply-To: <e030bed8-58d5-4a19-b81c-45193cb900d8@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_081532_212939_8A307256 
X-CRM114-Status: GOOD (  24.30  )
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

Hi,

On 9/3/25 10:52 PM, Cristian Ciocaltea wrote:
> Hello Heiko,
> 
> On 9/3/25 9:50 PM, Cristian Ciocaltea wrote:
>> The first patch in the series implements the CEC capability of the
>> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
>> This is based on the downstream code, but rewritten on top of the CEC
>> helpers added recently to the DRM HDMI connector framework.
>>
>> The second patch is needed for RK3576 in order to fixup the timer base
>> setup according to the actual reference clock rate, which differs
>> slightly from RK3588.
>>
>> The following three patches setup platform data with the new information
>> expected by the HDMI QP transmitter library, while improving the error
>> handling in the probe path.
>>
>> Please note the CEC helpers were affected by a resource deallocation
>> issue which could crash the kernel and freeze the system under certain
>> test conditions.  This has been already fixed in v6.17-rc1 via commit
>> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
>> unregistration").
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Changes in v4:
>> - Fixed the bisect-related issues reported by Daniel by implementing
>>   the following operations in dw_hdmi_qp_bind():
>>   * Disable CEC support when the related IRQ is not available
>>   * Set ref_clk_rate to vendor default in case it was not provided by
>>     the platform driver
>>   * In both scenarios, also print a warning message to highlight the
>>     need for fixing the platform driver
>> - Simplified dw_hdmi_qp_cec_init() a bit
>>   * Removed the now obsolete cec->irq validation test
>>   * Removed the superfluous error checking and logging around
>>     devm_request_threaded_irq() call (it already handles all that)
>> - Collected R-b tags from Daniel
>> - Rebased series onto next-20250903
> 
> I forgot to mention that luckily there are no conflicts with the patches
> introducing the hw-specific bitfield operations in next-20250903, which this
> revision is based on.
> 
> I verified the series still applies cleanly onto drm-misc-next, while commit
> ad24f6e10a5f ("drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro")
> responsible for the macro conversion can be further cherry-picked without
> issues on top of all that.  The resulting file content of
> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c is identical to what's
> expected after applying this patch set onto next-20250903.

Could we get this merged, please? This would unblock some other patchsets
conflicting with it.

I've just checked and it applies cleanly on top of v6.18-rc1. Also seems to work
fine, at least I haven't noticed any regressions so far.

Thanks,
Cristian


