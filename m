Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2FB1061B1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EGyhPkMbZlKeaHk45N37Ig1oxoER5V4siPo1Ha7gTE=; b=ykv+uV5D9L4sbBIDKTCu85Ecir
	UEU9lCUTCfLT8ESHccGoV2naDWBV/5kCgQhTWqcq+2cxIhfVsgwJuMPek4i8GGwlTAhyvd4VZ902E
	LBn+0qgEajsnrbfpwuoBoAbOjJw8EJC0zRC/luuYvBpikFcHDzsosOGYFBBdEjRtM7zTXbqsPSoFO
	paveP8pFLPdrNdu/G4iIWJLGCJK6M++ezLN91sPMrqn1QTxMAf2CpkewrUV1iqRUJ1kRHwxi7AaER
	z2stcac2XpkJgjHut6ILCZDrLfnZG3hxKNYV7FQ3mhx/VxTwBfy6ZEpGjulVRMwvU/48Ii6jYlVlC
	SgEaP0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hap-0000000Bju1-2aZy;
	Mon, 30 Mar 2026 18:44:07 +0000
Received: from mail-vs1-xe62.google.com ([2607:f8b0:4864:20::e62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ham-0000000BjtL-21RE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 18:44:06 +0000
Received: by mail-vs1-xe62.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so1458964137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896242; x=1775501042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9EGyhPkMbZlKeaHk45N37Ig1oxoER5V4siPo1Ha7gTE=;
        b=cfErX43hExmqYO/BkjYqgmQpvvPh3i/BZcRPr2F4vmqIG3dfjlRym3s4LAvjYMQ5FZ
         9qBqnp58Ph+bI/F1YkEs/LRjZifh4zXbpbVmKqDIMaZxmdMyCwQfZWiEwnBsI5h1+eXF
         aSZbYgNiFgHXQwUVBbFPKCrZm5d6BnyUGxzH90hcwRDaudzp+xY+IzkK64kgjqkXmfXC
         KvY80Ifr8IocNYPK5ThZyfN241ZyHGy0spsy8i0G3Y1TM2SHqDRanLm3NkArkhw1oMQ+
         EWqdUuX4nL+KGQ/pSlpjYW3TJ0XvEIo32xppl1siTCiSCQxxiqOUxj5Um4D7Igy4Y5U1
         zX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0p1LQCKboP5NG7C+Z+ok+v2nhPHcQ203AXSVox1ztWI1epv+LvpZXYaEdvkEDd9ZvX3sCbpBkoxyz5VqKWGaB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr6Keurpi93F7c+Li2Ap5fflY8BOQPmXqr4pxqxyl+v35x2+BR
	k50nZWnbJxNwlSC+1qVRl8hnp36jnZEUri1RKmc8d+/R0Ps01GWyRjyyw305M42pxSA7FSlSYGY
	QMWbpCcuU665sppUjcYJivq2/XM6soI5Ypn11B7W8dZoajlDn0X/g5Jdr4TxI5qow+XYxQzAQMY
	SeUVnWG+laEtdKmWUxOxvduujZ7TbHG2Wg9MnjNnLpRYfBfqWRM4csETwaqHdCLKNBQrxZRPyKt
	WSYfU1Nnqyw0Jl2KsZcANcz6cW5oJ5MPSQ=
X-Gm-Gg: ATEYQzzoyKNO3jXgMMk1mRND34cVTAdTD155HtKTUdtlvUCpRNFRczBRstECIGn5XlF
	6pOi9cV6kM5ZoFk4Ffx4oXPJRR0EbosLhZwfUgdEJuEbuIx62w8UqQ2JeEcFRCSBuG7Udo3Ep/3
	W+PINaSVuTHPkOtcrjD8CjezakYIi3YR5oxlNApaWI6/kC+u0bi/RTiLLVj2Eu0XMnpeWoy12nu
	yn6yQzZyQGPAAJMwKk2c0aaKbiwUeICr1r7HBRmLZPnPAZ7rKJkb8MB1T7Kia1s05glCc73+P3g
	ZXVb4YgGtkhhNHmK3oWJdFO96SEv2FiSxKVC79CUlZR+W9isu9F9GK6qVAf0zW+9ZeZcXPMsWHc
	wDufecOESILjSzIznmwtKf+6q0myss91YIh0IG4cNKs6djzXsw61rqtatPYYT7QdfH74sgKSsth
	jnOfcDuB7QYK0/mg2P1g5RTDHPFQ3P7IGFomRuPajLWBlbgWtmQS13BlVNfqD0IQ==
X-Received: by 2002:a05:6102:441b:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-604f9319a46mr4721525137.32.1774896241575;
        Mon, 30 Mar 2026 11:44:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-60512b3135dsm1162659137.4.2026.03.30.11.44.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:44:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so1102437185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774896241; x=1775501041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9EGyhPkMbZlKeaHk45N37Ig1oxoER5V4siPo1Ha7gTE=;
        b=KsXOmOKpAS5oO8SluVePT99r0ukRsitvFqFoJjE+VmsF/FWHm0Dqx90L16+PW2mtM6
         PnwRgE8ajwj95hkdmm38+DtD6AHRXF0OikH8BWkUAOFPqosOVGwj+9n6KYsAV7eo3Nrr
         Epo69mO8meFGKD+Otru+ZyPzO8CGFTxffY1eU=
X-Forwarded-Encrypted: i=1; AJvYcCX7agVpIaE4F0/OPEJovg3mbQr5qK2RXh/bWPz6uOVwr4BAFXGBEsM0T4O8sb3tfiLHx1fRYLGXJQ06Et/jza+i@lists.infradead.org
X-Received: by 2002:a05:620a:2953:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8d01c333e13mr1875222385a.0.1774896240876;
        Mon, 30 Mar 2026 11:44:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2953:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8d01c333e13mr1875218085a.0.1774896240260;
        Mon, 30 Mar 2026 11:44:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f29135sm665778785a.20.2026.03.30.11.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:43:59 -0700 (PDT)
Message-ID: <0d494a0b-51f7-4832-9102-e45953e294d5@broadcom.com>
Date: Mon, 30 Mar 2026 11:43:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260328-v3d-power-management-v8-0-94336830df5f@igalia.com>
 <20260328-v3d-power-management-v8-1-94336830df5f@igalia.com>
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
In-Reply-To: <20260328-v3d-power-management-v8-1-94336830df5f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_114404_560493_75169DAD 
X-CRM114-Status: UNSURE (   6.78  )
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

On 3/28/26 11:52, Maíra Canal wrote:
> Simplify optional reset handling by using the function
> devm_reset_control_get_optional_exclusive().
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

