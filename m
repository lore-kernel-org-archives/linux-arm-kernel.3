Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E162CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6I2Iu+cJT3+xxGMe7PrlNglBTOagx6IwbhJZJqxqBGE=; b=nAYPn31oopWtZcBRQRV2J9hUXZ
	/GCRAzu8aDRvjTGOEbMNDJZT/Hmy8pYdlRjwRKD2wPDMzF4q16qL36vap9gQEAVlu1aAOrnNoipDB
	vO+vUzM6rrdtzOl0ApcOgv+E876VqOsty8X0KmKkWMHxGO8RFVre33ygIZSNjKMjrLuKr0Tgagp3t
	FAmfV7PzegO4SA2/7SYm+jIVYjEkbQsEAA5MKVgtd+8Qo3HbwaF7FUgwSGuW4Cfx5ZBh/qOveRiqY
	1PFek9RQBvi/0a5tFU8EpDVrAxPpjoDKBxfL3S9WwVrHMlSHPgPmxvqnONZChSh3fW7o6A3Uqvh6l
	dN0crj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1WD-0000000FkBG-2EE5;
	Thu, 06 Nov 2025 15:03:21 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1WA-0000000FkAm-0Hjo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:03:20 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EB6071F93B;
	Thu,  6 Nov 2025 16:03:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762441394;
	bh=6I2Iu+cJT3+xxGMe7PrlNglBTOagx6IwbhJZJqxqBGE=; h=From:To:Subject;
	b=XSZGqn6GIJD61EDUYa00+rIE5rUeW4v9fNypsOF6u/RPK6BxPlVVAj6tAdbZDNfGj
	 cESdjMrFBVhb0ZAs0GkNehC3GhXkfzDZGj7kPYpt72E/HCIqoP6lW8ygTB+zRtJqpy
	 6Po4wRrC44QVQNpSgJg1diuMDwpfrj3Hiuss0M7OZQJBz5X6DXtTJb7Mjj2/+u6MeM
	 Wj+a8mbumaROEssjFPUKxPPXXk62WIvnVZ4PLNESgWQAH7WoTn6miY14uF36aFhcS3
	 olAz+zgdzG8RaiZkOj46PIkzBTyOnSJ1iuTRY3FOWf5x6EpXgGVtlBPNJ56ZESvD7Z
	 V4pZ95whObyhQ==
Date: Thu, 6 Nov 2025 16:03:09 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Davis <afd@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add Aquila AM69 Support
Message-ID: <20251106150309.GA44898@francesco-nb>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
 <20251104145240.61219-2-francesco@dolcini.it>
 <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
 <20251105115335.GA14157@francesco-nb>
 <7024f4b3-00a0-4618-8bf9-53e305fcc982@ti.com>
 <20251106101932.GA5975@francesco-nb>
 <be8040c0-76b1-46e3-bd89-841cbfa10c84@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be8040c0-76b1-46e3-bd89-841cbfa10c84@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_070318_857919_F426F549 
X-CRM114-Status: GOOD (  29.59  )
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

Hello Andrew,

On Thu, Nov 06, 2025 at 07:32:44AM -0600, Andrew Davis wrote:
> On 11/6/25 4:19 AM, Francesco Dolcini wrote:
> > On Wed, Nov 05, 2025 at 02:01:35PM -0600, Andrew Davis wrote:
> > > On 11/5/25 5:53 AM, Francesco Dolcini wrote:
> > > > On Tue, Nov 04, 2025 at 11:41:54AM -0600, Andrew Davis wrote:
> > > > > On 11/4/25 8:52 AM, Francesco Dolcini wrote:

...

> > > > > > +/* Aquila SPI_1 */
> > > > > > +&main_spi2 {
> > > > > > +	pinctrl-names = "default";
> > > > > > +	pinctrl-0 = <&pinctrl_main_spi2>, <&pinctrl_main_spi2_cs0>;
> > > > > > +	status = "disabled";
> > > > > 
> > > > > This is already disabled by default in the SoC dtsi file.
> > > > 
> > > > Yes, known. Is this an issue?
> > > > 
> > > > This node must be disabled, no matter what is present in any included
> > > > dtsi file, it's a deliberate decision.
> > > > 
> > > > This dtsi file describes a SoM, the used pins/functions are defined on
> > > > the pinout, but this node cannot be enabled unless the SoM is mated with
> > > > a carrier board that is exposing it.
> > > 
> > > Same as my point above, you shouldn't enable nodes that are not used
> > > or have anything attached. The SoM only has some edge connectors so
> > > it should not be enabled at the SoM level, that we seem to agree, but
> > > the carrier board doesn't connect those lines to anything either. They
> > > just run to a pin header with nothing attached, how is that header
> > > any different than the pins on the edge of the SoM?
> > 
> > You are commenting something unrelated here, or I am not understanding
> > you.
> 
> Yes this was a bit of a tangent to the comment above. The point here
> was more on the pinmux, as a new carrier board might use these pins
> for something other than SPI, the pinmuxing shouldn't be done at the
> SoM dtsi level. Instead do it at the point the node is connected to
> some hardware on the carrier board in its DTS.

Our SoM implements a specific pinout, with well defined functions,
therefore the functionality of the pin is defined at the SoM level [1].

[1] https://docs1.toradex.com/116801-aquila_family_specification.pdf
	  page 13, 14, 15


Francesco


