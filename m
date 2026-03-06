Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4FFFC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObaTsYnQwYRfm7amcTmZbsNtqdXwVvb0U5WhdC0Ov4c=; b=s8HUD4BDdRK2xH8Pw02cFO5UbK
	UQnx9G+iw6dTJoFK+Ko+lx8xpA15hBnGdMLx9aIvlRqpgunXcbvQ3KEOkg4WlIKh/xGNlWE518CZ4
	KMfT3jCEzTOI/Q4iTjdWQN1K5uNrolsOrp1vZvMI4NnjmoXw9lJdxMPjjuffczI3GPN990L2L5uJV
	UU87bXsSYyzsvvZkkMsUsmChzYQJbthZ5eQRBUdj6JiUWeuHBhxZikiYajXVcA6HkEwA/QnOHrSS9
	IUpSvCNSlTgzY1Sjm4Y5Ripods8GzZ5ar5vTuqcspOToDf/3ozza3vPva+gSUdtycUnv5qwOh+W6E
	xyUMsg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeov-00000004fbV-2kA8;
	Fri, 06 Mar 2026 23:43:01 +0000
Received: from mail-dy1-x1362.google.com ([2607:f8b0:4864:20::1362])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeos-00000004fZv-419u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:43:00 +0000
Received: by mail-dy1-x1362.google.com with SMTP id 5a478bee46e88-2be27fa54feso6171470eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840577; x=1773445377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObaTsYnQwYRfm7amcTmZbsNtqdXwVvb0U5WhdC0Ov4c=;
        b=k+RmzyS9BVElaoxLNXyW3PhT0Tl5/CVLAjrk1mOlLYm9IoN9awC3ehRZVAPYkwjHA/
         Yom5GCOrozvuLBR1fZ3XWvavXMh75GQPRmGQySlBBAWC8TieA+ufSnKgTwsbsUhG7Sl7
         ULjnUhILTmdxWqjVkMIHMjfiasknkEMzIIkMktFDLcKICZLxwbzjK8HqCemF5RVgS/WX
         dXeK7Gx7lmw86yVCJy2qHxTclSeChs83KEFGn6/eC0ppMJ1JLiSr+XfNeCOPihlGqIPy
         RNKVVeQDlSvqMYRCozI6BpvxT8A81t7FM/OYLuJJMrJ+Kfk1tXlH88Kw0EXlWCaDGkGj
         xSzw==
X-Forwarded-Encrypted: i=1; AJvYcCXm9cn4wBj4Ggwg6U5OxWnD6vsQcqXB61zVGFU/wA4o5dsq3CZe+1SsYDQZ6jikRfqRK/tMjNe90KXhYHpClf/R@lists.infradead.org
X-Gm-Message-State: AOJu0YyiRwYv0ljPOx4q9gW9bMzC0GQLhIdVv7A90mdQAID9jBgCOxfN
	CwMDenHofBJC77vG4t4R/OA2TVguWQ3rft8vhfAO/UyJdxRMnu6YmMFLEKDl08lmwFaYsoDeIiy
	AgawnDVBdn/9YBnou0jgVaNlG0jcvb4Mppk8JyGWVojLSBHGPUfodqr7wz0g6O99+KqrZneh/HL
	F3ajVKOs1WomJFch28nmiSLR7Wz+EkmCMDDuu/sJ353NnhehGWb8xAQSVTt3En2v4pfxT2yXJ2s
	iEvVTNNczJGPk2xZE5zHzx9qvtKmnIx85E=
X-Gm-Gg: ATEYQzxhAae8vUYcoCv6fWdjjuaaocJGDrLAaN5soyO/tsKpp3D25cPYZYzdDP+Nu5v
	QB7l+t75dmtrs7L1AFjyw1VAfH/wryRmkrvYvvjHrMWZCSrYKNveB4rSPnl0Dhqetz97SAjGPvQ
	cNwunx3xQRD0OPwacMomd6qUtW1pQtQrV4BQpDj6kWUoRJ/7n8G4K0KLI+w6UU8n8oqi82ojTBV
	SQrqCwLJz+X0DCNu4EYJYWgdXiETHFi+WdC3u0Zf1WBk7g0MU9GS4MaJh0wqHqjqd2DjVBgecpW
	LKDR/8aBKuPKO/QfKt+n3dDBlbv7k7z3x9+28eXOI9aqYAv/zqROArNTDEMWsF3uyx+2GaS6AKo
	c3atDZL2n3LD9X67N6magfePhvX57cAQHs6Vwd4pQD87z+cxYNQrtk7z6qW0qSw3yYejP2J8gQk
	kzGpsjcSHzfWqBUengDwtWq083ZWdejkcdNujxsZgfrP2ojr/iab9V9+CALgqnSQ==
X-Received: by 2002:a05:7022:f103:b0:127:337e:3304 with SMTP id a92af1059eb24-128c2d8e22emr1679751c88.8.1772840576835;
        Fri, 06 Mar 2026 15:42:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-128c3bef093sm268956c88.0.2026.03.06.15.42.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 15:42:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be21146933so7416776eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772840575; x=1773445375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ObaTsYnQwYRfm7amcTmZbsNtqdXwVvb0U5WhdC0Ov4c=;
        b=b0ve8uOPyk4qdLskB/NiBzHFuy0QleSBtv8SB6f0Vdn5IGmOxVbMHF5yWzbYP61a5y
         wpiFfAtHMJyIG5NdisBePQFsTI1MAU9XphY70U8BGlka3biEkyHUmM7TTLcDwKtI1ITD
         EBTAL6RYnG/jKHKUZSg+Qgyb/5dNBYGsOQ4LI=
X-Forwarded-Encrypted: i=1; AJvYcCU0TEdjAHvapdcQMw3eZ8Rybj4whFgMbS5oDp+p3k4DHdXUOSlqcragvBXHkHTMFfHT9Sp9WiHnsSokB+eh5qja@lists.infradead.org
X-Received: by 2002:a05:7300:a985:b0:2be:79a:6a16 with SMTP id 5a478bee46e88-2be4e057159mr1522117eec.21.1772840574767;
        Fri, 06 Mar 2026 15:42:54 -0800 (PST)
X-Received: by 2002:a05:7300:a985:b0:2be:79a:6a16 with SMTP id 5a478bee46e88-2be4e057159mr1522107eec.21.1772840574150;
        Fri, 06 Mar 2026 15:42:54 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82b78esm2271891eec.12.2026.03.06.15.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 15:42:53 -0800 (PST)
Message-ID: <2b6c0d48-5d7e-48a0-951a-a392a0636147@broadcom.com>
Date: Fri, 6 Mar 2026 15:42:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: bcm2835-pm: Introduce SoC-specific type
 identifier
To: Andrea della Porta <andrea.porta@suse.com>, Lee Jones <lee@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
References: <cover.1772839224.git.andrea.porta@suse.com>
 <c4bb218654e91f312a01b419d3d408e5131f7673.1772839224.git.andrea.porta@suse.com>
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
In-Reply-To: <c4bb218654e91f312a01b419d3d408e5131f7673.1772839224.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_154259_007700_D6D73ED7 
X-CRM114-Status: UNSURE (   9.33  )
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

On 3/6/26 15:41, Andrea della Porta wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Power management blocks across the BCM2835 family share a common
> base but require variant-specific handling. For instance, the
> BCM2712 lacks ASB register space, yet it manages the power domain
> for the V3D graphics block.
> 
> Add a hardware type identifier to the driver's private data. This
> allows the driver to distinguish between SoC models and implement
> custom quirks or features as needed.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

