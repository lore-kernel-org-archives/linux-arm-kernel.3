Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9843606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KnqZ+gOh;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=m3R8cqC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P0yLNScvKloWayj6m2JS8KQwpfW0PaSmZECjKePOOcQ=; b=KnqZ+gOhcQjwneuFVIq9K7o1cP
	BLm6XeaPHbxP9nRcONwzlmd6ENrnJqqNkC1mVTW2b3r9GMAESxKbujrkKgkBxaahyoHQug6GyB4hg
	rwpPlS16f8QxMLEWy4JZbsHEtXgeyVZW4uOu2SBpMYg8LAdZP/6Bm/41yZwnwSkGEcxm0ZaXtdhyi
	DkwLjAzJhRkUtJyO3fbcjwS0q83t1M0dyNdCGAnRHAZ1acbfmYZVSYmp1x5GVwJWG9NbWdJzsEDlP
	QMBi3iGgC5AWzw2vOqr+DJt5AFvNmBM6Uqb+woa14PK550zu3ZfI8kJjwuNu+JaXI8KHNWgLSOMuB
	wShSWyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp3Y-0000000Dpf4-1FhL;
	Thu, 22 Oct 2026 09:25:52 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp3T-0000000DpeN-3Dqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:25:50 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ABE0A1F921;
	Thu, 22 Oct 2026 11:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792661141;
	bh=P0yLNScvKloWayj6m2JS8KQwpfW0PaSmZECjKePOOcQ=; h=From:To:Subject;
	b=m3R8cqC9bN5rVAb3hFAteUVOrvqJuH6oDlJJpvVXlBd2+MauylWg+f/aqhz9A0QcA
	 d+OsiaxgschYB0IDOSnkv8s1mse4K9lQTg6WbjqzTuO37lEq+/gleMONdXV5NKwTxC
	 T4Jenk+3pBQoOrN466ELQl4fWydTW2uz9dr2iS2ICkQD72X7+GYQX5m03cFwPgrbV7
	 jjSqCQjxDERBCC4WDQdiyb4Nzia6QVjizaKvZx5iQQMW6eZEhhee4o6n0jOwAkxeNO
	 YVX3LOAYYYNq90P7evM2r98BcmO910JKpFCoR9EcsG3jGHQ0jX4v9byTr3zuV1wb1p
	 mWEi80kUDDNDg==
Date: Thu, 22 Oct 2026 11:25:36 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@nabladev.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Message-ID: <20261022092536.GA232648@francesco-nb>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_022548_855036_4DA05318 
X-CRM114-Status: GOOD (  18.09  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Christoph,

On Thu, Oct 22, 2026 at 09:12:12AM +0000, Christoph Niedermaier wrote:
> From: Marek Vasut <marex@nabladev.com>
> Sent: Wednesday, October 21, 2026 8:56 PM
> > On 10/21/26 8:37 PM, Francesco Dolcini wrote:
> >> On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
> >>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:

[...]

> >>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> >>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> >>>> @@ -60,14 +60,6 @@ &ecspi4 {
> >>>>     pinctrl-0 = <&pinctrl_ecspi4>;
> >>>>     pinctrl-names = "default";
> >>>>     status = "okay";
> >>>
> >>> Drop "status = "okay"" too , since this controller will be unused ?
> >>
> >> you can instantiate a new device on the SPI bus from userspace. up to
> >> you, but if I was a user I would appreciate to have it enabled.
> > Good point -- Christoph, is this the (use)case here , can the user do that?
> 
> I don't think that's the case, since there isn't currently an SPI device
> connected to this interface. Nevertheless, I'd be interested to know how
> to instantiate a new device from user space.

Documentation/spi/instantiating-devices.rst

Francesco


