Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE78FE7BDA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2NvsMxoWNVuUqRhdvvQV3f9iNA9+S0f6QJVA/XX1tA=; b=jVpMG6Q/f9k/iVAIwN4bQVx35d
	uzGP9CnrRG0qL0mXKDiDOKfNuK5JRC8MV5Qn5O/bZJK4iIUrkbjLr+x4xCdyTNiXE+OG8TJxSP3Yp
	AG7XOei/8GDy7cZbLUNL5D+Qc3aLEO3J6/sZPOOLSR5gmAGGCexLLQkQNe5p1LskVmLb80j+55YPn
	RiJadV6wQBpPI7eUfo4X3+aNQ8HmjUCsUICwLWhdN/9uzPOEyxOg7i17n/EJY55RTEQdB3CqHtfJS
	fEgD071IqPn2bruB/8Q7CXjRQsRrkQpanBvRVDtZgW3Hbn96GFshDw6nd+2qhWIlM93znV7hYEFfH
	wK3KrlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxZ5-00000006UtL-3Hjt;
	Mon, 16 Feb 2026 12:18:59 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxZ1-00000006Usp-2p75;
	Mon, 16 Feb 2026 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C2NvsMxoWNVuUqRhdvvQV3f9iNA9+S0f6QJVA/XX1tA=; b=kPBIMA/sRAOsa3jwN6/PZ5Tk0O
	2dxAzeWhKqPER+8aVa5N4vM08Mr9G5ewBkId/zezYtybBPS+oF0SKGSXy1NUsRPQRcj7JiUTZO95E
	He2I40ZGS9BSoK8uDOkAoQyUKC1LxbaWFECwDaQuhSCANE3i6tXufhgx+VB08EI+LX/7oWdDlprXg
	lJoFvUliz6A+5eu+oWPFSGx4XhVIrjep86hp8ZocGod9b62hIaPwUBhGPcTiqPz2/ZgAya8FbcCWR
	4NBufBjqivKo/z3djmIh6vZWL8KaK3X+e13CZNSRgQEbko2ySfEy3K8bv1RA/Rq5PpJ5J5OXWVTqO
	IAPvLL8A==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vrxYl-001Hhw-My; Mon, 16 Feb 2026 13:18:39 +0100
Message-ID: <b55ac433-4fe7-4179-9777-278022ccd3cb@igalia.com>
Date: Mon, 16 Feb 2026 09:18:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
 <20260216-brave-ara-of-typhoon-cf90ba@houat>
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
In-Reply-To: <20260216-brave-ara-of-typhoon-cf90ba@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_041855_719907_8C40A752 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Maxime,

On 16/02/26 07:53, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Feb 13, 2026 at 03:52:56PM -0300, Maíra Canal wrote:
>> If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
>> HSM initialization, which would result in a bus lockup. However, those
>> clocks are consumed by drivers (vc4 and HEVC decoder drivers,
>> respectively), which means that they can be enabled/disabled by the
>> drivers.
>>
>> Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
>> drivers when appropriate.
>>
>> Acked-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> It looks like sync_state would be a better candidate to handle this?

I have the impression that CLK_IGNORE_UNUSED is still a better fit here.

First, the clock framework has no sync_state integration. The only use
of sync_state in clock drivers is done by Qualcomm's clock controllers,
which uses icc_sync_state for the interconnect framework. From my
understanding, CLK_IGNORE_UNUSED is the idiomatic mechanism for "don't
disable this clock during clk_disable_unused() and allow drivers to 
manage it", which is exactly what we are looking for.

Apart from that, if we decide to use sync_state, I'm not sure we could
handle granularity. sync_state is a per-device mechanism, not per-clock,
and clk-raspberrypi provides multiple clocks (consumed by different
drivers). With CLK_IGNORE_UNUSED, the protection is per-clock: once a
driver calls clk_prepare_enable/unprepare() it manages that clock,
regardless of what other consumers of other clocks are doing.

Best regards,
- Maíra

> 
> Maxime


