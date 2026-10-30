Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C6606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kBWipKvL;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S8hDLFB/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=; b=kBWipKvLX/Vbve
	HqRos7PSe3sClTg1tSbv3yWAXnGuQ0neZVGqEfolIDGW4Fk/1vKHXz35FprJ8cF3MFDDcW5zBaAUH
	f6JPYa1n03izzMzV2TR36izSZsNN6i1UtuNo9keWyeg7FIUk4WXtEzrRLY2Mc0/zTWxxss3LMYwod
	FB4Fs6AdgH9vekO1/vP21qRA5znsetigYXHlz+5DkAlEIvuIk/gC0Ko2YpctJj4G0YNvDh/pgotYZ
	rycm6wZbMyOf1iMg4hUCixojAtJxkeW7jPQApMxtwfFKpCfn/Jh8eKpcV/92RNhGq0WzZ3z+sm7dz
	2zLKBsv7xhgqykvID7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq8M-0000000CCjJ-17yh;
	Fri, 30 Oct 2026 17:11:18 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq8J-0000000CCiZ-0PuS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:11:16 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso598259a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380272; x=1793985072;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
        b=wuwu3p8egKQ6vncjs4IF0r5a5MyCo0ULl5MLUBUQg1izBJNuT6JaNCPQarmH1e3iIv
         4H+mSdKvsMGwd1GCa6s00bpNpc9GqvcKIihEV/Li+uEvT3vwuHdrkeyqwBHnBaDVd3ZJ
         hzrL1swXVf3RGw680bsbC1gnv9MzvJKzdrhtk+PUBHR7FbjqLAEkvVoaFunxNa6mtEVn
         mB6Q/3AZCHWj8XlrI1j0nux4lX3ip4+KlTYwnkDLfmopxTlAQ0G+jukTO/aAqZFlmJ+m
         1DWKjiQ70yrQVZgWKdPuGWumQBsILpDG6sJKHv53tagL7MM2oAYrIm97inbAWKFwW98m
         pCoQ==
X-Forwarded-Encrypted: i=1; AKwUvByGtswwpWFcEiRf9eQKeVp+0qV+jSA35z5AMIfTgXNgqrLiqToHtFFfgAjJd/DYXb0COEVkrNpPaCq5EPhpFv79@lists.infradead.org
X-Gm-Message-State: AFq9FYLDX6XcpXML77QCTUGZWgAp9XynL6n0VkVrR+o89o3EHX+ccivv
	9QLaZ0Rof1OR5Ti3sTR8Qv1aYCEH3tRNE+JdWVMnK9TKG0SXA4rnswoF3iMIhpKg5/Y8893Jvta
	MRf/TOQoJQ4NuwtSz9XYbKwxNoHlhgmGGVrblTc6M4G7z/mSUVSewswpEJFtwIR/ua/wzW3RXf1
	AQ0fJe8P00UVOiGBj87YRPjJooXO+PhRS4oDQZd7VU2iJDvD5hrIS60yXYNmSdkojnvPLgrYI6N
	UZxNpjIlbsDkjZaxSt6GOmpVafFQaxKiMI0KA==
X-Gm-Gg: AYBFou3Av+gCHm1fL0zhKkSGUR43mq1ZyU9dKnvAtVpU/7aJViQYL66qUpu5k6LI8f+
	VVEdfJiZNeMX4X03d21UCUDUDoY07cw9M9+WFr0HBiQXjhl1UtVERmu6t7tWcgxwQj9UoJA/OR6
	FWCK/ryF0va6R9u2LuLPF6K3OlOTApR6WK0VOOsJc6vx//ht8jttYFvMrp/dZi64HhKsoP+Ay1E
	rwRJx9YunosFElBJDLIYOV7G4TAKX8bnkpSwAYlSCyhY/zUvPOVxNqH1MPqgsVhLkINmG8etXvs
	UY1vAzNNUAHxARU4wfP0FYogR65aWzsshEZde2Zb++YXZXE1nVBdn8kmMhTCtnfcFig0nvFmx3k
	PedRTm8jjpUkHGN2w5rjmZD4Moha2h4Bn3isrizlHathOgrZB273XB7zNvW1uwIsdNslUzJ0NQD
	B0UlpMMhOIbcxrDEVAh/9Gy3gxd03Nf3CSCMBKbTVG
X-Received: by 2002:a17:90b:5603:b0:3ac:9a03:20bf with SMTP id 98e67ed59e1d1-3ae8985b551mr2597085a91.55.1793380272128;
        Fri, 30 Oct 2026 10:11:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e6efe86sm4429996a91.1.2026.10.30.10.11.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:11:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1398990a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793380270; x=1793985070; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
        b=S8hDLFB/lpiwXnVwPvS/AFoATEqTE9sAG6w/KnsKdoGCJqvgy7iDW9xgLrWxPwTHAS
         n9VjkNqCe3Q3WNfhwEs75LR+vA6zL60T2/Ip4EPcZJehzgXGbp3T5XwqyMcwBB4zl9TG
         Y6ZKWfmcJcTB8VQ5TDrgMYmBy+o5svUar8o0k=
X-Forwarded-Encrypted: i=1; AKwUvBzd7fWr7ujV85kd/OEgEZDkObaGU+moRjvDCVg/k6cmrXSkuPauVbUMQszwHpvsrkPIjptC4iUuho797+lZqbPT@lists.infradead.org
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr2474483a91.53.1793380270413;
        Fri, 30 Oct 2026 10:11:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr2474434a91.53.1793380269908;
        Fri, 30 Oct 2026 10:11:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845e71a7sm4640721a91.15.2026.10.30.10.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:11:09 -0700 (PDT)
Message-ID: <d1436c92-b7a9-4220-a69a-1ec72eb9f5bf@broadcom.com>
Date: Fri, 30 Oct 2026 10:11:06 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
 <auSHoj46Os6gSEUH@willie-the-truck>
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
In-Reply-To: <auSHoj46Os6gSEUH@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_101115_200793_06119C98 
X-CRM114-Status: GOOD (  15.39  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Will,

On 10/30/26 05:03, Will Deacon wrote:
> Hi Florian,
> 
> On Tue, Oct 27, 2026 at 10:51:21AM -0700, Florian Fainelli wrote:
>> This patch series adds support for the BCM5301x PMUs which are AXI trace
>> engines present in the chip.
> 
> Do these replace/interact/support the series from Ian at:
> 
> https://lore.kernel.org/r/20261002175738.3242646-1-irogers@google.com
> 
> ?

This is a different piece of hardware, I was initially hoping we could 
cover it using Ian's PMU driver for 2835/2711/2712 but it's really much 
simpler and different on the BCM5301X SoCs. Thanks for checking though.
-- 
Florian

