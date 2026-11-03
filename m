Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAAC606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cdMVWQ4Z;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zns8vp4j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=; b=cdMVWQ4ZBJB0k3
	PTvN888lmz/8s2AjTasZHbYQZo2skbFFrhuZy9sbGcCrcB5vxTapq87kQt2offAEbfoi87bJWrSzr
	nvQpJpCIvy19E4QwnimwgepaUZozCpDsyijnVdx7ZKYhWOAzSlwuSt6xwmvjg7QLl1b/rJ/ocgbVP
	6K31zzQJa1VYQV8iw0llkI8BoLQ6n8DgzStn5hwuzTpb4EY87oR5kwc2rY26seHn3woC6s6qpnNOf
	PFxU9RYuDoDW/l/zNb/eCDw3PmmPVPAH3eyHzSYyQN4WVU/nsfeT/fkWRZVbQtU2FVd/TBNfaR9pV
	gN6uB2gleOsezE/nGpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH8y-000000035JK-2QUF;
	Tue, 03 Nov 2026 16:13:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH8w-000000035Ip-3qei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:13:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3844661f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722428; x=1794327228; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=zns8vp4jH6EBQchcH5jrvpikT+MQJaOnVOqTT+Lzgqwr6Ak271KBr0PpQd1wr8vwYj
         99gBPm2wln2Ka+tAH7RUQ/ISn6eUIKuWhf66+u6Vn+xUxoWZs8PoIkKtjGcvz0fCKu+q
         heHYrIlhF5AI4DLP3rou8liqLrtyj8oyhOCdWpLthmmMPSLaNQXb0mWaoOq7wdE365O0
         lwZkidLTbNMp+CzhqWqDNKmAEzq2Wg+imq2E/BfsZWbY+QVVoar46cnP1F+BPe9+/bR0
         1ucctJlBlEwh1+8HlosTAkzV0eCDAXznqFufvo8REv8i76zajijA9vO1sPs8gVI2HVt3
         NzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722428; x=1794327228;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=DyLrXZ9hgAZs4VntNsvhSOxfgxz5WYNisoe6jvsPyUzZAw6nGTudUcCT912V6UAmOF
         HRv92jb+s6IRYcaHth0b67RxO58Yn/V/Lga7ui+f/9yrJtYe658+qhKvccLF3DNaHwVs
         IpkpBd1QIci6zFdbJl6qDiYZBMdZvCe787biWqnWoZfrlSF6SiCYKzmZk8GxgD48I++o
         mCV2AwSheuHAx2X85oR6OmRX+OcGUgcGFLbP9h2MXwksieXLbNz2iYVIT+Fim25D3bbb
         dc9UumTvidhcJDHurMQb2n3+er2Ydph4yQrP7Q4WFvUVcuxEKyLahmxyNPVUiQj34ipj
         nZbw==
X-Forwarded-Encrypted: i=1; AKwUvBwno52hDWfc/gu73CVU30dgwWCIHM+9A8cQ2FL8Iyysm2+64jOIYjkYAajjQCSqKiNnQ0Yj3kfGuza2bE6ZPxJX@lists.infradead.org
X-Gm-Message-State: APuU4Z/UzULZXiqpxlbMSCHichnS8nZJZqwk0sIjCA/FBotcVcQM92TH
	9Srbc9EPTE+Kr2BvWbKe7gKgFRGaK2K0nBo6xbmWW4Rjambe1jKpJkCnnBWs2mImGdbP3Y80
X-Gm-Gg: AYBFou0hdJqji5O2eJ7wXdBuXro+qgPULWl1n8SA8Aprdo3wx0pKfWy7TfIbz96YTUl
	f3WgUYWJfX7D2+DSTM+M7pCwdMUZQ9T7HMhaZrVeBurOJzGNNftw2WDD1Rw0hd1lHc33hqvH5f4
	iWDqld3ZTFNh5Z/0vCvEtzqJ7GdTS5fiMdjVjuF5N5l9Ipsa/+MtyEewIgvfcNfE/p889WCNNRK
	GNfb94zAHpeGncZmfDL63axjCxntvQrrEs51diurhoPEn5s8cW4kH9JC9ZVotCt+W0UyRJNK3M2
	jEN+bNb5CqwGwWbo9GD9+25nm3o5jVMNFsy8MIx3Hq1U75HRYGsJiw3WE2ro4AVGWzBH5G0ZtUL
	iD4Arh9FoidAR/U5fAUucFLjni8cdTFHfHaMNTTBN4zngNt1oY06Fh+3nX+y1ddeII5dH8GdG32
	HzAVO6vtaynicS0KDRARDzD0ZdtawtU2d0M0OywVlfIsbrQwukkVYNQ7QTST5EsIQ08NQzX36Ch
	2XJDSbRuduAKHEWr1yKzn/VFjrEKLU9n3F5eOXpllLNpJyUP32okHaB6FOx0An85krYxcNZ9fSU
	ass863zfNXeZC3u8hU+i8GJM+qpo2ZX+96POgdz1dWNWXzOCRSPWJ13YWu6LPEDB2csFi1cqT3K
	M84QvF3cetdAp0A==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr306531505e9.13.1793722427449;
        Tue, 03 Nov 2026 08:13:47 -0800 (PST)
Received: from [127.0.1.1] (ppp91-78-241-225.pppoe.mtu-net.ru. [91.78.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm24419506f8f.15.2026.11.03.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 07/11] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-7-181bb0d23f4c@gmail.com>
 <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
Date: Wed, 04 Nov 2026 02:13:37 +1000
Message-ID: <179372241749.1222507.6207957568716226558@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081350_972053_7C069C71 
X-CRM114-Status: GOOD (  16.38  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Guenter,

On Mon, Oct 19, 2026 at 06:46:41PM -0700, Guenter Roeck wrote:
> The issues raised by Sashiko will need to be addressed, or you'll need
> to explain why they are non-issues.

Thanks for having a look. All three are real and are fixed in the next
version:

1. cpus_read_lock() in the clock notifier (lock inversion with CPU
   hotplug through cpufreq): the driver no longer takes cpus_read_lock()
   anywhere. The armed state and the rate are published with
   WRITE_ONCE() and applied with on_each_cpu(); a CPU coming online
   meanwhile either sees the new values in its hotplug callback or is
   reached by on_each_cpu().

2. armed set after on_each_cpu() in start, racing with a rate change:
   the flag is now set first, and the start path and the clock notifier
   each have a full barrier between their store and their load, so
   either the watchdog is started with the new rate or the notifier sees
   it armed and reloads it.

3. Watchdog state lost in a deep idle state: a CPU PM notifier sets the
   watchdog of the CPU up again on CPU_PM_EXIT/CPU_PM_ENTER_FAILED when
   the device is active and the watchdog mode bit is gone. It does not
   reload a watchdog that kept running, so idle exits do not count as
   pings.

The earlier Sashiko points (prescaler of a watchdog left running by the
boot loader, rate changes, resume) were handled in v2 and v3.

As the driver is not specific to the Cortina SoC, the next version will
be a standalone patch to you and Wim instead of part of the CS75xx
series. It will be sent after v7.4-rc1.

Fil


