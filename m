Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA276CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiQ+cxmVNau4z+karizH0FDcMDsn/Cs3rk+K8ty0T4w=; b=g0ugz+4IUc7A0sJHlJz3H3Ya3/
	GcC0EXLA+PzMDTH/M3rIxrOFHiPrmz4ZUZP/PCEJUOqvxoEaQX2j7KwaHRJps2TeT+2RU2KFDabdD
	+0Zs6wNXEwCyX7U7Cn1/oNE9Cj1qXyyWG7LpmLmabrGeGTKjscWd2CU+dZZKRz1YpzX+rpzk/adZw
	TYnpLX0zH9cgW2iyblnzGZyuA1ZNLqLjVF2mui30ZfvhewQr/5IW0548PA8T6hakRw2KxrJbu3gBf
	ASBMWPBkDSbian0ZYmNrjabMiPrNv2bxTPRuOTs2F+PZ3SdlXXjsw+99/Ja7sAQB32Y5uwRJ7a/8g
	ipfGKOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjNx-00000001SIS-1UIL;
	Mon, 19 Jan 2026 07:09:13 +0000
Received: from mail-m3270.qiye.163.com ([220.197.32.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjNs-00000001SGK-2dem;
	Mon, 19 Jan 2026 07:09:12 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 311f4d8f4;
	Mon, 19 Jan 2026 15:08:57 +0800 (GMT+08:00)
Message-ID: <c4c17773-1146-4db9-bf2f-a7500a8bd734@rock-chips.com>
Date: Mon, 19 Jan 2026 15:08:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, robh@kernel.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: Re: [PATCH v1] ARM: dts: rockchip: rk3036: remove mshc aliases
To: Johan Jonker <jbx6244@gmail.com>
References: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bd515d81509cckunmaf6f77109404f8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9CQlZOSh8ZGkIfGE4fGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VZzSwM/5kKzi1RZ/Zqt2LYEt8GQ3mWzthhHNV+B100czzDfBwEdOpLu3cHiiNHhSXQrIMbHEI5+Olbuj7OSAShZCiLQEZ/DaQTkYYtyGDm0SUsl5JDYdVgJEGr1fwW38iSrAYqT14q2uF7HazulWXXrvd9IoFDWdCX5PFeru7LQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=UiQ+cxmVNau4z+karizH0FDcMDsn/Cs3rk+K8ty0T4w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230909_214273_A52F23C7 
X-CRM114-Status: GOOD (  16.84  )
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

Hi Johan,

在 2026/01/17 星期六 5:05, Johan Jonker 写道:
> The use of mshc aliases is deprecated for some while,
> so remove them from the rk3036.dtsi file.
> 

I noticed that the alias property is still listed in the
documentation[1]. Could you please share where it has been formally
marked as deprecated? I may have missed the update.

[1] Documentation/devicetree/bindings/mmc/mmc-controller.yaml

> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>   arch/arm/boot/dts/rockchip/rk3036.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
> index fca21ebb224b..78afae42f8b2 100644
> --- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
> @@ -23,9 +23,6 @@ aliases {
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;
>   		i2c2 = &i2c2;
> -		mshc0 = &emmc;
> -		mshc1 = &sdmmc;
> -		mshc2 = &sdio;
>   		serial0 = &uart0;
>   		serial1 = &uart1;
>   		serial2 = &uart2;
> --
> 2.39.5
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


