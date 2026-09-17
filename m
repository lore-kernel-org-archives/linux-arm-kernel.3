Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFBDC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4imMswxUbVr42K3g5BOsJ0pmPAyLAHU01ncoNcfWeU=; b=dQuNGVScV9mUyQWaWKC98J0Hb4
	67EbVP2709CKZlzq+cWrnR8/Bbn8GfJ43wHrtVvfyPDIZY4gptxTi2Se0Vdlu8zr8q6/I0uEPbBgt
	kCgF6eQqLC9JuPUdjIVzt1f5iQC4xpXxMgLO1V8zTLeTBmfNnTkBCHMYqDA8unJAKNCXKn79TBLjd
	3OzFhkhNuQK+r19pl8SSoOAnj6OThyjBhBQwJr6rsCc5Hcw29Q0ioIC+uOqfcdNS/eELPxCUjNiK2
	w/xebxI7nlfp7eyFqP0PjD/0K5uOTH368MO15yZ96Dwv3a2kKglMvaHxKP6qCpdoB8UDFMrd7UdpI
	VXalEOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zYM-0000000AIK9-0PfP;
	Thu, 17 Sep 2026 00:00:38 +0000
Received: from mail-ot1-x364.google.com ([2607:f8b0:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zYJ-0000000AIJM-2Sag
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 00:00:36 +0000
Received: by mail-ot1-x364.google.com with SMTP id 46e09a7af769-7f4e729368fso144238a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603234; x=1790208034;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4imMswxUbVr42K3g5BOsJ0pmPAyLAHU01ncoNcfWeU=;
        b=H8lFL7PHf6G22TWjGg7NxIR1jiRDUwtAU6ed6ijz8peSKCrE+O+Xu9e6Ti91BwDYB3
         FxrgYekTj+ZmQk8eNSCYnzhSWUIp6+RpK6Hmfi/jkkm2kOA8rkgcwnfzKeqoaGExlLP6
         mLTOvhi/Db4yyoElUU2tPdAojKi/HRV7QF7IEw0dbZugX3bmOAxcWs6oyKvxL+A5PgGn
         dBkfeHKYNv+OhR4KnzEyHAWXQXcZ5237fEfYFd6KZSEdv0NDH/vgvQfI2Nfmgov5DDbh
         9WGoI0iGJcB+a3+8oJLFqwXN6sXEbyjsLr4HTLnYx/bIelhswUuXGTd4zGImP4UdxJIa
         ASAw==
X-Forwarded-Encrypted: i=1; AKwUvBwGTX+MkrVO7d3B8qqX37znXqO8Z4i3jV55BarwUwzRb+XXel/ZMpkvCJub3E2DAR9b0OX6zDTCTklj2qsHGRuu@lists.infradead.org
X-Gm-Message-State: AFuF++mQu9/Al2o+NJo/kaq39poem53pGU6vRAZpA4d3vSuYhaeXHWr4
	RqADyyqkiAbtW8Cm+jXdcK5NAgXZK7pOuPDATMwVgUSqgrpZF8oVFI4ezGk9DM5cJQ8QHgvQ2z8
	XTuGaxqXdaVEENk0ByrRVRIfs9uwedxcjO29edgK6071uprfycyAoG4fHWU2OxM50pwhBwsJ8Hg
	6+Osw+Hk55pt0J5UU7FVKNa9aGxb8tEF5eBI+cPp36iynnDOpMo3Sv3eEsTkMD8DtfPQuC44mWn
	AYOueVQO/oG1Amb3NrSJA9oD99ickMexR8=
X-Gm-Gg: AYBFou0JdzWyApEt/2njZnibZr2hFnBRAV1ZtwPbQ0QeL8qi8uhQPCgIZr6i0vgvUrs
	Y3pytVIwiKH5NQmYfzma/gHvW5h9HNc3PdqGLuqDpdEti4XTdL/rMzgN2jJsREkC/xmn8bARwUw
	Xjn1m/4rf5ruF35soB185bNrVdE3pIZlgHjc2Y3DolrLA22S5peTOpUlvxkkxHHnM+u3wA1f74z
	8X4yLb/wJQGdbw0UllPfUsH5G6NUhyRSKfo/z+C1DHNQw6kMwyQtLSmlihl1SoR33Nm1ACs0MvT
	Tqgz6pGhSB2SGPOrr1q5pY/C7xudf16oOaEVI8xl/MyMlM/V30AtxCbqexvkF8IPNELZY4sTbEH
	g+biEjGZ5lLeYSzcS/om3rGX4FgAypGFFAk64+5XbQskjRwIhnO/V4FJ3d9/qyBapizsWngN+vZ
	jSBNm7olbSgqT9NO8oRb4B2vpJLJefYQV+VGbyaT3c
X-Received: by 2002:a05:6830:4389:b0:7f4:d38f:980f with SMTP id 46e09a7af769-80b2bb841b6mr4768696a34.6.1789603234457;
        Wed, 16 Sep 2026 17:00:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c470bab23sm584922a34.8.2026.09.16.17.00.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so267555b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603232; x=1790208032; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4imMswxUbVr42K3g5BOsJ0pmPAyLAHU01ncoNcfWeU=;
        b=OlTiLhJ8PazfSaBMtr0TUKDLOxNaSTWs7q+9iWuGOJ3pzzHEMFrRL3cKPVnIKznowu
         8oP7qLb6NzFpO1uXLEF9Aem6k/1RbD5dfxLxDJkLVYCQqsTMTlkS7i5jhvTZlZUg15ET
         mZaXD/eam4/N1wMEMYITob/wRet8xeHahPn7c=
X-Forwarded-Encrypted: i=1; AKwUvBwt+Nus3YsIAgkjgOFNn8MBiToiDYLSbweMViTdrYztOZWw+ayUotMy/Ik8IxlkYQa1Ami/xlIg3TOb3V6jGw4L@lists.infradead.org
X-Received: by 2002:a05:6a00:300c:b0:864:cbc5:b8c1 with SMTP id d2e1a72fcca58-872372c3f26mr10397552b3a.2.1789603232005;
        Wed, 16 Sep 2026 17:00:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:300c:b0:864:cbc5:b8c1 with SMTP id d2e1a72fcca58-872372c3f26mr10397425b3a.2.1789603231228;
        Wed, 16 Sep 2026 17:00:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febde2e1sm1973248b3a.7.2026.09.16.17.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:30 -0700 (PDT)
Message-ID: <5ecf4562-3333-4b6b-9a19-bedc56750022@broadcom.com>
Date: Wed, 16 Sep 2026 17:00:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] PCI: brcmstb: Use flags u32 instead of bools
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
 <20260911233541.1650895-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_170035_627722_6CE8B061 
X-CRM114-Status: UNSURE (   9.65  )
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
> Instead of having separate 'bool' fields for each SoC configuration, use a
> small bitvector (u32).  Doing this uses less memory and provides a uniform
> method to assign flags for a specific SoC.  The expectation is that more
> flags will be added as we replace conditions like "if (chipA || chipB)"
> with "if (behavior_X)".
> 
> A helper macro "BFLAG()" is used to shorten the determination of the flag
> value.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

