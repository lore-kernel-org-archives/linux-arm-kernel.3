Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CEBF419BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8pdPkFA73XTg2PtoUkvQ2osaCILVqY0fxMWCh0K1ZM=; b=sZiSJQxU2iptGuuq17bV0ZMlI1
	2ona88rvHxQTgmYMYwcPfFyxHg4P33n//23qzCA/z0TBOi2tTzYKBWIA9d9DT5vLIMDQQmU3mvBM+
	uzXVpj0pExqHR6z/f6QC91Y2JT3E17fMHgHdLSOb3feLadnk4aKYBvy1UkGqBhSQcmgH1jdsZbN0O
	1AFV+pJysME7cvObV0U3lGSL1vz8bLbVBYkrHbCVk2vp3Qc7KuxAgs/JnPl8MmYaqh0WE0R4B7bup
	pPYX/xJX+ndx7Q2r3PPqdlNLkQXElNRxKVnZHpFkLSV/wvnmpJlkkIZiS5GqwW3DTzyngD16POU8d
	OGc8vtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0Ek-00000001BXz-2srT;
	Wed, 15 Apr 2026 13:24:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0Eh-00000001BX2-3JQT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 13:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w8pdPkFA73XTg2PtoUkvQ2osaCILVqY0fxMWCh0K1ZM=; b=WpLooBIPa/vGr/k+RWTDU1hEr3
	zKjQk2sXhPPEe581UYB+SvwOlDSMQxcDCa7ZzmPLh3Lv7yr33oVKotaNevQw8aBtwTJH2k7R6ahu4
	T9tpcERVcVGcTV+kgHA4Ze0yQWC/9SCi1H+NzWgMHOCKe+TKoEzbMcLBgvcIS6sRQqKk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wD0EQ-00GAkw-Pm; Wed, 15 Apr 2026 15:24:38 +0200
Date: Wed, 15 Apr 2026 15:24:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "P.K. Lee" <pkleequanta@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <621a477e-4fae-4824-a59a-bc2d65198b65@lunn.ch>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com>
 <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
 <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
 <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
 <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
 <CAK8yEOAOhY25R5qt82LUkGifg_9HLia24-E=WxoEwCdbft1eMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8yEOAOhY25R5qt82LUkGifg_9HLia24-E=WxoEwCdbft1eMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_062455_831312_C71E8726 
X-CRM114-Status: GOOD (  28.13  )
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

On Wed, Apr 15, 2026 at 06:05:32PM +0800, P.K. Lee wrote:
> > > > > > If there are no devices on the bus, why enable it?
> > > > >
> > > > > We intentionally enable it so user-space tools can access the switch
> > > > > registers. I have added a comment in v13 to clarify this.
> > > >
> > > > Why would user space want to access the switch registers for an
> > > > unmanaged switch? It sounds like you are using Marvells SDK in
> > > > userspace to manage the switch, rather than using DSA.
> > > >
> > >
> > > We do have a custom user-space daemon that configures the switch
> > > registers for our specific use case. Should I remove the &mdio0 node
> > > if it is only enabled and has no other configuration in the upstream
> > > device tree?
> >
> > Please just be truthful that you have a user space driver, so need the
> > bus enabled.
> >
> > I also guess you have some other kernel code that allows you to
> > actually use the bus from user space? The typical ethernet IOCTL
> > handler does not work for you, since you don't have an ethernet device
> > using this bus. Such code is unlikely to be accepted into mainline. We
> > don't like user space drivers when there is a perfectly good kernel
> > driver for this switch.
> 
> Since the kernel driver for mv88e6xxx in kernel 6.6 used by this
> project does not support LED control, and this feature is only
> available starting from kernel 6.13, I had to initialize the LEDs of
> the 88E6393X from user space.
> 
> In this case, should I remove the &mdio0 node?

I would keep it, and add a comment why it is there. And upgrade the
kernel to 6.18, or backport the LED code.

     Andrew

