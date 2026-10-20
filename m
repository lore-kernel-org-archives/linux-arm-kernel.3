Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C7606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vydTR2Yr;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EMAVoeNR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=; b=vydTR2YrKImEYBE5NbrtDDuJ35
	tXPHXvZmZFdKOtmp2pTVRWxE0Y8MGLypnpjhA55dNZx1YqdkI78fMjTwKkmrjNjnlQJyEbA4Y1JXP
	LyoABJZ39lIJ7SvvF0KH1bpDZPmFussqYxujuIRxJV38EHuNWaZVuhD0Z2lz7xBvVd/55rOsLevOk
	1JxCoOTFQ9lf9U58eD/88mjirqowDTM2hVfd79cghiQxur5dtVdSlSfTcMTmx9kMdO10N+jWlaGD5
	OnXdIW12KbnJG+nhPTrW6Cdvm+im6KVwHK+n+fYA7EA1vm7JIOZYCgwGP1C5EO65qwWPKOjU8XZKu
	efbSBSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvX-0000000A4au-2hSg;
	Tue, 20 Oct 2026 15:38:59 +0000
Received: from mail-yx1-xb162.google.com ([2607:f8b0:4864:20::b162])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvO-0000000A4Zv-47uK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:38:57 +0000
Received: by mail-yx1-xb162.google.com with SMTP id 956f58d0204a3-677dbe051d4so3037940d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510728; x=1793115528;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
        b=Gvh5hErVWLvx965lr+YCouDucFLVVpRx2NomVs0pc6HB6qUunlvdAdcaxpXuB+Hs3v
         JpwHGdlRYyy+T5TmlJif+KVwnVCCe8UI2zwIsBWnnFlbpSPWm53fuq+dsT2eI0t+4Tsb
         xZalFeZiM0C76VyAQz9PvEDAacMdeNlJRMWPUTgNsiKLqDLONxDwXsmqqq+2U9q02UiJ
         gGF4v+0bwTQ8SiOojsYW6hw247BX2ksjFCQGXX9jgcHmiRZ2yuTBcCcpQve1sKGieczl
         2nx692hU20dMfPYhIHwnWGlfXPcPnGMyC35KU/AIV/KgmqEVA8mX5D+9vS0B1liYbylr
         PEsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUoatbF0i2GHrYFdLNc3CQ7xX5+hHiySf3Bvy0N4BpuqyARvn83umkgjHhqqesTnfRsqyR/0InpKFuuC0tgqXs@lists.infradead.org
X-Gm-Message-State: AFq9FYJBDjXzZlF2lD+ybcLGE7Jqps/686qSBFWHb7AwuwGp8vodVXg5
	Zfi3vK3Z4gB4SW5Z3RaQuvcv/cm0uRYjaD0uMaQZHN348FRjd6Nri/ub1b/f6oB8+1HOO6pa6oy
	j6yyuw2zJ/QVknze//1ERBCB8WsZuUS3w0N/qWK4eoLniruq4X9D1r2ShGhT9Mn8wGQ4I9AaGPM
	z9FzXGjjzg+XBhVC6DoDOLLAYMQHz5nRoy+M7RQDjxL04D4ps4A3m3brcKPiGqvJxNMudgh3pvM
	teNZ3kU39OStt9i4NTiCmPIl+c74VZ/da4=
X-Gm-Gg: AYBFou2D8rQr7rQvDu2x7Z8acvcXAPxmv/lMoDMbPfdyYV6z3h1MTAl07qnq8bom2p7
	t2oh3MwVDkdGOlSnoQGjfEFimR4ylFS0g2dE5x9PnfGeP8cWoJVw6xvMjWR/hlWnAm+u5zEbts9
	eyfekrKOdP+vLtr6eKQGz60USOuG0s4k5ljNoX5OD3eE7uaogUfgpjyz7ze17VmKu22Q2Wj3YTa
	AXG0cDFK9J/TGmaRBqOOOx8TlN5ytpvth1EBNuPo3747eJAEIZsKyOhkPmOc7aoosJ2nWySkJJB
	5LousllWQnaZ0Nt+epF17+108wfhJwT5BuaaUB09Sy3x5HlIf0K9hEgrrF3YrykdcOW40xNhkV1
	yRba3BszJfbVvYQCFH2c12uYmjjirhkr35BILQbAOqB9LDNjsLXyUcyMcSN8IeRwYfPxe3kuQgo
	GeUWElZ3RV+T3NgaF+11AhzVxkWbx8b84XfurSndbxClY=
X-Received: by 2002:a05:690c:c615:b0:8a8:4cd6:b366 with SMTP id 00721157ae682-8b0f2165743mr27745877b3.34.1792510728196;
        Tue, 20 Oct 2026 08:38:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b11b82956bsm242977b3.38.2026.10.20.08.38.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:38:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338ff2cf14so65317291cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510727; x=1793115527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djXZskGgNuwcvXxJ7QSBd5G1fQCIwJ3UJCCUrLYgW60=;
        b=EMAVoeNRB7c4ImjmqOFqzaq5J/UoM8d+l6sNS6DjQavvFc6k0GH/l9s6cREFHF10Rj
         XeKPDJKG1QonAWNU6Ngwxh0ySA/5OqOLEjf4jUi3XJL+tQJUqglCjWEGWI/+30Q2VFGI
         /360U0QhxCaomT4akG/TtT7OO1ptMRLi2zrgI=
X-Forwarded-Encrypted: i=1; AKwUvBxiPGrdjbgJUK9qDNWG4PS2f/vwVoR8tjDV1jNjZio8oAGnetG6mtckg3ALUt+1u7bf6UcP1eEyDiMhOc8FVPMn@lists.infradead.org
X-Received: by 2002:ac8:5e06:0:b0:536:4cce:67df with SMTP id d75a77b69052e-5364cce6af7mr160757461cf.54.1792510727432;
        Tue, 20 Oct 2026 08:38:47 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:536:4cce:67df with SMTP id d75a77b69052e-5364cce6af7mr160756821cf.54.1792510726868;
        Tue, 20 Oct 2026 08:38:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5367b3d1ccbsm36400461cf.0.2026.10.20.08.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:38:46 -0700 (PDT)
Message-ID: <f918c40f-f073-4ba1-ac4b-7765c42a5cb2@broadcom.com>
Date: Tue, 20 Oct 2026 08:38:41 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083851_101751_C8EAA768 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> BCM2711 has a clock generator for the GISB bus that the firmware sets
> up at 200 MHz. The GENET MDIO controller runs its MDC off it, so add an
> id for it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

