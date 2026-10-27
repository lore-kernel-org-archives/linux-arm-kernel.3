Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026FA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OI6n2Tbq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SpXCwzbR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xnmTt7xAHrUILK2F5tw9jpxyescs2qacR8TokbmgBtk=; b=OI6n2Tbqy/dF5CD6aqSz5VUO0Y
	LV/vee66NOgot9LhxE79ontzdvAId22gsW9XJSoIHT6zoerZbOIY8hwPV5alQ+iiVqj7MIGEaGAJd
	a2oQlPcJiK31NKr5Zmn3H9v4tCDSz+B4k7kPz2xUiSOKFC10iR3pt/4IkyUhcr584Pkcj/q6FwNkF
	HlFbmblSirNfgQzrzsKufiX6nFzGAAxItXDpTyfAII6rpEZUGhrlppqtrEhKVPpo6kgGymle2k2BA
	iOEjBCLGbKPjnCYo45UHx02NroOv4UNewgvMC6A5Fs5EpOclYm+1MHG8c+9CgVNoBaRO8cOz/lUfO
	ts4S8NOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXn-00000004viR-3nih;
	Tue, 27 Oct 2026 13:48:51 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXm-00000004vhF-0k9G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:48:51 +0000
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id LfUcxFYSwc3XsLhXkxgJcA; Tue, 27 Oct 2026 13:48:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LhXixssHX7CfWLhXixDzPj; Tue, 27 Oct 2026 13:48:47 +0000
X-Authority-Analysis: v=2.4 cv=Z8HsHGRA c=1 sm=1 tr=0 ts=6ae0abbf
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=SGJkWrW82lNR26rtH8EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=xnmTt7xAHrUILK2F5tw9jpxyescs2qacR8TokbmgBtk=; b=SpXCwzbRcHVw
	N2YxxPeLLeWmEdPesF9F/Tvwg3/Ur+cwc0BNs5PkwRihIB8ZMpHxkfenhxHZpiilczHaa4BtNtJ1l
	MQnh1TC5aAZMz+jcAA5b/5ruWpsHOZrFPKBcqgrpVB3caHvWBe1ZNul0by2cPjbo+g7bcc2QVh+57
	V6+/SqH5BLHSkzcWPPnOglmu2ivP6fkSwwKLoaDhSDx727CnyZj1Tp4091tI/+Uj6SFEuba4GhaTl
	igg3Fb3jjUNUqPtxHIgSUTYnREXjUpO4E5Wjps/Jf4KT2tqED6oeLR6WZpxmMaRsTbbMxiLK7yK0h
	Q6z0bqsN0q8zSZQDFgNCgQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34878 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLhXf-00000003hnK-28cN;
	Tue, 27 Oct 2026 19:18:43 +0530
Date: Tue, 27 Oct 2026 06:48:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auBzvB8TsvIK8Hik@apocalypse>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLhXf-00000003hnK-28cN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34878
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI2olFRqGa4wX93N6LAo5k+Qcj51Bd1LjZIobt9cN4A/8a5P1bFCIrtlKcAwpk+DuKDPsAHNyTpheFWohoKMPNodngscsWLqW5OD/b5rure7L0gm0M5G
 DytlS86oQ7p1vl6uqPinATy8kcIOwRoe+c2vM+UC26vq1/xDId5YekwtNgtYahczTIjJ3PM+tDVlguwSMpu4Y1o54KtMvVTP1E5qw8/YpibA3vKRIKn8FhwF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064850_281909_FFEA51FC 
X-CRM114-Status: GOOD (  35.98  )
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

On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> Hi Guenter,
> 
> On 09:24 Mon 26 Oct     , Guenter Roeck wrote:
> > On 10/23/26 03:15, Andrea della Porta wrote:
> > > Hi,
> > > 
> > > This patch series adds fan tachometer / RPM monitoring support for the
> > > Raspberry Pi RP1 southbridge found on the Raspberry Pi 5.
> > > Please note that the patchset in [1] is a prerequisite for this one.
> > > 
> > > On the Raspberry Pi RP1, the active cooling fan speed is controlled via
> > > the RP1 PWM controller. In addition to generating PWM signals, the RP1
> > > monitors fan tachometer pulses. The pulse measurement and RPM calculation
> > > are performed autonomously by the RP1's onboard Cortex-M microcontroller
> > > core, which periodically writes the computed RPM value directly into
> > > dedicated MMIO registers located within the RP1 PWM hardware block.
> > > 
> > > During earlier discussions, Uwe Kleine-König explicitly indicated a
> > > preference to keep the core PWM controller driver (drivers/pwm/pwm-rp1.c)
> > > focused strictly on PWM duties, rather than bloating it by registering an
> > > hwmon device directly from within the PWM driver (see [2]).
> > > 
> > > Because the Linux PWM subsystem currently lacks a generic framework or
> > > consumer API for reporting hardware-calculated tachometer readings, this
> > > series implements a standalone hwmon driver (rp1-fan) using the following
> > > structure:
> > > 
> > > -  The PWM driver exposes and exports rp1_pwm_read_tachometer() within a
> > >     dedicated symbol namespace ('RP1_PWM') to read the RPM value from
> > >     the MMIO block.
> > > -  A companion DT binding (raspberrypi,rp1-fan.yaml) introduces a vendor
> > >     property, 'raspberrypi,pwm-tachometer', to link the fan node to the
> > >     PWM controller node without overloading or abusing the standard 'pwms'
> > >     property.
> > > -  The rp1-fan hwmon driver parses this phandle, establishes a device link
> > >     for proper runtime and unbind dependency management, and registers the
> > >     standard hwmon 'fan1_input' sysfs attribute.
> > > 
> > > An alternative architectural approach to the DT phandle + exported helper
> > > method would be to model the tachometer as a child device using the
> > > auxiliary bus framework (drivers/base/auxiliary.c). In that model, the RP1
> > > PWM driver would instantiate an auxiliary device for the tachometer, and
> > > the hwmon driver would bind to that auxiliary bus device without requiring
> > > a separate DT node.
> > > 
> > > However, adopting the auxiliary bus would require a more significant
> > > rework and refactoring of the existing RP1 PWM driver.
> > > 
> > > I'd appreciate any feedback on whether the current companion driver with
> > > a dedicated DT property is acceptable, or if an auxiliary bus-based
> > > refactoring of the PWM driver is the preferred upstream path.
> > > 
> > > Patch Breakdown
> > > ---------------
> > > Patch 1: pwm: rp1: Export helper to read fan tachometer RPM
> > > Patch 2: dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
> > > Patch 3: hwmon: Add driver for Raspberry Pi RP1 fan tachometer
> > 
> > This seems conceptually wrong.
> > 
> > Have you considered implementing the hwmon driver as auxiliary driver
> > and accessing the register in question through regmap ?
> 
> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> solution.
> 
> The current implementation is a consequence to the discussion about the companion
> PWM driver, from here (and the revisions that followed):
> 
> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> 
> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> 
> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> 
> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
>   I moved from readl/writel to regmap + syscon.
> 
> - V8: Gary proposed to export a function to read the fan RPM as a viable
>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
>   and the function has been exported from the PWM driver
> 
> - new patchset for fan driver: the now independent hwmon moodle just call the
>   exported function from thw PWM driver.
> 
> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> all aligned, as this would also require refactoring the PWM driver.
> 

Let's say it that way: If you don't want to implement the auxiliary driver,
and you insist using the exported function, I would prefer for you to go back
to the first solution. The one thing I really dislike is conceptually broken
code, and I consider the current approach broken. Your call, but the one thing
I won't accept is the code with the exported function.

Guenter

