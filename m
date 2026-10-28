Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2q5kz87h;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQQg2kDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=; b=2q5kz87hLGiuZv
	7uNth1BX/H7699pW/5KAvwiM45fVfBcNVQk6uJi6BVr2B4caW3obwhlUnvWg2YK3S4bzuRwdz4yhU
	5DicBJo5A9Nds0TpfKiKLUuQfuGhzHyP00cG6F9dM/XBuKZf0COqCWj24KE+1Jd9b2yY8bHQEX/OZ
	s8wY/WwkNaC/OiS6wQb+yXn9XZPFgTKTw9ZvjWd0Wq+5OcZ40/6i6T046WBE17eoob+K+5jrRhLiH
	0b8YMrevdWP1V+a2u5ZeXU6Ty3seigcpo2noJix5WKWQiI8mMvyuimtF6lT1XA2gdRbX760MVaZXm
	XrxISl+Z1fkMXJrsK2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAII-00000007vlU-2SPc;
	Wed, 28 Oct 2026 20:30:47 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAIE-00000007vkb-3kOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:30:44 +0000
Received: by mail-oo2-x00.google.com with SMTP id 46e09a7af769-84e8a9fae57so563677a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793219440; x=1793824240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=xQQg2kDxZFONcZ8QPdq8gEbebuGvt/w3gVa6P+a+A914/wNMMd+aCmQvw5120NgSFZ
         EYV9TEPI+S01iMxeVBNuXkOoCMUE6epnEGpzWG6rwrPqrfu3hXiUOmnd7OEHVR3srOPU
         axWVKo3XEMbwpOhXcDOXhZdG5NmgquyeyXTHOjCugkkTxvuTs3Phm5rPBAlb14c2GhTf
         8T6I5L5mBxCcb64lBk46fwNE57of1X5vsg3VRAduqi0bUJ+tuBVcGEIZ935MoIvren/B
         26u3CV9Soim/Ad8TQP17BuDc7u3RaZWxvcO/fEnWUOWfC0a0krKdii1oFUnJRZEi4aln
         5SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219440; x=1793824240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=bhbx5KfQB2Xm2dk5Ng56CoZw31jShbMA3j0u6xANuvzmlrcHR+8FBCYhvn81gUts5P
         ZJ+Wu9MCpBl6TXP0apSUmDPwzzuow8S20XeOG1DOyVyQmisnoPSRPNgQGpB8bv2coUVG
         QI2Nt/sZsOR5Bw2uUEpcGXbwNhbQekK+UTJ88XOV+z1UGKZHOfnqgzpBEI0OvGIjnoZy
         7fZHpbxarnpeRn/j92YOqKURLu34iyKObvWGvfIt74SsRjahLjcQ3CJsZBA5wk4UpNBX
         zeYKRG3yVBdjITAv+u2x0I7R2pYbb6W5G0sSrkrzOTtzOBfV4e0KAmxCnZXad4tG92MT
         NEcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmi3bIILtvUIY1oQZzXI4ke9d5ymJ6sHPRUCUi/hPUH8MnjBGz2WunU2jk3SpgQ1XwMY4MtCNn7Vt3laJ/u7f0@lists.infradead.org
X-Gm-Message-State: AFq9FYJZelgd1Ufv8l+kHCdLhCn8IbkllVCXplTF554CbDGCEBDV4QPj
	Q9GbhvNJ/72S+kdW8bStY00k3XVWjRNrxFado4pwA+aOnWyq53EdJjf9
X-Gm-Gg: AYBFou2XyBgX1yrldM17X9HnSLRMowQhEDAIUE03KyRsyYKfEWYuBjyJCS9BCNUn6p+
	TRp53ijJ7Lj54+rtuquc/MtPTrok0uzVS97mFwoovISrPjGs2ds9C7Zp2W36ILFu4A/FXG8Fhpn
	zzJdYeBnhNkIdg136q7p59+gHc//U1n2uZZWpVotT9Mf9MuE0eGnCxGzyZnvrBsSC2O+gMRxGWS
	w/pd3NedQW04OTssknym3T1vvS3p5YA11cVAgZflXOAI2xSnvf8hD1Fr6kuGnpQzaQrZ1U10rmB
	2drBKspEAxRqSLM2SpNpInceoqKWLEqjO5EcjMBPtYEkD39MS1OvO+LHugnhKDCGa/9lmTUy4n7
	aWdjfQi5yVv4uJrXBTw22VCRTb29b/Xa9GR4Lw8G1qss/vr9GBIRwH6PBgXbT2X9OYSgA8prbIu
	7HbGQvHl4wxJx3TG1JLkV9XNyXttJdxlfoFVOYZw9pMj6SRA8b0/4pQRvuA78B+iK0iIW6UvHUy
	ClyIOIkDGL3bcPg2sQ8HxTaTmf8yuNo+xLPUkX9wkY/0sRrudCnG6DDesE2ynIZ2wxnRdsJkc5/
	HAQMDR6LV6vbgUOp51MQWQ984ItWhwX7nWoXbvtpI9GjxbkI6zjqyZ91nENs+ygdmIOwW40BedL
	VkQqpUy8WVINNaRRHRFYd0nybVuZFp6IcdWLzt1yo2A==
X-Received: by 2002:a05:6830:680f:b0:81c:a8c5:633c with SMTP id 46e09a7af769-85ab7b0d6b0mr3330153a34.17.1793219440535;
        Wed, 28 Oct 2026 13:30:40 -0700 (PDT)
Received: from [10.10.121.179] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm2618813a34.1.2026.10.28.13.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:30:39 -0700 (PDT)
Message-ID: <7981f7c6-c949-42e6-ad53-15e6530588cb@gmail.com>
Date: Wed, 28 Oct 2026 15:30:38 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
 <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
 <20261020073236.dDVmd3BW@linutronix.de>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261020073236.dDVmd3BW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_133042_939958_23B0F82B 
X-CRM114-Status: GOOD (  17.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 2:32 AM, Sebastian Andrzej Siewior wrote:
> bulk writes could be a concern. The 40us delay is within the lock
> acquired? If so, could this be done without the lock? I assume this is
> part of the init sequence so nothing should use the HW so the writes
> should not be interrupted by other writes to the device.

Yes, it's under the lock. regmap_multi_reg_write() holds the regmap lock 
for the whole sequence, and since an MMIO syscon's regmap can't sleep, 
the delays are udelay()s. The PLL's enable runs that sequence (13 
writes, 40 us of delays) whenever the PLL goes from off to on, retrying 
up to 10 times until it locks.

In practice it's init-time, though. The G12A USB3/PCIe PHY takes the PLL 
with devm_clk_get_enabled() at probe and keeps it on, so it runs only 
once. Nothing else writes the PLL then, but the lock is the HHI 
syscon's, so on RT the other clocks in that block would wait it out. 
Running it without the lock would mean changing how the meson PLL code 
writes its init sequence, which I wouldn't want to take on in a pinctrl 
fix (unless that were preferred).

> So it would be safe for now…
Yes, that's the trade-off with the second option, which relies on the 
DIN never being written in a multi-step sequence. Nothing enforces that 
though.

I'd like to send a v2 after -rc1, but I don't know the best option for 
the fix. Still waiting on Lee, Arnd, and Mark to pitch in if they have a 
preference, or any option I've missed.

Best regards,
Ryan Brue

