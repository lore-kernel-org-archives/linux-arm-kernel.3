Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF8606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=358NCxkv;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WjiySbvN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=; b=358NCxkvsUZR37AK6GL6X2ZGCE
	byNJC28DRQ4oCHRKvTuwMZrpq4UOYzsAZr+Kp8j3uVN+xcvlJxRy6Ij+/qQBt+uCDSe85kwRXyn5P
	/RTmgkPL/9GSzldruKCYeZ1dwD9Qu/0ddDwPvVdS8Ik8nAlj7/V19QjcO/k7MzxNFUASHv/QiiioC
	0SIsw0W47TrfRX4BoW5sgCJq1hoFEFpNGpaZ19L9gVUyXcjCfMs4vC2YCrxU9MFQZAkPrqJaTiVYR
	o41VQbQR835BM5+p1yAR4js6JA0w05J1mUzDzfFryH3NO09hdQRcUvJUojJmA0vfWoXzBvfBT6wkR
	0xCw2SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLl2Z-00000005TBT-3Gc1;
	Tue, 27 Oct 2026 17:32:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLl2W-00000005TAQ-497K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:32:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso797825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793122366; x=1793727166; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=WjiySbvNUPKMpJLyyMQ/YNAA6xY4KZFZab4/WBNF4UOmEt+cp/1xXw6wbZ8y3Ond+k
         6ntSBThv0IMxDkJFzaR4NvssOsPyfVJXGW2gzEHmE3em8vbdERR9Msoru+M0fGXVPNQf
         o1QU6vqW5+CV/BoAblHPql9AsQbOGvn0nnZWLs7ZD5arriGHA2uwk9wWULiB1C8pqDsZ
         36fjHqgti2IGJp2qTw325FdKZ81Ea7VwSaF5PG1fupW8+/rQj/SsKPe2yY+3DmHUbatZ
         WGTTB6F0FRZ1UFf4YLVeIqA6IwNpevzblMckv5tyotrp2Eol817iYQRVQ2p8TX9A1z9x
         FKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122366; x=1793727166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=0Mz2yThiMl1S4QnG2kJRwMFBPmvWVvqlm8cRwH+NN68NDdZ0NWdajMaW7OlQ1C5IDk
         s63Ga74zSFH23gSZ7lyNKK5sHPRbjzHMWSN9FYMhayn+XqSrihdU2a6cF3tygdE9NtOs
         v6DR5Ko0hYl3HBLpIPaYsUbP74kloe/qfXz74+XiR5EZ8C+bbbaa+dWwRlIMsz30fHQq
         jx6lFN3cUN12b7NmI75+Zsn8HnUzu+8F38RhTJsE5vjUYrxZH2AhkqnrFShsYgJxJxfx
         1mG1CYRou/ZoAJ0RbAypne881JDsLIhJCwE3FOJwWbUamftBGOvUuz2BWpZTUbXNJRrB
         6ohw==
X-Forwarded-Encrypted: i=1; AKwUvBzpH7VqeapcUL5KsXRlG4+fgjAzRFM3vvr39BdrPz1FbPGkt+1vUjT0PM4/m8CvwWYtamn1/m827yILSE86fqcO@lists.infradead.org
X-Gm-Message-State: AFq9FYJj+6iJcKnRQvpAHRo7kFZ/+d4r3R6e5kxrSJCwECK3Fs6EVwKp
	JS67f3ZozYlJ3Q+vUNbd4uY0r74L3M2I9pORyQxwjQrJqn/kaFRAJ3njOeIF8W2NTms=
X-Gm-Gg: AYBFou1SEU3RZEhK70451SrUMhTkO3jptrPlLkZBP6rLl1cmRLfbUAuskSnA0l+VrkA
	uQG7q31RX+3KnqK7L8fLw6Rng71+DqV8/7XB/2l58t9WmQjJZY9IgdWBua8fqyaGmYan0EMtGs1
	RQcEC/zzcHcIzCjbhx1TbBEQPvU2XboEa9JR/+cRkuzvkos4IScNzZ7NhWHaciDkghAIMF07BRj
	iXc14rpEURYsilvnxWVenjFgvy/7W6LsraaXy3XC5QUxEDUwL3L2zj8SoriyeHTIk3cKoUKjCdL
	E4+4ey3Ip/AY8YKWkxzCdSq1hp7z7phaKZZyZZD4Va9d2KqtpHhAsiINYRiJlbz+OHJ31PbFosG
	Lvy28KFupLFHK9fRUNtF/pSLxAfS1mBp+mx31MTGTnqsI0LWnIlvTfIVGJD4d++PxnwiDaCmQoe
	2RELRAB8cyUrGwnKJmxTby/02nlusZop9qZ4nsPXCUNQjXfuCNiiEewxGH06ie1slK2+SizmfeD
	GhXnDlv+XxPFjHWQVDux0vzvNLph25taAOsGSDdBvgaoMl/SDnxP5k=
X-Received: by 2002:a05:600c:4ece:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a35ac9d100mr198532065e9.7.1793122366508;
        Tue, 27 Oct 2026 10:32:46 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92b881f90sm5173585e9.11.2026.10.27.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:32:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 18:36:37 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auDhJbMOQ-qAeBBs@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auDRHk8eaYife2zH@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auDRHk8eaYife2zH@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_103249_073701_6D3D53BD 
X-CRM114-Status: GOOD (  20.56  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Uwe,

On 17:32 Tue 27 Oct     , Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > Add a hardware monitoring driver to support the fan tachometer on the
> > Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
> > 
> > The RP1 PWM controller block contains specific MMIO registers that hold
> > the current fan speed in RPM. These registers are periodically updated by
> > the RP1 internal firmware based on the tachometer pulses.
> > 
> > Since the Linux PWM subsystem does not currently offer a framework for
> > exposing integrated hardware tachometer readings, this driver is
> > implemented as a standalone hwmon device. It parses the
> > 'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
> > establishes a device link to ensure proper lifecycle management, and uses
> > RP1-specific PWM functions to retrieve the RPM values.
> 
> I wonder if the tachometer readout should be a counter driver? That
> would allow this driver to not be specific to the RP1 hardware.

I suspect the counter driver won't work with userspace daemons (e.g.
fancontrol) which use hwmon as an interface.
OTOH this driver is indeed specific to the RP1 driver: the fan rpm are
read from the same registers range and hw of teh PWM controller.

Regards,
Andrea 

> 
> Best regards
> Uwe



