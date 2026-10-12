Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2159ACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRGdhpzpgBIB8Wn9L7geEKuubi449G7vuDBdHmN4gRQ=; b=QDR2Yzgg8fEGeWz+3ddfVal74g
	nmBlg3ATa3krQI2Wf0Vilecx2+Y3erTCqD1NZr5HRWUce6v5Z/tLRKkYMHJIgoGulbJAU5aeUaF8d
	0SfcecYmd0At14PBSJNNlW3A1OukdeMNriBWvH3F5xqXX/FqTMcfrZD5NO/xw1UDG1+h+dXF58aqO
	02LZKRk7F01VIkK/lJ7dYfMRILbZOksYfDtKVpmjxFNJual4yXS58fJtjJBSNzcbVnvCjIPKJ25/T
	h6aaYjhs9xeCO5iRFPP4XjlIYGWZCzmrNIJL7iCO893CXzFVya7VDBGNEuTJWNAJWCkIg+v44Bf8P
	I2UZJKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIkS-0000000Aws4-2sEu;
	Mon, 12 Oct 2026 16:19:36 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIkQ-0000000Awrd-0IC0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:19:35 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1666306a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821973; x=1792426773;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vRGdhpzpgBIB8Wn9L7geEKuubi449G7vuDBdHmN4gRQ=;
        b=LYa9JINU/POagesNbP6pPQ8Hn8xHmB+dSoFtB66VTMpSulxw2mPJMuSisDGTuNPs2e
         aNHuzQaSWIb8dL1+KbXT8rUkQCkwow1CUBblKNLK21RYSD+3n0r4kx9hxyHPvz7EOMZi
         Zw7rlsChoroLRNCWt+lFDJ0CscpyIH3yEnAofxmSu17HiRTWQmOkklkEc980AZVtI1Wz
         UroGeifV52+keoux5jyxr90UlvmmvaT1nwUq7a+AE2Mja0IJpV873E9lFqo1Mfy6/5JJ
         fkjwwSdgTk90HqOpv/fwBrOB5zFPJGJlqhBYf64fxYFQN2LqY0voBdSkw5LIW6e7VDse
         aJVA==
X-Forwarded-Encrypted: i=1; AKwUvByJn0CMjura+TRamfHcd5ktrYtV8gB6R6IoG+YD5gNHnSQf/qUqK2UATlrYR/SFuSYk0h0iof7GhtWBmy6Q+maz@lists.infradead.org
X-Gm-Message-State: AFq9FYLLfnHoBViikjdvpEx3C+2gHT/AHcAS6rNdgTOnzh9ze+W026qu
	KElqEZXUHPPGq+ibzSOuMuBRHHaCKMdcfNQsDKFp31KafkLQqJSEOyapTAsmq7xyuz7vHlTsDJ0
	nk7MZ/YtHueHB7E9A+jnxpp5isXBbl1Wz979/NfqY6/nKnz5ZQ37Y50uYnVUZ5izWwZcLMpRfk7
	hwYHDhSRGJLHhsRELRzplvZzO0xUl8vEdUSCWfk1tk6tH/VJWa2dK2F0MXeXyHKUdbhr35SZ/nr
	G+uhL3Pcov3jrRYozeqzsbML0audMzHhlU=
X-Gm-Gg: AYBFou3ifKACV+cIcP+vqryOE/N+0cVmMA3U/5Dz00pxQflOEBAtx6kIPTlLpDlfwn0
	+teWt+iPxmoqkpjXQCR2DDyhYSt4GY2zLphzFDMMGOYwOl6iWIYxUkvgwZSEnIKrowDO2PflYz2
	THK94vGK38h1iFZIFEKuHUDkmsTWWlHWOIZZD0LcDruTxqk5GF86inc01KrWVXw3gOchtehFdnY
	2dpS0A1p/WZ5KtdoPtLo7lFRfuZ1IZ5N5FWm9UWEtK7k6fcR63c+yXbSm8tvlpox/PYzGGfui6M
	sFCjwSmLaZd0X3AmFNlR5qvJ0HJ8KgcSDFllQbD8W0DTtce+wQpuzS/qDrTxhUDhBr4i4rdVnni
	TZcdmcNcZydF64kb6c4C3zIAh/ftYdLz7dgaj0mSxFEnCTxyuHGK2YgEj7hN2N//k91OtqOQhMy
	u24+GUk34MIvvmpvspaeYM2xWqGT3Lu5q1/Fu4QVIE
X-Received: by 2002:a17:90a:d006:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3ab3a955c28mr8507729a91.15.1791821972531;
        Mon, 12 Oct 2026 09:19:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab36d74b2fsm5780741a91.4.2026.10.12.09.19.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:19:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35ac5255f1dso3905453eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791821971; x=1792426771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRGdhpzpgBIB8Wn9L7geEKuubi449G7vuDBdHmN4gRQ=;
        b=LzxvKLxGlyZJk+czl9t7hqPvuNWWU40NlbWkljw3CwouJRZMF5+VU56LxtcVG80nKZ
         byWHPbbFM+eZt7lKRH8jVgKgEGYJOGj/3N4kDNKpZxyw5uJggmMwncH0ZRWSnPdoi6Ia
         1QMa9GLhs34VrlmgG1SyHvmMiGcfv7HF/pABI=
X-Forwarded-Encrypted: i=1; AKwUvBxVsCn3bNo8G9gkBPvB3O/FBHIr3EEOCnUgtt/BDbBgdF/JkODs+CqRQRe0DDl2TmchxOSZyNp4Jaj0UUPlqoBd@lists.infradead.org
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr7297839eec.7.1791821970684;
        Mon, 12 Oct 2026 09:19:30 -0700 (PDT)
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr7297784eec.7.1791821969846;
        Mon, 12 Oct 2026 09:19:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm24226946eec.15.2026.10.12.09.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:19:29 -0700 (PDT)
Message-ID: <be539c4d-de74-4f1a-b5cf-98d074a6d0f3@broadcom.com>
Date: Mon, 12 Oct 2026 09:19:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>, Ray Jui <ray.jui@broadcom.com>
References: <20261011085254.603765-1-jirislaby@kernel.org>
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
In-Reply-To: <20261011085254.603765-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_091934_183488_2E41041C 
X-CRM114-Status: UNSURE (   9.84  )
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

On 10/11/26 01:52, Jiri Slaby (SUSE) wrote:
> Both are bouncing:
>    Final-Recipient: rfc822; rjui@broadcom.com
>    Action: failed
>    Status: 5.1.3
>    Diagnostic-Code: smtp; The email account that you tried to reach does
>      not exist. Please try double-checking the recipient's email address
>      for typos or unnecessary spaces.
> 
> According to Florian, it should be first.lastname@broadcom.com.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Scott Branden <scott.branden@broadcom.com>
> Cc: Ray Jui <ray.jui@broadcom.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks!
-- 
Florian

