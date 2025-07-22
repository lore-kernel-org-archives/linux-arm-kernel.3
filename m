Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD723C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0eOoWAY9496jUiB2vuHF5pd/0r+QZAaNXRvWpSvqhA=; b=VaCCFiQy36nEVBwr3bjXOhmynM
	x0tQpR2RiNTQ2M2IJQ0a0qhRbVsNZBmxm1lYPHkBXDaS2Ym6fn7pWnhCtqYV0URsgoZP5z5wDVXrT
	Czyw9d+2B0u3Wy1vpSlA+ld0YTui1j9tLtjPknOWFf3IApPUXmjok/QypMU4R0t7Ck0oBjddKMP90
	xTWme/OhM8ANZu4I0e+u02QQrhxLEb/ZQtC3Ucc0PGx3SXunaW7bFAbHuFA0XGf03+JGM5phiEvbx
	7hFcSini2Va1zCzBFUYY2NRst5PM0maE/+vdNrtA+OfNtIPyYAQDH+BZ3q8mCyLA8249h6cDUFfap
	F+XFCSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJyP-00000003SnF-2Bz7;
	Tue, 22 Jul 2025 20:52:29 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJdD-00000003RAC-3MYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 20:30:37 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7e278d8345aso576696985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753216234; x=1753821034; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C0eOoWAY9496jUiB2vuHF5pd/0r+QZAaNXRvWpSvqhA=;
        b=UFcVJe+sruh9/C16ApFGoZ3zlaidAzZxAb6h5eFsqIePvoup5JEvqdOQuEnQkTOk0I
         xqOgPmzIHsr2SJi+aP+3Wj3PW+11uj63uG3+l3NQg3PVXhnwbwtZ3v2O2c+V/Fow0/4Z
         XC5KnWY1JBZ65z+dmFVTG9+LOQhiBeJJCQdek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753216234; x=1753821034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0eOoWAY9496jUiB2vuHF5pd/0r+QZAaNXRvWpSvqhA=;
        b=di+ffZDOdRH1Ae32tJ8iGF3I0hri53eJRZkeHnJvnY2ae7o4XgkpCN2QyS90StkwaE
         z7Xn0mvKYgoAZVP0A0GPtVIwr3824eGtIZCjVGLXvTRflqzF8o269RttvTpbBLl8+D1M
         GjmXcmZKnq9SDLyTyM0XWLZh4zBG9gwSnmEgpcXdhfy8zF65GyWe+7dnonxbepMKbwX6
         RVBHizdWpVdvh0gSBNfPi5QEGYHuygtMAkOuCPg1TGwhoflyEcvKqstZtUIT38ZEFHtc
         frxL6ftN1TKkosM5wmqsLZfcAGnlzjTAgmACoCLKovAYMSGZJBGFQ0PFpGRYXdZGl1gD
         pq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNLE8Lko0HvbhS/TQNfHymj16ijBMAdjb8x29Te5gd+zraydhYpBf1Mgjs7GrpWpoBkQ2h2mbiKuS3ei8+1B/r@lists.infradead.org
X-Gm-Message-State: AOJu0YySgE0sxGcGyE76ULnQfMLZzkZfqy8/jCqlkiq5O84JI2QwK3jy
	1y7hXc/JqX/OfQEdvGCQ/mU6uQFXTABSSvbgkV85RHypIUqJtbrk5KR9r/7qmVMjwg==
X-Gm-Gg: ASbGncu3QQHJgFvC0CsrWMDzJhTVWmdQL6ksFT6UANlwlANCyzMuRlkx+uHTNU3XJYB
	RU2fqFO73eeZD+OmYBPHp9KFlRQXWAAWQnfOwudO/qM/NpZYK2pP4MRyPLvBXrBzXAt0KHj7t9v
	oou6DYOnsCum8jb7fHNB2bIVhn7tK1RseOgcCNGgFkETFqgXjrieSr6g5Na3OYEHyAybZOIDgHj
	cAf2/qqHB0u4FmSrQxMbFVknS9VgmMiQ40xdgaJoLfYTjIhsIMQ41cLpa6FF+VcXOWYLYjArle4
	gBdeX7qxR03uQY0iClAWhy1YdFj96NBaqRRFVHdYq1pJuOFue4cikFIBV2t+bKt+jMxOEpgYN7+
	ivY5Hp3iUNAMA3HTBeqVySWokBekjfBNDZxqruybrEsO8vk0aSALMeMGRneLbFQ==
X-Google-Smtp-Source: AGHT+IHPgae5UqXTaq+pQoIZUFXjLrf7YpxbYbZHd50ldnbPVOcMotdpI94wHHx7zju3ly64oocICQ==
X-Received: by 2002:a05:620a:1094:b0:7e2:1117:55c4 with SMTP id af79cd13be357-7e62a17ce5cmr70674685a.37.1753216233639;
        Tue, 22 Jul 2025 13:30:33 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c737b5sm585921885a.87.2025.07.22.13.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 13:30:32 -0700 (PDT)
Message-ID: <0a665be1-6300-4d37-884f-b2e22448c463@broadcom.com>
Date: Tue, 22 Jul 2025 13:30:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Simon Horman <horms@kernel.org>,
 Tristram Ha <Tristram.Ha@microchip.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
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
In-Reply-To: <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_133035_987317_4B9BBBF4 
X-CRM114-Status: GOOD (  38.09  )
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

On 7/22/25 13:20, Russell King (Oracle) wrote:
> On Tue, Jul 22, 2025 at 03:40:16PM +0200, Andrew Lunn wrote:
>> I know Russell has also replied about issues with stmmac. Please
>> consider that when reading what i say... It might be not applicable.
>>
>>> Seems like a fair and logical approach. It seems reasonable that the
>>> MAC driver relies on the get_wol() API to know what's supported.
>>>
>>> The tricky thing for the PHY used in this patchset is to get this
>>> information:
>>>
>>> Extract from the documentation of the LAN8742A PHY:
>>> "The WoL detection can be configured to assert the nINT interrupt pin
>>> or nPME pin"
>>
>> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt
>>
>> It is a bit messy, but in the device tree, you could have:
>>
>>      interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
>>                   <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
>>      interrupt-names = "nINT", "wake";
>>      wakeup-source
>>
>> You could also have:
>>
>>      interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
>>      interrupt-names = "wake";
>>      wakeup-source
>>
>> In the first example, since there are two interrupts listed, it must
>> be using the nPME. For the second, since there is only one, it must be
>> using nINT.
>>
>> Where this does not work so well is when you have a board which does
>> not have nINT wired, but does have nPME. The phylib core will see
>> there is an interrupt and request it, and disable polling. And then
>> nothing will work. We might be able to delay solving that until such a
>> board actually exists?
> 
> (Officially, I'm still on vacation...)
> 
> At this point, I'd like to kick off a discussion about PHY-based
> wakeup that is relevant to this thread.
> 
> The kernel has device-based wakeup support. We have:
> 
> - device_set_wakeup_capable(dev, flag) - indicates that the is
>    capable of waking the system depending on the flag.
> 
> - device_set_wakeup_enable(dev, flag) - indicates whether "dev"
>    has had wake-up enabled or disabled depending on the flag.
> 
> - dev*_pm_set_wake_irq(dev, irq) - indicates to the wake core that
>    the indicated IRQ is capable of waking the system, and the core
>    will handle enabling/disabling irq wake capabilities on the IRQ
>    as appropriate (dependent on device_set_wakeup_enable()). Other
>    functions are available for wakeup IRQs that are dedicated to
>    only waking up the system (e.g. the WOL_INT pin on AR8031).
> 
> Issue 1. In stmmac_init_phy(), we have this code:
> 
>          if (!priv->plat->pmt) {
>                  struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
> 
>                  phylink_ethtool_get_wol(priv->phylink, &wol);
>                  device_set_wakeup_capable(priv->device, !!wol.supported);
>                  device_set_wakeup_enable(priv->device, !!wol.wolopts);
>          }
> 
> This reads the WoL state from the PHY (a different struct device)
> and sets the wakeup capability and enable state for the _stmmac_
> device accordingly, but in the case of PHY based WoL, it's the PHY
> doing the wakeup, not the MAC. So this seems wrong on the face of
> it.

Yes, this looks like the wrong driver to be doing the 
device_set_{wakeup,capable}, those calls should be in the PHY driver 
where the knowledge of whether WoL is possible should reside.

> 
> Issue 2. no driver in phylib, nor the core, ever uses any of the
> device_set_wakeup_*() functions. As PHYs on their own are capable
> of WoL, isn't this an oversight? Shouldn't phylib be supporting
> this rather than leaving it to MAC drivers to figure something out?

The Broadcom PHY driver calls device_init_wakeup() when we have 
determined that the GPIO used for wake-up is available as an interrupt 
resource.

> 
> Issue 3. should pins like WOL_INT or nPME be represented as an
> interrupt, and dev_pm_set_dedicated_wake_irq() used to manage that
> interrupt signal if listed as an IRQ in the PHY's DT description?

Yes they should be IMHO.

> 
> (Side note: I have tried WoL on the Jetson Xavier NX board I have
> which uses stmmac-based WoL, but it seems non-functional. I've
> dropped a private email to Jon and Thierry to see whether this is
> expected or something that needs fixing. I'm intending to convert
> stmmac to use core wakeirq support, rather than managing
> the enable_irq_wake()/disable_irq_wake() by itself.)
> 


-- 
Florian

