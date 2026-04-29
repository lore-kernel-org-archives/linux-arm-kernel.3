Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D666CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=; b=Fu6en0Btn575Z21VhesW11jvjh
	W9dhd/6otHWl6/Z7BJmkdsv2QxTi28q5z8FTIinNKzyOQqgnmJdwMSiEdnlfZRcKMasIJ0e3Gk1od
	grnYBvuft0b1/hVXOHMNHd6EqFwdmKtO6wNxXUX2d4AbKoLq1HFDLllzx/5S507RuCYyeIdwXLkpn
	JCF7XUpsnz326cxwCjL2MuQglaorn/bHok86TO/mKwcJ2YTd3hN/09WC2mZ0jBFEn6mkqeqe79WGd
	hdD4dbuHag6zK8gcazF2mG6nFCljGTilFuyjVXj8103UUUnkJbQRdByQ3KogPftcYl8Ac/SOtD9mG
	shdX1e8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI716-00000003rzd-45Cq;
	Wed, 29 Apr 2026 15:40:00 +0000
Received: from mail-oi1-x262.google.com ([2607:f8b0:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI714-00000003rya-1iQD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:40:00 +0000
Received: by mail-oi1-x262.google.com with SMTP id 5614622812f47-479aa2dbea2so4762715b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477196; x=1778081996;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=;
        b=YhueK4PTC+tgYofl3m0lfg3NLXm84UFlEfmo4W4LbIv049JCFqzYNQF0HVvVIAKXSA
         stNpmaMiz98QZkQJC0KsBpF9KxiMyeXKYr/Kxgo4XpSRhKWZYbd0xH3UZVDiBxlcPRTm
         bpTLcAdW8INA9UErs6MJjxebTmgljMDtQMLKL9cJa/sPeCZ3KKZ3X7MMctm7cKDuUE/w
         tdYu7YSIqRlX7t81ZFGqPiLVZpejQf6JR/WsHtT4KmHkLklQyKJ8ozrh9t+yMWufHvdZ
         2ftGzKmKIuKfTZ/7GJzCZ/F6RUPG5zZBeJQ2NSn3xJym5Aiv0huTNjqw7CnXhOUJRzBC
         YeZg==
X-Forwarded-Encrypted: i=1; AFNElJ/KXfvTSDnnoAl/mDWRR+2sNGZtx78cX5+K0cFw+l2+F9uMELDXQUdazBZYK5/P3jVgQVJ+Qx/th2bp9b+KjaCI@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0JCiPfUZP8Zu2O7mBlh1cMvGUB1lLzjLhdnMAEFbcMl9HZ16
	jEZHMzfm6QKEbAfEcN+SIYMMtPT5enqV5ofS6KjDsb4QKcWHSgsS2IV2OMKzPPAp8RL4Lh8j9lb
	zw/H0fu71GrXvSQ38KBXz1X/AtEsCfpc6kEXYgITlHUdhZXlS9mi0ikLkeEFC3pvNqpXWOypn5+
	GpnLeXw9oEdF2L+d1wCbEyjXRrDnj1FG2qMZAkOfeDTTncFEYtvy1SczwDe+luQAQlHFbEHY+FU
	GmWjl7VobKMXGNcqRDzpAnOD/9ZfJwIWHM=
X-Gm-Gg: AeBDieveIYmX/pcahTB3/zd7VkyZ9iG+l6ow6OXvkBS5Jxyl2V1e+sxOUFMUdc2Nh6H
	VGPuIO7tUgz10gBA2BWxV+DeVSjdEYLsG/1kLi7eLs/M3taDPSw6odkd1ui7cjJx9yk3smpeJm9
	riu8CRU91ym7oLzOI+hgUB6rbk7F5oFGF9Y1jkSsDBLSRvKNhPlzeu0DtkrwiF57ceKsynA0hrM
	1xUVTbu8gI2p2Nc7XL+9RAg0+wRdapzdIM7Fs2Zrgh5YmG7FfrC52YMTA8d4lwLSS2/zDAHg8If
	kyiLhSiVGY9P6OxrLgS22Y4j9wdBBgtzXDegtU15f0bZvOuLE4qxlI7E4HyhLJ120E0YjRYkdBP
	SjtdxG3sKEeX4QyBsaqfXQT+DkXhVjGDJUD0YpMt+d06kRGFB+juweURkEivKyxIa9yeIcXt3KK
	e9704I//GGWbCKPvnl8BwZPVGUXmBWfQN2v+hb87fwpsV9qC81gD2iqEkZ/C36keEblDS1XjHj
X-Received: by 2002:a05:6820:3102:b0:67e:42ca:bf0 with SMTP id 006d021491bc7-6965cb79813mr4267968eaf.39.1777477196307;
        Wed, 29 Apr 2026 08:39:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-21.dlp.protect.broadcom.com. [144.49.247.21])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4340e9cc419sm275527fac.12.2026.04.29.08.39.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:39:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c6fc58aso20677370c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777477194; x=1778081994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=;
        b=bXqZfXKMGfghhOen4CR/n2G5Ti+E3rQaRJqp9UURR9ouF5FMk7yO/N/VUX10+hYyV3
         h/X0i2I4ymdLBwz8No+/KsJV9MPfvFjnmCXCf25qGZ3V0W3kzq9pPhfRa9UxBuABadfj
         1hMO2u8X1WmuoSUcWB2ZkeaTWt5UY1V11/XLQ=
X-Forwarded-Encrypted: i=1; AFNElJ/WN8jLf2r2rfinw09kcV6IMwUuEr/4rj5zprfTDwXH+BXWmuvzPdrAqlrqef6Yw6Qch0/VsfS9Y9oxJL5P/ShM@lists.infradead.org
X-Received: by 2002:a05:7022:eacd:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12ddd9614a5mr3768790c88.15.1777477194006;
        Wed, 29 Apr 2026 08:39:54 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12ddd9614a5mr3768748c88.15.1777477193388;
        Wed, 29 Apr 2026 08:39:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de3216e81sm3765626c88.4.2026.04.29.08.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:39:52 -0700 (PDT)
Message-ID: <25d267b9-7839-413a-ad91-9c6802bcf292@broadcom.com>
Date: Wed, 29 Apr 2026 08:39:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v3 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
References: <20260428201522.903875-1-cristian.marussi@arm.com>
Content-Language: en-US
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
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_083958_516065_78D9FB42 
X-CRM114-Status: GOOD (  23.51  )
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



On 4/28/2026 1:15 PM, Cristian Marussi wrote:
> Hi,
> 
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
> 
> This series aim at solving this in successive steps:
> 
>   - simplify and reduce to the minimum possible the rates data info exposed
>     to the SCMI driver by scmi_clock_info
>   - move away from static fixed allocation of per-clock rates arrays in
>     favour of a completely dynamic runtime allocation: just allocate what
>     is needed based on the effectively discovered
> 
> This is done in patches 2-6.
> 
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
> 
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
> 
> Patch 7-14 implement such optimization instead by:
> 
>   - reworking core SCMI iterators to support bound enumerations
>   - use such new bound iterators to perform the minimum number of queries
>     in order to only retrieve min an max rate
> 
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
> 
> Finally, patch 15 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
> 
> Most notably in this V3 I had:
> 
>   - picked up Geert fixes on V2: these could have been squashed in the
>     original series while maintaining proper Geert's authorship but as of
>     now I have simply picked them up and changed their order to be near the
>     commit they fix
> 
>   - dropped the "Harden Clock protocol initialization" patch that caused a
>     number of out-of-spec vendor FW to break
> 
> Based on v7.1-rc1.
> Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

