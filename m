Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71978CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGPRJMVULESKCLgKGUncmikFBtRlPF3i2dr81yltnqk=; b=lPE73IQmAeyzFIj8GnsHlE7SY9
	YP9TXrK+5hDRyxb01G1CeeW1YwPoz9qJmRugZ1ZnMwloa1IGriSjryRVi0R1PHSAf/4V/jRWbqd70
	5aIaZfeMe77hs+rZ8VV4QOegYSNay+PAjeyxtLi8me0ABKRUvclUoSjrMGcVPUr00J0akXUdsyBKf
	+7P0n5qdY8DOTOgOoMfPpnYzocbE8jpkKfxlFq/kbIc9W9tyT2hwH409VBy5LElCV/lCTII14uCL2
	WNlq4gXPW9n8IHBBMQBMmtMs4dh47MpY5uP0zZ17fNadguDn5BOhRM5f0GoIXJK9JwMtXHKdKb5GG
	Ete4PLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIknR-00000007DkE-3G4u;
	Mon, 19 Oct 2026 10:40:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIknO-00000007DjQ-2l2i;
	Mon, 19 Oct 2026 10:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792406442;
	bh=q6N5Aio8FeUee+E5prkHvtU2XRa+2nEtmXw5f1D/Naw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QcW07TuK1MwNhKhje1WJ+t3EqobvIzT4fFt8pAfQq1Ry+KN3bfWOxfxsjs65IfEmk
	 ZrxC/F2ps+CsAzZctOfBCOPkmyBxqWcSkrmwQu0toqCT66A2BbUUpIQ1XipUslbcIp
	 PxJVqnf72ATj0HUPRKkVC2ePYl5bufxR2sN6NZoRqtICeDZY651Yo6IvSasYq/e5M7
	 ANGyJfDkRiGMApo9VfGg6OOyNfojbu06tMsB0q6B1cUJlWN8Ub2NKabuXPgRv2c3ga
	 AYq8+JewqBnT9JkTAWaI0wvzZGwDqAf36KNNE0hgpthO/SN0uSfXGpsGx+X4zgYdWH
	 JIXlJmD21RpoQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DF6C17E0908;
	Mon, 19 Oct 2026 12:40:42 +0200 (CEST)
Message-ID: <1c2c222f-53fa-496c-a8ba-9717beb6dcf3@collabora.com>
Date: Mon, 19 Oct 2026 13:40:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/rockchip: dw_hdmi_qp: Advertise BT.709 and
 BT.2020 colorimetries
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018123037.19560-1-jan.claussen10@web.de>
 <20261018123037.19560-7-jan.claussen10@web.de>
 <039f91a1-7944-4092-9f9c-29b60e8fb17a@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <039f91a1-7944-4092-9f9c-29b60e8fb17a@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_034047_547178_040F6DF6 
X-CRM114-Status: GOOD (  10.95  )
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

On 10/19/26 6:19 AM, Chaoyi Chen wrote:
> Hi Jan,
> 
> On 10/18/2026 8:30 PM, Jan Claußen wrote:
>> Expose BT.2020 RGB and YCC colorimetry so userspace can enable HDR
>> output. Also explicitly expose BT.709 YCC as it is listed in the
>> Rockchip RK3588 TRM V1.0-Part2 20220309 data sheet.
>>
>> Tested on a Radxa Rock 5B (RK3588) with an LG OLED55B87LC in KDE
>> Plasma 6.7.5: enabling HDR switches the colorspace to BT.2020, and
>> disabling it restores the default.
>>
>> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
>> ---
>>
>> Not sure if BT.709 needs to be explicitly exposed here, but it is mentioned in the data sheet.
>> Might be covered by DRM_MODE_COLORIMETRY_DEFAULT though.
> 
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Hi Cristian, may be you would be interested in this series?

Hi Chaoyi, I already planned to check this out soon. Please note there's a newer
revision of the series, so I think it's best to move further discussions there.

Regards,
Cristian

