Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E30D33994
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8vWFsGyx37EcR9Ck3rWLZNCzDMVpsZ+MmmOiw3mV4E=; b=FZDMs78l440AAZqupSO81sB9rl
	7AIPbUMVkBTIrD8/+KVE8vSvfa8UQ/Xr1HtYwA/hUVEMuzavKSGz9zVzrmsFQsQRkIOOYBnFUm55Q
	ulcSuZxHAC9xbM1WV7BQhNZaGnLvpntFA/qQ1+58YvYaqXGwK+l7VAd4EfwvvUO8m1ZOLA20PoeDd
	sdTN7Yk5BM7bBxnca/Kj6IQXIRBUqrIlEuhWif7Bd6bm1DSrnYLQduVRWmCH8EkUpqacfs3i7mAus
	cXH77WIiql9U0+GDjV7m809+p3hXScS6gjYc5391T5mdOuUx+ZjTgLDVzvHtQ11lMFx8kONC+MZTF
	93l8LlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYsS-00000009iPU-0csi;
	Fri, 05 Dec 2025 16:41:52 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYsO-00000009iOh-2oPB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 16:41:50 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-297f35be2ffso35460155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 08:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952907; x=1765557707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x8vWFsGyx37EcR9Ck3rWLZNCzDMVpsZ+MmmOiw3mV4E=;
        b=DYKxikCcn+NBRNR3J7+J2kEWu+X0guMldh6SaUmSbkKc8w6w1vCzuBcqb3nb8+zrRG
         D3eo4vhCooHQJ2V6sWec9mzCm+tyVXiNibA8mPy1TcQoUiBo/r8vq5CpMzFGUxqJbjPr
         fYKR6e+Vrnr0gejSVxbLvismDU7LxGi/orssUKzt4DXNvS3b7wRuf8Knllo5vBvCai/j
         H78iFm38i8ZF8dza/DmaOGR41J0Kl1xmEoKBy+Vy49l1JQ6lOItkx5fhMnlMQZcixYsG
         wgLOaggTo3QZ81ph9OT1hlFEJgjCLqdLhCfrh5w7ZbFuHwZ8XsdPrDfJ7d9AMRCFCOxF
         HWtw==
X-Forwarded-Encrypted: i=1; AJvYcCV4/1lzkpT340qgdWNxtvwJuhlKHnvYEWXG9b7Ex6Xwg6CmWfuhLG3vE/c3mDqwm/IVHAX5tJAxss3B1Cly2Gwz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5yG3ZO/CmgrajKKz1q8VDByCe2/01KkSb226oycUn7cv04/1a
	iC2MofMWRxuarG9WCSc4QKy45j0Xn9W3wf/gw0JtGXAn/bOhFx3T1PdBR3L1FdoHffljny1B9xQ
	7bl9Y0Rx1lP9Sw1SHwe7Rq61AxaBVZCYj79Lbd/OPGyByMmw1+iERDoPPrRea3up5t7EIMFpDKA
	0vBSkVZwPWU51GJzPUm4mH8LfNe0OHwvdWUVCO0yCzjYYc24iiZIHZAtw2L7PNuanfDSfNC7uxd
	ytv5+4WrkrwoGMjBKJuzUqvnyWP/wnaGxs=
X-Gm-Gg: ASbGnct7THGwlKo6gvwkTMRZLVXhjxz8xtcWVcOLCDZRAHM53DgqXnk1ENrL8J8Z2iN
	pETPo61Z6QdVgQqS8BwRhWaXpXkaILlEurbFUgd8nrPuZY9SAKlcLEKTFesQyx8mg+xl/cJVWbn
	DPiqZKEDbrTe3hY0yebjbSSIKK7l195x88Dn5akpCbKQamZfLB1sRf440YytrTR00lc5g/IRPh8
	QIEyyFqK+13nf2tJu1KXs4kAQmDfAssioyMBvcIS6N1XkWjRqjkidMiDSMrTmTX2ct51sfC0WaD
	9danRrh/oc/mnSRa3DkSI5Kxz46cfQ5CvMGSzJVcNxRiUe+8JLmO9kAw54tQn5/e+xF3e3VCGCZ
	kC2Y0po9z+Cq9dkXS4bjxfoMOeMbJfSiQaS3WqsaTRRmhb55o8MNCkgHixVspTh63CCzkolfGpQ
	TC6l0s4vAMDRBq4AoToYPtF5/CQC1KBTk2Yxw13odOqNhxW0D0QiXf
X-Google-Smtp-Source: AGHT+IEkXT+98TQp45DgX+YBKvFXpgMAjENBsNwyM3diyCAlwGwRIxZ9UUwgzEGioH880//YYk29fFzYwiRF
X-Received: by 2002:a17:90b:48c4:b0:341:8ac7:39b7 with SMTP id 98e67ed59e1d1-349127fd714mr9556212a91.25.1764952907237;
        Fri, 05 Dec 2025 08:41:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3494e720a92sm540987a91.0.2025.12.05.08.41.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Dec 2025 08:41:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47799717212so14660065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 08:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1764952905; x=1765557705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x8vWFsGyx37EcR9Ck3rWLZNCzDMVpsZ+MmmOiw3mV4E=;
        b=Qf9WLcR9n3yhwwQn7/LHra9seDbk/GveQyrQBXb1V+RNOvta+8IOLsZM6zVJTanogM
         EJQntvh74Wm5JIq9sudbkxyZ7EHE4GROjVlH+AtRzLiuqqjIQsWxqxZnojHvr6IVJHmE
         w2CyTyA3FzoSpKpc7aQW7LXrwCqV/h9o8ltYo=
X-Forwarded-Encrypted: i=1; AJvYcCWUjHfGx1ujNkfBHbzpJjrXxaQHty6T0+08JYSsjy4ucB81RnwCMM25ME6uQXMMPrOUQRye6Z1yNQTJDQoNDKGP@lists.infradead.org
X-Received: by 2002:a05:6000:310e:b0:429:d6fa:da32 with SMTP id ffacd0b85a97d-42f731d1ab7mr11349010f8f.59.1764952905190;
        Fri, 05 Dec 2025 08:41:45 -0800 (PST)
X-Received: by 2002:a05:6000:310e:b0:429:d6fa:da32 with SMTP id ffacd0b85a97d-42f731d1ab7mr11348971f8f.59.1764952904652;
        Fri, 05 Dec 2025 08:41:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e62sm10059554f8f.35.2025.12.05.08.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 08:41:43 -0800 (PST)
Message-ID: <7f051318-0aaf-454d-8a85-b6d16fa10d2b@broadcom.com>
Date: Fri, 5 Dec 2025 08:41:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: broadcom: bcm2712: Rework rp1 overlay handling
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Phil Elwell
 <phil@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrea della Porta <andrea.porta@suse.com>
References: <20251117211503.728354-2-robh@kernel.org>
 <ae5d1a37-9af9-46a2-9ca0-83c276248931@kernel.org>
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
In-Reply-To: <ae5d1a37-9af9-46a2-9ca0-83c276248931@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_084148_742763_2266AA22 
X-CRM114-Status: GOOD (  13.33  )
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

On 12/5/25 00:08, Krzysztof Kozlowski wrote:
> On 17/11/2025 22:15, Rob Herring (Arm) wrote:
>> It's a requirement that DT overlays be applied at build time in order to
>> validate them as overlays are not validated on their own.
>>
>> Simply adding a build time target is possible, but it's also not desirable
>> to have targets which include the overlay contents and apply the same
>> overlay.
>>
>> Rework the targets such that there are 2 overlays: the existing RP1 overlay
>> and the board specific configuration of the RP1 (bcm2712-rpi-5-b.dtso).
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> The missing applying of rp1.dtbo will soon be a warning[1].
>>
>> The comment in bcm2712-rpi-5-b.dts(o) needs updating or removing. The RP1
>> driver or userspace handling of the overlay probably needs updating to
>> handle the 2 overlays. IIRC, I think we can apply overlays to overlays
>> which may be useful here. If not, adding that to the tools should be
>> possible.
>>
>> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
>> ---
>>   arch/arm64/boot/dts/broadcom/Makefile                 | 10 ++++++++--
>>   ...m2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} |  2 +-
>>   .../{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso}     | 11 +++++------
> 
> 
> So now Linus' tree has warnings. Can this be applied by anyone around
> Broadcom and sent as fixes?

It's an RFC and I was hoping to get Andrea to comment on this patch 
before applying.
-- 
Florian

