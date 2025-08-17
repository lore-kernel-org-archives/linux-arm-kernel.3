Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B56CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgzYxtQckyjVZOGp9Y3h+oWyiWCJpkBXNVoZbUwFcSI=; b=ty0jRgfKL4fpKhSSHWnnibfPWH
	Bfh2IpPXzuPgkkyDyna58UKuD5lotBd26auUBMHwfU4jUY4qfnV6IWtPQCCCPhN3VjQoWZqRDR4yc
	FB6DPycaLiY7/4IY7W2677QZY/xoLKNiXwqZYwrF0lHVgxquvJme2kLXHR2VKJF6ZpPUKrFelQCW6
	RBS0aL0iVjp7/9TZjRFlu7XoM2T1Swrf9hQG2wTifNvF+zn6IHhqCMqBKq+zDMzFScHHeyNoQ88qS
	r+9WhsC9g33um0vekPbnlzcCqZ/vv+vLd5wR8bqExitMwm0MBeOZMCDK1iY46EUA9R5tpSXFJMe0V
	aYamHRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unfkO-00000005olO-1pgZ;
	Sun, 17 Aug 2025 15:56:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unfhm-00000005odb-3AAa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 15:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BgzYxtQckyjVZOGp9Y3h+oWyiWCJpkBXNVoZbUwFcSI=; b=VaB9C6WJd8F7rvrY612y75q5ZJ
	TCre80TCxTwuDT6dEzSBLMI++b3AYi1cSqIb49Jt/3UbXVREpuCcHj69G2gROjDodVXxKNej6llPX
	Z98rskyl6JDq3vqWOC/afvj5hhHEo+fy6Nl1pwm98/TXuRIA9/GVZYWhPqLvkSOH+YkxxBp5Rilyh
	fvQ/Ye/keplgadZz+pkADjwhedzC8mI1777gpk0dHQP6h8qSF5xtwlFrqlytKUKsJI5TmfKgiytja
	PDUf0yYAvKCpSJb1k9U+NXEfVQ2UenAjsj3ByXX5Mb7KANcio4Bt6gb2ziDl/tTNnvhFRtQ4WiNHu
	VuRoS0sg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1unfhT-0000nb-33;
	Sun, 17 Aug 2025 16:53:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1unfhP-0001YF-1M;
	Sun, 17 Aug 2025 16:53:35 +0100
Date: Sun, 17 Aug 2025 16:53:35 +0100
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
Message-ID: <aKH6_1MRqD24QTq5@shell.armlinux.org.uk>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
 <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
 <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
 <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_085359_081855_F2A5CFA7 
X-CRM114-Status: GOOD (  30.09  )
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

On Sun, Aug 17, 2025 at 04:59:22PM +0200, Gabor Juhos wrote:
> 2025. 08. 13. 17:28 keltezéssel, Russell King (Oracle) írta:
> > On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
> >> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
> >>> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
> >>>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> >>>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> >>>
> >>> ...
> >>>
> >>>>> TBH this sounds to me like trying to hack the solution and as you pointed out
> >>>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
> >>>>
> >>>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
> >>>> in that.
> >>>>
> >>>>> And I didn't get how recovery code affects the initialisation (enumeration).
> >>>>
> >>>> Without the fix, it is not possible to initiate a transaction on the bus, which
> >>>> in turn prevents enumeration.
> >>>
> >>> But why? As you said below the first pin control state is changed during the
> >>> probe, which is fine, and the culprit one happens on the recovery.
> >>
> >> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
> >> devices on the bus.
> >>
> >>> Why is recovery involved in probe? This is quite confusing...
> >> Let me try to explain it differently. Here is the simplified call chain:
> >>
> >>   i2c_pxa_probe()
> >>      ...
> >>      i2c_pxa_init_recovery()
> >>         pinctrl_select_state()                  <- selects GPIO state
> >>         pinctrl_select_state()                  <- selects default (I2C) state
> >>      ...
> >>      i2c_add_numbered_adapter()
> >>          i2c_register_adapter()
> >>              ...
> >>              i2c_init_recovery()
> >>                  i2c_gpio_init_recovery()
> >>                      i2c_gpio_init_generic_recovery()
> >>                          pinctrl_select_state() <- selects GPIO state***
> >>                          ...
> >>                          pinctrl_select_state() <- selects default (I2C) state
> >>              ...
> >>              bus_for_each_drv()
> >>                  __process_new_adapter()
> >>                      i2c_do_add_adapter()
> >>                          i2c_detect()           <- enumerates the devices
> >>
> >> The culprit is the first pinctrl_select_state() call in
> >> i2c_gpio_init_generic_recovery() marked with '***'.
> >>
> >> That call causes the controller to go stuck, which makes it impossible to
> >> transfer anything on the bus.
> > 
> > Probably because when GPIO state is selected, the I2C bus pins end up
> > being set low, which the I2C controller sees, so it thinks there's
> > another device communicating on the bus.
> 
> Yes, it seems so.
> 
> When GPIO state is selected, the bits in the Bus Monitor register which are
> continuously reflecting the value of the SCL and SDA pins contains zeros.
> 
> Additionally, the Status register indicates an 'Early Bus Busy' condition, which
> means that 'The SCL or SDA line is low, without a Start condition'.
> 
> 
> > I could be wrong, as I don't have the hardware to hand to research
> > the issue again.
> > 
> > I have a vague memory that the GPIO state must _always_ reflect the
> > actual pin state before switching to it to avoid glitches and avoid
> > inadvertently changing the I2C controller state.
> 
> Unfortunately, it only helps to avoid glitches on the external lines. At least,
> in the current case the controller hungs no matter which value combination is
> being set on the GPIO pins before switching to GPIO state.

Note that my original i2c-pxa recovery implementation was proven
functional on the uDPU, both by myself and Telus.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

