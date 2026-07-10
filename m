Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D82C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 23:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQvPeODxU0d6J4vdc1cgw/GKu3KH9eDW6Ridf2PV13Q=; b=Zoai8CqKirOh8dgmKqRvhpBOUP
	ZwNemske41IkCKfmSi5ZhcOPuynSsIM00Qy432YbkHW4wcz7QrvJc+cVgqEXh5ag7E319410Ut3H8
	aG6pCbalXEAoog3j9KA2iVuCpYMjegdFmwGKpl0hguvAzAzzj7J+ru57ijp5xE1wpID78bVDlaUYy
	bfc43drAS+3KLhXEb6z1mUJlH1Glw/Eo4zXG1Rm/9jLeWbmsSjmTADzVNoRrFvOvboeHvjd3KYVLU
	2FHBVtGrXgwwHxUnZd7MiaihV0M+kJ3aXLyJZCOh8CstpUPur2gJ82jeNaH+/mQqUlboPfceN5bMW
	pEaGcWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiKb8-000000060Zt-0lxg;
	Fri, 10 Jul 2026 23:25:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiKb5-000000060ZN-3NHw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 23:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.xyz;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-58e3cb06d0; t=1783725930;
 bh=yQvPeODxU0d6J4vdc1cgw/GKu3KH9eDW6Ridf2PV13Q=;
 b=RRC855HiXneCBQfDsccP+sfB2ECWkGJSxkzbY67IM06rqUH7Xiy1Ac595HsonSMalNs1ASbJp
 XwQguzNU6LADtprbBCnFpCMgWvc/CDnTDDFNTB+JhxqQLqpWvOlbCAdj13L8gKER7bauordQNVG
 DJsLD3QJt9FPpErgSknhcrA=
X-Forward-Email-ID: 6a517f25780742a88792fe6b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.xyz, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
Date: Sat, 11 Jul 2026 01:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: joachim.eastwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.xyz>
In-Reply-To: <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_162531_931383_CDDF7423 
X-CRM114-Status: GOOD (  13.75  )
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

Hi Joachim,

On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> Since the NPU is hooked up on these the always-on isn't needed anymore.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index bcb2f5d63a61..463cfeddf270 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
>  		regulator-max-microvolt = <950000>;
>  		regulator-ramp-delay = <2300>;
>  		regulator-boot-on;

Why is boot-on kept?, NPU is likely not needed until OS has started.

With PD domain-supply the regulator should be enabled automatically, or
is there some other issue that requires boot firmware to enable this
regulator before OS is started?

Regards,
Jonas

> -		regulator-always-on;
>  		vin-supply = <&vcc5v0_sys>;
>  
>  		regulator-state-mem {
> 


