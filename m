Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899AC60A3824
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zFWO4o5E;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YNYzJ86a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=; b=zFWO4o5E2z8Wcx2Z6PcoAMVXaO
	SCo4lg4cxDd9r6JeQzM0JSY93zJ1RmpaM+hCJxo9yCTodvSpqT11yofwqzNSj8y3xiMaHorFU0ioL
	Q6JFmiweJme5gpbOX6Oh/xArG+QyfgBv5KciToxetHf36foTZzkhNukugKrqyVsrTdKDdw+qKAQHt
	qA+QFy5OGHZvUQnywVjs/fYM6WfCURvd90y+jztwKPstrBK86ABTyLwEy4be8fuSvq+mciMMGxtai
	ycIdjkwRCVW7i2I9bcskrEfeVSY9lrsYuuaIiuuLWc391LhrxmybQnzGqDX+sa3Bm1uag9eXaS6Np
	PaYx5O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBx8-0000000A4s3-2LcV;
	Tue, 20 Oct 2026 15:40:38 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBx1-0000000A4qP-2Ae8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:40:37 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2e985106c0cso22869705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510830; x=1793115630;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=MIWE39dAo/ulc8HAK4PbrjUe+I3/r4bHeIaVbLbTUMBwrvk07DM5dCk8co4IeEkC3C
         J/QQj3WgbY516Z66Z2kopnr7S58B+4RKU32bZ/CFMU4MTYTcDSfi9XVovnYO9qL1C/Kd
         yY05GrJwYGcTi47mtdX+y+Xkfyz5z8fAqzTviU2otSJLdt0gZNAYWxVpf+0sBosnlGiH
         jiMMHoYCg4iP1fUHEXPGD2voBSU5rqkIQI5wGRT4Ms6yA00wmqA8X4JYcSceOZalD62+
         7ir6qbEzPaapuVQp4xwLpfnlMB1joXHMtPVTQ+hk8b1A7gR6ou44M/IN4WYbFuRNlmQ3
         YwaA==
X-Forwarded-Encrypted: i=1; AKwUvBzIxVYQld5M73QpX1At4UqBue/SxUIZYlqNptoVlLrMjeBoEmLqyGzXOr4LQ7rQf1qR5f9Pbmn05owl+vvs8+xv@lists.infradead.org
X-Gm-Message-State: AFq9FYIe0nOl02A97aNljUkL/xvmYJxnneWI2H775Q0B7WBlSxk/cAR7
	Nwp/qBp0VCCYoQD5HdTRGvcWqOgf74B5yxcoz7aL2skKzblThxvzU+OXV8bTndhJfVs2+HK3QGr
	EM0hHROE1YOG+q2veib+Uji/y44i60RpBVXH668olunrQsJmlbZtzeFuNQg0iywT7veo5tHr+4+
	cjWr7FEK0MdAvy88+HB29FORvJE4FZLaIMF/OnwR5TcMlOx1Srg1UAJT2C2SkAp+0mSoLUqvCI0
	44LnZlhWmQJmjXqM5fVVUdl/oZmxaNFMto=
X-Gm-Gg: AYBFou3nlTnmQzw0dfkzYmUBowsZ6GBrJ8wik1Nl/D3ObFxg0aM4zPWvCmT3XlZywDa
	5Plw0YdH6otLM5z7sULOiXU6zd5qK/sromwPB4EOoVZXcF8d648c54e3FSV3+gfjsa1DJG/gCeO
	/Xak9mawT6/IgUML3wrX39E4AtA8ACFYy7lVcCCpUPWQC8ekRj247zS5g9gjlyEY00DssqCwxF9
	Lf//wXAOipTJ8AfFtF7Av1ldYrYrw5QDVvVV00N56il79QFHAEQTdSGECQttx8P4Mbm09vHhNSL
	ROBAKh5fQVNZwFZMvchDNOa4QM+StBAtj9fLKjkaefGx/H7zKGarEyMlW0EzQ3LBTOQvEh2Df95
	BTr8sn32/OPv6rOeGPZn8sAHWP+/R6qzOrb19HXKfDdMTNCnxZZBOKFmyvppI4GFDf928hVy85+
	Bf3NNuwNJbJP94F7CfszKKVAcBQlc2icFj96260lxlUG4=
X-Received: by 2002:a17:90b:580f:b0:3ab:2d46:1dd2 with SMTP id 98e67ed59e1d1-3acee728d3emr9444368a91.6.1792510830412;
        Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad80915f58sm18498a91.1.2026.10.20.08.40.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so75623236d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510829; x=1793115629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=YNYzJ86aToAw48Ok7ONeAGUSHimVvK/NytFGYQ37WL8m5xObUsF/L7gk9Qsd68cnUl
         5ruWJjSZUQ+06drJ23OS3hVYFxUMsdWFXHUTX40RwSdSrXVWD7WuWvNf8iBeYRFexT8Z
         iveRyWGVc+1yJJK2AfCysXwNgi7/WNHyR0cGI=
X-Forwarded-Encrypted: i=1; AKwUvBw57GKgupPqGFulnRBHEDRXooYH53Gx46tiz37nm8OPdjPfOiK0eGmPru9NQU0rFgZ5ERnNwzU2wt0k5CfZkJuL@lists.infradead.org
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164536551cf.74.1792510828718;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164535781cf.74.1792510828049;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm81961331cf.14.2026.10.20.08.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:27 -0700 (PDT)
Message-ID: <d31ed7f0-2b4e-46a8-9345-68173710dd0f@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:23 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: bcm2835: register the BCM2711 GISB clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_084031_568672_4D9F56D7 
X-CRM114-Status: GOOD (  18.34  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The generator at CM offset 0x1d8 is not in any documentation I could
> find, but the firmware calls it gisb and runs it at 200 MHz off
> PLLD_PER with a 3.75 divider. GISB is the register bus of the STB
> peripherals, and on BCM2711 the GENET MDIO controller clocks its MDC
> from it. mdio-bcm-unimac wants that rate to work out the MDC period.
> 
> Mark it critical. The firmware enables it at boot and nothing in Linux
> owns it, so it must never be gated.
> 
> Checked on a Raspberry Pi CM4 by moving the divider at runtime, the
> MDIO busy time follows it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

> ---
>   drivers/clk/bcm/clk-bcm2835.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 118df86d717c6..bc1de20c7e00e 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -117,6 +117,8 @@
>   #define CM_EMMCDIV		0x1c4
>   #define CM_EMMC2CTL		0x1d0
>   #define CM_EMMC2DIV		0x1d4
> +#define CM_GISBCTL		0x1d8
> +#define CM_GISBDIV		0x1dc

Yes, those names are correct and accurate here.
-- 
Florian

