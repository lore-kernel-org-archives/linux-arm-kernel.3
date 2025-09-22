Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8406CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Czn2vrlolGeYQImejpAr7KFt5Sj149E/ZMwKdYUmdVs=; b=3lp6Mw3j+mLm6tCq2TyXHRPvn6
	Qz+IWPMMsfbN9bsKPb1jo+FC4gnsEaWlicR/GytDjlQbhVHp1tGiC2dwfwLSKp/SuxyNk0Nb2qY87
	M2bQxHnis0jEGUzWebQTTjp7sbQwePt/wlcYDgY2YcXKF64z4B7Cnff9yja7mrNpD/Twtg/oJob8G
	Ndr2/HSFRzpXp95E+U40qb/23cVSLqe3jhCFiV23mP7RtR8zYHOt4OS6chuCpwtsPIt4w5Z8xC4f/
	arEhgzcaNMeANH6Gj9cwpet/yZ2jDVOrmM81ARcsEEEXPwXT7oS79vgto8XpC/N1VIMQhfVXehS/K
	vlUCCYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k0E-0000000B3q9-3Mg3;
	Mon, 22 Sep 2025 17:07:02 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k0B-0000000B3nH-3hdu;
	Mon, 22 Sep 2025 17:07:01 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1758560815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Czn2vrlolGeYQImejpAr7KFt5Sj149E/ZMwKdYUmdVs=;
	b=ojmwYfqUYRslwx9vrc6Vkc9cUh/s/av1mcLNGO7ucF+zTT6OESF9DAe4ez6x51V0FNbB8g
	rb6oZyjIhxCHPiwYlPVGDXkkGQepwQkUvB97umvVL6TEstsXVV8fzAy1Ort9Kw66MF8gsS
	PGua7faiaSFvowWcas8HN9eRAZKd96TpBXV+qyzcJ7N8ovITJESRy7PFG4q4i5y5TiGhJa
	13W4iqoAwtNTah8wRhtOGhUUgBlraXiOKiF9rQPECYD64Zk8WzpIpnLQ1+LmS2Jm4eCUMq
	4p4IMsgCeGHzGV0WUcRSVv2ObP7f+VG8rpXqhAq7wPTkRqAx9cE5dtPMONmhnQ==
Date: Mon, 22 Sep 2025 19:06:55 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Ondrej
 Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
In-Reply-To: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
Message-ID: <53eabe34a310ea9c74315fa09a604e4a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_100700_282060_37401B63 
X-CRM114-Status: GOOD (  13.37  )
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

Hello Rudraksha,

On 2025-09-21 23:05, Rudraksha Gupta via B4 Relay wrote:
> Throughout the years, many have contributed to the Pinephone Pro (ppp)
> development. Unfortunately, these patches are scattered around various
> repositories in different states.

Thanks for submitting these patches.  However, please expand the patch
descriptions, because their current forms are too terse and, as such,
simply not acceptable.  This applies to all patches in this series.

I'm also under impression that you're submitting these patches upstream
blindly and without researching the rules that apply well enough, which
may not be the best possible approach.

Finally, please refrain yourself from sending multiple versions of the
same patch series in the same day.  Doing so makes reviewing the patches
unnecessarily hard.

> I will be attempting to upstream these patches. I will start off with 
> the
> following small series:
> - Add light/proximity sensor support
>   - 
> https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
> - Add accelerometer sensor support
>   - 
> https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
> - Add magnetometer sensor support
>   - 
> https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
> - Add mount-matrix for magnetometer
>   - 
> https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
> - Fix voltage threshold for volume down key
>   - 
> https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
> Changes in v3:
> - change magnetometer mount matrix
> - update volume button threshold
> - Link to v2:
> https://lore.kernel.org/r/20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com
> 
> Changes in v2:
> - remove usb-typec node in dts from light/proximity sensor patch
> - Link to v1:
> https://lore.kernel.org/r/20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com
> 
> ---
> Leonardo G. Trombetta (1):
>       arm64: dts: rk3399-pinephone-pro: Add mount-matrix for 
> magnetometer
> 
> Ondrej Jirman (4):
>       arm64: dts: rk3399-pinephone-pro: Add light/proximity sensor 
> support
>       arm64: dts: rk3399-pinephone-pro: Add accelerometer sensor 
> support
>       arm64: dts: rk3399-pinephone-pro: Add magnetometer sensor support
>       arm64: dts: rk3399-pinephone-pro: Fix voltage threshold for 
> volume keys
> 
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 42 
> ++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)

