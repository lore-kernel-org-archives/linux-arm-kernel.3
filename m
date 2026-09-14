Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA7CC88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxs7CW/umC+9+eoq20Tn39ltfqLOc3ED03x/dPGj1Jo=; b=U2EoBhWV45kCD+xm6w8zROElju
	Pb50ZxnjQttEA8fttmEEJJgt9mLEIeLyhRRL7C96Xhp/9KoNKa4U/uJp6JxqqXAIjWSKH8egmbhBl
	ta4G1Px6fafI7AESwPMTfkhbw6hHGz2IOSxcyIPQzdSqqv/dd58594WiaXl+0l1wOJoz7A0YBSqE6
	dlYXQRYmzDwpIUtG60lNQaEVjR/FSZhUCZOdTI8TUx6edEIVIc6dlQWSByuV+QfjXO9rfRpapoSjz
	xS2vTgWBDW/YKjL0mMDcfNdUp2P3ylR1QqfzT6byKWO4XXCgQfCb9Ed7pPTOYzDfFkczrtt5J5JjP
	iKa1VApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62l4-00000002sed-3in4;
	Mon, 14 Sep 2026 09:13:50 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62l1-00000002sd7-2fv9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789377225;
 bh=wxs7CW/umC+9+eoq20Tn39ltfqLOc3ED03x/dPGj1Jo=;
 b=t9Rxma3BL5r5zWM671e/UmkLCwe60TeH6/NGaGibAOjjxtYO5syKWtIEZReNQDeFKgcapm+t1
 JVry6UchmDOVz852izKF0dlMa7+cvjGzhhI+1wuE6/nzNtAblTqVkf+kPg1QAup5cdqIu518G7c
 Ot1Ixtit1Ydb7IDM3tSBEuLBw+WOffpzElbxMxm3DU18AoqjZHfFN2fiSsvTtw+z8rejx1XonHD
 cdj7NF6XOx+ga4IRHz8fymjrBp00Z5LLSneeCyVqv3gifz1ohu8Ld+iCsjxVq4yJ+huxqW/UkQ8
 48CRb/ZrCImmG81yadGWUUB2vr9md98Q1o0vJsbB6UHA==
X-Forward-Email-ID: 6aa7bac38051bf6db6060bc8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5016be61-1a65-4fd6-850a-96fb0ab17d28@kwiboo.se>
Date: Mon, 14 Sep 2026 11:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: rockchip: Add FriendlyElec
 NanoPi R28S
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>,
 Andrey Korshunov <razor1702@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
 <20260914-r28s-upstream-v5-1-7409c498e8dc@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v5-1-7409c498e8dc@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_021348_059683_2ED3D7AF 
X-CRM114-Status: GOOD (  12.67  )
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

Hi,

On 9/14/2026 10:24 AM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 81744fbee9..709e2cc44d 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -347,6 +347,11 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
>  
> +      - description: FriendlyElec NanoPi R28S
> +        items:
> +          - const: friendlyarm,nanopi-r28s

Maybe instead add this board as a variant under existing NanoPi Zero2,
seeing how it will share a common .dtsi-file with Zero2, and also with
the NEO3 Plus once this series lands.

      - description: FriendlyElec NanoPi R28S/Zero2
        items:
          - enum:
              - friendlyarm,nanopi-r28s
              - friendlyarm,nanopi-zero2
          - const: rockchip,rk3528

Regards,
Jonas

> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
> 


