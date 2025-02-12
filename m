Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A50CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lasNycot9OROMRz3Tf45TsHUJIexVqDWGvappPiMilU=; b=A+sl7bYpgF8B5Qo8tJPHYzv1mJ
	a0+H/642fOMI4aFDz+hfzlcYeY81CoB15irPT1qnOAvH+5BzUiPXrqMQuVYI2k180zZTU5IcFfadu
	SsogVmdj7IhUkENi40iwD90Vye7xAMG+rBNnwfNlm97E77g8XV/HbK0vXY5sfUVkJMVQxuhW4lWGg
	o02ZOgQXLN7bmizMydzqOdCsfcVJhjslLYxT/NnvBaZzvjMKsNgXmmLI19dYG/8sRbmQtcORP8hda
	IqXBWRgZIbpv3NeU/JXTX38VrxWX6JXMcp2vCOxcUe/3GRrY1GKtQAX1YgoTKlogKtVKYsA/Uapnq
	SOg272gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIW9-00000008enq-0T7p;
	Wed, 12 Feb 2025 19:35:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIUh-00000008eXq-379V;
	Wed, 12 Feb 2025 19:34:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5de6c708315so65227a12.0;
        Wed, 12 Feb 2025 11:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739388838; x=1739993638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lasNycot9OROMRz3Tf45TsHUJIexVqDWGvappPiMilU=;
        b=M9/jpvLaVjv3zvviXzp/pk4YCub9t1QtY4esbVfCUUgJ4tVOdiwnZMaY4/xLtRNLOb
         WizZDWeRzcRwJ+hTGomLmbsn6rOcNviBuAcN4whEfmIi8ST29amqrWra+cJckhElpRyz
         NL29d0Cayr8W18vzXDgvRKcEwWBsktTAMn1nXVpxFxOqgUroi3d9H+hWp+OppXF6Uknz
         HCW8C5dtUT63sqcKzhGg707khDoxP15nax7WexylcpchfLey5tWiplVYWO3KMbocM/vL
         DER66cL5/Ln775E2HWq6mRP6bwFtOOa4S42m7BygZ33LqJZNL+8Es2k3Cd6ibKie5k+i
         qt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739388838; x=1739993638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lasNycot9OROMRz3Tf45TsHUJIexVqDWGvappPiMilU=;
        b=vUQFAYy08NyDaejf1VxrBbu8GCxoW2MlbyevqWgXjEdyd8gMNKCF17XGDf8hofZbgf
         8BXSCtdyuqupf/xA/jBj0yTVzfMmQHe9h/xZn/ZAQP4vaYD72pXXrvEdrK/q3rHHGBvU
         yM1AMJs0Gmo5SrY8q6YkIN56/S+bA8gpvrLMTzNHoKag0p4q/eQyB3f6d+3wVP6ouQHu
         w2mABUuupiEsskrA3lBUnM7U2DGOmbmKShbtXdDkmnHCYkS7PUqx0HdW0JGUv8qeH7tz
         8tYGgof6rXI4fXyiRwVPHR7R94dksQNd3kzCdp2E5QuoP3JaVYpsHkm24yHEnS9duHaY
         q2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG0GL5aHip4qhp5CkAyIZ4qUr23+YQCjxTyU3uQx7/1ycXKg+kNr6b8v7epLQLjhzF3Sz1Hz/oG3wwd1/ku3s=@lists.infradead.org, AJvYcCWpS4YBousf1xvOorz2M0+XTIX3wGplKzIv1DMatMR9ioYrqQXuSWi6hQEU4M23PWVv9iGj2HrxtClQ598n0mQr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6xcIh/MVpMlBD1Osp+5r7z1AaXa+neJCc2ETWU85lSDCgP2qr
	UtF4d4WDMLUfLDrXNhkVgqVVNAuApLqGtOORNRVrnNeEN3cic5wC
X-Gm-Gg: ASbGncsxHG8RB5k8fPL8wxkRo0uFqzRlT+2fJCHYWt8k9lUkdOZ8uHaJfS1T9kQDoqW
	0QN1TOcEz+zKrj7xreLC1WYtYiV00NxBxuij3dHefRrzmBNvK7H7Z4unCTRl/fYH2m6hlZxZ6nk
	ETs+yvvk//HQgnprncjMwaCTOA7hJSA+yGJQrshR265EYTAD7dZocFufAtJb/y4EkhuN/mV8FpI
	hsArIJwaKP2z8zvaCTHRGnKPNKzvXOhpRE0ULLT63cEpGmyZ4OwdhoviLKnyPxEU2biUK43QWmr
	txK0EfkzZ5dbdqih1BDx3jx59K67ESaceBHaY9w6+4IU6B2lim+oRapgrCbIhE1yEtpw3lTgMtw
	GxoTqOGRGTBPJ7OwY/xEPmit5x7Ogj6qc4+2ckl/Be6o9u+GWx01p9GjPtuF4p+lk/A==
X-Google-Smtp-Source: AGHT+IHkmVd30f3deykKxL2ZIUBA3+EnIW5l4h6W1mPQ91mHlha7qyevukukOy5IENG+fcG0BHpRFA==
X-Received: by 2002:a05:6402:2106:b0:5de:4877:ef41 with SMTP id 4fb4d7f45d1cf-5deade00a82mr4171173a12.25.1739388837360;
        Wed, 12 Feb 2025 11:33:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de63a89b6asm8193610a12.46.2025.02.12.11.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 11:33:56 -0800 (PST)
Message-ID: <fe6509ab-c186-47c1-b004-4e17a875c5c7@gmail.com>
Date: Wed, 12 Feb 2025 20:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
To: Jakub Kicinski <kuba@kernel.org>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250209110936.241487-1-ericwouds@gmail.com>
 <20250211165127.3282acb0@kernel.org>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20250211165127.3282acb0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_113359_785743_C0CAAA77 
X-CRM114-Status: GOOD (  12.43  )
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



On 2/12/25 1:51 AM, Jakub Kicinski wrote:
> On Sun,  9 Feb 2025 12:09:36 +0100 Eric Woudstra wrote:
>> This patch adds QinQ support to mtk_flow_offload_replace().
>>
>> Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
>> of PPPoE and Q-in-Q is not allowed.
> 
> AFAIU the standard asks for outer tag in Q-in-Q to be ETH_P_8021AD,
> but you still check:
> 
>> 			    act->vlan.proto != htons(ETH_P_8021Q))
>> 				return -EOPNOTSUPP;
> 
> If this is a HW limitation I think you should document that more
> clearly in the commit message. If you can fix it, I think you should..

It will be the first case. mtk_foe_entry_set_vlan() is limited to using
only 1 fixed protocol. I'll drop the reviewed-by, amend the commit
message and send v4.


