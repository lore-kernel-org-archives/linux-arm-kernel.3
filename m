Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36477E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v38x3oaUTfdLVdY/2vyRO4CYSKBHgk6wUxH58Pw4U+c=; b=HKuuc+78ZVmrfBFHV7IMB27nRz
	fQ2/SlRwkJuloj0kG/stfbhaQxwtDxbyFGRpdouAfkZLplp9BK+rRGsYCeGDdz8/F1gClnEEGFP1m
	GF+NivBk0O0vy0p8TfGlFA8Dx1s1qHo3fjjFtLoJTYT8AC3WZbp4uZtjPCyNnKXYWoLDjHFKcv7sR
	IlGpHYIbOgpyAkmDmKARLqT+kX9Sq1qTaMSUrZVJfU5UG/jaiIAlfWlsRXiP9HrpcdS9fG5cMB99s
	6Y1uA5sJUiDIEF6SWMs62XUVgsa3q/asy0ja0qJhMxEDpqR9reK5ynkfWO9+fmMSdeLotuZOYnrqY
	cgm6Z/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIqS-0000000ENSV-0zH6;
	Wed, 11 Dec 2024 09:17:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIpO-0000000ENFv-1XPo;
	Wed, 11 Dec 2024 09:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733908575;
	bh=Pbr8TFnAH68Uxd3BnYtQuKKBAuRerzWhYOPBr/hv+kI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OGH+62ObJppBdxcPFolFdTnI9ixx/WRUjU6WB3rUcDMneG/sUIK7N55TJ6AkuBQS5
	 tlDAI5hnXQdgtmMlDnP6UJHk1SA5LoyUJCROujtY4S4NNQ/PwYklz8Hgsp/ufsQcer
	 WwqA/gQDa7TzXEGECnjEAG2Toq35f5jZtuqzhlzfqOfk1rnrU9CaAeTBlq4lCk2Ghj
	 AWp2DkhXbKO9yeBWi99t13YGayFkL+qqNhVYGhE7hqSLlqVuNlUx85ex6UuDT3N+WE
	 Cuuur/HxdxyI/MyRtKYQgkNu7iPVq5YNyLWhAQ80DGjVgB5PlgQS+loZpNno/7n8+t
	 WBLnqLjYI8iIA==
Received: from [192.168.1.90] (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21E4A17E35CF;
	Wed, 11 Dec 2024 10:16:15 +0100 (CET)
Message-ID: <43ae0fc5-d775-49d7-80cd-af111ff8fb25@collabora.com>
Date: Wed, 11 Dec 2024 11:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <12942826.iMDcRRXYNz@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <12942826.iMDcRRXYNz@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_011618_561799_D0D34671 
X-CRM114-Status: GOOD (  13.69  )
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

On 12/11/24 10:46 AM, Heiko Stübner wrote:
> Hi Cristian,
> 
> Am Mittwoch, 11. Dezember 2024, 00:06:13 CET schrieb Cristian Ciocaltea:
>> The patches provide the basic support to handle the second HDMI output
>> port found on Rockchip RK3588 SoC.
>>
>> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
>> validate this.
>>
>> ** IMPORTANT **
>>
>> The series has a runtime dependency on "phy: phy-rockchip-samsung-hdptx:
>> Don't use dt aliases to determine phy-id", a patch submitted recently by
>> Heiko [1].  Without applying it, the functionality on both HDMI TX ports
>> will break.
> 
> Looking at the drm/rockchip patch, that should not cause disruptions on
> its own, right?
> 
> Only with the dts-parts enabled would we run into phy-issue.
> (Asking, because things go through different trees and the drm
> part looks ready)

That's right, I should have better explained this - all patches except
the last one (that is actually enabling HDMI1 on a specific board) can
be safely applied.

Thanks,
Cristian

