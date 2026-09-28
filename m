Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E37CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGjdMwJsnua5C5JwBesKhZf4WJKUTjxVN8HV5NiB4F4=; b=U8JJOH8+YPZDmB2K8e69xgp0nb
	NemcISMTn630ZjkVJn2eB6oBBc2Fete809LAKmWnZcsCeo/pVBHz172dVJVnSGhsl1vHALqJO+ma4
	E8uw4mJzFrHs8LPE7tBMF06Ndz+zicdkq76iSYe2YaDkqSVld+Wv3/l5aXZUvkUB4qfsbL9OdVEMf
	q0cYn81jBpfB0R/RqyTeBwrYmwW4ksjJQO6r1iR6y2H1bieHGrP3moXvt6JqO2IWFnhx3J+6Dz8mu
	M6jgAhIiUFii6IiYdrkUcHZaj2QHGbz8F0wvHtUMYeWoRmK0GNGOs1YDdLjbJ+KnSebLBCqduLVgg
	zQ2bF+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG3f-00000001JcW-3Ydz;
	Mon, 28 Sep 2026 18:26:35 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG3d-00000001Jba-2NII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:26:34 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-8812140819fso541562b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619993; x=1791224793;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XGjdMwJsnua5C5JwBesKhZf4WJKUTjxVN8HV5NiB4F4=;
        b=QM0IRsIwCLFfNhS5wr5YtiSFYuF4H4oeLYNGB3PQAVUNurc3TY75K4ODqQABowdc9q
         6CUry3RUcC2ig50M67JHscwNOZbW7chwnJY1d5iZDUOmIJFV7cNNMtgZQKFEPb7XeV5Z
         NksTz+ez9NG0ufN0E+mkgFyS7MMgemoeYes4gzIKO4rSiKsH97RMDYONgAedSL+h4WR0
         zItjMfZjUeO7+P2x1MF80+9qU2qo4kY+1MxYYaymZRsUCPqo7534mDPFifV25ap/rrXv
         COvsIxFmCwt2tB3JOujcQhZ6YzIQlslq7jQexOZKi1ga4Bz3vn5oD1Bph06BrtK/QzNd
         6X4A==
X-Forwarded-Encrypted: i=1; AKwUvBwCtpd1PXfeVlXfjzN2gEBcQbR6Lna+HhVjNhWDF0MyeTdiqk82DPd/2MgrlE+vZHg21HjmUHToOPzEpDs/HNoN@lists.infradead.org
X-Gm-Message-State: AFuF++ksiBkDW7mljf6UuNUbDqscnrb6U8zBZqPD1ghuH4WADqz99xJf
	MxF5LdtgdNYd3NECbXf+zEpofjL30ZF2xm57R8qLol9lrlUP5HyPHLnB94CaLJeQhIHWhTgWOoE
	hqt0+lZlfAxWZaGINzZgEgV0veXCGpJlLdMkXgc38mBDw4/4l4SsaCXm+weLtqeX/8BzOugHGGU
	cIEytlWjFqPnh32USR0ycT+P/KkhWq/J2QfEpiL0Z+iZRoc9//3DkEn6P0qSfQiyJhAJ9CBrmTA
	3bLsgIl2tnASY+fJDixi2bejumQCi5gbiU=
X-Gm-Gg: AYBFou1t7oppPH+YutrgmJ25NeLU5Lm5+4RFSmSUelUiuZbK5J1Ssx4JMeXaFyWf6wp
	vtQWYJMOREVttQtaeZYaaGv9cTUWDAoB7dYRUxjIGr6EWK/9yfaeptBgzX8OYoYTQNgtdKVavYC
	kUTTTff71KA9QkJ1lc7XXHzIFWo5X9sTsdRYALUHSlJ89xWVc9fQcS8yei8UMqXK3b0V8ZsxSV4
	oQ8jgWI9bOqNhh9OqD2YSfVCmag/vPfz7vTVOD7e5Q+GC3t/Gp+Vzc7dZ0mDcVrec/5RQpheJCl
	cZZYpAgVlUXwzM4jhHhI/wwXIGGwmZPstv56QsMrWIsBC85di8nxYxSTXBPK9gzhWUx/Z7OyouT
	ZaD/EF39NnZLHbQxHA/yg8OqaYV1/PxyX5lRahMGoncTuQ6gzURtLvRlWM+MrvV6OfcWf3koBnZ
	0950SZel0UHghXrKjjU35gyv+ByFTw/2kyMVIzyHTT
X-Received: by 2002:a05:6a00:6c9a:b0:880:d04d:1502 with SMTP id d2e1a72fcca58-880d04d1618mr6079634b3a.0.1790619992652;
        Mon, 28 Sep 2026 11:26:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-87ff6da80a0sm5494872b3a.0.2026.09.28.11.26.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so773839eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790619991; x=1791224791; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGjdMwJsnua5C5JwBesKhZf4WJKUTjxVN8HV5NiB4F4=;
        b=YK1k2YxR+O9qAvSS1u3nr2fFi8RBZzQcFoWLoAUwIb5eyzJiN00AM9VGmahYAJRNe0
         /7mHqzbIjkhXB1y2sl28/CotTPVNe6SrLhoGjE9Q/illk6HMH/v7fb/ZfH10Uoejzcjc
         H70JUb5n48Afh21zVPNffg7zRKGKZX8Sna3xk=
X-Forwarded-Encrypted: i=1; AKwUvBxvWM4J4J9wUhzbGPz2Jl6kuKYG+LP3XtcXMzYnwahAiAHTEUcyz+L9DgsxO02OAqDrrbeSxKwQkeuFHLX53ygG@lists.infradead.org
X-Received: by 2002:a05:7300:3081:b0:344:1bd9:1f0d with SMTP id 5a478bee46e88-3441bd92155mr11160572eec.21.1790619989872;
        Mon, 28 Sep 2026 11:26:29 -0700 (PDT)
X-Received: by 2002:a05:7300:3081:b0:344:1bd9:1f0d with SMTP id 5a478bee46e88-3441bd92155mr11160501eec.21.1790619989070;
        Mon, 28 Sep 2026 11:26:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm27663297eec.26.2026.09.28.11.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:28 -0700 (PDT)
Message-ID: <7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com>
Date: Mon, 28 Sep 2026 11:26:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
 Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1790606188.git.andrea.porta@suse.com>
 <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
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
In-Reply-To: <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112633_605746_C2A6A3B0 
X-CRM114-Status: UNSURE (   9.66  )
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

On 9/28/26 07:42, Andrea della Porta wrote:
> From: Stanimir Varbanov <svarbanov@suse.de>
> 
> The RP1 chipset used on the Raspberry Pi 5 features an integrated
> PWM controller to drive the cooling fan.
> 
> Add the corresponding DT node for this PWM controller.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Applied to devicetre-arm64/next, thanks!
-- 
Florian

