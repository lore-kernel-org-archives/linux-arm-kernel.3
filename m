Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2838CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99/b1Zz+WjCB1f6WwTNHvQByBXsYpqmstCtToqVhvHk=; b=b4MxyIvO9tjFmDMTgFEw7kzKM/
	XeELC8RYfrL80XApB95HwjjevxFnG5trUr5QtPDnSsveDtBklxu+zeeB2F9GfoOmJ0KLPJMkI5xcS
	+c3jrFk1qlh29lDPofI1NbAHGpvnDH/j19VgQ+fStsf2u+ZNlUfVSFKVgFDbjjzyFEE3wZ8/E2NiD
	qarnjWYiPchXFYC6JyMja/vUYwWYJED909h6MD86d/DXLP/vdQguSC6/ezojfUXudrXzB9kd2Rn7x
	ZLuO+CUnma05yiHEEuV8JG1vIMngXXSoPTDLZ9ydFGVP65XLm23FOAR0GSPETpPjSqRhaP0Eh1sJJ
	q9cAWGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umELU-0000000EOFQ-3tkz;
	Wed, 13 Aug 2025 16:29:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDPA-0000000EBh1-3VEP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=99/b1Zz+WjCB1f6WwTNHvQByBXsYpqmstCtToqVhvHk=; b=iD/vDSU9sI7iSXH2vti3YhW/l7
	WBPlbuoCL0mDmgYtM3Nfy/FT8JngWib2nu/AXoE4dwnSrJbvJDFFh5F0f+3jTcX2b8rg4Zs0olMJ9
	vq0ycg35wvXZZUAV8lJSs/ElrsVBCH6zzjy290B3/xxTgq2wghkkqv7OPCj27HG/Nbr8JkKqvCLk2
	sPp/oy/7DWQNTGO8F0xf9daAfQBDD5norhMHYNHlSHMtOpQ1y0qluWuKXzlJ4fHlNuQV9VJ11WFy0
	HSpYqY3f+mJnalam52JvTJ0k7Wd5+SqqXGzgG70Z7TMb7C0e2M0JTIDhQl7JBya50FYGPgphn5HLu
	SN8TCSLQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umDOz-0006w9-15;
	Wed, 13 Aug 2025 16:28:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umDOx-0005rk-0D;
	Wed, 13 Aug 2025 16:28:31 +0100
Date: Wed, 13 Aug 2025 16:28:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Message-ID: <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
 <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082844_874130_3221F61F 
X-CRM114-Status: GOOD (  25.15  )
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

On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
> > On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
> >> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> >>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> > 
> > ...
> > 
> >>> TBH this sounds to me like trying to hack the solution and as you pointed out
> >>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
> >>
> >> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
> >> in that.
> >>
> >>> And I didn't get how recovery code affects the initialisation (enumeration).
> >>
> >> Without the fix, it is not possible to initiate a transaction on the bus, which
> >> in turn prevents enumeration.
> > 
> > But why? As you said below the first pin control state is changed during the
> > probe, which is fine, and the culprit one happens on the recovery.
> 
> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
> devices on the bus.
> 
> > Why is recovery involved in probe? This is quite confusing...
> Let me try to explain it differently. Here is the simplified call chain:
> 
>   i2c_pxa_probe()
>      ...
>      i2c_pxa_init_recovery()
>         pinctrl_select_state()                  <- selects GPIO state
>         pinctrl_select_state()                  <- selects default (I2C) state
>      ...
>      i2c_add_numbered_adapter()
>          i2c_register_adapter()
>              ...
>              i2c_init_recovery()
>                  i2c_gpio_init_recovery()
>                      i2c_gpio_init_generic_recovery()
>                          pinctrl_select_state() <- selects GPIO state***
>                          ...
>                          pinctrl_select_state() <- selects default (I2C) state
>              ...
>              bus_for_each_drv()
>                  __process_new_adapter()
>                      i2c_do_add_adapter()
>                          i2c_detect()           <- enumerates the devices
> 
> The culprit is the first pinctrl_select_state() call in
> i2c_gpio_init_generic_recovery() marked with '***'.
> 
> That call causes the controller to go stuck, which makes it impossible to
> transfer anything on the bus.

Probably because when GPIO state is selected, the I2C bus pins end up
being set low, which the I2C controller sees, so it thinks there's
another device communicating on the bus. I could be wrong, as I
don't have the hardware to hand to research the issue again.

I have a vague memory that the GPIO state must _always_ reflect the
actual pin state before switching to it to avoid glitches and avoid
inadvertently changing the I2C controller state.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

