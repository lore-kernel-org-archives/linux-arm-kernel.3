Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA42E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO+MGwpeAVge5dgHTV4frWGf+UqwapLJVzEqTcAPuqs=; b=DmiJXQp4JA4iRBUIWMyyA+DlSZ
	wtpXyya8iqvm9KS589lI06lc86qRjnfmmGS93DIoB+s8mkC9CxEZYaT35Inz/jzOY9opJdgj/AfiM
	dcE11QFBAetoPxj0jOBWt6LM+yO3mdppUyQE7Ty9m+osS2/qrz3DdBft4M/EegUO9UhlmtvzLfnh5
	/tfrU1IuTJQ3KyiOgve2RrEOtCriwxjoMFy1Pp9f8KhQw5V+E5PU8FskgFW2npPHJRMzY17AOlJQk
	LQ8gob8UZKF2FpoMupDN2WrKlYkKpdDjKXqT/tXoKxBhJHyWMYjwQzXk41Uxm3qQQBsqHyOsgbXPP
	/Qsr3/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL451-0000000CHNI-24ce;
	Tue, 10 Dec 2024 17:31:27 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL43S-0000000CH3z-0ul9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:29:51 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6d87ceb58a0so46686346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851788; x=1734456588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pO+MGwpeAVge5dgHTV4frWGf+UqwapLJVzEqTcAPuqs=;
        b=dJ33pP+OJH2ZrUj+cUKJaigS+MPoj2uXvvZzVyBAGJLNuwP32DOkK3KPDN9B8mG8Zu
         lxfwe66H1GcEDaILm1wOKJELBDJ3RBdc7eZ2/84gGuXISQc6kQi7f89LFFhOgY8uuPb/
         /v5JomW8glsEj8j7Ikr+QSyoWHU2I1lkfJNNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851788; x=1734456588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO+MGwpeAVge5dgHTV4frWGf+UqwapLJVzEqTcAPuqs=;
        b=e5neDB7YxYLQPW/zsk3QmZ63J0L86B94OMmFPEja5f7RFLCy7Qh8/SOi7cBt36L5KZ
         IERywd27oOYbknhc3zgHf1q1Nqqc2Gmb4PugB7ceWMCHj6D/LPRw+MdbBy0PBp+z1VMi
         Q94LiB8PGotadgsKEqc3VnX5xoJsB759Pk56UWeiDlxcJ9KAeQR0xIOnDRfgO5yW6tTP
         3eeYZe+IwVrba6meb95AyvYHkSNv3byHBxNY5o0PdABIvjv8KdA9NIH4vRh0z9DBb/cC
         BYcBoWSRcIUaEcMFeXkrZNMW4LFp7NA1L3r+sM2IH8vu9PedXHLlAMFFo9fbOb//nurZ
         9OtA==
X-Forwarded-Encrypted: i=1; AJvYcCXJzFk6UWUibtBGKtlNk7fBS8OwjhdoFh/0XzGL0rEAm3ERjc9zHzp65P93Cg4tBdwME3nowDS2X+v1NTefyMgO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+3LgxNOB2tjRw8rsoHUQ4QGvcYpfs6dp4sVd/sm1oa556rmIc
	rg+Cx1/3yWTkfmg7XUvlWTw6lqBUCGOTP9IW2fQotYlnOQ0yUO4XqdUz9qXwl9cll+F0PT0KVhA
	5FQ==
X-Gm-Gg: ASbGncuNt3tWkjoJ5oJ/9voyuhe9+Q19MaGfsT7erN0BDmhuFNmtMdJgoQDUI0jOWEO
	QbO6LGfPl0oH3zhpBbmhjRGIjML6unE65XDhYi7rekx6mYOUBBM5CkRupiYv8BIvzzGfNExJkfY
	LfPVN38nE/8+3adfFalTMECSVoc7eRBRDXKrD6oqraXbkeCoRaRoefDdp4qgy1TCUXTuKNn74GY
	ZI6w7qJDokV3je6RaOmFnsSj+uMaGwbKaB01KYsyg3kSPoPtj30bbSLJ70xQ7NEBBuaoV+3P6Oo
	obNFn3rvO8+0eC6Vkw==
X-Google-Smtp-Source: AGHT+IHYW16q6sKxZxQ2s76au6BvsH9mlgt3o6j1zViiWttw+FsxPXhlL5JgqnbkA5PMSrtUja4vnA==
X-Received: by 2002:a05:6214:194a:b0:6d8:8667:c6ca with SMTP id 6a1803df08f44-6d91e415bc6mr71627646d6.32.1733851788248;
        Tue, 10 Dec 2024 09:29:48 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dabfec80sm61624956d6.98.2024.12.10.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:29:47 -0800 (PST)
Message-ID: <fafda63f-687a-4a3e-99f9-2a6abfbb5d59@broadcom.com>
Date: Tue, 10 Dec 2024 09:29:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/9] net: dsa: provide implementation of
 .support_eee()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ar__n__ __NAL <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
 <E1tL149-006cZJ-JJ@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL149-006cZJ-JJ@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_092950_265202_D5D7A191 
X-CRM114-Status: UNSURE (   7.93  )
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

On 12/10/24 06:18, Russell King (Oracle) wrote:
> Provide a trivial implementation for the .support_eee() method which
> switch drivers can use to simply indicate that they support EEE on
> all their user ports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

