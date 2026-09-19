Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3963C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGrl5lrYdWqS+T79tPrrdFjy8nze0T9cQfR/nAnT4sY=; b=CRHifBz5K8nh/f/L7GMh+pkknM
	UlzAUw/9gdcp/vV6zPHlAwmxyv3IVzKtQ28IQPL2l5Nxdk3//GIin8KJurbaxGJfgyD+go1ygJ3ow
	hzrs4YUyOMV3nndnrQzt3xtXicDjfAffkl4PNRy54OI4snT0okq5d5VhDrdgLcifgbEL+nbTbJKBW
	KcrW8B7Zs8vlOEqoodBfspytRyYjdjaoYQ3gponbiFjo9SHVzJhKHU/H0JsHuFt4+8f9AdBtJ7LEr
	+B5o9l/nFM9gHXwQN2BSGz1wB0BffDFGzj97baoPwJwJryCsDBa1XSGYAXOGlI4zovSJoAMqStITA
	S28Sfsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rWh-0000000G8gP-0BgV;
	Sat, 19 Sep 2026 09:38:31 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rWd-0000000G8fk-3XY2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 09:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789810706;
 bh=zGrl5lrYdWqS+T79tPrrdFjy8nze0T9cQfR/nAnT4sY=;
 b=LIu3BCd7lc42hKrfosMKpUhXopp7oheBnx2IRIuj80kKwzHIZNDNzTsxEuca823hOxl+gUHX+
 D+SMjpaAa2dlyUZlLg7UNswfFsvw4798/PHjiUtVWK7UIca8YyJhhPBCplvBlcKQhYOiHyU/Q6Y
 2/7kb7rJ09FMbdZuYlxDdQUz7mopd1/lm3PKrDD3Ns8h9wsMPthztT+HPrqNX2kWhTL55xnUX5K
 wtZFZYen9UwE+iqUhpib9vKtj2GKHV5on1ohD45LdyWQ7O5l+HaRYWREZ83TNNKPLLJHYIncII2
 27BFVNZDmqkdPCq17bU5SSDunZ7AmHXg1MF/0+hbKnpA==
X-Forward-Email-ID: 6aae5808a917c0722b3828d9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a558ca88-6981-428c-943d-6fd904d8ef2b@kwiboo.se>
Date: Sat, 19 Sep 2026 11:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: arm: rockchip: Add FriendlyElec
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
References: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
 <20260914-r28s-upstream-v6-1-ea9edd75c126@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v6-1-ea9edd75c126@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_023828_192891_447FD422 
X-CRM114-Status: GOOD (  13.67  )
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

On 9/14/2026 3:35 PM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC. It shares its base devicetree with the NanoPi
> Zero2, so list both boards in a single entry.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 81744fbee9..dc04946db0 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -347,6 +347,13 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
>  
> +      - description: FriendlyElec NanoPi R28S/Zero2

Maybe name this something like 'FriendlyElec NanoPi RK3528 series boards'
to closer match other NanoPi/PC entries? That would also prevents
re-ordering once more when NanoPi NEO3 Plus is added.

Regards,
Jonas

> +        items:
> +          - enum:
> +              - friendlyarm,nanopi-r28s
> +              - friendlyarm,nanopi-zero2
> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
> @@ -388,11 +395,6 @@ properties:
>            - const: friendlyarm,nanopi-r76s
>            - const: rockchip,rk3576
>  
> -      - description: FriendlyElec NanoPi Zero2
> -        items:
> -          - const: friendlyarm,nanopi-zero2
> -          - const: rockchip,rk3528
> -
>        - description: FriendlyElec NanoPC T6 series boards
>          items:
>            - enum:
> 


