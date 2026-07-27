Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A973C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuPRM2oHQdKy1nuzzj63RGBjL55V9ZOJNmKnMoykNIg=; b=KvzgNuJQG4Ej4sFpIi87nvWoBI
	1PPKe1j6F5PQQMSJcZTwZ4Bhr7pzut0h9g2O/K8+nztDJDoqFa1TfbnMf4f0EgmygE8oU34lSaYLI
	niwkH0+Tck6aLi7wd0f3BqkfyRoKfugwclWSoqV9FERgrJYYN0e9Zhd1edjHMtusoPI2cB6rrYzAo
	Jd+tS8fw5Rqhn+hwSyjQcZN7niDtcikcC59FfiVGrL2Foptshe1dsooy3+mrRf2+Q+P+jXTUPj2UF
	41/hiZt8DoiLsxdgCbt5r3rTrvuUqWH8A/NhYAQYNrMV1+KR38imW65IIwNn1e6xtHQrTJOqSGRro
	f7Bj+zAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOVN-00000003RIX-2YcQ;
	Mon, 27 Jul 2026 16:48:41 +0000
Received: from mail-ua1-x963.google.com ([2607:f8b0:4864:20::963])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOVI-00000003RG0-2zvP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:48:38 +0000
Received: by mail-ua1-x963.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso54242241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170915; x=1785775715;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fuPRM2oHQdKy1nuzzj63RGBjL55V9ZOJNmKnMoykNIg=;
        b=oVeyx5ePnOzOB8caTOnUzN8oZM8kIcQhXUUSlGrXAx1loXhBR7331gAfVuv91SaFHH
         mLlSw4JCzV1CVNzMpQGiApXlK/uTOOdABfdOLIAQ8G5q0sCZXDa1XmexAbUjO0J49Iki
         /08+mA/X5E0qlT53md7o9klsekolWwn3KfG0xI7Egb0hws+vf2YEebAttdD7SudL1dKD
         adK+M+zq8rRJiSpEHRjDWQ4wMUlMHOYkE0QDlP1lqH5UG0xj9SBiFfCBlKfQv07Heag1
         r20weOtLF6xIekIKhnROiw0RfeBtj0VTiQ04GP4TL37waAourA3Y73RMpnOAAKwGzfnE
         Ntvg==
X-Forwarded-Encrypted: i=1; AHgh+RrhB5MOBRxVITGGNGLzhFuxO2KeOi5cmHRRw/SBp14yqfukO3PiMTI6syX67AbTF6JEqENni84ojY3rqlqlLxqh@lists.infradead.org
X-Gm-Message-State: AOJu0YyMmgWOouIjxhDiu02t9IoGpYg3tfjIkqsn6SyRzhUF1NPxhXvG
	WMs+KvlIdpSiDhQ+t8mW+it8SohPi9reZYY02aNKZ+YHLYFcuj+YBx2z4skpPQfxy6PxBs1TCZQ
	LPXCI2Q98ppAfVxi+WyDFfwAaDOJDklYwvfXtX2TECmqaef6OPbSjHL0O1VfRs2ZkDI/jzRKhJO
	HYfpX3BBwYQznecYq7H8IrPL+gR7u9FaKBTt6KOiucnMFKZnCH66fLzyMczFNU1qPsiSwqmHTlf
	00zLq1ttmzAE9trJfUcx1NtF8hNfSNfrrI=
X-Gm-Gg: AR+sD10jc6fXJFNNOjw4mzbVLtk74qJkm7EtjIqiFGs3LmPT8iacCpZUl22kfF562Dh
	CD4ayqMDiecY6tOKj9cBBqPIE+qMtOxCy9bOIgi6Y+Dlf63SgUH1ba1oPn3EdcCaWCDUe330cr+
	PHP5s0Fjz07LYmNZ6bGb6wNoBqfIk4S/MQ28o+TfoD1zJDFGSE14D6rROpY9APMEpirUpIscHcd
	EJyx/VjwmhdgfcjO6c7trtqTY2dLbmqx2mdxzRcXAySF5q0cuDVIo/Hi94VmXGQUR9ywJiiNweY
	z8HRY+113BGPtu+7gSphTF++pxXKnAq/McoSkjRyePzbXOyH1k9voL55WfY4+seJeQJjVA1Erj4
	mteh8MesZlPxFg5rmzSNgOXXNXyneohrpKSOGUePpMpM+JgiFGFNbsaNx/xFdW2uwSy1EgMpiMk
	k0NhoQrhktgoHfLJo8iIFcnlu9+DrdfAEDjxoTS5iI
X-Received: by 2002:a05:6102:8302:b0:745:53b2:d651 with SMTP id ada2fe7eead31-7543008e0c6mr88159137.12.1785170914816;
        Mon, 27 Jul 2026 09:48:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-97774ef706bsm331356241.3.2026.07.27.09.48.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:48:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so56609a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785170913; x=1785775713; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuPRM2oHQdKy1nuzzj63RGBjL55V9ZOJNmKnMoykNIg=;
        b=LFeupYptMDZJN5pasC/u9XIgr2umZLl7nzB4D4XNUcHtgnZg2nyw281qm7wN/X10PC
         76pAvw0w9nQMbj/rzKUJZPvo6Zh9+xWsbQBY8ajJR2bC5759luwOYpd7xgMqY3nInxCf
         YYvGzhdDSPOI72v3h1Y30shzxN9HlUF6DEANY=
X-Forwarded-Encrypted: i=1; AHgh+RruEJNMrbFk0H/vU6YPQk+R6HX3JV3RBiNSPuuE+L42ZkwrxbKtrZ7PDJZONu49FX6wfM/L2Rxx50nRNXnNHcrc@lists.infradead.org
X-Received: by 2002:a17:90b:3b45:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38f643465e6mr262744a91.6.1785170913450;
        Mon, 27 Jul 2026 09:48:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3b45:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38f643465e6mr262686a91.6.1785170912906;
        Mon, 27 Jul 2026 09:48:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e52f0c6f2sm28019446c88.11.2026.07.27.09.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:48:32 -0700 (PDT)
Message-ID: <ab327dc1-f921-45cf-9e4a-fbbf0a116e27@broadcom.com>
Date: Mon, 27 Jul 2026 09:48:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: iproc: Use the EROM outbound window on BCMA
To: Semih Baskan <strst.gs@gmail.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, rafal@milecki.pl
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rosenp@gmail.com, rani.hod@gmail.com
References: <20260727140939.389-1-strst.gs@gmail.com>
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
In-Reply-To: <20260727140939.389-1-strst.gs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_094836_779863_171B833F 
X-CRM114-Status: GOOD (  23.50  )
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

On 7/27/26 07:09, Semih Baskan wrote:
> The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
> revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
> controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
> 0x20000000 and 0x28000000. Broadcom's own driver branches on the core
> revision for exactly this reason.
> 
> bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
> that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
> Describe PCIe controllers fully") gave the controllers a ranges property.
> The commit shipped in v7.1.
> 
> With that property present, two things go wrong with this driver:
> 
> devm_pci_alloc_host_bridge() parses those ranges and requests them, then
> this driver adds its own window and requests the whole list a second
> time, so every controller fails to probe with -EBUSY.
> 
> When the DT window is used, it is only correct on core revision 0x07. On
> revision 0x01 it points at an address the hardware does not decode, and
> the first MMIO access to a BAR takes an imprecise external abort.
> 
> The enumeration ROM reports the correct base for the revision actually
> present, and bcma already provides it as addr_s[0]. Drop any memory
> window that came from the device tree and use that instead, requesting
> only the window this driver owns. This makes the driver correct whether
> or not the DT describes a window.
> 
> The same commit also added compatible = "brcm,iproc-pcie", so these
> nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
> enabled, which is the default on ARCH_BCM_IPROC, that driver binds them
> first and this driver's probe fails inside devm_pci_alloc_host_bridge().
> This patch fixes the configurations where the BCMA driver is the one in
> use; OpenWrt builds that way, with PCIE_IPROC_PLATFORM disabled. The
> platform path takes the DT window as-is and has the same wrong address
> on core revision 0x01, so that side needs a devicetree fix either way.
> 
> Tested on an ASUS RT-N18U (BCM47081) and a Linksys EA9200 (BCM4709),
> both core revision 0x01.
> 
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Tested-by: Rani Hod <rani.hod@gmail.com>
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Semih Baskan <strst.gs@gmail.com>
> ---
> Applies to v7.2-rc5. Related DT-side approach:
> https://lore.kernel.org/all/20260628231156.1254012-1-rosenp@gmail.com/

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

