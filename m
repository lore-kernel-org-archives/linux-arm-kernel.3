Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lMdATHf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0bRG5pWu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5G3ZmT86d3fe1rJiM6b5mr2ay0ue+O83AEJqLc41Pes=; b=4lMdATHfHotgbD4Wd0ZDqoH74H
	32H0bw6Xvn2Szae3KLzJiZ3u65DZrn893p++gRIZvY8a12DOyPBRFZi5LEOK6VY9LyulGB9wXc4cJ
	xx29FbsTQpn/gsvw7B8Ol29Gp5LUlAcsYggxqL8pAYXeTKZ4RYHiYXfYQHHH0FNzg7qq/JxEdF8xp
	QFLIHLAN1Cd7F96FdKvkopWXE+9A/nYtBrhsN3Vl3gi0Co/O+qeG5yQN3goibqsy+/EofcKYZhc/C
	CwcQavffrKSZ5fP7ENDQE99YblTdAM8l7Njrs8YAwrliuY+RVDgEeWLK6WuTbaAx6YONPQmB4XXDG
	qsnPSNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjnw-00000005Jrd-0DH6;
	Tue, 27 Oct 2026 16:13:40 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjnt-00000005Jqu-2lE8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:13:38 +0000
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id LYFNxEEnMc3XsLjnrxhunZ; Tue, 27 Oct 2026 16:13:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LjnpxOow3p4IlLjnqxPi8E; Tue, 27 Oct 2026 16:13:34 +0000
X-Authority-Analysis: v=2.4 cv=X59SKHTe c=1 sm=1 tr=0 ts=6ae0cdaf
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=lMUDpl8nYqh3M6R7ydkA:9 a=CjuIK1q_8ugA:10 a=LP3-5Lh9zdkA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5G3ZmT86d3fe1rJiM6b5mr2ay0ue+O83AEJqLc41Pes=; b=0bRG5pWuLiZXHXqJQvNggCWlNQ
	GbtulZEHDb8sReMmPpD9jeLOPqZQkvsmUB1QF/eaKJBgihsBywZ3ulNPnxshEjknN4c31xvSydrof
	G8UKnkf5xfgnI69nY3a4sNA9bFAtUL8L0JA58uLhKUpMYHBBJ0OrdJplBMt99zyuCp21tdFaUrvXc
	Rj/BTRRnkXIIxr7cfp1yIvTqmh6CwL7GsO4UOrGrFPKoB3lE61ZgXnJN1tKcwjo/RzpYUatrMH8pN
	s0ztAID6NGI3HShJw5b84D//CWybXdMw56O+bg8PoNsDOWiW4Y6p1JVP8bF+MAB+WQBG2bEK7fw3K
	OgN2UsKg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37196 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLjnm-00000000huz-1JIR;
	Tue, 27 Oct 2026 21:43:30 +0530
Date: Tue, 27 Oct 2026 09:13:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLjnm-00000000huz-1JIR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37196
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 29
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI48uUElaAkHkzpFYWggewFHh3lzFzY7UAXsf8oskGst+h3DEa30+S5XY1XvgmAeWuJSQTHVOm6Tjw0DXy6/uPOk/3jiMoX5I3peQgPsataSe9cWs/wS
 jpdDgiphC5gBVLwXr8xQ/95SGXTZnuEkuvUVct/OpmIP4DONs3ydgEEi0zvzFHwnf4le7zOdsxGstZjL5zBDOh4M28+ESnuh8kdIO9P4dnuZX00Dm1K2XqZN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_091337_715939_16D30CCC 
X-CRM114-Status: GOOD (  31.82  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> >> Hi Guenter,
> >> 
> >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> >> solution.
> >> 
> >> The current implementation is a consequence to the discussion about the companion
> >> PWM driver, from here (and the revisions that followed):
> >> 
> >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> >> 
> >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> >> 
> >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> >> 
> >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> >>   I moved from readl/writel to regmap + syscon.
> >> 
> >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> >>   and the function has been exported from the PWM driver
> >> 
> >> - new patchset for fan driver: the now independent hwmon moodle just call the
> >>   exported function from thw PWM driver.
> >> 
> >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> >> all aligned, as this would also require refactoring the PWM driver.
> >> 
> >
> > Let's say it that way: If you don't want to implement the auxiliary driver,
> > and you insist using the exported function, I would prefer for you to go back
> > to the first solution. The one thing I really dislike is conceptually broken
> > code, and I consider the current approach broken. Your call, but the one thing
> > I won't accept is the code with the exported function.
> 
> I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> an issue, and regmap is not the right fit here:
> 
> - Previous version of the PWM1 patch series publish regmap using
>   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
>   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
>   chip itself is PCIe device which must be removable).
> 
> - The tachometer register is not its own separate register, but rather (re)using
>   the phase control register. The phase control is not implemented in the RP1
>   PWM driver on the list yet, so this is currently a simple register read -- I
>   can see that RP1 PWM driver need to take special care to about the tachometer
>   reading if the phase control is implemented.
> 
>   For the two reasons above, I think the way that tachometer is read should
>   really be an implementation detail of the PWM driver and not for the hwmon
>   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> 
> - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
>   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> 

Let's agree to disagree, and keep the code in the pwm subsystem.

Thanks,
Guenter

