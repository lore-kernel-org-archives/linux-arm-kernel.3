Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A3CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhclhhAN+rBOBw5D126RaMzi1C7zOpsEM0rG6HQAxYs=; b=axzhpXV04SxbqFq4gca2xJWx5J
	ZdET/REFvuaIpJyLJKWCKSgXan9oTRS68mtDFL/m08Kw/kPe5HrnFjNv10XJBxbLkiClFw66jspTU
	C3+jXBryLbbBNFDjwqAQn/fTiv03blcaP+H9bKVpiJ4ubjGMqV7f/OcESXHAzfl+51AXYHrqB66Hi
	Vwh1exdKi0CakKss6YhibK3WG7O7cpWvxY1yDDXDOoBx0YcyoypR4Ak8WujoQgEDtOVUI/bmGUgh5
	7Tvsfvd0+4DX7Ux8rqqtIR9z/FSOq14d+kFLtiGHOBU1nzYalxgJYMDV3iI2IBLlw0uG2qrsSMemm
	1b+xr+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWeB-00000001iM7-3b1f;
	Tue, 02 Sep 2025 19:26:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTV7-00000000qsu-3pBN;
	Tue, 02 Sep 2025 16:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756829092;
	bh=ovWdbmcLBmA33JBDYg84OE2PqHzIKb6iNt+T6eoF2kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FUUfI3WXYc1B8QJ6WeBpPvR0+1cMVN778Sl29SAmhAoSko8l+RH/Bxm0WuqqyJJW1
	 lrMAWYbfZ80CGBKTAcbSG/5phmbYDtRElhkRWQsS9uubdqJ8wRB8MMfG+ZuqR0EuH5
	 cc4hQYsR8yFJX4o5sAEOP2F17NHZFKm/Loaa7WpvuUrKY1fNLRA9RgbCkxZUyWSGld
	 ZMvRimQ+t3ZM3ANHSvPz18MV+Wjp08FasY9xoJR+TY+A4eE9FUKLI9OF72e5kPK8jO
	 J7wJyFTpc76oxwxhQbs+xMKsWOMZ1oUXQNvGMP9PG9O5KdeNyGwlOdVxEehCPDsBh3
	 4dG8NXOEAcTIg==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E63E17E131D;
	Tue,  2 Sep 2025 18:04:51 +0200 (CEST)
Message-ID: <fc9baa6d-ed38-478b-9338-8a76986639da@collabora.com>
Date: Tue, 2 Sep 2025 19:04:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Matt Roper <matthew.d.roper@intel.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
 <50e3f25c-f4e1-40f6-8e36-23193863f1ee@foss.st.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <50e3f25c-f4e1-40f6-8e36-23193863f1ee@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_090454_109141_D715F129 
X-CRM114-Status: GOOD (  14.79  )
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

Hi Raphael,

On 9/2/25 4:19 PM, Raphael Gallais-Pou wrote:
> 
> 
> On 9/2/25 11:27, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware-configured to present non-black
>> colors for pixels which are not covered by any plane (or are exposed
>> through transparent regions of higher planes).
>>
>> The first patch of the series introduces the BACKGROUND_COLOR DRM
>> property that can be attached to a CRTC via a dedicated helper function.
>> A 64-bit ARGB color value format is also defined and can be manipulated
>> with the help of a few utility macros.
> 
> Hi Cristian,
> 
> Thanks for this work ! :)
> 
> FWIW I sent a series also based on Matt's work four years ago:
> https://lore.kernel.org/dri-devel/20210707084557.22443-2-raphael.gallais-pou@foss.st.com/
> 
> IIRC at the time there was some questions around the pixel format used for the
> property, and non-opaque color vs alpha pre-multiplication.
> Mind that on STM32MP platforms alpha channel for the background color is not
> supported.
> 
> Hope the thread can bring some insights.

Thanks for pointing this out, I will consider it for v2.

Regards,
Cristian

