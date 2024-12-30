Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292CAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee3Rb70cUWxtsCKv/dSQ92mAHiIOAXlNrYtEzGv5wlg=; b=ObqfR5Ea/ACzRCsof6GFwXYJTq
	4P1wqILD0U6gMvyHJ5yfQeq6H6aG3IHBDO1wb0/10Jz7s0Za9kTxC7k8xIJD7nZcXGVAsEWGKSToG
	66RvoiH8p3No5h6W6gJy1lSgyWqcy0IfC0Lbto5NeCvRCgRGq32I00iNbiNw/dqygZj7dkwuKrq6h
	e1o0TTdVf/GcKBpc3mpKRH+gEwqkHtxRl+k/3O72beZzg77go4egEE8UCrn667FQgx6fIDJTz/Dou
	iOjt+Wr/qp5G+FjDr6YR8gmIU3smTOGbcn5FoNmF2k48BHQbK1CWZDXb1gBZteQXpmdJUMDESjatn
	JTRyeKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSKoj-00000005hMm-38LT;
	Mon, 30 Dec 2024 18:48:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSKnY-00000005hJ2-28eB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 18:47:30 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso9611556a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 10:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1735584446; x=1736189246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ee3Rb70cUWxtsCKv/dSQ92mAHiIOAXlNrYtEzGv5wlg=;
        b=f037tNtmG9vKwMjGCC2Xh48W83VUVcj8JP8Wanon6GQn1JM73WvVCryaE1mgRIQExj
         YwKpIr5VSOkLlE756tDiPpHu8QPf42MVkMls8J+eXZ5AqP4N74PkZm06UeWMHR1cWTHd
         mM2pZQ8vKf+0tYMAWFKwvdCRjOavH0YgczVtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735584446; x=1736189246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee3Rb70cUWxtsCKv/dSQ92mAHiIOAXlNrYtEzGv5wlg=;
        b=DF1r5CX/qbNzB77X6D23hX2JdYhBSeUOwEMwNxMJCvHE+yDN98wE9ab6jhQEBuLiKu
         CloJ/Kv55ufgXo8vM1iHd9lQQuMvVVfE5f2V0Zufn+UNrB2We1UTengLPr6AHHSaMFJu
         LnGd13Ox12IW6NbMRNQiXzCO5srceGUISu1t8Met4rriXXQnFh65YevLRA+CCI4zoplP
         dLRsdDaWAt5EfKcfX1H6LbVdsTizcZxtJH70S21Qd/fR6hSoIrJIvJnr5ug+e9KuHXoM
         3wi6eG5Zvcer0r6FCkLY/QrTAIxxMey2M60wtNThyrZTy7A7YNJI8V9Tr0oT3xWL9gwP
         te5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzgA+Q0SZEC2eMi8DijTrHtNxSyPkW1M5VT2Won+nR+2Ce2hZ3CrBnkwqc2QDtVKrwbFieLgGPmF9/MgVbUtoW@lists.infradead.org
X-Gm-Message-State: AOJu0YxCnqUVSKACPskQ8AtjJobAJfDKdebyHaIOQNdeauvQwp9OXILB
	JTpzpttU/4dd/K0zT0lN785/yaahmxh+zblPwdR5ZuiijkWmdMukwl2WTS7d9g==
X-Gm-Gg: ASbGncto20Z0W5KkG2l0l/MjNxiRkmxISQCB0dGYN95p3srFSKK5CJgOYTrWgdiUmf5
	0pI4dcW82MkYNXn3GXsMY/fCP/DoEBp66hmx8fQbEZ1W015tw4H70qbt8zXDpR5rWOYlzPedYEj
	Q7tBoSxkPfM7wNMcH3B92BDrlBKx27Uq6IniS/vWM1fZz227qrevmWWmW/IuO5U6zA5k1Z9wYk3
	01lzkP1fvXpRQmYQnOFPC0hTRgymXmX58XJK3M+Om+T48tr3AawKPntG7+2X7nZZmSVrA8bO4Qw
	Sv+zwXZDvLHLFxWYC4ZH
X-Google-Smtp-Source: AGHT+IGwZcEJWebKnTsfjANfHDTsU3aPlCWKRnf+QuXe52JFYpfCc+/oAz/puWn5ZTaE31E8Sx/poA==
X-Received: by 2002:a17:90b:270d:b0:2ee:48bf:7dc3 with SMTP id 98e67ed59e1d1-2f452e1606amr58153377a91.15.1735584445856;
        Mon, 30 Dec 2024 10:47:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62e385sm23038413a91.22.2024.12.30.10.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 10:47:25 -0800 (PST)
Message-ID: <fc99b12d-b8b0-44d7-ac23-07454164fe79@broadcom.com>
Date: Mon, 30 Dec 2024 10:47:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pcie-brcmstb: failed to enter low-power link state (L23)
To: Stefan Wahren <wahrenst@gmx.net>, Jim Quinlan <jim2101024@gmail.com>,
 Jonathan Bell <jonathan@raspberrypi.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kernel-list@raspberrypi.com
References: <ee21345c-6baa-45fb-8807-1c836ac36963@gmx.net>
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
In-Reply-To: <ee21345c-6baa-45fb-8807-1c836ac36963@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_104728_687088_39D0A02E 
X-CRM114-Status: GOOD (  13.15  )
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

Hi Stefan,

On 12/27/24 04:44, Stefan Wahren wrote:
> Hi,
> I did some experiments with s2idle on Raspberry Pi 4 (8 GB RAM,
> arm64/defconfig) and noticed that pcie-brcmstb fails to enter L23 state
> during suspend. I don't have any clue about PCI or this specific IP.
> 
> Here is my current working branch [1], because s2idle on BCM2711
> currently requires some quirks.
> 
> In order to help, I just added a simple dump of possible relevant
> registers at the begin of brcm_pcie_enter_l23():
> 
> [   46.822440] PM: suspend entry (s2idle)
> [   47.050887] Filesystems sync: 0.228 seconds
> [   47.152159] Freezing user space processes
> [   47.154443] Freezing user space processes completed (elapsed 0.002
> seconds)
> [   47.154472] OOM killer disabled.
> [   47.154475] Freezing remaining freezable tasks
> [   47.155742] Freezing remaining freezable tasks completed (elapsed
> 0.001 seconds)
> [   48.797565] PM: suspend of devices complete after 1641.374 msecs
> [   48.797580] PM: start suspend of devices complete after 1641.829 msecs
> [   48.798059] PM: late suspend of devices complete after 0.473 msecs
> [   48.810510] brcm-pcie fd500000.pcie:
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY: 00315e12
> [   48.810519] brcm-pcie fd500000.pcie: PCIE_RC_CFG_PRIV1_ROOT_CAP: 
> 0000000f
> [   48.810523] brcm-pcie fd500000.pcie: PCIE_MISC_HARD_PCIE_HARD_DEBUG:
> 00200000
> [   48.810528] brcm-pcie fd500000.pcie: PCIE_MISC_MISC_CTRL: 88003480
> [   48.810532] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_CTRL: 00000000
> [   48.810535] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_STATUS: 000000b0
> [   48.846632] brcm-pcie fd500000.pcie: failed to enter low-power link 
> state
> [   48.846640] xhci_hcd 0000:01:00.0: Possible wake-up device;
> regulators will not be disabled
> [   48.846725] PM: noirq suspend of devices complete after 48.628 msecs
> [   48.846730] PM: suspend-to-idle
> [   53.672017] PM: Triggering wakeup from IRQ 25
> [   53.672032] PM: resume from suspend-to-idle
> 
> Does BCM2711 support L23 mode?

AFAICT it does, but the end-point might not, and this is not considered 
a fatal error, in fact we should probably demote this message. Would you 
have the lspci -vvv of the XHCI controller, too?
-- 
Florian

