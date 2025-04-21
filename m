Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8773C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esv+rDKVix0ldoFrtD4D3MGlv5tCJf22iS0JUE37zVs=; b=wk4H7tcIx0e36g9PT1y+1z5+Uv
	/Dv6ifGuGsOVV9REC3fcmVTCBRyfoPAj2j2tcUOcnwVpARX71+07SXvu/Uz4mG/sTtC4nRi7Jc4BB
	FUp3sRj6U2QiDOAtJFJJcY0LnL/H2By/QZ4xswSAFW/+kpgRvz6SLBUD4qxtXEzyjsUkAfImo5RmS
	OlglpRFGrQ8WtIfzhhicFxrfDuYOoJQCYL/p3azw/Fxt6UCJ1bdNgKJjDB6YYW9GkiCUkHuMSNt1A
	HOoynvWCa0Pamx6UPs7Cn3rMusnSecxSLXdj5j/ej7mmgaGu+bL6nQvHGEJZAItv9uVZXVRj9K27c
	Omsjbpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tzI-00000004fVk-1iJb;
	Mon, 21 Apr 2025 16:27:16 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6txQ-00000004fKG-1jvY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 16:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1745252716;
 bh=esv+rDKVix0ldoFrtD4D3MGlv5tCJf22iS0JUE37zVs=;
 b=wvs6W/baIpTBlgrrPpp53Bgryfr6hO6F4iFbm1veMOh9yeWKCmTQGieeMGA93CzQj/QuXlvE6
 JcjFwf8mgk5Xtt+wOgaQv+wu207cYVwNw5rGcHtqViq+CAmOI+bgqwxLfBSXqmB66E4EKbtGgHr
 3NeLHVto324XHIIQmrhy7NbUdCUrutwpNF5PhuMeqx8Lmi3Z7Li7k6FjWPZELekqlL1RrfMBvnB
 Q4Zs+rHbxRihFJSLJVaQ1dEbhxr9bj9YoQXkx95bNYEXA5cCd5zb60gSERyOZIGmSzBo7nD36v6
 Ci7Tqkw7rgip7M3yqfxWpZ1TwVe8b8w42Zf8193XPdrQ==
X-Forward-Email-ID: 680671678a5cda485177d286
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <18705cc3-ef2c-49f4-b284-bca2308950f9@kwiboo.se>
Date: Mon, 21 Apr 2025 18:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: Add support for rk3562 dwmac
To: Kever Yang <kever.yang@rock-chips.com>, "heiko@sntech.de"
 <heiko@sntech.de>
Cc: "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu
 <joabreu@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Wu <david.wu@rock-chips.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Eric Dumazet
 <edumazet@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250418095114.271562-1-kever.yang@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250418095114.271562-1-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_092520_857992_722991FD 
X-CRM114-Status: GOOD (  14.80  )
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

Hi Kever,

On 2025-04-18 11:51, Kever Yang wrote:
> Add a rockchip,rk3562-gmac compatible for supporting the 2 gmac
> devices on the rk3562.
> rk3562 only has 4 clocks available for gmac module.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> Changes in v3:
> - Collect ack tag
> - rebase to v6.15-rc1
> 
> Changes in v2:
> - Fix schema entry and add clocks minItem change
> 
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 3 +++
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml     | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 0ac7c4b47d6b..a0814e807bd5 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -25,6 +25,7 @@ select:
>            - rockchip,rk3368-gmac
>            - rockchip,rk3399-gmac
>            - rockchip,rk3528-gmac
> +          - rockchip,rk3562-gmac
>            - rockchip,rk3568-gmac
>            - rockchip,rk3576-gmac
>            - rockchip,rk3588-gmac
> @@ -51,6 +52,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3528-gmac
> +              - rockchip,rk3562-gmac
>                - rockchip,rk3568-gmac
>                - rockchip,rk3576-gmac
>                - rockchip,rk3588-gmac
> @@ -149,6 +151,7 @@ allOf:
>              contains:
>                enum:
>                  - rockchip,rk3528-gmac
> +                - rockchip,rk3562-gmac
>      then:
>        properties:
>          clocks:
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 78b3030dc56d..7498bcad895a 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -83,6 +83,7 @@ properties:
>          - rockchip,rk3328-gmac
>          - rockchip,rk3366-gmac
>          - rockchip,rk3368-gmac
> +        - rockchip,rk3562-gmac

This compatible does not need to be added in snps,dwmac.yaml because
snps,dwmac-4.20a is already listed in this file.

Regards,
Jonas

>          - rockchip,rk3576-gmac
>          - rockchip,rk3588-gmac
>          - rockchip,rk3399-gmac


