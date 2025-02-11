Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDF9C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mifodZnx+GAT8j3y7LTSrIDDb3fyeuMJi7Lz1TWQoWg=; b=Xjuu+7aKxmWrkwvfnXEHyz3A4j
	PrFy4o2iwf0BtQQmEPs2uheCOpcG/94dlQ4hmhEDLJeHTWRGs5W+bnt3qy+PnqyCMyZIzOlhREnCR
	PYGe9ioajC3QzO1uGctA5kdcLLXb2vVynMTHAu7X+I4S4+89AHCKMZMcCwrjmilftm6yPGpAoqsH6
	f30Ry6gEFGCiX8UUqAvrED+VoeiJ4CDy3mENKt4WF53kaJ2PuSH82yGTv5wd0apwJABM0WeY8lh+7
	NZ6dKEFYZA/Mvd4MCUz8o2DAeKhcbks8iwwVE2IYCf5JZcACVKHc5yjySPWKoMTqoxRQqnPHVTyfJ
	4j3SAvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrub-00000004F5B-1Wog;
	Tue, 11 Feb 2025 15:10:57 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqk3-000000041fd-1mdv;
	Tue, 11 Feb 2025 13:56:01 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739282154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mifodZnx+GAT8j3y7LTSrIDDb3fyeuMJi7Lz1TWQoWg=;
	b=NM7NzNok5uOfeVIliUUYXIjdfRtVgvDGaH9gru/W/Z2DSizT9jGyeohS7f/+9/x41Hh+UO
	AasxnZ7X27daRD2cLPsFWyH4C5MfdLr8955ZuZ32LOOHz+IybYOnKka8tHUOM4TSGUSqox
	U2Ypmvd8oWnSgL1tSLduD7ltV9sqTxa4xPID6osBCAwssPuMKt9QuFvJjtvRDkZj5rxb5J
	XTTqUZjNlZylDn+t9EcfUVemavXzxOS1BWBM/NTKgJpYSZIFuUvaAkQn4Ydxw9BzRv2Tlj
	tVlJ0mhoiALwBGSmZXcVVfsWwXNaDVsaImIoxOLJwBqjxCnFqlapMEjkR+mZ+g==
Date: Tue, 11 Feb 2025 14:55:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Jagan Teki <jagan@edgeble.ai>, Quentin Schulz <foss+kernel@0leil.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Niklas
 Cassel <cassel@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
In-Reply-To: <06f1f9f4-8a79-4505-98b8-992accf1fb87@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
 <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
 <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
 <74502f5556584ee7378c63d4971f2a66@manjaro.org>
 <06f1f9f4-8a79-4505-98b8-992accf1fb87@cherry.de>
Message-ID: <a9a023233f9a096cc215203bb6ef41d7@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_055559_773400_10DE6892 
X-CRM114-Status: GOOD (  13.46  )
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

On 2025-02-11 13:59, Quentin Schulz wrote:
> On 2/10/25 7:29 PM, Dragan Simic wrote:
>> On 2025-02-10 18:57, Quentin Schulz wrote:
>>> On 2/10/25 3:11 PM, Jagan Teki wrote:
>>>> On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> 
>>>> wrote:
>>>>> 
>>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> 
>>>>> The Edgeble NCM6A can have WiFi modules connected and this is 
>>>>> handled
>>>>> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add 
>>>>> Edgeble
>>>>> NCM6A WiFi6 Overlay")).
>>>>> 
>>>>> In order to make sure the overlay is still valid in the future, 
>>>>> let's
>>>>> add a validation test by applying the overlay on top of the main 
>>>>> base
>>>>> at build time.
>>>>> 
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> ---
>>>>>   arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>> 
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/ 
>>>>> boot/dts/rockchip/Makefile
>>>>> index 
>>>>> 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 
>>>>> 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>>>> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568- 
>>>>> wolfvision-pf5-vz-2-uhd.dtb
>>>>>   rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb 
>>>>> \
>>>>>          rk3568-wolfvision-pf5-display-vz.dtbo \
>>>>>          rk3568-wolfvision-pf5-io-expander.dtbo
>>>>> +
>>>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>>>>> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>>>>> +       rk3588-edgeble-neu6a-wifi.dtbo
>>>> 
>>>> Please add neu6b-io as well, wifi dtbo is similar for it as well.
>>> 
>>> Similar or identical :)?
>>> 
>>> Should the overlay be renamed if it applies to neu6b AND neu6a 
>>> instead
>>> of implying it's only for neu6a based on the name of the overlay?
>> 
>> I'm afraid it's a bit too late for renaming the .dtso file. :/
> 
> How is it too late? Is there some rule somewhere about renaming I 
> missed?

The way I see it, names of the .dts and .dtso files become part of
the "extended ABI", so to speak, once they've been accepted upstream
for a while, because renaming them may break boot configurations.

