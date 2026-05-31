Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F84CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 12:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SIgq8nHu6psw4Php68J+X3M2P+JbJ62dqeHI2I7CMc=; b=NR1r+8g5j9ROkaX911nax19stx
	87Ah2TSZ9Mj+9QPyPRMuX5v/a+BwTpfF35dNnYnMzVuKO647KenAabxk5hSEUDDayrPuNgytLK+YH
	w9A4sYHBnmUqKSGv+IBDQ+ExguTitSK+xfLAiPcSk1tk8HH+h5ExfeQiknfZAoE0cUs723d28KtbO
	mDpbjIg2/0VPi1has+Bna/F8ohGgl0R9rCG/V0HOD+STfMO0towq0w4W8vsFPpCzhKvw1UPqhYF+T
	emsEQ4ip6ghGx9DkrDBs8YmJX/24aJchhK3C0GwCrixE8t9hg6ldfeylJJrOSL0zO1e3dxJcaTpXA
	jDid0suA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTf7a-00000009Zgq-08fz;
	Sun, 31 May 2026 12:18:26 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTf7W-00000009ZgG-0rwa;
	Sun, 31 May 2026 12:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1SIgq8nHu6psw4Php68J+X3M2P+JbJ62dqeHI2I7CMc=; b=KNahn7qtNwDSJ95/VyjhQogG5F
	gAP843yR+nqj1HlCXX16K3bF0N1+oz944Hv5hFV0jOCNktJ228XdHkWL4I7rALgJOjPW2XNLt3hWG
	m9AfuFqSu3Z47KS/dbFY2p4LYylbk6gWMr9/oUmZUqeYWUkI9epfKJb0W5R1ruri4h3OUpdWZzM1x
	4jhS8+d//u74PAy3Ykb38CMhfV7Ru//WTmZg/D8QPCLaZbjgHaYqJnKORlCOxfBuPHBRaHKyFOKGX
	kNJboHdY3wBSD+iqlQLgPznbfRSEOlWufplTw6dFC8w3noVZ+74mLAlPhH3g+dzM1b8sL0alCcngr
	Qj6pEZNw==;
Received: from [189.7.87.67] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wTf7I-00AZaA-LQ; Sun, 31 May 2026 14:18:08 +0200
Message-ID: <eba66b9e-520e-4afc-8973-d54b22919d2c@igalia.com>
Date: Sun, 31 May 2026 09:18:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to
 100us
To: Stefan Wahren <wahrenst@gmx.net>, Ulf Hansson <ulfh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260530204636.1115120-1-mcanal@igalia.com>
 <deecc409-02c1-4393-bc06-1852fc06e4d1@gmx.net>
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
In-Reply-To: <deecc409-02c1-4393-bc06-1852fc06e4d1@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_051822_565982_C3C11295 
X-CRM114-Status: GOOD (  27.77  )
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

On 31/05/26 07:41, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 30.05.26 um 22:46 schrieb Maíra Canal:
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
> tbh I'm not convinced by this explanation. Starting with a timeout 
> comparison across different pmdomain driver looks strange to me.
> 
> My expectation that the reason for such a patch is that there is some 
> kind of scenario to trigger unexpected timeouts.
> If this is the case, please provide more information about the scenario 
> (specific platform, scenario, link to the bug report).

The context: I was debugging this issue [1] and initially I had the
intuition that it could be related to a timeout in the ASB polling loop.
As I don't have access to the BCM2835 SoC datasheet (the public one
doesn't have PM information), I started to check other driver's
handshake timeout to see if ours was comparable to similar drivers. As
you can see, our timeout is much smaller.

In the end, issue [1] wasn't related to the pmdomain driver, so I don't
have a specific scenario to trigger this issue. Even though, I sent this
patch considering the comparison to other drivers with the goal to be
conservative and use a larger timeout that could accommodate an extreme
scenario. However, if you believe it's unreasonable, I'm okay dropping
this patch.

Ideally, it would be great to have information from Broadcom on what's
the largest possible time required to perform a power transition. Maybe
Florian could help us with that?

[1] 
https://lore.kernel.org/dri-devel/20260530-v3d-fix-rpi4-freezes-v1-0-c2c8307da6ce@igalia.com/T/

> 
> I'm not against the change in general, but please start your commit 
> message with the problem and not with the solution.
> 
> A related question, does it make sense to add an error message here for 
> the timeout case just like in the rest of the driver?

Before commit 18605b1b936b, I was getting a "Failed to disable ASB
master for v3d" error message, so I believe the error message already
exists where the function is called.

Thanks for your feedback!

Best regards,
- Maíra

> 
> Best regards
> 
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/pmdomain/bcm/bcm2835-power.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/ 
>> bcm/bcm2835-power.c
>> index b76d74e3849b..d507bb675e29 100644
>> --- a/drivers/pmdomain/bcm/bcm2835-power.c
>> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
>> @@ -175,7 +175,7 @@ static int bcm2835_asb_control(struct 
>> bcm2835_power *power, u32 reg, bool enable
>>       writel(PM_PASSWORD | val, base + reg);
>>       if (readl_poll_timeout_atomic(base + reg, val,
>> -                      !!(val & ASB_ACK) != enable, 0, 5))
>> +                      !!(val & ASB_ACK) != enable, 0, 100))
>>           return -ETIMEDOUT;
>>       return 0;
> 


