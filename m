Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B527C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la3EFGPTmY4WhuQJZNNkENF+jYrhdOvMI5n97zyEnQ4=; b=hmP6caez2YiE9yfccKT8k359ie
	rFO4985Y7DbZ6vnQth/mx34mFglZddsq8/LAVVHDqdikZh476SxJWhlBhbB78W5C9kHeuVcvTfLQq
	l9RHqIdVCiESv2vVxDsaJiIH+ph66RpwulLLM/lvHGZOe3DTxPn9vUvQmkctS+VFVYaznnADswxA6
	8KEzvU4CvEcEd46l2IvNIRSeuOY5RMdAUTlL0S2xYzhElw5CqoCbh42JU7KXjQ+8i0XDTTuRLkYGg
	Y4fQhr3VzKewnKHpCQ1A/izJNDvtb9Yvvq7vsPbvbeEjYgYHGx2zWMOdcC05fA8Cr7BmVlP2gRMKZ
	mFlEHEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZ4-0000000AITx-22oZ;
	Thu, 17 Sep 2026 00:01:22 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZ1-0000000AISx-0UGm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 00:01:21 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso60868a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603278; x=1790208078;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=la3EFGPTmY4WhuQJZNNkENF+jYrhdOvMI5n97zyEnQ4=;
        b=NMc2q1pYB61cdEJje63LBaUDRbyrnefkqyMCDutr9VpismHuCJZwau1aB5TVuJgs2s
         Vf63v0BpWwlxexzKTNqKkkF2RtWlBFbHQF+lJOhUa0Ijs2qKsdVO/gP1IaNxpKx8C9om
         gRlo8u6ieeiofWAmamP7MgVyPDmdgGLGDudSN/7edQAMD+bbiahaDQ7eL0h/fm950Agg
         UPVmpl6htSwNycQXtu7YGyUtEpfOFC9Sy+lEd/QaN7c6tjRuVjAklQZoKYktuDWWfsoF
         8QlaFQBALYAnimd8TnpwQwxWz3gXNxENT4Oyzxz0wfgkxC84lIegoYw7319/mpzgKqDT
         6myA==
X-Forwarded-Encrypted: i=1; AKwUvByRdKuKqm+/3t8RRKIXg7Vd3+5q+FzXWgcD0uOyMzNl8S9kFRWuxlgMSFlgO4g/I8eaoTJKPN3sbYEYCs+QTimp@lists.infradead.org
X-Gm-Message-State: AFuF++neMGYC/XhfPpGSrmngcPDnqk10OhA/sNzf2rPKsFKx0qeqOHLJ
	CVhqKG+co/ltjo0dMDH/lIms8Wauyr1iy7HJ7/Ls5x3SqQif6sI675YiTWceuU0Jvzxzc+wYDZX
	AoGoPMiNBQwL5h3rJtU/ImodL908RYJs0ZbsO8+ROlDCLL/nWdG1O28IhdaHXUio2c6Hfw2DzXj
	hR7fmSN/jcPzpoizgMGEXCqPGJfTWmk17T1EAGYfh8hESHLht5NWO/Yb+BwhM5iomziFf6DZIBK
	ubiMSWLY3FkhKCDF3lH9ct2lElpKEsFfrY=
X-Gm-Gg: AYBFou3368HveJPUsstXvMttwyKGvVlzzfWCGMMEzTk2r7Xgku2ZCvKXiJzwulQmNEH
	UF+WTG1pQTqgRE8apIb81yzhua4+A3bx5koylGtGR0t3UWXc8PPD+t/TZnta2FF0xQcK4/Qi2LQ
	N9W+/EKnmYN6N7oLBwLgQFv6s8PjsKMe6Y/dPfx3Hz5aY/9r8FCRuf+iPOeySg1y+Ur4jDJ80A9
	Q1F6NUixA5xvb4/Ix35tcDUwpp38WRPQwClQLFvkwRRbRkl9xBDGWq3f5MRrolV32Igs7FJ5QBW
	voG+W4RD+gDiIlEznF+TABB7p+pelld2/JDMYtzds9etQ7N/Zn19FfLt2/z1x4ozk3fbuTt4X8B
	Z4U7bVFE+rdNbaD/GSe0uASNCujx8rimsl9X8Sv/sLIEpdHdIYQFPmTov/OqZu49uxtiYG6e0fk
	THQWILpreJCOgdTdnJDyCg5gpypIBnGc3l0752teZm2a4=
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr9416754a91.15.1789603277757;
        Wed, 16 Sep 2026 17:01:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e39aeb3b8sm83617a91.2.2026.09.16.17.01.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8052a85c504so272807a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603276; x=1790208076; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=la3EFGPTmY4WhuQJZNNkENF+jYrhdOvMI5n97zyEnQ4=;
        b=ZyrmjOSC3FgrWop3CTWxJY4T7MU6fFVtjQ123u0AgQPohCKjOLZnRKgSuS44KZAMCu
         gjVoh5zdTEwA23HP0stpO5dGU6WZD/Y73fi6zZFI3MoYAMOELV1S54oSDsXeuh1If6/Z
         ZUDsaNusytc9BPjDtVAYEbtdZSGGqOWsHyBw8=
X-Forwarded-Encrypted: i=1; AKwUvBx5w0oNA3JA3gxJ9rExzDCRFLoyudHr9LfnUaQka9L3STS8GCBQtphAf0frYqjXWKJyw5yIT5UxgG5hV8yeHxvg@lists.infradead.org
X-Received: by 2002:a05:6820:8ca:b0:6b7:46e9:9708 with SMTP id 006d021491bc7-6c7d46e3955mr4212749eaf.56.1789603276050;
        Wed, 16 Sep 2026 17:01:16 -0700 (PDT)
X-Received: by 2002:a05:6820:8ca:b0:6b7:46e9:9708 with SMTP id 006d021491bc7-6c7d46e3955mr4212698eaf.56.1789603275627;
        Wed, 16 Sep 2026 17:01:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a182sm11174848eec.8.2026.09.16.17.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:15 -0700 (PDT)
Message-ID: <fbf36dfa-b3d4-4102-8573-1911814e93fa@broadcom.com>
Date: Wed, 16 Sep 2026 17:01:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] PCI: brcmstb: Declare and assign quirk
 OB_WIN_32BIT_ADDR
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
 <20260911233541.1650895-5-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-5-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_170119_152584_9068942B 
X-CRM114-Status: UNSURE (   6.71  )
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
> Even though only BMIPs chips have this quirk, it is more uniform and
> readable to define this specific quirk in which the outbound region must
> reside in the lower 4GB region.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

