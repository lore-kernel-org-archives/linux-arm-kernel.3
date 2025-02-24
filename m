Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21082C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YehX51z9ruoSTdHs0xpzKQo4FPSrQVEIkSiaWIjTk8A=; b=R5OFtEijm+mS6FLHA9xt1SMTrf
	shAm/T4fEb1Y95AifONvsCKLAmSc7M34/1wss+5O+dvO7HQcB0ncTkZf82xRFS6tId36kJ+NWE8Ay
	CoxAH9h1edB/GJ0eEJGptYEaVpbn9Eqo2ZvunCEBBYgoB2Ma/emFGkEoehwMpMRPPhiukc6Wszi0M
	ahr8eo62N7vqgy5EHfyAV/53I0jguxItL35nR2necWOlAudFoZa+pWpmunzu1BiCcVKplvrPOz57/
	0F6fIPKeI97+FPKm5wGm/Nap9pMSUtRW797Z75hvgDFrY/pclvxiDwUOpuB2wJsyZibcwLudvnWKn
	NAp9ZFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcYR-0000000Egh0-3yf3;
	Mon, 24 Feb 2025 17:47:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcOg-0000000Eedo-3Fi8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42CB05C5E8A;
	Mon, 24 Feb 2025 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8986C4CED6;
	Mon, 24 Feb 2025 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740418657;
	bh=pVP6oSh37lwNecWx7K2k2tpwE4ZYLxObmjX1W2oGxWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sze/6fdQaK0PlMPWzvgHJPIrUCQ495IMk+EWPQ3KlErm4UcrdtM1WmS8PRIUHnRKD
	 bs5xju+htMMxr3IYtafwD1Do7fnECEObHlfFC6p/xgcvMiVxXcpbS9UM+FWDrCNzN5
	 A9Uiu9rqYF7XfgsjjdEYxA+UwLLGit8IJtzLzZBLhSL7p7yjiVZDHQDAt9JT7W6NJl
	 rYHqVmw8U/l0stw1Cf98pf0KJTlUMLM5JRjlFWzp73rYFY4j6HPwu5SxmHl6O8XUBU
	 /vS2yh13PpJ5laUJlSj4ElJlJM44kF7zQjE+orV60J+e/oJZIpmDNckX8Yq0xErqMt
	 uIpAS+mw2OIeg==
Date: Mon, 24 Feb 2025 11:37:36 -0600
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: Add bindings for BCM21664
 pin controller
Message-ID: <20250224173736.GA3566877-robh@kernel.org>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
 <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
 <2b3059be-2a82-44c9-9bf3-d1c98f66b0e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b3059be-2a82-44c9-9bf3-d1c98f66b0e8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093738_853161_13B4DF0D 
X-CRM114-Status: GOOD (  15.56  )
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

On Fri, Feb 21, 2025 at 09:37:48PM +0100, Artur Weber wrote:
> On 21.02.2025 21:32, Artur Weber wrote:
> > Add device tree bindings for the pin controller included in the
> > BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> > both chips use the same driver, but have different pins, and the
> > BCM21664 has 6 alt modes instead of 4.
> > 
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > ---
> > (...)
> > +examples:
> > +  - |
> > +    pinctrl@35004800 {
> > +      compatible = "brcm,bcm21664-pinctrl";
> > +      reg = <0x35004800 0x7f0>;
> > +
> > +      dev-a-active-pins {
> > +        /* group node defining 1 standard pin */
> > +        std-grp0 {
> > +          pins = "gpio00";
> > +          function = "alt1";
> > +          input-schmitt-enable;
> > +          bias-disable;
> > +          slew-rate = <1>;
> > +          drive-strength = <4>;
> > +        };
> > +
> > +        /* group node defining 2 I2C pins */
> > +        i2c-grp0 {
> > +          pins = "bsc1clk", "bsc1dat";
> > +          function = "alt2";
> > +          bias-pull-up = <720>;
> > +          input-enable;
> 
> bias-pull-up should not have a value (pull up strength is not
> supported). Will fix this in the next version.

Please make the schema enforce that, not just fix the example.

Rob

