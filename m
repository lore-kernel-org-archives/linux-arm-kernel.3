Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B2FC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjJwvSHHqCuZQu15hBig8Am2+A+2y+ZPzkxA4Bwxu/A=; b=sb/p6bXxxfp8IUwIGOe3skd/vW
	/WiO0XsgTxPgwndsqx4Ux7GuzO9pm2KPf3IhFI5mnnd4m/8/jnN7RVz200HGWhoetkMtFjOvL/SjC
	HHVzMB9y/9A+LhG6TrzCF7EbpdyDpDrP+kyoZNJKVRjaVyNrxHcUcQGB4xr9/NpCshyRSoTDv5mP2
	uUFGLHBtbeaa57sd7xa5oY/WDeXmWuijsHw0GcKXU33NosFD3AK8JYx4Y0qdzZS94GR2HhPTyEHY5
	enQvdZrBH9vqgLf15vtGCT4W2pic1AP8qPwe9x4FXO8O7YY43KgXOhcc1JNM+ZIiq5Zc/zPNBfLLf
	ciQxCmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpplL-0000000CxMv-3loP;
	Fri, 31 Jul 2026 16:07:07 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpplI-0000000CxLu-3C3h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:07:05 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8485b358552so1360792b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514024; x=1786118824;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjJwvSHHqCuZQu15hBig8Am2+A+2y+ZPzkxA4Bwxu/A=;
        b=LS7EF1nX72cuBXJSGcwCphYpHNxQBv7jm8/Sxk5ux3Eac/qYum+moFHWbyvulHGl8T
         Q4SakYdE/icv55xFFty8bhZttazmm3Se5vS8Iuc2t/iGxyItGRYTswDhDysiDBNqZ/PM
         mvzfcsh8TrbIa8pbtu4U59knQIBt1QzKpudyxoD6zfkzzvwOLZBRPi8sXVWdXmbBwcpn
         zSOJQL/fb3Q+j6DgqV7Hjm8MjLQWmdaXckE4L7JPr03R/lL9iGNi4HOhoSy/a3xbAll0
         WnydWqztbvPMUAT6yMbG2S7BUTuFuVPgctElAOrltBzITRSgfBC24VM04NEFVeQzIfJC
         y1ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RohtQv+rtPRnt9QdapUQYDUi9ZJ50rKOnb010vP86gXG9CRSAXf+IutD27gBmgZHhwADX4ngg5sAsdicszL/N3E@lists.infradead.org
X-Gm-Message-State: AOJu0YyEAyv0qyl8Q+WdTn5F8JdF2QCito2k3UNPHhwvabFxbgr/ukWs
	srH5bp6jDLuvRvzYxpsSlFCtZz84+dxfZMga7kwrZnYpM1RV88Z3ROFW0I4ep+bTxzvNW0fA8ps
	EMiwPxImlO49C0fvOKmP5V+HeJAFX2Wd4XUHjdkRowrBSdX+Y9LDqwmZdn6cwURhnksCjNufnfN
	bLSNeiujPCUd7gTr1bVX3nKYq2jwtMzv60YAt/yde+HxxcUNaLJ2E1ybVR1sMh+yWw5ktKUjsiL
	ex8hBdIkrbnvQDKZUDhTNtu9oTJZdsJuAQ=
X-Gm-Gg: AR+sD10d/Zp7jMQGkyzqdr62MPsquV/HWI9glseGEWPBwZoqD5qOhts14+WgQR3SJlv
	qV5izWWzG48w2PvexobI9Cb+ibd8IjuYMc8/hbmY7CdRW6zc9BDk7psq4tL1B01mckxKTEloutx
	d+4GPRUm5mHU3oT6ljiQYe4FKXLaTs7claWUzn2nVg99heNLPaYC+zWqsWLBOW86KOG9lguMKx3
	oMuZTndiUyMS1Sox3jhoBmWRDeEttpanAqY5eI4HIA3UI514ug3lv5HmRglDJdO0q1QTRw367Pk
	+YPsG0tjJR5BJCnXb253Gh1cpzo/fXjBktTmQ/XS82q5yafA8xigrJeLukEpfjoFaBAbv5I/Wbs
	59dZvifIUgRpaZyR4u6MJp6oV5E0oUYzAaXfzR4+OmKPGhC2o1Ou6VD/dsCITtaOtEixwphiAZb
	lNi2p9PXhS+8XxZ8bJaP1sZDZIFk1tIED26xmV4BM6
X-Received: by 2002:a05:6a00:300f:b0:848:51b3:f3c2 with SMTP id d2e1a72fcca58-84ee4813995mr269449b3a.33.1785514023721;
        Fri, 31 Jul 2026 09:07:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cbe39657001sm126791a12.3.2026.07.31.09.07.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:07:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d004f13426so14009435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785514022; x=1786118822; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjJwvSHHqCuZQu15hBig8Am2+A+2y+ZPzkxA4Bwxu/A=;
        b=QZUFnoSmWCfB22v/kZqnBtdqdwKMkJQ8Tb3HL65AJq9xu3DtMWtpw4j46Aeu17VASA
         Z7onHU9m5/PaqMYPm/aApqn1VVuZE2k3A5oIE1A7M8xyjiPeKysPUE7wWSr8Jm57n0Vn
         uTo5cDQ6Nf+97Ivc0jqVrugT/lZ7mng3VzpyA=
X-Forwarded-Encrypted: i=1; AHgh+Rq6c7WhBxB5bIBtP3uYXqh/tq53BrSZERyxLdOt/8wy+PvZhA7PWWwn1UH9K61S5ouX5OLX3G+64mSObTA6IH62@lists.infradead.org
X-Received: by 2002:a17:903:46cf:b0:2ca:f40a:be76 with SMTP id d9443c01a7336-2d0524290a3mr5116415ad.36.1785514021695;
        Fri, 31 Jul 2026 09:07:01 -0700 (PDT)
X-Received: by 2002:a17:903:46cf:b0:2ca:f40a:be76 with SMTP id d9443c01a7336-2d0524290a3mr5116015ad.36.1785514021156;
        Fri, 31 Jul 2026 09:07:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm8399159eec.0.2026.07.31.09.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:06:59 -0700 (PDT)
Message-ID: <5b71e1cf-6c9f-4c94-976a-648bbbe0926a@broadcom.com>
Date: Fri, 31 Jul 2026 09:06:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: raspberrypi: Fix typos in Kconfig files
To: cleverline1mc@gmail.com, Florian Fainelli
 <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matous Hybl <hyblmatous@gmail.com>
References: <20260731-brcm-typos-v1-1-740551aba0fe@gmail.com>
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
In-Reply-To: <20260731-brcm-typos-v1-1-740551aba0fe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_090704_794803_58C94ECE 
X-CRM114-Status: UNSURE (   6.20  )
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

On 7/31/26 01:17, Kryštof Černý via B4 Relay wrote:
> From: Kryštof Černý <cleverline1mc@gmail.com>
> 
> Correct minor typographical errors in Kconfig help texts.
> 
> Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


