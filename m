Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BED2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxqFLxTJnguRFYydNxYvORzf2O3oAQRZxALEShnb8Fg=; b=wJc9dAy4tZ6g4YsDTl4vxIDaBH
	0P+vUSaxZlwJw/GF/2VlMMaeEmnd/XtBSD3we2GpZ2ueXOjiNxOcBges+BVx4WgNXof4LowW/heru
	2Sp0+XA+WQTs1XGitk550BBkGW619ipPuRXdQGNOIylstDti//vno7hBrdjH6muBVTk33co0MpBJ5
	uYtiw0GsEou20E+1p6MbIkdeoK5a83xv5AaswXqvjIJhcKZD0ub+Nhx6leKYdpJw0Ofouzunca3YB
	9fI3T0EJQiX4c63TYJOgYQvV8Ajat0ijWCn7fRiBw+5T1RT5d27ghnadLqYoVyoCZv4Lcm27nLDEU
	y9fsQu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EoK-00000000cih-05q8;
	Thu, 03 Sep 2026 21:17:28 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EoH-00000000ci6-1MVM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 21:17:26 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2d9520b9155so2900845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 14:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470244; x=1789075044;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gxqFLxTJnguRFYydNxYvORzf2O3oAQRZxALEShnb8Fg=;
        b=UstW5H/pPcg1RzQhhAduPyA+48WJmizs8yq8584GYeQCjg4BvbJiswQfFxVyxRM705
         KJuwFpfPPor8JaoK9y9hiL25MSP4lPaSzIIWSo+Twn3TF0dgXDIUJ2L5uspbkjLPwD3N
         ccbcwGz1hJpIzc6//f6bMLpJnrGNMMMlVSxnhfdzhvdNaB8IBiwXIW81jdfIwsaAkMP7
         TXoocInRudER1wEAfSl85G55CXtuxCkADarAHCmF8CYbLeGVLMRrBSvGrqkaa770lAsH
         Om6ngR90g7cXp6tLYxn49qBqQALNM6dk27JmtcpB8EorWrBW0TiCq5Z/LZnlowT9tWPu
         km5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQo/gTwtiYgcmIWZrFoglY1xqOxF/OJjzfZJHaRYdUz1hx78sZqzmkK5CSr3ouXaYrvEZrWBYlUBiATQIeoaR9@lists.infradead.org
X-Gm-Message-State: AFuF++lNvywQfWxlCSsJYyX51I6fPx2pMEGLhccEGGTyssdnMzaZd4xN
	DrZWrlpbr1X6eX10sxCaQxNn9BFwTJHTIqDeovGgxI1CeDsy7cfaWkEtk2SttwCcsgTtGt75EES
	7Q7yb2CBW+fYhV7nOR7LZXf2ZppGA1fBGWaBXRPzNIDIGbJ9x0O4yutEyE9Nkf2tcRHzJMerpW9
	m78UIuI/9X7ILnmVRusnzUdZppfHZRfX4LcRArovBQpaHy9ANrblHYGDNqmdj560rmWBgs4IvgA
	KroP7wAESgNzd29FFu18Nxa3J0I7U7fMM4=
X-Gm-Gg: AYBFou1Y9yUxaX+02/LrgZkqgfwuO/l6Qi15V3POkjQ/0GKECFtScusbQIluTVxf8tO
	MxyNJtuSw91+1cGYY5F0FwP1OgGCZa923cCpJngUgORMalwNm8siHjlhlqaUkKdc/yh6QTbQbMz
	r2oiTWkpbYSmJbFiUms504JMiJYfKL4gNnqhsPOPtyim240J/0NloHmi5zfdf8/4mTG2ZpmDDdF
	0YinJW/fK2nc/Oe80BhV8jaCSVvRyiZixOGuaXCzni0kCC6EEx+eHs+ECyOwiz5JNMQa9QrICJx
	1CgRip6Qiv+KKRh6hcKk894qMD3ES7bMbK5iKjbPu3xCXVUZzA//FLWuwwyztlS/r0XiX2SsnR/
	oawhClIb1mL/6IA4xjJwjYD9PmEzRMV4K1dAYs2v8QIl/09YmKKEHWHOZjD1JerWwv+aGzN8a5z
	nA40oBLHRAoQgzqKjgNoRw0oEPDSzWnj21KWBIcy95
X-Received: by 2002:a17:902:f70f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2db1225b297mr31363085ad.0.1788470244417;
        Thu, 03 Sep 2026 14:17:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2db149a5817sm163945ad.16.2026.09.03.14.17.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:17:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8dd8be81so4815796d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 14:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788470243; x=1789075043; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxqFLxTJnguRFYydNxYvORzf2O3oAQRZxALEShnb8Fg=;
        b=P99lP+qg0qvFd8Hwqy2x9+Dt58QXic5hMVT9YwNSPPiGw8yD2ubydid/Ytc2pLVep+
         zPpATGnFA4Qwfw/GSsoaaxTEyB8xnXNoeIxtTaHgN58sIqCT8Bou7VRyVnJe5dwggK6b
         3thZFsou2L4UMYMg9oSTjXdybzhVbpiNfh+5I=
X-Forwarded-Encrypted: i=1; AKwUvBwMeRLGevdaTsJSNZl3GtsZwUNYjJaMgjYVyupBEFck32Lo8RwLPLhQ+gyGS/Z2IHGd6BSBZ2sJfiQfdGq+ZvDN@lists.infradead.org
X-Received: by 2002:a05:6214:dcb:b0:90e:876b:3b20 with SMTP id 6a1803df08f44-9103eefd25amr23988526d6.4.1788470240307;
        Thu, 03 Sep 2026 14:17:20 -0700 (PDT)
X-Received: by 2002:a05:6214:dcb:b0:90e:876b:3b20 with SMTP id 6a1803df08f44-9103eefd25amr23988026d6.4.1788470239714;
        Thu, 03 Sep 2026 14:17:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040693abbsm3979336d6.37.2026.09.03.14.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:17:18 -0700 (PDT)
Message-ID: <636a448a-0711-4844-af62-4b38ed7cce86@broadcom.com>
Date: Thu, 3 Sep 2026 14:17:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 Andrea della Porta <andrea.porta@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-3-pbrobinson@gmail.com> <apl6RddLcPz8Q2-O@apocalypse>
 <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net>
 <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
 <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com>
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
In-Reply-To: <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_141725_389557_D55DA19B 
X-CRM114-Status: GOOD (  11.44  )
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

On 9/3/26 13:55, Peter Robinson wrote:
> On Thu, 3 Sept 2026 at 19:55, Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> On 9/3/26 11:47, Stefan Wahren wrote:
>> [snip]
>>>>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
>>>> It should apply cleanly against Florian's next branch here:
>>>> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
>>> this branch based on 7.2-rc1, not sure this is intended.
>>
>> It is intended to be based upon the last -rc1 that was released.
>> v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next
>> branch on top.
> 
> But  v7.3-rc1 was cut on Sunday 30th Aug IE 4 days ago ;-)

All of the /next branches have now been rebased against v7.3-rc1.
-- 
Florian

