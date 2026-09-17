Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D2C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZKUQlfoC/8Hz5OWhXA97Agge1eLf/8U2Rh0h/dSQak=; b=c78mFOzPGFkwwLHNIbVaNCEjcN
	dxrEmHkJRfczMiqq3NVGekTaNU01i85+25Lwi08jg5CGvCYsV3qdxalfOESkM0KLgdm882jOwGd65
	Vah4PEjthUFvUhy5tIMVUGRQzrZjTD6knBcTrGWRPP3aPdQEqlexdhSJGe3FeKNxyWCf6Lox721V0
	CoGipNaybFe8ijcQzT4d2Mdz6ZADwjgntNxsk2sXG5wKh3z/mYpzC0LjHcbKvhwBaDBa/4x1jmVC0
	yZSBzpAOB3c5pq3GkFRNJNufXN0gWXiy2ABcjcPHpoeoPFOwAXil1SyKuwF/f1hfddHdBXtUQOVEG
	owbvLQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zbS-0000000AIzo-3Mmn;
	Thu, 17 Sep 2026 00:03:50 +0000
Received: from mail-ot1-x364.google.com ([2607:f8b0:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zbQ-0000000AIzB-2ehP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 00:03:49 +0000
Received: by mail-ot1-x364.google.com with SMTP id 46e09a7af769-7f4f824de5dso46129a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603426; x=1790208226;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AZKUQlfoC/8Hz5OWhXA97Agge1eLf/8U2Rh0h/dSQak=;
        b=ulTrE7TTcHmzV8hE0qk5Y0Ln1A7NLjDnwC7ODyZ4etmP9RUQ/OTVsRJ5sZbKxV31ax
         dglNI1420YownpOFaYjcgpzQCQRUbECtvSUs3JqRLaAbHAy+E44G5gsyFJ14Ds0eUFzt
         eBrMk8gYzGqlKB8YVPoC21udga5Cbo4y4rGo3QwLQg5xfBVeKDk5HwkA9fkb9iwP+Xu1
         bnHdLwmTr1n0YzykYk3vCiAyfF3z+tCk2HVyvTpvGIhGM/JbFOXuza8T5RQixFi21cc1
         E0m+eqHB6zjbulAFreD4RnNM7EFR6Df0kyXMmirpsQ7gFWhg9kk7Oe9qlJJ/GF+ONWn1
         s3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy3nM7HuAwT1prT6b7e+BdqnrkWJDLeteekqqWyW0Ns/T5Q7O4JN3H4si5qF0m1hG/1HT0owZgKW5bFdMS+Nkpr@lists.infradead.org
X-Gm-Message-State: AFuF++k/d47nIUaV69R8VxEUw9w0PzRaI3ZZ1LuknGw4ra/HB9T2OhwE
	yLwT3Z9Cn+mw3Ll0CO1EyOM1MIyrQTF+ozouI5T9IIPcQgnR7n6C7aRdEK9ugfins6OlepONuqy
	atW8Zfv2byNdyWmgWAfa5rNVoTRu+A/oVugAje8rmWmUA1OtAYnVO9zgTypKVxs4OLltSBkmRNs
	fx6t4fT55UeUcPsXBxoN9iBrMSEdmhmrDjdDGEh++2SOT1batRWSgr/n+M3iN914gWDRlgCcFgl
	HmaxEfxT0zmOXFzen17FUo1404SXHDooyA=
X-Gm-Gg: AYBFou1TCGvV9WpOlM2dydSYn9FHYkyQfetvgz0D2jbbh/F3o5P9TJG6RuBmDiMNX8W
	BQHRJnGPR9zF0PwJLh6n1Ejv8FTusTzRqGSMCwpVv+EKuuB1QcTdeI1B2AF8Y/XWlhyC0wTpQqJ
	vBFiMY8vAf8dBxKJhzU5qQGFLe+CICL8Uzzx30M06OjmjBYT7sbTxEZC+s/FNYUjMf2j7IWm4M8
	Oaprpw05fjKh7uxHOpkwqViAJT6J4JGv4uZp/wMVS3l42BaS3hVd73GDsFwxKEmR46d5EGc7Duf
	+WH2MyCgvL7qAabU7tP39BUSfDzLA9RXEt8WmL19flZshTw9dKuk7IfHU5nOzt+o7Rzprk8ckjg
	8cbJwPcVmkIUUSZHdLJly+awDMzvvfr79+7q41zR+6XFM+z3JFl4+0BhNqACTSglggVWwtlxYQw
	42F5tM6kLbIjoOM++c/bpIlq4dtxl1tdyt5zRbXyVg
X-Received: by 2002:a05:6830:67c9:b0:7fd:9161:fc14 with SMTP id 46e09a7af769-80b2fbecb2emr5421123a34.31.1789603426426;
        Wed, 16 Sep 2026 17:03:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c4629f89asm634422a34.4.2026.09.16.17.03.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:03:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so600241a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603424; x=1790208224; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZKUQlfoC/8Hz5OWhXA97Agge1eLf/8U2Rh0h/dSQak=;
        b=ejU/wq3uIINlr8jUdeQrxQxBRXvYMCZNMqE9Jb48y7nmV6RL8DMLAbfMbRLZTrdVMp
         eTFHTbzKo48DXXWbe5lJ57SnzfCEiIXp+WSzNKCZVgXRtqOsYSjl3P9SGrqJyc+EJWvs
         83XbQctbIxtH7V/QWFObD/YDkV8xhL0iVmqso=
X-Forwarded-Encrypted: i=1; AKwUvBy60JLmxghap4JkqEredWzwe3idJmAhYX6ajRzdT9vd2+JM9u3wkyXn9zXAfjEA7shr3cn2cHFzlqBWsxaNSTIh@lists.infradead.org
X-Received: by 2002:a17:90b:1c0a:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39e1e2cecb3mr9562708a91.6.1789603423981;
        Wed, 16 Sep 2026 17:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39e1e2cecb3mr9562636a91.6.1789603423446;
        Wed, 16 Sep 2026 17:03:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm21282976eec.23.2026.09.16.17.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:03:42 -0700 (PDT)
Message-ID: <073070a2-f46f-4016-95ab-1c407b0e632a@broadcom.com>
Date: Wed, 16 Sep 2026 17:03:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-7-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-7-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_170348_675145_F2C62329 
X-CRM114-Status: UNSURE (   7.66  )
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

On 9/11/26 16:35, Jim Quinlan wrote:
> Eliminate a function that evaluates SoC chip IDs and instead declare and
> use a flag that indicates the SoC employs a CPU with a variant of the
> MIPS-1 ISA.

Uber nitpicking, but I think you meant MIPS32r1 ISA here, MIPS-1 dates 
back from 1985.

> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

