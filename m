Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9C8EEA84B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5b0aMPiLLEIVy2NpaR3RVyx+gvUXOAAi7eEHMzx70I=; b=3pA6ipkSXUMEvL4h8DyK8EOcuA
	H+nzsvcYly9uEQeRaUWsTYAb+0+WnOD2EaghzVPX8tSnAeg0z/2n2an7CQb1EN7r0eKOrWd1fmY3g
	doMTF9ssvzifVAkrWNMEsnvRshKWh8FaB1opmsXEvpSRveYTuQ+3ep4AatWSj5erKBp4FyIvKA6At
	Qw7E2KkCYE8Fw9MyHS5scckzScEDXnCIvK0N/9rrN0t+Ja66rQHJpuBF9bXzXoU99nGzKRIdWZvJM
	dYwMfqUeqXuBCeCcgIfrbsLVwAJnDw8c77Sg8NdufMyEs7ANSkgQmKalthD72rJ5GWa7RhxSl+IJH
	6gjbIr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqc6S-00000002Z2k-0uV7;
	Thu, 12 Feb 2026 19:11:52 +0000
Received: from mail-yw1-x1164.google.com ([2607:f8b0:4864:20::1164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqc6Q-00000002Z1z-1MZo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 19:11:51 +0000
Received: by mail-yw1-x1164.google.com with SMTP id 00721157ae682-79495b1aaa7so2420127b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770923508; x=1771528308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5b0aMPiLLEIVy2NpaR3RVyx+gvUXOAAi7eEHMzx70I=;
        b=hcWIl8BWtXL3UFkdl+8REE/sgymwMlmeW9BLd/1bA8BHqbieWmMKCgE4o9gtWxBD7R
         cBBRlZUUu1jucAGDhOphA8FdSwmghDJO6mBta7SJ39fzK3xO5FbuIrR0fPMyUEpXkxHk
         gKFhFNMgIQmeelbDZjj88tH+civAemcfb+oSlD+TvtoQmprL8WE9ahqr4dkVl844t91A
         UAJ/RW611r7dCrTHYPr4WSD0x8cKnoUMBl/uV7uxRcSpwwLuJag5Abnk30FQFxBED18x
         BVxS19NDKR1IfvCgdIM8uY0rOI1YloohaiXWVK4QFltI1aP1HizAJn7PTKINNXDbxeHJ
         Qw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGhlOokvoFckwKzFDq5GWGH8+hYblHYNw6QHxbdKsilYJDC5vwY7EhrPi2cxCRJIKOjughdQ1srWTt3y6i8/9J@lists.infradead.org
X-Gm-Message-State: AOJu0YykF1VLytIzWR72n8w4V3vFkkSY+EJp5OyHK5v17GsUtqjzqZyx
	Q7pWyHAHvc51erycQLEXetlDvwiv9xfddOPL+ydEPpzJKeLRN9T1rUjhoRhOZfD0YQq/xWPlOm/
	z4a2P01dNaUd+hu9CPIWvbWY/u5OBaDMxPjbVtW6bzpIGTmPtn69ikfRFR+KSYg9ERRVFNcqd8t
	mCkwxovwn0PaVg+SziGfspKHcv8NdXhAYB2vH3ekVHsmFD7xU9xu2RdTfQAyItWWFLrwl9jMn9u
	Bo/h2m8xgkGHAAv0on82i7SFyp2xyFWJXc=
X-Gm-Gg: AZuq6aL4LS4JnrHIUkzkf18vdjXbr7rbZ9pQ1i97qdnE+0H65n2Hosk0XxPb77sOggq
	k632mySR9cWy68DDXhVEp8BnXj7trw1w1yek4DYFdtyd+uKgigylhE0ZvlA3UfGJ+2DWQ7nlzkn
	i2L3MyW8TLgQzaarEj9nnguNEceXeJtoSSWA63w4RpnpRd4+24gMJwEgor8va3RNRzGcxBAQrM8
	xB+8dYW1NAhTeEhhNrYAJ2GXkeJDWzAZaoAYeo9xqDdXlXTdb1g79DIICG8oAGaegibjc6Qfn9F
	+V8gVtnTqiS7zebERTlicoCXfzYSX1B1Bnfitrb4hrVWrI7eOPB8wHPN7lHLRWnZv2BCC8YfO8W
	97c8exd0YpCvA3O/HgwWfNgIQ67P5V4hidGR0MuUwVHngMjMHpYLAqQZRtIcXx6diUiuBeHCc+T
	iuI4XNVnGv2Cd6l4XjiS65STzAr/uwldZZixU6FilWLYCYgf6eRVy2+1ctUqRJvZT/
X-Received: by 2002:a05:690c:397:b0:796:31ce:6019 with SMTP id 00721157ae682-797376a3ba2mr38516767b3.63.1770923507842;
        Thu, 12 Feb 2026 11:11:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7966c2325e1sm5258107b3.19.2026.02.12.11.11.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Feb 2026 11:11:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89546cbb998so8244776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770923507; x=1771528307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C5b0aMPiLLEIVy2NpaR3RVyx+gvUXOAAi7eEHMzx70I=;
        b=Ygyt9s+AvKUNzUUSkZMI0geTd+CP73XnZP5wqbJZtA/rlfh8C3eqfk2qNDNZzLGk24
         dkQ3g0OmOMbMT03uv/tOPgYgGT2RF40V8yO9CQYrCXbw7uTkZxbf/VrEl3L2rM4EiGbV
         OKeG7PManZ7Tx8DiUHd8VrAEjV3nMyyUizxLs=
X-Forwarded-Encrypted: i=1; AJvYcCXOSRjsZLvZdAzYs2CObvqWfzWeTjA9mUUQhIqltJnAg+TTMetDNh6zLyVJ6UN3Vb83v2ElYNJwXz/hjU7Z4y5x@lists.infradead.org
X-Received: by 2002:a05:6214:411c:b0:896:fe42:e897 with SMTP id 6a1803df08f44-89734986099mr1217976d6.67.1770923507051;
        Thu, 12 Feb 2026 11:11:47 -0800 (PST)
X-Received: by 2002:a05:6214:411c:b0:896:fe42:e897 with SMTP id 6a1803df08f44-89734986099mr1217546d6.67.1770923506568;
        Thu, 12 Feb 2026 11:11:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc94dffsm43549986d6.14.2026.02.12.11.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 11:11:46 -0800 (PST)
Message-ID: <69ac37c3-c384-4592-b76a-507724727b19@broadcom.com>
Date: Thu, 12 Feb 2026 11:11:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Fix broken reset status
 read
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260212150039.67117-2-mcanal@igalia.com>
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
In-Reply-To: <20260212150039.67117-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_111150_397681_70792727 
X-CRM114-Status: GOOD (  11.50  )
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

On 2/12/26 06:49, Maíra Canal wrote:
> bcm2835_reset_status() has a misplaced parenthesis on every PM_READ()
> call. Since PM_READ(reg) expands to readl(power->base + (reg)), the
> expression:
> 
>      PM_READ(PM_GRAFX & PM_V3DRSTN)
> 
> computes the bitwise AND of the register offset PM_GRAFX with the
> bitmask PM_V3DRSTN before using the result as a register offset, reading
> from the wrong MMIO address instead of the intended PM_GRAFX register.
> The same issue affects the PM_IMAGE cases.
> 
> Fix by moving the closing parenthesis so PM_READ() receives only the
> register offset, and the bitmask is applied to the value returned by
> the read.
> 
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

