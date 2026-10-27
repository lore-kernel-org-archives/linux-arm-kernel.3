Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11515606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=icCm0yqD;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bi9ECv+y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+6N+Jms6EdQM8CFjQ6BDl0aRKTJSrgGB/6/Z+xj6T4w=; b=icCm0yqDs0t1CO
	KzPrLG3NLYgmvLe2OB9r9UftldxmozEFNDhqcDExSCi6XoZA7jypWcjGiCgR9p2la+tt5Q97GiTdX
	iRluP84BeWVQb2fcXEkC0Hru+lEu79hoy8VHg4Syrev8qHzhtqi1/L+YIHPglbKodHYn1jybiKL8D
	zQ7Ng/8ZXPBwL784uHiWTVmomQhe4X5ah0bCIqTwX6wft8GizarZ6WLcrSBqdBW5PJ5Ux3VP4mwnb
	1EHe5/tcEi6bYJ357KP6sC8UuNjeEYeN4mZpaM3+nTbdsv4FSA4N/LoQu2/Lc+jHGqoOctYeAG1f/
	oDNERn5lpm3vm9X4PUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLq4V-00000005t5T-0LbZ;
	Tue, 27 Oct 2026 22:55:11 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLq4S-00000005t54-2glj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 22:55:10 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso268436a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 15:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141707; x=1793746507;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+6N+Jms6EdQM8CFjQ6BDl0aRKTJSrgGB/6/Z+xj6T4w=;
        b=thH4S1BQYg8YF2A0XJvjbtAckOpvKr3hEiBAuOBCqLef47gok3E5vfdaO0IurdiX+u
         HTfCO5HR7+ZHqBtBY5fQO0hhDvXv5+Ww5rKXP+7XMP9nnOQ6WEliahMKddzkt133zgYv
         icjYTt19Wgpb+b6fLrEr3pI0pabNA4xGo2VEN+OR3MEvqdCZbNXIDKZRmn2fXw+45UX5
         4FUINtlQTU4VBLLsCP7sfISZ7BBSM7p+CnZDRgqtQeHUlbvY3jRqJEBYC6TwA3kexpte
         K21fXOFqBIaSpMAwndyhZh2Ajk/ko6AP6FdwAjWT5IUInb46Jnbqb5jsihQ2MWVp6WfY
         mDog==
X-Forwarded-Encrypted: i=1; AKwUvBwviliBJ73400XJnzEm7fPaA/7jS+mDt/C6FXAMngxMxVu/IZbTqrH47V9ZzOSbBmtnO8Tauo9ZCK5WlvipgrFB@lists.infradead.org
X-Gm-Message-State: AFq9FYL4b3lHXRmuCo5DegRIiTVDIDsfQwo+6JliQwTNh9QtaUg5IgeJ
	rX81vb6uOT/x276Mf0R6KgruVpVp0Fv5uI5MLxZIz92WehY9qrZ97DAmczdcmNN0ZvtPL804Sb3
	M7bDODY9wd8Jup5iyPxU/obRhgXj2RR7yQS+uBf46Ot57EsXYDg/oJlA8S9jp/swUC/5x4+g++i
	PhmXloySWmeoKGMBMcUnqCUYHs3hRmMTpLixNB0kpwXqLAcjIp5NDPXlh8wAqBDXuP5lcL25g4K
	R5oGReCfsW41HqV1xfHpabFVmCJ/izhudFYzA==
X-Gm-Gg: AYBFou3atCvjSTALabyoX8et1Uoc4DIFNRpFgBYSPSqVWPb4+9UIiSraOlA4K7t41VA
	mFFf9CoaWKVtPXnBHspUbYe+2Bx3f9/oAtyvrYhMoHJ5iUPHObJLN1ZEz+Ob+sNtbIqgjkOEPzb
	3WVtRGyxAHUkfl4ekQsnHvY2R5fNAaDfcNFUfw4jiPCyK/qM5MeRe1pDJd4tPpqD5iMDjdNSNNz
	UfYI4gLbNUOU2n0iVRKOox/pkqXKgeY+ZcfjIWNsT8GXoHpPNR+VB9wjNtXo7/pjIFmrItBfoKZ
	4gqqELmEiaRJiPETyXH7CWBa9aQKVYWN98MY5f/fElLD8f+9iGJRN79zq991+hsSMNPsx4zT8HI
	Z7AInCqZVfrA0IAvm3WL5igIu4UKx61gbK5GEDObtj+siMyNmLqFQlDlrsXQ2IOra3+s2pim87S
	aBrqrzxQSsxf8DO2g8JjL51k6G3pwiQgwVRv9Ru9En
X-Received: by 2002:a17:90b:264c:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae5811fd93mr381130a91.30.1793141707105;
        Tue, 27 Oct 2026 15:55:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5abe29c2sm127131a91.6.2026.10.27.15.55.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 15:55:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso811114eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793141705; x=1793746505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6N+Jms6EdQM8CFjQ6BDl0aRKTJSrgGB/6/Z+xj6T4w=;
        b=bi9ECv+yxjBUaRcJx7rFLVExsCqv3WF2Bsn2sTJCyOYnb2FZogVt4TxKvpZDUaCyh+
         6Qj3ORt7wedIkz7wEryPqFP8tea/VYfx7g74CW0iASQIoh5NXwcaiIEXAkgIc5cJq88k
         bJp/4h5ij3zmiUEdChOsCmPBRm8qzOl/ZHEnw=
X-Forwarded-Encrypted: i=1; AKwUvBwqYWDoLN61kO5KuzdbklshL9+yl0sXj7KczInTv7wAPwPEAm3WVDcClVJ1jIufDjNo2oFuOBfiAKiM1tFKAwTh@lists.infradead.org
X-Received: by 2002:a05:701b:4288:10b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1a6ce9bba59mr860581c88.21.1793141705324;
        Tue, 27 Oct 2026 15:55:05 -0700 (PDT)
X-Received: by 2002:a05:701b:4288:10b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1a6ce9bba59mr860547c88.21.1793141704694;
        Tue, 27 Oct 2026 15:55:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c8da2sm1105224c88.14.2026.10.27.15.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 15:55:04 -0700 (PDT)
Message-ID: <50fc3275-863b-42d0-863b-d0594d7779ca@broadcom.com>
Date: Tue, 27 Oct 2026 15:55:01 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
To: Guangshuo Li <lgs201920130244@gmail.com>, Doug Berger
 <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Gregory Fong
 <gregory.0xf0@gmail.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261026115227.41779-1-lgs201920130244@gmail.com>
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
In-Reply-To: <20261026115227.41779-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_155508_691855_6FC21FC4 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -2.1 (--)
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

On 10/26/26 04:52, Guangshuo Li wrote:
> When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
> path removes the IRQ domain but leaves priv->irq_domain non-NULL.
> 
> The probe error path subsequently calls brcmstb_gpio_remove(), which
> checks priv->irq_domain and attempts to access the already-freed
> domain through irq_find_mapping(). It also attempts to remove the
> domain again, resulting in a use-after-free and potentially further
> memory corruption.
> 
> Set priv->irq_domain to NULL after removing it so that the common
> cleanup path skips the already-freed IRQ domain.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 0ba31dc201de ("gpio: brcmstb: consolidate interrupt domains")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

