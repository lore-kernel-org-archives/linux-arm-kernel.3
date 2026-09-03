Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B98C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEsr9BGeNrd54LE/l0kGrNt8rZ6d+rV2KMdW7NWoYDQ=; b=QeNTLYNWMnrLH+vgB5wLQ3mM4t
	goQbrxBqzm1AUSS043uvWETCCX8HG8tApwe7YYPVfrMPWT1Q2tq/h7/SUAyzZkR1eT9wj/qtmN6L2
	2j5XFvqICHcnVeZXANk18XHnbfddCJf48QC+4sVDcD7UbicMmy3aboT+T/qn/CY19+ZJRUEu4MQjg
	r6v0rCkn3ZJYN2foT8QJaR6dwJEAoB5WnG2RFYFgVFevzCbOLW4dgSosAqBk0FgFILKjK2m4rm8nb
	9Xz44r+fg7lu7w+hjTgwS7+hKql6ua79J+wC9qkdRKxAFZK6PZ45kUodA+MMIiGssjC8mCJyHDWZ4
	9MDabdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Caw-00000000PFR-0dZz;
	Thu, 03 Sep 2026 18:55:30 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cas-00000000PBm-2ehd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:55:28 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cc439aa0078so301549a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461723; x=1789066523;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jEsr9BGeNrd54LE/l0kGrNt8rZ6d+rV2KMdW7NWoYDQ=;
        b=W7Miqi7IOKcHL5/Rtw/gqVKF0g0i0fBQbsi3lHV+IPQ0UN4s2bI4rM4n/M/7COp6/4
         AmpOWJoQfdUmIJtEqvCyPAeh4U1a5wXpQOYR9Hi6AmIP4ViCgu8ub6Hfi0A8grMECvKF
         6ipwRXMUaYNUxEVsVEaA67KTBYIS0fqFJFxPy2sU1/frCDtLOPE6wq4lI8qjAw4iwjqV
         0umvvMtXdUGPje9UkBUtHIgOQXjLeISvXOttxHAg/lR3c9epInOzwxOgyF0bH6/9JQyd
         PyF56X9xhxdNJQMK1j6Rf1C8I5+1lFkJ4q7kSudiYydV4P91ALRzd33FKyV0znF5heVG
         kekw==
X-Forwarded-Encrypted: i=1; AKwUvBzP/bkHGzPW5dq/3P9ZM7qzn5+KsJoNRmZmkaLdrMK/teZAGYwat97rgTYqbuyPycIMm09hnwK4W2aVgyV002AL@lists.infradead.org
X-Gm-Message-State: AFuF++ld+ilUpw6VtO2IB08lvYYQj7b/Ex1zrrh2QcModzifVnWud1pT
	VITeNq+b9nDVVKKSf5QSTlLwTw0sV/llqKIRjXug4N7FFIfyfOgO0teQQr2HeVAu8g3axl32uUk
	I9gm6jRk/0C/NeJgNBJoz9GjusOxeYJE36fs8BcfmdGxZy5CcJs7g/2GQPOmuzzmumAaj/vQhDq
	07Ju1d9wCLC8KdBGUFbKtk9ELLTl5ObjqeHFSPtKolj3sttkkhHb5lIvyUePgr4dGURIw4lG6r6
	QMsxTJ0d7DMVStsnJSbU2ps85Ovat4jwt4=
X-Gm-Gg: AYBFou3nVOAH3kdu5JokNTj3FiCW8W/d5qjbYcAmNGqNxo56X8Uv5T87OdoKSZt45Mp
	67kUZ4MAqoVq45T/KRoGSMdHBPUoqVWWJmf0gs8MPPFtm0QaP+/qvexMhQnA38OY24KdXZZ6eLR
	La47QIv5VUoUzUUTxiG806VnONRT5utf1juRcDnW96Sup5gDNqn5xuFyYPxN/3Kdr2Mb9HQqxW9
	ZCbkt2jaiPK8cpYIUIHUFWmNEfa3EOA30TlM1EUECY4jIU2EPqdkX6w3EeoeR8qAp1aIvetBkJi
	YoTDxgoGXb5mTa+Us2zbjUG0vd8hJEVyG/MlfaVpecYekEvDG+SZNNT8NXcT6JsZ4S8+v+EGhjM
	jZtKBy9bBbwXkogYscerSl9cODmqdbicsUAEPDElKliPFRH+RWrdjK1D6xFnyhHmBdt+sqWSrrW
	a+rXdphVkXLyg70CzqcFtSueFP7+nputqCmwSOQjd/
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr855969a91.25.1788461722514;
        Thu, 03 Sep 2026 11:55:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b15caea34sm1410127a91.2.2026.09.03.11.55.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:55:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5302b692c8cso5573631cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788461721; x=1789066521; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEsr9BGeNrd54LE/l0kGrNt8rZ6d+rV2KMdW7NWoYDQ=;
        b=V7/cTA4H/lleOf0esVLhNH6haqDbpzERVr3ygxLmwS9Dbu0UiBEIjHNojhx/pREf7D
         iVdD1kEqlUC6o3OIAuPV5LMBSKyCglocnO2XTMm/kTgfVT6App4R7/WEzRg2bDHHhZPE
         Z6wKh2ZfLYVWFG6N0iebRaTrcb9HPIApBIDXo=
X-Forwarded-Encrypted: i=1; AKwUvBwYpfQd3mVyJHhbzf6yuATtjbFBE4YuOR882HuteOVvcP9N3/qeFjHNyf78U5aZtRVNODQIWp/qUnkMqD7wUvdU@lists.infradead.org
X-Received: by 2002:a05:622a:4cc4:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-530548007e1mr10138931cf.9.1788461721199;
        Thu, 03 Sep 2026 11:55:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc4:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-530548007e1mr10138251cf.9.1788461720559;
        Thu, 03 Sep 2026 11:55:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305414a36bsm3321801cf.16.2026.09.03.11.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:55:20 -0700 (PDT)
Message-ID: <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
Date: Thu, 3 Sep 2026 11:55:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Stefan Wahren <wahrenst@gmx.net>, Peter Robinson <pbrobinson@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-3-pbrobinson@gmail.com> <apl6RddLcPz8Q2-O@apocalypse>
 <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net>
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
In-Reply-To: <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115526_867584_D50A8CBB 
X-CRM114-Status: UNSURE (   8.58  )
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

On 9/3/26 11:47, Stefan Wahren wrote:
[snip]
>>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
>> It should apply cleanly against Florian's next branch here:
>> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
> this branch based on 7.2-rc1, not sure this is intended.

It is intended to be based upon the last -rc1 that was released. 
v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next 
branch on top.
-- 
Florian

