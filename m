Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF62CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J58LymEyd0eWh2BlEICOgBmMyqoMmGyghTiG80Pa5/o=; b=qEbabjdOgA7Aq5j1KXSkkZxpnE
	RNJwUl0lIys6MDpqmsi8DK6mXhCcEo7RBJyCrc32tppybNygYvCYDJdyQFE8nazRaZlUevkrOlNvf
	Dx7BuyasuuTFW0TDM+kcg6l7PZpj2JjfF4K/gIZfJk8N4ehlnjmb7hpjcJVAOQmo45m3RiHfhsn+Y
	FMCNodQAbnqh92FmHDOqZ01Fqvur/+SBt9dKcRWS35f/ESvMkQ1qHJ3sa5fbcLV9t7Tpr1f4vYMa+
	eCJhtUt9RQ484QoeR78W7w/Tx8zB9nrEUt8BFv5DEaGLeNXi/Co4XYNCVLkA0B1WYhAPinT2Ds1H0
	VUzmDjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7Be-0000000ChhW-0trz;
	Sun, 26 Oct 2025 20:17:58 +0000
Received: from mail-il1-x164.google.com ([2607:f8b0:4864:20::164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7Bb-0000000ChgP-1VKH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 20:17:56 +0000
Received: by mail-il1-x164.google.com with SMTP id e9e14a558f8ab-430da72d67bso24575575ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761509874; x=1762114674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J58LymEyd0eWh2BlEICOgBmMyqoMmGyghTiG80Pa5/o=;
        b=Ly9vXOzgwlXerG+fB8hWUisW9yeFuEBEyjKt99iQjUY9f+2cR+sXYH2PAuH6amP16R
         cV/27nTkJ4eRNlQ9ZqOROfhnQtdvwDfrPb9wXlsQBP9hjgEBj3GY3yJHa3mvOplpXEl4
         zRIIGo2GL9hIds9xXNFdKPh7Rc969PKwkiLN34ViI5V5PPZyb/xGie6tqoaM0VamAh7R
         MUNzuLNawwaF3WqfZZrS2OByqgGHEW7ciISlZM4ruhb1R0J66ZVMZzEw9KljDN4Xe/aH
         LcVOIunhSJqx+Mxu0AY11vbmXkdd7GPnOw1IjuH2spmdRRNLH1+VLyEcvM6QsrlReoS+
         tmCw==
X-Forwarded-Encrypted: i=1; AJvYcCUHDPtv13p32A1pEa/pBFRrfx9OGpSt0r8sT/1pJAsRO0fv4UicloExfpcz4mENqZr3G+snkoKc6S/U+U9ny1u0@lists.infradead.org
X-Gm-Message-State: AOJu0YwpNOONm3Gw6+nLGhYcv/RaS3g98Hq2cFjJKF4yOLzjZL0x5/s3
	ApLXo0337ZFM3VBG61+s7fnRvnepBh+friUnQIU3M7sWZOHBUWHkZArrCQDQ4xnOAAR8Ra5jea6
	osqWBn4IAIv68aV2zIJenCstZUHNu8cYTMtbIO/Xm5tVDxb9BLrPYQFeQJCN5sDJo3rrzOAmRPe
	BfFBde0GBf5LDEfB+kaQDgs4F8gb+9DLANuXt2POHtt9N8Rb0BgcA+/qC2k7b3efQSAQwo4hYwu
	9oiva7Ys4jJYPajwvIXJ77fv41+RJ3ekUc=
X-Gm-Gg: ASbGncvfr39xcuYyAr0zFbMmDthWZpkeYa03G/KjeTKuWzKTBMf76JiQTNeeEteeAkG
	YdInlCqgjldDgxNs9Uoe2BJNZ3kjZwkl0y0muy8mUTQtWvFzLGOPQz5i5vtslDNCkZ/jJXFTBUe
	JCNyZp9tpwfFt6C9facoddo4HpeefEHRMuEQPaqiNg6CHG7sdfz8fnN0A8xiWzyyRJegupJY7oS
	lAAv9NaW/sYDAWROgU+t/qlVaFtVGQbhlce3HCLkAq079ApoCGZfjZHjeNj+DUjUGlxQIrzgAVJ
	nPtTQvdxPGlOsALsVu3UnAtP+6pBtaHWfrJUFrtvVEe15Y6p5vR3j4c9mWgYEvl15ajIDbu87u3
	PnPkmpUS56gCKt71CvrU8lDVyLsNVe6TswZIqWNTSs4rM1LTiymRBIdlqSFb0EOd+8TJf5Y00HK
	8S/hppOZR7A7ySH0ngHyYGBPznqa4v24joCYtUqLE=
X-Google-Smtp-Source: AGHT+IGq3iE+xZzUsjH1aPlGoSbR3djBNH/nlkj5inVrb7b/HhJD9ZKRWb2WQfwnpQuET4d9I+3LU/yyL9KY
X-Received: by 2002:a05:6e02:2502:b0:431:d678:fcb with SMTP id e9e14a558f8ab-431eb668375mr137349965ab.9.1761509874306;
        Sun, 26 Oct 2025 13:17:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-5aea9e32c85sm405350173.29.2025.10.26.13.17.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:17:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33826e101ecso5300955a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761509872; x=1762114672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J58LymEyd0eWh2BlEICOgBmMyqoMmGyghTiG80Pa5/o=;
        b=HUamXO6YEEXRRmHIq0bjrjWaSfQUQTrc4lCvlnHfxSNtr9jlLLRqk7SQPxh7oSPfT6
         kpphyJFx3BDkrr5frhU96o5CaOstRpoFEF05mikzW2p0iPWgWER581fpWDHLMh7qBGpd
         AyrpJtl0wcfml+ah/Z86+R9Dwu2wfR6lX/q+0=
X-Forwarded-Encrypted: i=1; AJvYcCU3hSuHGLCG+fVZFrhv4PzOzghi3KX8mNA6NFM4TvJ/mkbLn8VqhWknLkjSbVtv5SrRayO16bZltSdjXnlAo/Kx@lists.infradead.org
X-Received: by 2002:a17:90b:5490:b0:32d:e309:8d76 with SMTP id 98e67ed59e1d1-33fd3bbda7amr10674466a91.10.1761509872518;
        Sun, 26 Oct 2025 13:17:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:32d:e309:8d76 with SMTP id 98e67ed59e1d1-33fd3bbda7amr10674445a91.10.1761509872119;
        Sun, 26 Oct 2025 13:17:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81b40fsm5946267a91.16.2025.10.26.13.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:17:50 -0700 (PDT)
Message-ID: <8f2edb24-e5fa-4ef2-ac8d-609ceb454c33@broadcom.com>
Date: Sun, 26 Oct 2025 13:17:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250917063233.1270-1-svarbanov@suse.de>
 <20250917063233.1270-3-svarbanov@suse.de>
Content-Language: en-US
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
In-Reply-To: <20250917063233.1270-3-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_131755_405954_402BAAE0 
X-CRM114-Status: UNSURE (   7.66  )
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



On 9/16/2025 11:32 PM, Stanimir Varbanov wrote:
> Add bcm2712-pm compatible and update the bindings to satisfy it's
> requirements. The PM hardware block inside bcm2712 lacks the "asb"
> and "rpivid_asb" register ranges and also does not has clocks, update
> the bindings accordingly.

s/does not has/does not have/

With Conor's feedback addressed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


