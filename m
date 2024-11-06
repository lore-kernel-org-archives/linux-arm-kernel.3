Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D4CD44D53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MHWiUN+hvZJqLkzW7YR9dn2TMo/r1ycB79pCW3nHhQ=; b=e3GI3gedb8+NCa/Tn/V+Yt6v9k
	W1hS26XbpumYKhUOCHf/NQDy1Mkhr1fh2W5h8Mxh50mWiUnMioT8Z4Kq9Iak7TieLncaDJY+3IRrP
	UPCJDvRFWdkvXD1YrqQZVAtZRK1uR+xVs6SQqwgXV3AcxwlzQrpfy0ezS2+kClOOmD9FrcZTtb6tp
	tJV2Qyn4kK0s6Ri3ESWZiKKu1p16OZTJxSlERAJeu9kfeUXPUSE/6ZcQwnRyFrA3Q0vAUoJllEUr0
	KJtUpLTVL9J+tcTe3YSEIwWKcqF8S8OdItREN9jI2aP1VSEmMViwo1+Se8kQk1dHVpDyYmcpUnJlE
	0e23nwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eKb-00000002wRR-0H2Y;
	Wed, 06 Nov 2024 11:36:13 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dRG-00000002lr7-0WAc;
	Wed, 06 Nov 2024 10:39:03 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730889539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MHWiUN+hvZJqLkzW7YR9dn2TMo/r1ycB79pCW3nHhQ=;
	b=ZpaYPOovhJrW7WRmAad0cBiYuAVwYFCfh7Q+1vQRonZIIGdRHJET+NX/BoOiOBaCj1Z3Rj
	iIEk7q+V4CPqnbfxZP355dNGim7xBFY3bbgUJlX3Uro/RcGR2gdsBndLqiaWNVnFkUTirY
	Ja8gHV7nRVlwWXiBXdlgtTxGcwoM9bAJy7a6Ws35djO1VmKy76lvZWGBN45IPopWfRkJiL
	nbtu1nwj8sESAT+d2YGrSG19B1Th395mGvi2ppD2YbaozIKgbVGCGBKSd1+QuaSrVVAN2e
	EEV+P3Ifhooi65+YC2r/5TTO/K2wgH3vAi6bf1TLGIjdR55QVfGdtVRanNFutw==
Date: Wed, 06 Nov 2024 11:38:59 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alchark@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add OPP voltage ranges to RK3399
 OP1 SoC dtsi
In-Reply-To: <f6bb3387-4396-45d4-9cb4-594d58095510@cherry.de>
References: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
 <f6bb3387-4396-45d4-9cb4-594d58095510@cherry.de>
Message-ID: <afbc922d80e2c122bd412782ee882ec1@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_023902_369740_4B6D7256 
X-CRM114-Status: GOOD (  17.02  )
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

Hello Quentin,

On 2024-11-06 10:32, Quentin Schulz wrote:
> On 11/6/24 9:33 AM, Dragan Simic wrote:
>> Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in 
>> the
>> SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This 
>> may be
>> useful if there are any OP1-based boards whose associated voltage 
>> regulators
>> are unable to deliver the exact voltages; otherwise, it causes no 
>> functional
>> changes to the resulting OPP voltages at runtime.
>> 
>> These changes cannot cause stability issues or any kind of damage, 
>> because
>> it's perfectly safe to use the highest voltage from an OPP group for 
>> each OPP
>> in the same group.  The only possible negative effect of using higher 
>> voltages
>> is wasted energy in form of some additionally generated heat.
>> 
>> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Well, I merely highlighted that the voltage was different on OP1
> compared to RK3399 for the 600MHz OPP :)

I just wanted to somehow acknowledge that you made me work on
this patch, so to speak. :)

> So... If there's ONE SoC I'm pretty sure is working as expected it's
> the OP1 fitted on the Gru Chromebooks with the ChromiumOS kernel fork
> (though yes, I believe all Gru CB are EoL since August 2023). In the
> 6.1 kernel fork, there's also no range:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-6.1/arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi
> 
> So not sure we need to handle theoretical cases here. Will let
> maintainers decide on that one. FWIW, there are two other OP1 devices,
> the RockPi4A+ and RockPi4B+ which do not change the OPP either.

The thing is that adding the voltage ranges won't change anything
for the devices whose voltage regulators are capable of providing
the exact OPP voltages.  They'll still be set to the exact values
as before these changes, so there's no worry about breaking anything,
while we make the things a bit more consistent this way.

I also plan to implement and upstream the DT for TinkerBoard 2S,
which is based on the OP1, and its voltage regulator setup may
actually need these voltage ranges.

