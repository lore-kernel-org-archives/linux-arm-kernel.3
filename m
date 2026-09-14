Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214E0C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V26hn6RdtcapGyB1Q9qAVqrG5Fqfq9J1gaqGxp+1q+w=; b=x2x4BgDrQx+xU7DOz21zwEN9Jb
	BkM/wO/ZSEZ5wECtzzroWSbSInLtuZF0E2gtLsE72scVm/Z8iZLPfmrzqH2XJn4LNB2XgwdKvTMtH
	19yhCx2fVCIxpmp9/rd6AlVhp8R3VUcahyGNmEtTJa3SCY+0q/4M9U9Z4En+LS1L4iivxdjn9ATK/
	H+4GL3hZszEvF/WJzAzfVmJcdGubStMLnTkleiCOKYc7nZCguIwDpkarIKWM6fr72aROtly+dqqqr
	MuMNbGf/eCSUUZNkuTkdBez6dAcCrDNd3g7/RGXAYmM9V+WjlE0AzsSUJIRc5OCyegHjL5qodFTo2
	LZm6g/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6B9V-00000004QtA-1Lbz;
	Mon, 14 Sep 2026 18:11:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6B9T-00000004Qsv-1c3r;
	Mon, 14 Sep 2026 18:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V26hn6RdtcapGyB1Q9qAVqrG5Fqfq9J1gaqGxp+1q+w=; b=ctvehEBAhNUnd3gkJ2UeRdto3A
	ZL3LIenrtmpo/6+Tyv2PpxxtX7A1a2FzatFAwSFUjarGQ63LFjCgCndAEPrMPw98shUdbBO2lL0Ba
	CWXEsLDG3IYccPdf6pQY642PDyNjosyL2JuXy261L40QDRALqWeSncX1npEVEo98aG4hNMa2ILTo5
	XT4omCAzsMbDFiyMe498laXX1VmF3CleZ89a56jBJgkHDtxyXf5DacNCFsphTWxMFXzpVpKji2KJd
	pOT+4i83tqpb0MKQKb7hp2HZSJD3Wnjkz2WLxq6zOh+aEMn8q5eYhLKwTzVkr98x5IfXf26VuQuA3
	ZF+chuRw==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6B9Q-00000005vBI-2vmC;
	Mon, 14 Sep 2026 18:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=V26hn6RdtcapGyB1Q9qAVqrG5Fqfq9J1gaqGxp+1q+w=; b=pIVHT2Ep+LpSFgehssJGFbwPQx
	n5ugHjm2ebEQeYkuYKkV6gfrpW0KaNopeDqn7eEWZtS+o4Inos+9TM/Ew3wQG6ZyGeARc3AE+LGbJ
	5tR/0hWBRiH3lpc2gCcj0o8jkrMn6bHcn5Y9lV/21AMw/zVCDuDlIddvtfoEFD7WfGf7Uh0RmUZFM
	qhBPGHeNTcQvEAGCXLlVPKnkDd0iwgjLphnMhPiCyIeG1vyWN9L4glPaB30V1Hb9EsKbL6juV5AV0
	r/R3Ard185iCCuqvMmEIhy333bMogejlqBu5l7AqApq+WHOqH9GbpIqqOS3OfaC29aCb/VJjxoK+t
	20NfaQqg==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x6B9F-0021te-1b; Mon, 14 Sep 2026 20:11:21 +0200
Message-ID: <ff452f18-7f4f-4274-ad95-9937af972353@igalia.com>
Date: Mon, 14 Sep 2026 15:11:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
 <20260818-idealistic-chivalrous-sawfish-08ddae@quoll>
 <3ab273be-e811-45e4-adf1-75532c840bc8@igalia.com>
 <1f4a0df1-97e0-48e7-bd08-6b31c8dcd0e9@broadcom.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <1f4a0df1-97e0-48e7-bd08-6b31c8dcd0e9@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_191132_849447_E03DC89D 
X-CRM114-Status: GOOD (  13.00  )
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

On 03/09/26 16:38, Florian Fainelli wrote:
> On 8/18/26 03:35, Maíra Canal wrote:
>> Hi Krzysztof,
>>
>> On 18/08/26 06:05, Krzysztof Kozlowski wrote:
>>> On Sun, Aug 16, 2026 at 11:05:41AM -0300, Maíra Canal wrote:
>>>> The BCM2835 PM block has exposed a reset line for the V3D block since
>>>> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power 
>>>> domains
>>>
>>> This is a reset provider driver, so not really relevant here. Driver
>>> commit would be relevant if it was about consumer who implemented
>>> undocumented ABI. I suggest to drop reference to driver and instead
>>> describe the hardware.
>>
>> Ack.
>>
>>>
>>>> under a new binding."), which allows the GPU to be reset without
>>>> power-cycling its domain. Document it so that the vc4 driver can use 
>>>> it to
>>>> recover from a GPU hang.
>>>
>>> Does every device have it? Cygnus as well?
>>
>> I'm not familiar to the Cygnus hardware, only Raspberry Pi, so I'd
>> appreciate if one of the folks from Broadcom could help us with this
>> information.
>>
>> However, just like the power domain, I added this property as optional
>> to accommodate the fact that the current Cygnus DT doesn't expose any
>> power domain or reset controller.
> 
> I really don't know and have no visibility into these older chips, let's 
> assume they don't.

Considering Florian's feedback, what would you suggest, Krzysztof?
Should I document that not all devices have a reset line?

Best regards,
- Maíra

