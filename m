Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KwFMqxAz;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OWQ+cvqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/ACB8f2xH1rEkjmG+UvGKZpwz98xJh2FSOOsD44xzng=; b=KwFMqxAzkIJbOMG+luF/LvHStN
	HcfXHLKhjusP4F8WAfFfjjlJgjiAdycCjS7NjR+0qVy7/nYCoBbKH+UKpAktAsjddhLQt4G0Xz+Yp
	9/J1AQhfPQa3wW+XhrEG2qRjM8iltKfJ/aMK1WkymuyllZGB6xPNsDfcQ5VC+1Soihlpx2u2JnW3w
	GuiUzZwqUvNv+ErrBNuwbO2VyT4OEZJIEljAsmtkcol6NRO6Yc4uDF0V5t7dAAPqrDvYD/N29lYOa
	2rSC24dA4ybMBYzW/BE+5C7AVETMKYbh01SKywkBF7CTQYJHSWiCYAZZ+XOvD/VdluvQ4beDifmWx
	S/m27esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObCN-00000005UrS-0eAu;
	Wed, 04 Nov 2026 13:38:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObCK-00000005Uqj-0ifV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:38:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e0d885929so587911f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793799517; x=1794404317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ACB8f2xH1rEkjmG+UvGKZpwz98xJh2FSOOsD44xzng=;
        b=OWQ+cvqhPQU0N3hSyZCyq6DjQtG+Ujy9DeC72w7J5f6o+NxUoKROA2CS78IPxhZAhG
         YWLlO6ZGlZvN/KMfKt1KOlCps9HXs+LT5vDNr3pT/ypGHvMP/G674vSOY1F2rqDTfNyy
         yp3kBoOURmZRLmZN+W6KPl5W/A80nV05zw0s3UfKsltnyexrB+XKe3fn6Ml8wUWIE4y7
         gdT0X3hZlY87yw13tJivpSofCX/w9+brq0sQrbbOrNQ5STSI70L1fpF/VeEGnfreO3fw
         2ebw09FJKMiDP88E2VMlavNsizln/jUcxuo703bQ6z74SYDGtrqtySDB2ExMaepZ9ujV
         rg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799517; x=1794404317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ACB8f2xH1rEkjmG+UvGKZpwz98xJh2FSOOsD44xzng=;
        b=e+Kmoy40gydECPxdhvOG22A2b3jlPZzx6wAP1fgg6IPbK2FhkLdTklc2uf0flWa7RV
         rinIIWglgvIysPBnsWU7/Za5nbSUtsqz0twlTMfzxg4AjiNqYvFmTcc6x1YpEI9sDj8M
         gRAxUWvUSeIb/xOhqlG7/7ZTdykClzr9xRyKnVApE/VqL1U6h7i6fJ2MWKTO4mzKbV2l
         6s8RFrvxokZRYePVzyUMmIXKDxbXWZJmgviYoTqYIpR50y9L5/5S+D95F8QHvyfTWDep
         fz9PfprVpVgQ3AlbY2FmMPH5IsuU1R/bX3S6tU1ZAn1yJQ+h7iBavdrws7y3xVNbnIwe
         bh/Q==
X-Forwarded-Encrypted: i=1; AKwUvByimY+Dx25DXCfhZZ88fCRpRVjkoFQl0S7Pwn+FsdVyzxarLw0IT1OGlW1kPV5jU2diTgo5WciYrJkaGiKyX/hQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8x4l6XfAZh8eHMHuTcuIYSW/uvQLs6KFEwmXQasmY9qsAPg+uL
	XYzwbMva5m1zjGKgZrK6vxLKIrSJBQte6ytyh99s0D180eiUnQG5/Tjzcq+PgyTnzZQ=
X-Gm-Gg: AYBFou2tnExqflVE09TaAfYXYtmCJMOPMQ5NpgDXe9afiQPkhnZbafHa6Hx0vY4hkSz
	34+7dFHtnv+lFU2tedMXZGzIjvMcazYRuPUBoWHPg5/MSMNzvegqNXfZJjTh0dNC5gXcny+dQQA
	UIYkYJzYtlkQJ4RkaYGC9zRwSNZyFH5fnxCb5hQt+9Wpl7TRnreA+MxjbvvYlRNalOS/E39CpVa
	9Z0b3Z4YhIpJj+3Uvs71WM3JjQfkPRm3Bc+dmksmCrBw6of29hwhZ9WS6j+YggblgZJB/R6o2B6
	S2RJqzZ7+F7Zevh76VCHuDiyavuqqVbO2N8imPe8Nl/IdNp38sbPibhGLkTIMhVs3HKbVSjPMQ3
	UpKQblbCJ6H1BZghpk54wAyHjpKJxTF2APSSdrU5fXEKK+qq6ADE+iFn8X7cSKER6Mgmy6Qhq2o
	XNpJhg2LCdqnlSIGRcoCdTtsj7rvQwiYD5qdG+cM79f39NZZL4LOpKw+60CExlCowDReCcKdaSY
	VpqfQH0lr78bo/UdWu2b5w7JB95qkqr//VKVWM5FO3t6khFd7B+aa1IuuYX+ixjbhaE1xp2UHba
	s/xaxfDXycuELZ+/XLhE1b20B1c5AetP6HAtrFuLolUq9wIM
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e6e501911mr37072969f8f.43.1793799516428;
        Wed, 04 Nov 2026 05:38:36 -0800 (PST)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm3985293f8f.41.2026.11.04.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:38:35 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 4 Nov 2026 14:42:29 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <aus2Ra_sLySMZU1i@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
 <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
 <auIotAwnOWKNApjp@apocalypse>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auIotAwnOWKNApjp@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_053840_229581_410DC3D1 
X-CRM114-Status: GOOD (  46.49  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 17:54 Wed 28 Oct     , Andrea della Porta wrote:
> On 09:13 Tue 27 Oct     , Guenter Roeck wrote:
> > On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> > > On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > > > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> > > >> Hi Guenter,
> > > >> 
> > > >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> > > >> solution.
> > > >> 
> > > >> The current implementation is a consequence to the discussion about the companion
> > > >> PWM driver, from here (and the revisions that followed):
> > > >> 
> > > >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> > > >> 
> > > >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> > > >> 
> > > >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> > > >> 
> > > >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> > > >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> > > >>   I moved from readl/writel to regmap + syscon.
> > > >> 
> > > >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> > > >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> > > >>   and the function has been exported from the PWM driver
> > > >> 
> > > >> - new patchset for fan driver: the now independent hwmon moodle just call the
> > > >>   exported function from thw PWM driver.
> > > >> 
> > > >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> > > >> all aligned, as this would also require refactoring the PWM driver.
> > > >> 
> > > >
> > > > Let's say it that way: If you don't want to implement the auxiliary driver,
> > > > and you insist using the exported function, I would prefer for you to go back
> > > > to the first solution. The one thing I really dislike is conceptually broken
> > > > code, and I consider the current approach broken. Your call, but the one thing
> > > > I won't accept is the code with the exported function.
> > > 
> > > I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> > > an issue, and regmap is not the right fit here:
> > > 
> > > - Previous version of the PWM1 patch series publish regmap using
> > >   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
> > >   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
> > >   chip itself is PCIe device which must be removable).
> > > 
> > > - The tachometer register is not its own separate register, but rather (re)using
> > >   the phase control register. The phase control is not implemented in the RP1
> > >   PWM driver on the list yet, so this is currently a simple register read -- I
> > >   can see that RP1 PWM driver need to take special care to about the tachometer
> > >   reading if the phase control is implemented.
> > > 
> > >   For the two reasons above, I think the way that tachometer is read should
> > >   really be an implementation detail of the PWM driver and not for the hwmon
> > >   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> > > 
> > > - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
> > >   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> > > 
> > 
> > Let's agree to disagree, and keep the code in the pwm subsystem.
> 
> And auxiliary bus it will be. I propose the following:
> 
> - drivers/pwm/pwm-rp1.c: create an auxiliary device for the fan. The function to read
>   the RPM will not be exported, but a function pointer will be passed through the
>   private data to the fan driver. No need for regmap. To be taken by Uwe.
> 
> - drivers/hwmon/rp1-hwmon.c: The auxiliary driver is probed against the device registered
>   by the pwm driver. No imported function. To be taken by Guenter.
> 
> In this way, we decouple the two drivers and we leverage the auxiliary bus paradigm.
> Also, no DT node needed for the fan.
> 
> Do we all agree on this approach?

A gentle reminder about this inquiry. Before refactoring both the PWM and the fan
driver I'd like to be sure that the proposed approach is at least acceptable.

Many thanks,
Andrea


> 
> Thanks,
> Andrea
> 
> > 
> > Thanks,
> > Guenter

