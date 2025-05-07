Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C357C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 06:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bMEqoVOsJr7MfvJQhzu+XLSD8SzCSYsJRMGf5xDRNo=; b=jeOZ/ZghxKba2S9LWPGROEZRvE
	3l9glI8JW912P1to84B6/XUCT/cwi5zziKu2F8MOT5V9aioVMzoR5h/wt74TSYZYsbJ8RwqUqSAny
	SFNhoXzKNXvBWdUMixgl6uXcd4tjVpms/QLTlgUmZGnImjKxjjqYKkxU6Ij6W2VtSJaB88kCtPo+c
	ydDT835zGvVinNWj+x4gAZOuXjf8ftrHyDkAw200IofvOHOULMNLK6bUX0NTq99IrUdcKLZn0YrTg
	X2TYXWjHAqyFsvX5OMPrjrLczh0JvwDmKX34k8fDaQKPE/IRuSwvhMdYRxYTf2FJ1Xq2MNu4Ek+2F
	XW8i2KRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCY7m-0000000ELpp-0OF3;
	Wed, 07 May 2025 06:19:22 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCY5o-0000000ELft-1drj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0bMEqoVOsJr7MfvJQhzu+XLSD8SzCSYsJRMGf5xDRNo=; b=mvZTWjDo2RgXLgOQ5CFc26+qwK
	mfqVkQk/4nw6UTLssKNjXNy1L3bb1TU9xmZyLpWXoJBLRRZtfHltA/oMIcM3Bvoi+EUkzpbpxT3px
	0lbNPD8cr+fNwKL+4+NS/1WAsc+fVnbi0iRIybla7HYGCTIrrzk3xo1XMR4AQFI/HotKeGNndns9z
	5j4+fpKbRNv2ZyQWJsMR2ybD9Swrqipb9iwyCW+hjTnMV1JTndvjnHcRJC+EAYd2o2qcwc7Lx5AHx
	05dShjQN2U7DHo109hDfSnhc5lkVVJh6B662Cnxj+B1V5h3PaRcF5VTRvTIwcFifJrRwarYFMSPVR
	a7Leiv0g==;
Received: from [89.212.21.243] (port=59440 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uCY5j-001nkt-2Z;
	Wed, 07 May 2025 08:17:15 +0200
Message-ID: <4b8d4232-0e7f-4dc6-a76e-705bdc952db7@norik.com>
Date: Wed, 7 May 2025 08:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH 4/4] arm64: dts: ti: k3-am62a7-*: Specify
 Temperature Grade
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robertcnelson@gmail.com,
 francesco.dolcini@toradex.com
Cc: upstream@lists.phytec.de
References: <20250507050847.912756-1-d.schultz@phytec.de>
 <20250507050847.912756-4-d.schultz@phytec.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250507050847.912756-4-d.schultz@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_231720_900833_4715E233 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Hi Daniel,

On 7. 05. 25 07:08, Daniel Schultz wrote:
> Specify the temperature grade in the base device tree to ensure
> correct trip points are applied for each board.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts | 1 +
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts
> index 77e5fef618ba..7d2e4694ed8e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts
> @@ -10,6 +10,7 @@
>  #include "k3-am62a7.dtsi"
>  #include "k3-am62a-phycore-som.dtsi"
>  #include "k3-am62x-phyboard-lyra.dtsi"
> +#include "k3-am62a-thermal-industrial.dtsi"
>  
>  / {
>  	compatible = "phytec,am62a7-phyboard-lyra-rdk",
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 1c9d95696c83..125e812fbb86 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/net/ti-dp83867.h>
>  #include "k3-am62a7.dtsi"
> +#include "k3-am62a-thermal-automative.dtsi"

You have a typo here... should be *automotive*.

BR,
Primoz

>  
>  / {
>  	compatible = "ti,am62a7-sk", "ti,am62a7";

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

