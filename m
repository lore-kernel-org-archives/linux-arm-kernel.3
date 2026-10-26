Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C628606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TcbyNlO4;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FZH/k1ke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=; b=TcbyNlO4ieRcU1
	oBsKSKQVGl2GUl+yWjCSZJGdMXGYh2ZQvzOXGUg9DfasQzU9RV0B1Wf185K+L2yYkgU1bjqzzOrJb
	JxWjyCPJdAFO3TgvhMGlGxDRiqFBhDo96gupi8N/B0LMHm2PlgZgTiHuE9X0A2NxBL3gBsxIXOB1n
	71070Ea24s8DftLl/XSJ+18PLuXgerl5ufcwiKp5pBUJN8zCObQ6uT3IomLTU6RAC8w0R812kKDJf
	A51tQYjLjRrftIVsRJSR8x4kiMKQIQEwnSX2O3s69WGV1ZDAYlEWOgbT53wuI8eKS5gljCVdPy8Zv
	wC1Q8tSqXBXSG802atyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGWG-00000001zwE-0U4R;
	Mon, 26 Oct 2026 08:57:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGWD-00000001zvE-0pBn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:57:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a214af2076so18663905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793005043; x=1793609843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=FZH/k1keSJfKvQBTM0KaK0w0iGv05im1wn8ciBgPcQTADJEUMH5fbh1k3f+DILdenR
         9wqPCbCrbrsVKAcspfvwXCP5Nw7ixB8i/1vZcwrAyFPed86P7kISzT+gnOQr6WpH/Agb
         sT7LqYamiD+wfPaxYJ+V6gO/g4MpiChExqCo9TRE6xJ3ronDWOIgmilLNp9thzZmczrH
         QDT9GpNndjXGUUFfgUaX+PJAw7UkTWNGQFb7jhkSsFf33a9xqK9YoGqLtXfFIG0vhMe0
         cQrJF76nKVEHdQuuB4MYmfpg3T9ScRdAHhQNPg1GtrwvI5zrStXlqpNrByevKun1LdVK
         He3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005043; x=1793609843;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=AECp00vNUtZxRvzMVf5LhFOybXi8VTY3fA0Vr6yo3OehofMYdUvWvyOIJ7EMgF34ZQ
         ZgexqE46ptn9fwMwIb5MNjEwZ8xyOswKDAx43Nd2K4Hf09xmwLl4HCs0J9pGlc0tCBCm
         iekljaKr0BmZjlGE604pneYTBy0VVrqx8b8+zfqDbALanfoxWODyg+l6nNJ051KoU3zG
         PHsM4Wc3XD2EeEJmqIeN9mG0JCH4oUxMmepSr4Ned/Hjin/SbaNDk1btOqVl8Ua1ndWU
         9Vt1ZQ8k0BkrATtHw+YRRBD05v5eJPZPLOMUDKRyTBY2RXww7zu0DOxPIgr1zoS0l4St
         z/Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzcjRV7Cvup2KjcvuJuPrxT5A5f+JTm84C0l3MbL7fb8HDalLahx2XkTfndZhkTYmsG2PtkgzUaySw/3ODNK2vr@lists.infradead.org
X-Gm-Message-State: AFq9FYJQCxAV+KKh2cDtb2e1OSoxmMHOG5zD0RLA9cq1UTYUwQNKGLsQ
	2hsGhZd5WH8XJPKP0viltJOxzWFXff0Pkw+0QbN/4bzUnkQ57AZY04+fJnqYD8qKf8k=
X-Gm-Gg: AYBFou2xT0zjmGHwK7cT7o3359gfO44YYx2f+k5O4e7UE4c5X/9NwS21PkxrF6263Dq
	K59QlhKzQQdW6Oxvr568JiDIBU2J/FTIFhImdBRhlmnDPQWIYY3MEZrg7g6HyD56roYgSS+n5qS
	iMihj7hmvVWCzROXA5Q8FKX2pAO2UtFTFqvZeJNognwOyVvgWhOPaAs4yidPqDbk1JeNrIQzCRz
	dAqPExw9OxiagDKEnpzFdzRNl5vpWWdTfse8fzgIMS+eF4iEpfcz25dwE18t982soKaqdPPuag0
	MtP/2jws6FGPxmUBUzryTQr7rScr/LjYqf/1CJ0HUAKQScyQHRqNJASLkKZphynJh84kOeFxDRF
	YWJ4D1uL6YbGdWA5RW9xnjGdksc92Z+xj5G40dZ/S7nmNdy1SBByEGU5OMilWDWpe081vzk0Lza
	/mDGtaXUbopV9wOqxX0s+IcqqEfofViE+Gf7n+nCp3FZrjLAUMrSMp9oO0Z/l1WVsCoJan89BJ4
	0/3cBsR20GrOQg+AmcrqP5As160BdMB8js2yL0l1jGnYUekg0H6T4tYRuuHzwR9V/TH9npPmy4=
X-Received: by 2002:a05:600c:3b25:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a35ac9f1ecmr118305925e9.19.1793005043279;
        Mon, 26 Oct 2026 01:57:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm187484365e9.15.2026.10.26.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:57:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4?=
 =?utf-8?B?bA==?=
 <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
Date: Mon, 26 Oct 2026 09:57:22 +0100
Message-ID: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_015725_275999_707D4450 
X-CRM114-Status: GOOD (  14.85  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>=20
>> Every S4 speed bin runs the same CPU frequencies but needs its own
>> voltage curve, and the bin can only be read through the secure monitor.
>>=20
>> Read the bin from the firmware, select the matching
>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>> on the SoC compatible and needs no node of its own, and S4 is added to
>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>> the bin has been applied.
>>=20
>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.d=
e>
>> ---
>>  MAINTAINERS                          |   1 +
>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>  drivers/cpufreq/Makefile             |   1 +
>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>  5 files changed, 202 insertions(+)
>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>
> Is it safe to apply just this one ? I can take this via the PM tree then.

I would advise to wait a little for Amlogic to chime in.

Patch 2 is something I already rejected back when S4 support was
initially introduced. I suppose AI just unearthed it and did not bother
to mention it.

Amlogic was supposed to migrate to SCMI at that point, and possibly
handle CPU frequency scaling through the secure fw entirely.

They did on later SoCs, I don't know where their FW stands on the S4.

>
> --=20
> viresh

--=20
Jerome

