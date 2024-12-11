Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9C0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nZewObnpmidSPs24J/C8qQRTp3QXqgI7zisl0ya9zU=; b=Twzpg0IhONdwi8cnfi3GXwA4OJ
	BETgnXt49+IME+l7Re1P7yTSC9EqUx2q8SdzlhTC0UBALBi4UZXJFQfl+EZ7yM4EVac1OjgL/mSLE
	+/kVF5Up2EMzv0Fb+65ejxa39tGU0/5TH77J7bYOeTyBu17I51vEJnZCEEIK9rjP/TiCxPvbOWKIw
	0iAAGaClzsS4S3zW1WSDaeBOhQ6BdKzTwvwSMD/OYpTrl7mmWC34/rG7KkQDh1GHdk2l6tU8QXoQZ
	SiB8i8/L27f3Y2MP9kUUs6NQkCFS7Kp9A0Ikbq9m1JnrAxtgekQcsvjAxk/WtWdKAjJY+rJ9fuBK0
	Wn0Raiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJPY-0000000EUrc-1GRX;
	Wed, 11 Dec 2024 09:53:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJO6-0000000EUZF-2tfV;
	Wed, 11 Dec 2024 09:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733910727;
	bh=KQa0YljSDyn4f2yMLEHD4sXJuIGsikdtCBRivJW4u+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pyixXY4yVLNRRp7l8Dm2uhUoxDDMaLYCUO/5v86h/IyllVT8vjBOMCX7DXuOpUAUV
	 0DiTqMQFUF2iKae6huS8FOqPbSGjvqbXXSYXEpNoF74EpubmiSiAFF0tDOXL+Pzy64
	 hjPHIg8LQgSXNytwthlq5gegWpuD04K6LxjhrAm5xxN8VmSzXc3osGt3F9arUiVWXn
	 TDf7tlcvO/ehpOBt0tcB4n+szHA9ZC8FtmPBe5AbwafWyKSBz1SRmxSnsNfdWnzapp
	 nOqs6NXyz7v9TzFul8L1vc7qt8e+D/vNUXds0ggK1usjzDbbao1yzT1M9wJvU3Ogku
	 lMCUxeCWJYozA==
Received: from [192.168.1.90] (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 228AB17E35EA;
	Wed, 11 Dec 2024 10:52:07 +0100 (CET)
Message-ID: <a0cf9b40-8ac2-4d6a-a26c-bafa85096440@collabora.com>
Date: Wed, 11 Dec 2024 11:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
To: Alexandre ARNOUD <aarnoud@me.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <BC29D61C-317D-4F82-AF42-EA3D705B0632@me.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <BC29D61C-317D-4F82-AF42-EA3D705B0632@me.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_015210_865355_EE18BB65 
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

Hi Alex,

On 12/11/24 11:42 AM, Alexandre ARNOUD wrote:
> Hello Cristian,
> 
>> On 11 Dec 2024, at 12:06 AM, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
>>
>> Changes in v2:
>> - Override hdmi1 pinctrl-0 on rock-5b as it requires hdmim0_tx1_cec
>>  instead of hdmim2_tx1_cec (fixes a pin conflict when enabling
>>  CONFIG_SPI_ROCKCHIP_SFC)
>> - Link to v1: https://lore.kernel.org/r/20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com
>>
>> ---
>> Cristian Ciocaltea (4):
>>      drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
>>      arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
>>      arm64: dts: rockchip: Add HDMI1 node on RK3588
>>      arm64: dts: rockchip: Enable HDMI1 on rock-5b
>>
>> arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi  |  62 ++++++++++++
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts |  44 ++++++++-
>> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c  | 119 +++++++++++++++++++-----
>> 3 files changed, 200 insertions(+), 25 deletions(-)
>> ---
>> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
>> change-id: 20241207-rk3588-hdmi1-704cbb7cd75f
> 
> Tested-by: Alexandre ARNOUD <aarnoud@me.com>
> 
> Works perfectly on Rock-5B, thanks for your work.

Thanks for your quick test report on the series, which helped
identifying the pin conflict issue which I missed initially.

Regards,
Cristian

