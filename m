Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314CEEC1113
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=; b=NmnL0f8UI6vZ2bI2Itolw2MtTN
	t/qA5AKGyIkROKPK+UdjqnB7Xb/1M6tFZx68ARXTqGm6ekWKacA/hb48DH3MoUGD0MRY0ciXELeYO
	dS9Pi6O7QM3J2UtBgGfMlDeIDc+CWlT40hRv8SZG2TPgXwPLgM3+z2LBizlR294s8uW9Z8Nb3RsCs
	2xZ+qP+FhA47GHdwIpOfAi4uQD5NE9fqC+WOaDqmRw3KmjAha4NborzD5J5sdWo9VLIJWX2OcvbU7
	KmKz22NUH3q54xWyOvzH23xbuEVJN0QZLcsvOCJrxO5+qETOspuw6otL3ZbmeRLBkRpd89R6/eHdL
	wThSxIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZwX-00000000o16-3X1l;
	Mon, 23 Feb 2026 17:42:01 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZwV-00000000o0h-1hMs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:42:00 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2aae4816912so31951535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868518; x=1772473318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=Fwc1M1ADz56RwPWHseXR98luLGsMl1nK3yJvZ6UwCfG/G4d7IhvsBzq6E8a6J/xs4Y
         gnl8L9HznOWP7HYRCzQdbZZO3zTwZbEz1Kzv+p5ii6EM3DrdPvh68AE1X/aeIO6WkGw9
         mVmUCzdsZeztdeqlg+HjN1TcRl2ORTq6EVfpShdHHzC+C/72GTw2fcAgTWc4SFbZVI/W
         vP0m7Amm8jbSccEb0MwKqfEx0Ww3zGCI1SU0Ml9uTgSjheWtVUouT6BrKxOH/jfz2GkC
         J34aP0TIp9ibFjlYb1pSC0WSmERZaI3lQhPZZjx8BswyHlI/vAXh7RERBNglZWh2nhqV
         R9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVE/XM9rAdJjPECdD/RGD+kBySpQ5a7AAO/mg+ZUGXNusaJ6mGXqKGcEiGhGd/uT65sWLtx9qRSBb6cRoRYspEd@lists.infradead.org
X-Gm-Message-State: AOJu0YxmlAdfm1smOQPjGZJFur4YJhZwp5hQWokh+p8VHAsJ21EUYF1Q
	IE922F85EZJDA7PVv8vL7iruE5TUouKKnNplTJL2lh9ef8oqV2eMtIp2Xa/g6vWIXXv2VT+OIOZ
	gLdIw29PETFLnmlp02kNNywVqs2TOykt5cAgyY7a7jqvorRVwinMj9LMlnLGFnxBktWLKd32iv1
	/XpuLbYQ15lGatBzWSfBuxSYTvb8kWbdPptLVBRIzf70elkCFk5gdEcdUDvGBobGyue96F3YgJ2
	bP97P1kuiet30ZB4q2PRpELNs2aywWrdsc=
X-Gm-Gg: ATEYQzxn3kRNXR+iMn0ap25bKSwQ1x5revml+7li+7xJ5R99oXLUR5q5st8FCzAlA5r
	l2MKpZJSfURUQHRtsAOJGf3r/ntB6vvEQdCyhqdnVsk1Caad8RiUtxQ++boIv4ZVSgbW9oVCUSS
	dvgpV3poBcbn4Njdo98D07iezlkU3iM680/K4aDRnGF+l9xYsZkwsxy3uOGd4FWTC1XNIXnKnZz
	iXFBAICXmkdzvJrK89IEAPNklXf1CqZSiGXPf9ZRkbbi1gLbmeL6T8OhwQe6r+dQimL25H92aT2
	k+A5+GWwRt0vS+M64ax7VZPR3eex+LlBD3+JDtfjeQKAYisKq+kuxAdV1TiJfe69zO1pijGSWF5
	odGoQAiBUOT64obFQz0t+me5+0cVgugNtQDeUl8b7sRbEpCZC3/nnDysBLPq/FbsqPhYaV8wPX0
	7sWhC0jZjHOstvn2VFKDQ+TfOXn5eOIkV21R+tvYYxm+h3Hw+gTwMxZzIJRT44qg==
X-Received: by 2002:a17:902:f68a:b0:2a9:62ce:1c18 with SMTP id d9443c01a7336-2ad74449b3emr85879185ad.14.1771868518342;
        Mon, 23 Feb 2026 09:41:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-95.dlp.protect.broadcom.com. [144.49.247.95])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad74fecf31sm8875095ad.43.2026.02.23.09.41.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:41:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aae0d40a47so410976515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771868515; x=1772473315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=PUxiT5KRVq5dWBwNUzDX///QOLngQwXQzKmeuAju8gS5T6WgP03sdfMcV+rGrnHScb
         Lio3ZEwV2mrXpxSYjwgoe+7nEthsmtbuc+lwaczbTtoHujd7xylMekZnZ/WLGmFXdmE+
         U+vmATJg1x4CcZWBscu6eLKzDVaSmHw4hEMMI=
X-Forwarded-Encrypted: i=1; AJvYcCVo9xScLM843sLJZ842sNMxoarGO+ybks4ms7h4IA5zBWYdIrn8IPXwABc1+PlboVl+T8nQgDE9VWp39CJNI1au@lists.infradead.org
X-Received: by 2002:a05:7300:6144:b0:2ba:8a46:142c with SMTP id 5a478bee46e88-2bd7bcebdebmr4905307eec.25.1771867868545;
        Mon, 23 Feb 2026 09:31:08 -0800 (PST)
X-Received: by 2002:a05:7300:6144:b0:2ba:8a46:142c with SMTP id 5a478bee46e88-2bd7bcebdebmr4905255eec.25.1771867867664;
        Mon, 23 Feb 2026 09:31:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da3eec5sm5168891eec.4.2026.02.23.09.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:31:06 -0800 (PST)
Message-ID: <765a981b-8ceb-40f2-b033-2e6ce529cc6d@broadcom.com>
Date: Mon, 23 Feb 2026 09:31:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
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
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_094159_441465_1CDC78C7 
X-CRM114-Status: UNSURE (   8.04  )
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

On 2/23/26 01:05, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

