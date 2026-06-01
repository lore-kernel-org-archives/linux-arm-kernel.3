Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40597CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xV0cBcTIxSbpyYXNCcDDEaCoxrbY0/NjPrBS4j7wZMI=; b=GRTNy9aeztw/KNod2LetLlIuvb
	XlkYHvq9RtMqi5To+aAhAh+hdUsVgsUFzDFQI+I2eNeKw3y/lUWIGdZvVbZgcJDoulegN8tYQPM07
	5aNcTFi8a6YTzkJCKfDG/EJBEZYYcJeiMUT+79takTESclBpSvczikraVEXRH7E1JBuyAaAC8q/Km
	CyPbdiPytVQTBS/5V9/xewELoGXYEOP16uJy20obEA5ZCcMVXFa2aP5VB9T/xpruU5GfUWq1Kje72
	02UJ4po5XEhkGTQs4aRXhPOrdvMfosK9dykytJa6unLYGaXH6DfD9OLPEBetKfFDq3ohSgT5gfgW0
	reTb8oew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAgK-0000000BuG2-3Ksm;
	Mon, 01 Jun 2026 22:00:24 +0000
Received: from mail-oa1-x61.google.com ([2001:4860:4864:20::61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAgH-0000000BuE2-3v2U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:00:23 +0000
Received: by mail-oa1-x61.google.com with SMTP id 586e51a60fabf-43d2c7b5a6aso215456fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 15:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351221; x=1780956021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xV0cBcTIxSbpyYXNCcDDEaCoxrbY0/NjPrBS4j7wZMI=;
        b=mqyZHG660iUtGrR4YMg366oKPxVasVYlr2/IGPvUoIFjN1jSsQYyOJSVjNjAs2RIQ0
         1pDLDkBrirhNhuzzDEN+O8ErE2smohpbKVXE1tPNNjCYSmlz61bUmJBmK/fRKfcTMch8
         glt9H9i1PEnvrEktVYbXhksCT/NGX2/hUXxXDvjEQZpZvsCmU7JGNph4TLLw8PZAX48e
         VaAeNhUnLOtlHBd2/vzwUqtiBbuegA8srjhN8dnOz1mzn1xfb1tY94jPDNxkC6CVEQ/O
         VhXdZPS60Xbkx7/XoBFNX8CUOYbOjgsNzkcnWnL7zqXt3dJSQf8t5YrecPj1JvAqhXQw
         TAbQ==
X-Forwarded-Encrypted: i=1; AFNElJ84fGn3BH7sYxaFR1f3A/H3wd00xq0tpT2uB47bhKQ8H2NLHNOwxHnLBrEVR0LGYeMPVGWiDxiR8qq1b0H6Ti3e@lists.infradead.org
X-Gm-Message-State: AOJu0YzY9/WkK1Tqj/I8TmlA6hASgV1/D6GgLCyV1rBmlEqimaKUqnmU
	4c9a/3AUJVS+A/NZKKX8xq0jfe72sM9UWhbm6kUJ3ynfszNHJ+45ss4DUj6x64h7Ju4mqrats/Y
	0j7g/wHCXYgch/hbtNYGRE8Lw50mUrvKKlC9N4o06EGe4gtZVhEOnGyswRXW4d4qQ5QcOuZU7oH
	J9sxTSpLT0O/cKJ8uqq45B1/1AB+a6A4Ip3cij/GiIlHCs7Mnnv8ngN95jqzABmePH17Jf57Egn
	3t6dTlhBMI9+7H8oKQKjsubXB/paJFpZbc=
X-Gm-Gg: Acq92OGxja8g/Jr5v3J0SolXqUpyQIjw+Gmc6q0tie92UKUy4wODKN9uu2+WP+L5oja
	nPqiHjmpBY/oBOF74vj1C6QpVzPy6296yKJJJnZglWqDFp59xqijqMitsT9/Y2F9F737E/gw7ty
	rbXzdX/vGVDZG1vXeBFsJw8i0LNezTnB2mrgwJESwCqhLRoDFgVur3ZveRIBfw0XMHDxDj3ioef
	j5WNjmqSjfUNEz+CU1BfbbDXNEpk/HC09pCC91yajL3e9R1uJZTUuqQDXkkcpz8XEnPQiVds/ST
	qIwV9AGCnKrOnsVKX7cYp/b7naV5HxK0MHsAcfTkFXl19dbPBZHywIcHsogohGFIFbra7OHL6qS
	2apkW9l0KQxrr1ZsPC+1d85i0Om+P4NQeIhgE3rGcJOcbCaXbgO43hiWMAXWm58FYIKfa5Y3TqN
	IPtSn9xhxbFLqG7Rblm5Hb32qo7o/KSvWJmqwbIg+euIU6UsregXYFGivXPs+wKmqpWjPXRmQ5/
	vo=
X-Received: by 2002:a05:6820:829:b0:694:a17f:759d with SMTP id 006d021491bc7-69e1053d19dmr6470452eaf.28.1780351220665;
        Mon, 01 Jun 2026 15:00:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-43c940a2fe1sm902115fac.14.2026.06.01.15.00.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2026 15:00:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bb9d47fso24129551cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780351220; x=1780956020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xV0cBcTIxSbpyYXNCcDDEaCoxrbY0/NjPrBS4j7wZMI=;
        b=StG27oC/7FRUOxUOYC1DsApOejxI8EwczO/llrqDGA/FFM76nmxrUjQgGteDlvChbO
         r+tCtWN9gMMZMp3896QG6v8wgzm9lkyPYNKL/2m8z2FcrC+FjE1CTKFl3vjT0cm1Jrbv
         cOeUS8Wc1tSaDD9abCGNTwYF1pR2iy+ML4nmE=
X-Forwarded-Encrypted: i=1; AFNElJ/bmtR21Cyoh62lioWE5HYVsYlBTNBizn8TgkqPaMC6mGkqyLRkvGTpmVQxtn9TFB5EKOQmnZ9eAwPSe8IBj1qn@lists.infradead.org
X-Received: by 2002:a05:622a:610c:b0:517:1465:9167 with SMTP id d75a77b69052e-5173a818cd7mr194209881cf.28.1780351219425;
        Mon, 01 Jun 2026 15:00:19 -0700 (PDT)
X-Received: by 2002:a05:622a:610c:b0:517:1465:9167 with SMTP id d75a77b69052e-5173a818cd7mr194208411cf.28.1780351218741;
        Mon, 01 Jun 2026 15:00:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea08d945sm102961666d6.20.2026.06.01.15.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 15:00:18 -0700 (PDT)
Message-ID: <a3cc0f97-5a35-43c1-bea8-d2b9671b4ff8@broadcom.com>
Date: Mon, 1 Jun 2026 15:00:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.2
To: soc@kernel.org
Cc: Jinseok Kim <always.starving0@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_150022_038479_8B6D2FAB 
X-CRM114-Status: GOOD (  12.99  )
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

On 6/1/26 13:29, Florian Fainelli wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>    Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree
> 
> for you to fetch changes up to 245552af869d35ae27cac2121696dd630f15b3bf:
> 
>    arm: dts: bcm2711: Fix typo in gpio-line-names (2026-05-29 11:13:56 -0700)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Device Tree changes
> for 7.2, please pull the following:
> 
> - Rosen moves the Meraki MX6X pinctrl configuration to the PWM node
>    where it belongs, also fixes the USB3 GPIO for the R6300v2 and
>    EA6500v2 routers
> 
> - Jinseok fixes a gpio label for the bcm2711 systems (Raspberry Pi 4)
> 
> ----------------------------------------------------------------

FWIW, I have not been able to migrate our git tree to kernel.org just yet.
-- 
Florian

