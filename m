Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240BFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4myrzpcV5cUM4yz59ZTbnlSvPcHQdnJLHv+wrB4J8no=; b=XuNu7yO4+cWIDNKMkwlTKbiDE3
	TEOMM2UqC9gWwA9F/OoSXXkKRXMhO2KM84l9G60BacaVaLTwcPew5nJWjs09E7LVCHEUJK6LYsULB
	De/mwmsAm86mTS86A1nEKoVlas2wwYcsbukm+54GTsh+1aeDStJlFJz0anEmJcZXXkSD/5RkNR+Wg
	gesqEW4byTlxYcAuUfWrXoSpfmRx1q+NXeujkDAit6HVD1tZjOtfLR/dhwuwzn+oLj8PwcjdGzRwp
	BgnhjfXegalVe0q8wzSoxvTP8JZR3rB0cXOb9XIO3HmRM3INNB4UrDeV7V1qeaF+ue9a6xaaOyxLD
	ZZu5vZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJX-00000009vL9-0OyH;
	Mon, 13 Jul 2026 16:15:27 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJT-00000009vK5-0Dz0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:15:26 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2caed617615so37052835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959319; x=1784564119;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4myrzpcV5cUM4yz59ZTbnlSvPcHQdnJLHv+wrB4J8no=;
        b=V7sbAueTnJGPXlP6f5o3ig5TU6Nkpgdb1AO3VX7viEjcKCskB6rZXYdiocWw9V/yh3
         bufsGpKUf3gdPvMj4f5a2fEk2imXXtU6xelCC+IKPoaOnWzxaMYoj/n7zcRbd72s3QVw
         dJSd5Iwq72sH+NtRHh4NRd6MOoeBoTEykq5BW+UfWwtjP0zWsw9QgyfqYgdHwNN3IfOk
         l2GvwolR8moaz/TOA4OOuLZkOcXP9UAmtc18ajzO4s/tzu68JhXvCBp8d4B1XnQ+pG5p
         OHjCMrZbLRQmHSo3MdswzpQNNIO9Ic1pFPJf9FFXIId5U1OI2/tq8hkSWFvc2ghpevYW
         jdAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxH1QMykaPlpnzRFKrZYiyHJTCjIwJuFAUBNDPxarJTkDfI3cxt8AZ2X/8DPfz2AKhPLhvTnMNHaQvwaW4F/G/@lists.infradead.org
X-Gm-Message-State: AOJu0YzUHDW9qvdBHGVsmcRAXhPQL+lR0iBY/vs+JQZAtniGsYFUesyI
	i1o5//tGvrmmV9UdsRboodwZnKGvXJp9h6OXTqM4AKEYdyvC+h6ZJaYd8QNg+aPSWP/To1DCGQt
	uq9RMawWrMSylZBh6hzlws2pcmxeuSzzDOQX8dQmzms0sOw0YDhJLF2jFZVsaJ/f7RA8MG8uePF
	tjeSRcwRa5ftau2Qx+Gngrn/ir71ptzCks1ELd5fintVR5GW8+ENanVrGf2P+o3eqxHrgi0RqGC
	tMQxzzvdo7vzp2O4u+VrYqattBBZdBd9uM=
X-Gm-Gg: AfdE7cmyhUpAMr5GQwNRpRrB44kLWujEGxkqwhqkKDRAhpvfgYCPgOkrkvmlHe/0MON
	4vMFIVYU2XMPrumEzSAVqbnLvfNtwg03UEVfyWX/lvL11H4noPZDdUF9Wj479RG2aTzlJOXpxhK
	26t9VWjfoQnAWOzfRubcVv/eDB1eMo9oumQSg4G5PNU3T/OdzQcwJQnbAazN5WCOm6pKa8eZBzC
	z+4WJ2ipkgy0wP7Tdsg9Zg2behZ64V8JuFClohGWNasSFnqc8+EwNLIPjBpRj3yX6vmJNcpN9M1
	TW425h0uI0AaglscreBQl3+KnT5tBrwEJW25VhDYYjK8rHA/Y9hbe+SM7Wok4lZqdxHcvGo+AjR
	ztvl2YEK8kLN3FbiMrfBNT7cT/gLQgVZxT4QHOTp5YLh/tU3C0bf0z8WMhuWByQGCatsnpdaAIq
	YbpUJVPah7VZbkl/MRD2YWJfl8Kd4lrImLe+LsdmPS4Xl+eCZO
X-Received: by 2002:a17:903:2449:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2ce9ead3d83mr95972155ad.20.1783959319062;
        Mon, 13 Jul 2026 09:15:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ccc9bc5955sm20485205ad.3.2026.07.13.09.15.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:15:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso2678345a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783959317; x=1784564117; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4myrzpcV5cUM4yz59ZTbnlSvPcHQdnJLHv+wrB4J8no=;
        b=Bed18hqGlAa9cJeVUFH1ghtOef7pUeWlluQKbgNDaHr1uVimhPRHkSID1u+90z5YK8
         DY5Tnd5MnrRT5iCi6E5TiHPp/pI4G3BC/nPQh9KjsEzmKOqZiB+Z43Qd+kOzeVPMJvCK
         Qep2kKkzvGE78DfeUhV9UoZ1dN6s2me2WIc+8=
X-Forwarded-Encrypted: i=1; AHgh+Ro6AzqJ8EEzXInzj+3Df/XeilOIN+TvcEc47bJ1GTCr/YPL67XfTPexRk/iHzw+gsvadOPJDBBqGXLRT82nKKRC@lists.infradead.org
X-Received: by 2002:a17:90b:4d8d:b0:387:e0bb:57fd with SMTP id 98e67ed59e1d1-38dc7ba2aa6mr8816595a91.36.1783959317073;
        Mon, 13 Jul 2026 09:15:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:387:e0bb:57fd with SMTP id 98e67ed59e1d1-38dc7ba2aa6mr8816545a91.36.1783959316473;
        Mon, 13 Jul 2026 09:15:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm29475375eec.23.2026.07.13.09.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:15:15 -0700 (PDT)
Message-ID: <c131f3fa-1918-49ec-b083-11ceb03eb40e@broadcom.com>
Date: Mon, 13 Jul 2026 09:15:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Daniel Drake <dan@reactivated.net>, maz@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com,
 andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
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
In-Reply-To: <20260619204832.586079-1-dan@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091523_148749_27503DB4 
X-CRM114-Status: GOOD (  16.34  )
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

On 6/19/26 13:48, Daniel Drake wrote:
> Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
> EL2 virtual timer when running VHE") causes boot to hang on
> Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
> any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
> confirmed set via readback.
> 
> The reasons for this failure are unknown, however it is likely that
> this timer was never tested. Raspberry Pi's original devicetree did
> not include this timer interrupt; it was only introduced via a
> suggestion[1] made in code review as part of the upstreaming process.
> (Current RPi firmware versions do include this timer, but only because
> they rebased on top of the upstreamed devicetree starting with
> Linux 6.12)
> 
> Until more is known about this non-firing timer interrupt, remove
> the devicetree entry to enable RPi5 devices to boot.
> 
> [1] https://lore.kernel.org/all/12363be5b11c752b7155cc0c416fdfd2@kernel.org/
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
> Signed-off-by: Daniel Drake <dan@reactivated.net>

We know why now: the interrupt line was never connected in the first 
place as this was not identified as being a requirement *sigh*.

Can you amend your patch with that detail, re-submit and add a:

Fixes: faa3381267d0 ("arm64: dts: broadcom: Add minimal support for 
Raspberry Pi 5")

Thank you Daniel!
-- 
Florian

