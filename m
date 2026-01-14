Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BDFD39005
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvsCV4xxeZfBF7U+NpDM1p1RqT3IT06yXEOy1GqmxoE=; b=eY5uXOz+ew9eL552t7TVwd3O4P
	e93mJepqXyS5o1JKIKGDe96woZ5occr3vMtSyoeR35hp0hlXgdio+fWkK/b97Lq12+Yo/qBVa3mhJ
	Fe4/L+28IQc/yNS3cjL4MlZpWTtdrhRAVPDX6MCfP4vVJu1uQjpgkZh/KE6IqB4IBYtBnIxMu9MMf
	PFVneNoDUeebFTmck559TPZSItUSq7eumIm4nQ6LCzz/2oMMLRfhexn2zdXDGF9svOxKgTH1tXwLq
	bKZsYgKnVz67p53/WvLqfSukhzlD6lWz+RVuW3iaiyvafY9q0zCHYjIVevvORI9oox05NTncy/NhG
	ReIeJmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5Vk-0000000AJBn-1K4s;
	Wed, 14 Jan 2026 18:22:28 +0000
Received: from mail-qt1-x863.google.com ([2607:f8b0:4864:20::863])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5Vh-0000000AJAW-1dbf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:22:26 +0000
Received: by mail-qt1-x863.google.com with SMTP id d75a77b69052e-4f4cd02f915so578631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 10:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768414943; x=1769019743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvsCV4xxeZfBF7U+NpDM1p1RqT3IT06yXEOy1GqmxoE=;
        b=TLZZO7wjsSsG39XgxQm3DAUwLxhG73eyh+B5F5l9mNoDxUFFPp6iaqhXL212zG1ON+
         g+XMBLQdxo2WIZr32FWXoHcvvjqYVsVjIGDTB/bbfvqdpkIv0PdrNY+GPQOR9leyetBf
         sbYEkmaKX+HywpaOQPqte4NrxAgoQ+AiYUAH6QUHxuhxFRyveua2y3uANlMf2FKfvvZc
         65mT24edBwQpzJdOSgpche9JpQ+lVS5h655XZ0Y8imUF3jwXirBPey5huF+mnzYU2JS2
         qQqXjbXxtnloyO+Fji8s9ECV2AassLpX8w6LxC61ze0cBjycVSbD/p1xOPEDsFmvH7X0
         1msA==
X-Forwarded-Encrypted: i=1; AJvYcCV3DDFrzlc7wuIcVgTh7I85pABTLiL99H7yeOo9wfPF1kZibOZWveFFRHuB2zOF7WQx7mf9yXLwMSON5i0e5GVS@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNL04cmHodx5JPVpVJLDUuT9A0AnqyiTC8YAnRrXaCeBuLtQh
	3WlBl6CrekiKZraRGONvIPI1ng1OOQX3CWDXjivTkTTdHhstbNAK8GXvryS1HNAmQgMQfbwud2t
	QxF8EEBeFrMPJNlwHm9VfLW22jbxl5d501is1r6ZtJiOIuSzEdCAxZuRtRCNBExJD8K1mlBdtzY
	+Ia28S5ZsZclVUQgNipI6Eik9iAqsKCXTWMgOKyXcwC5Noq67e1b58ysHesrKW6uv6+Mhzval1K
	QPG5Lcu+xAI1N753apUdME+sWHKKLB3nPM=
X-Gm-Gg: AY/fxX7o8HL1WQAH4FcCkebXWmVJ7uvV7nU5CQu3POzDFhEFLy/POC146APJ2uRdgcF
	G6RwwcGd4mOfrOf6I8Fz+nP3COR7U1ZePhrSOfQDjZxg/Ng3VckrglGqpRkyRGhTtIJx4Vm36VJ
	vJkPK+U2GrVtK32kR1aqjs27eHfV3xMV988J2oTHbVN3dx3oXRXi/wqK7xwDguVh9b5OmZ2EDvB
	7AzW0HC0rlpLfV1PcEMHC/69ON8pPfZN9cfEAl/XNxQDcEI0v6Kfff6cV9Mn/XvpGYIk0WtpAfY
	/onwVL3VQ7qu4SK/ZWi7938nF4qt9Jfb9WMy7X6BN/GZbJul94IU8jQEkk/zWEIPln/wM6i8pc2
	nMDH/cbUDKysTxSZgbXdNgIjy0C5DTkghx2FsPL7JTIccBHUBYwdSNaaVkSgraexu/jiipQWIdc
	X5EVuGTgsnqlTK1sMLzVJoeu2ZkfgV6e8Y1dr8KDWtPF0YZ2E=
X-Received: by 2002:a05:622a:4d44:b0:4ee:42e6:a5 with SMTP id d75a77b69052e-5014827e215mr48106461cf.57.1768414943082;
        Wed, 14 Jan 2026 10:22:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89077093d8esm29109956d6.7.2026.01.14.10.22.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jan 2026 10:22:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae32686ed0so856719eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 10:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768414942; x=1769019742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zvsCV4xxeZfBF7U+NpDM1p1RqT3IT06yXEOy1GqmxoE=;
        b=h8Yfrm8yO6pDxuu8HInIYOxXwhSRHRtsTPvEEvXGR1C5i0tcpsQ5y+/X17Mjg+trTS
         Yoeuppknafrxm2I/tOJ9XxqNyhKcDENTIwXo5yUUgS5gQRysZ/uUXuIo146KrE+hFsCD
         7l+/+rL4DeExr5gE5qk62qCeqMuvcjq5en9cc=
X-Forwarded-Encrypted: i=1; AJvYcCWBuKlTXxqZ2majyhGt/NKMVJKBmLbMN+7oYEe/UL3NVGDB3dJwrlLoVphb0Q8vvw+H7np78P33hbETjJWw58hE@lists.infradead.org
X-Received: by 2002:a05:7300:6901:b0:2ae:5bde:a5c5 with SMTP id 5a478bee46e88-2b4870abc8dmr3633850eec.30.1768414941850;
        Wed, 14 Jan 2026 10:22:21 -0800 (PST)
X-Received: by 2002:a05:7300:6901:b0:2ae:5bde:a5c5 with SMTP id 5a478bee46e88-2b4870abc8dmr3633817eec.30.1768414941183;
        Wed, 14 Jan 2026 10:22:21 -0800 (PST)
Received: from [10.88.173.133] ([207.212.61.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707da231sm22380597eec.34.2026.01.14.10.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 10:22:20 -0800 (PST)
Message-ID: <a9a202c1-048f-473e-b8f4-6f0550bdba2c@broadcom.com>
Date: Wed, 14 Jan 2026 10:22:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: broadcom: bcm2835-rpi: Move the firmware
 node down 1 level
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260114015810.701076-2-robh@kernel.org>
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
In-Reply-To: <20260114015810.701076-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_102225_438942_22ED8286 
X-CRM114-Status: GOOD (  14.32  )
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



On 1/13/2026 5:58 PM, Rob Herring (Arm) wrote:
> Commit 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non
> simple-bus nodes to root level") moved the firmware nodes into the
> standard /firmware. However, /firmware is intended to be just a
> container for firmware nodes as it is possible to have multiple types of
> firmware (e.g. SCMI, OP-TEE, etc.). Move the RPi firmware down a level.
> 
> Fixes: 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This is only half the fix. Unfortunately, a kernel change[1] is also
> needed to make this all work. I do plan for that to go to stable. I'll
> leave it up to the Broadcom maintainers whether it's preferred to revert
> the fixed patches or apply these fixes. A 3rd option is revert for now
> and apply these DT changes some time later to give some time for stable
> updates.

Let's wait until your fix for the /firmware match table gets applied and 
then I will pick up your two changes.
-- 
Florian


