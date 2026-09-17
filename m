Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FD2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfn3wdW1gpkbyJCwfcMHDnOUrZzvlnPPmgTV0TGUklg=; b=nApyb3UXL7Mg7g+mN5yX1CTkeC
	wxllsyc742ezA9hriXVOVmK797pvH5Z5xG3LMIk5/GfRhD3PQ6OE3s/FhqNY/JwjnZgMG+zWLJO7H
	jgfRG8TfzL/9IPffwJT720bacDKDCcvvdWRpyO+Keg5aM3CLQ1QcQ5U5JTvXFYkNtviSmxycNdsdO
	GmwH4sZPFxcEfEDE/EMDZAZ3TJwU7fgKHtNJL6E96KXHMJRyXllabaqpjJFtXWXvL7htWHABdFRi0
	rFhwpEpV5XkC2jsKL6I5hEMRbsSx6u8ri/OUHrvOhYWUbw9o3I1fc8QFKiD1vL+NHcm+GLzJSMnfv
	MXmEcPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FVJ-0000000C1rj-3WLk;
	Thu, 17 Sep 2026 17:02:33 +0000
Received: from mail-vk1-xa64.google.com ([2607:f8b0:4864:20::a64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FVG-0000000C1qj-2Xcb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:02:32 +0000
Received: by mail-vk1-xa64.google.com with SMTP id 71dfb90a1353d-5c847eaa0aaso133460e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664549; x=1790269349;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qfn3wdW1gpkbyJCwfcMHDnOUrZzvlnPPmgTV0TGUklg=;
        b=woEpjVXREYremcdv9VuSWBqBExcqpMQfJnaq1Sva7K1e9ZJdi+5TWaDcnYvi3t1vC1
         iau+1/Yl6BqN7VNc8aT6hHKjTq9+i2uQ/kJP1XkaTE50Vuov2MfH0V4gkPm1DA0ViDTa
         Iu4GlK2mj5N/Cyj5Lq3lqE52xdYyadylGtdpACjCZ5y+PRKi/v/dp0sXnG20u4O9Ycqv
         k91MpTBAYVzkPGdzV5iDUWgpfD7qRMQzbKc2UMXTPja6JrsuPAe6xJ/HNarkd7cZDhkD
         b8iu5q6aoQke5k/tG2ZxyGfTfigfWYtTMAAlU+V9tXFw+02lycUSkG4Z6ctAgI2yz3Le
         bgIg==
X-Forwarded-Encrypted: i=1; AKwUvByZwIMYuzuAkoWLWEExjZiV89HDdWM/PPZ5HOut99vn5DEMJy9wj0msLq3IYJ5IUgveGhfgSRDSNt/9Y8CpGBc+@lists.infradead.org
X-Gm-Message-State: AFuF++mt84KJJ/+ih1Sg+6WPcTs8rRVZIglsRjFX9NdL96FSayxbygW7
	91pRQef+BQvqoFQhLnasfyXZtqXCVG3Zw0wUbULzLeC+mTEUKfVoHtL6lp7FNUlUu+zMXru99lQ
	jom9Oe2OyUUWGS/QATP9AC2ccRRZkxL2+r/abi14ggDAXrs8K8e4oTuqsfoORa/AjRQ85+mG+Od
	ayY0vC0cex1W1cBa+v8jllmSkxVGrhstl//bHXLAERH/FYLmilb2VJ9lyKEzm/2FlLWoT9jXrCA
	xXTXy1fHIdRzAA1T/APV0ItoeYMpoJBGds=
X-Gm-Gg: AYBFou1QYVj1vSPmD5GYkW6U79CibKxjAcjytP7emoFu8/VQQDBHmcWHyPaEjMMGSqE
	xKF5CLlnvdwJWWKSEAubMOvOsMSEYBSVWMl9GOdIr4J+TNEy4wj309mGmNmX5Pbqr3nJj8iwGqH
	V78ZFuSKzY5HRJnDppLNpHfgkRu5w6shX0LgBKsmv30O/CfCykkFYWWxZPX/Ug5istggMafAcQf
	kwmf4q0RwQbDP99rE3O7oKiyI+abrNceBvrd+rCndmbRW2p7FfGAKIEZD1kmYgsjhpmBFOX3YW8
	7GIK+rjzOlj2hjUzhqgloxyDpf7geiQzgfm/YPKfQsIYSpx6zchPr0Ly/LOYmaxFf5SsJnU29i1
	EouCbPtea+i0og98UDwFAKoegmxxxItEiGSCf4rKsni17xyF+2g1f8GJBU/kRDOeiwcPQm6GG6Q
	bbmrx80Wx0fxq8t8tWESAE3QDoI+95EZTTOJvsPuWG
X-Received: by 2002:a05:6122:512:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c99ac67d45mr6512937e0c.4.1789664549094;
        Thu, 17 Sep 2026 10:02:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c9a52a0231sm1238358e0c.5.2026.09.17.10.02.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:02:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc52c77089bso118517a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664548; x=1790269348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qfn3wdW1gpkbyJCwfcMHDnOUrZzvlnPPmgTV0TGUklg=;
        b=EPt4nvjlu0FUt1jWTT89jhuOwNhkaUFRkyXi039SCELR5nC1VmXCjKxx/C25s+ZLQw
         fAVuzgVg4npvOgqQ9MzFOyiHKl/6emvdSuZcyw+CrweI0fznx2Khkr4RX9DsGJq6iAKD
         bvf/j6fx6AyZ1G0muZsrFQZoKj/LRv330DKxE=
X-Forwarded-Encrypted: i=1; AKwUvByP+fyzIzyfzgKlQxJ+5WjVbnBxiobqCDdI0edReWYEEoJ124k8kuqisJLG1qhUyFz0H7JXMCqiufomdIa6vmvL@lists.infradead.org
X-Received: by 2002:a05:6a20:72a6:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3dd5f3c0a6cmr18483882637.3.1789664547821;
        Thu, 17 Sep 2026 10:02:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a6:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3dd5f3c0a6cmr18483813637.3.1789664547377;
        Thu, 17 Sep 2026 10:02:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aa987ccsm3699978a12.3.2026.09.17.10.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:02:26 -0700 (PDT)
Message-ID: <79467ff1-caf0-4bc5-bd5f-f6196659e690@broadcom.com>
Date: Thu, 17 Sep 2026 10:02:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] PCI: brcmstb: Declare and assign quirk
 PERST_PCIE_REV_CUTOFF
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
 <20260911233541.1650895-11-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-11-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100230_662042_92FD7D88 
X-CRM114-Status: UNSURE (   7.35  )
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
> The SW behavior for asserting PERST# for some SoCs only works up to a
> specific PCIe HW version.  Declare this as a quirk and assign it
> accordingly.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

