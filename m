Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B728CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYUa0y2VQ6L5ucliJrlQD3LW1X+q2pOFWv7Ws428vpk=; b=0K1wxO6Ybl7O9l+1bfSoqpxjnP
	puXp2CRDCjdqWrAuMwlLC3Mx+EZSDEw8mKbdsxgan/6CJuhZ2emcHBKIiTeleLwJOsrefvIE5GP0r
	2bJPSpEc0XvTR0xfdDC9zi8MyVlg2DSTAfz/GfQAbF4+W1J8Pd5XIEd6BLg42rrZ8qJX+JQwKyeRS
	nvDYbsNOy5moWO5txj6ho4iBncnMJPPW55GY5StaG2/sB6clhS6s2sN4XC1mk1NDLbeOOl8DBWcwL
	vAcvOCO7ojYeY/gy2IlRLeRcIryywzmlEVGzYOhgslDpi2OmUch27UVfBO3Gkzmk4ptSSyxinboBi
	yF26n9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgb8-000000058NK-46tG;
	Mon, 22 Jun 2026 15:30:07 +0000
Received: from mail-ua1-x962.google.com ([2607:f8b0:4864:20::962])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgb4-000000058LI-3WVz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 15:30:04 +0000
Received: by mail-ua1-x962.google.com with SMTP id a1e0cc1a2514c-966c991e6b1so1887176241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 08:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142201; x=1782747001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYUa0y2VQ6L5ucliJrlQD3LW1X+q2pOFWv7Ws428vpk=;
        b=g3tTlMB5mpvL3FjOTl717ExEeZA0wKPOZDhtUUQabvZOY7mn1ZucJ/WhGlA/Nqmvtt
         7TzQdhasPSRH5zDZgWawQ3HH1dadGdAcHrNMogETywN9NEolqburfy3F65HiTwYic0OP
         FwVsucN240rFplRO6usMZ8lB/x5EA7TXzAlkHhKSPB9wwpw1NF0XoLfJ+WmmK7XLvDZC
         RKvD7B0rHozu4XAKhVhYdxy78lI3dOTx7xFrgi2wrsC4X0g4+M7oknsy1RJZEGC3ChyT
         VZcZkVzKmnqoUELj888V0TqQJ/DkuQe4jxMj1gevjwu6crpTUL3krXv4OlBpKD4utSEz
         yAyw==
X-Forwarded-Encrypted: i=1; AFNElJ9gbn/8IqwsckijMseGm9rGehEmL8qXld79xNRyzoM6mT0SA9Ngu5jswn1Jrdl2lMckQGF25235oh6c/LovvhOv@lists.infradead.org
X-Gm-Message-State: AOJu0YwU6/mnlVXVapDZTrjlRjP/Bu2tcpazznHADZwtrARssNYtVo1z
	IsuV8PoWj0ZDenVHGbtnDK6csb7GtwxejVQr6ah5LMaF81K9FfvZ+08kF70ZRqFQXpN+C25Lz+1
	aYskh+YYLgykFXSivev4M76y9OYLwKG23AczOUoKnw8nQDCWMgaLzWmpCGCYsrxmHG4NwqGhBgA
	NH85Ino5PVQSOPKiU4FvhQsXCzl8jUsReqPq610XHjTq8XzQMIKDMAiV/LU26IViF+VtH6GHPYj
	Hofg1v8WkKnj4M+5jS/VVKIYduJ6vON4iwo8RG7
X-Gm-Gg: AfdE7clQ/39T07u29Rk7pLMZ3BTtOfx1qtansEK97Pr489q5yguMigWKsZkqYCTRkKK
	em/qSo+PCTOr/NMLspMIZR7cYmtk5cEjahZTwNJF4NcZ1vWaheLJygsBJy2vZtP6g9UcbY4FUyl
	DThz8lGfb5aYVBtUzsHw4yaB/pS50TMwxS1EdCRodNhHpD47jnh39lIddt9i4xuVJaQ6IrH4Bbb
	HVALoUp/31qdoIU7UhVtBjYl3+Y0zUPb4+w7kU+gHx85YQu881p/Lvu4qYMVEYwSn2d+5E3DZUs
	jJv/871III6DhaIj0eINrhDE131/hnnmt4jWFGx0qDFsglxQf9xJ5vr9JgxOexCxff84DCcKur9
	EG/k/9qAQm5nfOLP5pccYyrXQKe04Ole0M9M5jcf5Uc3Rh/PbEsKSjWPVxRoPaSYE/WGQzO/B/r
	+zKGI/kDBP3LKT4UE847sldB2i9K6hneT/hDYcWZnpd4gqXfF90BY=
X-Received: by 2002:a05:6102:5087:b0:729:a7d8:e56d with SMTP id ada2fe7eead31-72a795f634emr7254358137.27.1782142201031;
        Mon, 22 Jun 2026 08:30:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-72ba41041b5sm684894137.20.2026.06.22.08.30.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:30:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso3906391c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782142200; x=1782747000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IYUa0y2VQ6L5ucliJrlQD3LW1X+q2pOFWv7Ws428vpk=;
        b=I2NcmfiCPqg7fg4ymCNeG5uOkZ1xLA58JePFDTD461AR8Ng9G2KGPh1S5/TitHIUvg
         pWfKrD6cOrgeLfaYLs9txTxU9njnFak+jRrsK0fCy/pbul087VV73+YjNACSOqks7pV9
         0cn/TKAtaZnsp8JzSuTXa+lZI1Zk5wB0asnD0=
X-Forwarded-Encrypted: i=1; AFNElJ84GPxfU4Wp3HyyjAP+gLyftudgSXJqo++y4/zlvsqgxl3qSBqIyAh7y9PlLOIh0wi/8m/Fu4E2MyJJREY5AnC0@lists.infradead.org
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr8433120c88.11.1782142199903;
        Mon, 22 Jun 2026 08:29:59 -0700 (PDT)
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr8433093c88.11.1782142199204;
        Mon, 22 Jun 2026 08:29:59 -0700 (PDT)
Received: from [10.178.4.71] ([192.19.176.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adcb7aabsm9525774c88.5.2026.06.22.08.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:29:58 -0700 (PDT)
Message-ID: <dc06a108-342d-480f-849d-908b76fce2d3@broadcom.com>
Date: Mon, 22 Jun 2026 16:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to
 100us
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Ulf Hansson <ulfh@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260530204636.1115120-1-mcanal@igalia.com>
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
In-Reply-To: <20260530204636.1115120-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_083002_888544_86710D05 
X-CRM114-Status: GOOD (  10.61  )
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



On 5/30/2026 9:46 PM, Maíra Canal wrote:
> Commit 18605b1b936b ("pmdomain: bcm: bcm2835-power: Increase ASB control
> timeout") raised the ASB handshake polling budget from 1us to 5us.
> Surveying the pmdomain subsystem, 5us is still one of the smallest polling
> budgets by a wide margin. Comparable handshakes in other drivers use:
> 
>    - 100us : starfive jh71xx-pmu, apple pmgr-pwrstate
>    - 1ms   : renesas rcar-sysc, rmobile-sysc (power-on)
>    - 10ms  : renesas rcar-gen4-sysc, sunxi sun55i-pck600
>    - 1s    : mediatek mtk-pm-domains, mtk-scpsys
> 
> Raise the BCM2835 timeout to 100us, matching analogous drivers. 100us is
> still negligible relative to a power-domain transition and gives the V3D
> master ASB substantially more headroom to drain under heavy workloads,
> assuring us that the timeout is enough for any scenario.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

The response I got from our design team is that turning of the the 
"slave" should be immediate as it does not support multiple outstanding 
transactions, it's the "master" that might requiring bleeding out 
in-flight transactions and for which a longer timeout seems reasonable.
-- 
Florian


