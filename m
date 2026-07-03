Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xTFwb1kkz9JrRcGUxV79lqBnPrw2xUh/ObKoOp+uyI=; b=rRI3iS/tS09prffNwivxE33lLL
	vdn+PWjp2Ez43G50Rz/u6F9rk8V7ALY/O4bF6HfSaQcVFDvQ4Dk2yF2x5ZQsZfsff6lGXMliAzNYL
	qffsHu/wNENVN7QBwBDa10uKIIsUhhT+SqMSvRvExxA8m8EYPJjJJJ74cKmyw/lEoaifxCQ2zby+k
	1QbtlaNeX1MaqL3Guez+jHE+u4sx3E6sKuug5mbA5rn0fzNjdtngoCG0SR+Fth2frpmOHHUmcOYK3
	9oL2ydYVSggLfMXzySXYBB2wKSaZG+d/SKEO/OriTv2YgStLFvrdfYBAAVP1Lz5dWQa10qMrH/3mf
	6ks8uyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGQ-000000079d8-22K0;
	Fri, 03 Jul 2026 13:49:06 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGM-000000079a6-1pwV;
	Fri, 03 Jul 2026 13:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3xTFwb1kkz9JrRcGUxV79lqBnPrw2xUh/ObKoOp+uyI=; b=HxHSuDXQgvnItugfYRvrIiwSFQ
	7GZ+/DdX3eSdrHO0Uy1Cl6V77+Q3fYAz2AfOYN/pghq13Z/PGh/UwnyV0i4qTGt0l1Lad2M4z506Q
	IlPslrPcE+eJh8eeOVZsEcP52053o53TeYftj2q0E28/X7wR56AhCu9dpmauENarH9wJkyCsDfyZn
	J1dhqZEAZJGKPMJw1dwcuiFZ3eXPYTagmSyVkxgRmCnfTUOAbKq0ijQa/cK+IhQw86g0/D442qZjF
	aPhNPcBkKsfgFeJnKTNbew9Yt8fWentD9ejy/ITc85HXkTZ/lNE1QDD7gh2RXiG7QRfHnvXdECs+A
	KmhsrjFw==;
Received: from [189.7.87.67] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wfeGA-008VUz-Ou; Fri, 03 Jul 2026 15:48:51 +0200
Message-ID: <8a49c0b6-4390-492f-a8fd-5edba290bb1d@igalia.com>
Date: Fri, 3 Jul 2026 10:48:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to
 100us
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Ulf Hansson <ulfh@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260530204636.1115120-1-mcanal@igalia.com>
 <dc06a108-342d-480f-849d-908b76fce2d3@broadcom.com>
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
In-Reply-To: <dc06a108-342d-480f-849d-908b76fce2d3@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064904_375119_DE111899 
X-CRM114-Status: UNSURE (   8.60  )
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

Hi Ulf,

Given Florian's ack, could you consider picking up this patch for the pm
tree? Thanks!

Best regards,
- Maíra

On 22/06/26 12:29, Florian Fainelli wrote:
> 
> 
> On 5/30/2026 9:46 PM, Maíra Canal wrote:
>> Commit 18605b1b936b ("pmdomain: bcm: bcm2835-power: Increase ASB control
>> timeout") raised the ASB handshake polling budget from 1us to 5us.
>> Surveying the pmdomain subsystem, 5us is still one of the smallest 
>> polling
>> budgets by a wide margin. Comparable handshakes in other drivers use:
>>
>>    - 100us : starfive jh71xx-pmu, apple pmgr-pwrstate
>>    - 1ms   : renesas rcar-sysc, rmobile-sysc (power-on)
>>    - 10ms  : renesas rcar-gen4-sysc, sunxi sun55i-pck600
>>    - 1s    : mediatek mtk-pm-domains, mtk-scpsys
>>
>> Raise the BCM2835 timeout to 100us, matching analogous drivers. 100us is
>> still negligible relative to a power-domain transition and gives the V3D
>> master ASB substantially more headroom to drain under heavy workloads,
>> assuring us that the timeout is enough for any scenario.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> The response I got from our design team is that turning of the the 
> "slave" should be immediate as it does not support multiple outstanding 
> transactions, it's the "master" that might requiring bleeding out in- 
> flight transactions and for which a longer timeout seems reasonable.


