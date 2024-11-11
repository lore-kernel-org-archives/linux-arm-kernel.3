Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8215FD3ABD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8thwsB+ljS0lWZ4b7dnqxQ/N/kDhQQW1Jd7+/GQSOs=; b=SqBkCASVFMCpuMq+YEKmNR/XzD
	yWofSKDq0umovhbuWy3q7MiX7tw3Gx3rBXvrbjqongINITWKIBB/3a4KOVW0sTE4XxZRWutMChhvW
	qKntzaY91oK0mvRHGCsRe7DgFWi+6XmgS4vq1e86f02KyMJx/giPFo4j1NN/+cU8pp/uzELBfaKZB
	3yxM5RPrAHg3TJYxEkaPes4uySN9ChpQViMLvwmTolb7K/drLBU/6Nukntu098TVpnKHl2mySNzQk
	KIfMfP12nM2rGA/4NaM1g+ynqOvPbiKpus82vA7HmUfUP6ZX4g6ZtHDKCQjNieflU7LKwQ+VS9t8q
	UioEsUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAY2U-00000000h15-0Fk3;
	Mon, 11 Nov 2024 17:17:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAY0g-00000000go3-3Uti
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 17:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=W8thwsB+ljS0lWZ4b7dnqxQ/N/kDhQQW1Jd7+/GQSOs=; b=fh
	6FlBFBQS/bFlsT6PMKK5U9LH02C+3Qm02iYV3yichYa6m0FTJQpA2gLUXF+/BtZxhn02GWnJJyU6P
	9KmOiQDg7WTWYu4AAjLHWd2nSFd+vtLRHcioSOTzvGFv38olkVrLzVA36NBm7nPqEWDyOM0yvyR9u
	Maz6pNxDnCtMFm4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tAY0S-00Cunp-No; Mon, 11 Nov 2024 18:15:16 +0100
Date: Mon, 11 Nov 2024 18:15:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Cc: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
Message-ID: <e7a8e087-fb92-4911-b7fb-34521635e8da@lunn.ch>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <e534c723-6d65-433f-8ab5-1c0d424d7367@lunn.ch>
 <9B1A5D20-3DE5-40C1-8B2D-B1C4F53FA5F4@public-files.de>
 <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_091530_896122_11C5F5B5 
X-CRM114-Status: GOOD (  21.35  )
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

On Mon, Nov 11, 2024 at 10:25:12AM -0600, Rob Herring wrote:
> On Sun, Nov 10, 2024 at 3:25 AM Frank Wunderlich
> <frank-w@public-files.de> wrote:
> >
> > Am 9. November 2024 18:29:44 MEZ schrieb Andrew Lunn <andrew@lunn.ch>:
> > >On Sat, Nov 09, 2024 at 10:46:19AM +0100, Frank Wunderlich wrote:
> > >> From: Frank Wunderlich <frank-w@public-files.de>
> > >>
> > >> after converting the ahci-platform binding to yaml the following files
> > >> reporting "'anyOf' conditional failed" on
> > >>
> > >> sata@540000: sata-port@0
> > >> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> > >> index 1e0ab35cc686..2b5e45d2c5a6 100644
> > >> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> > >> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> > >> @@ -214,6 +214,7 @@ &cp0_sata0 {
> > >>
> > >>      sata-port@1 {
> > >>              phys = <&cp0_comphy3 1>;
> > >> +            status = "okay";
> > >>      };
> > >>  };
> > >
> > >>
> > >> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> > >> index 7af949092b91..6bdc4f1e6939 100644
> > >> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> > >> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> > >> @@ -433,11 +433,13 @@ &cp0_sata0 {
> > >>      /* 7 + 12 SATA connector (J24) */
> > >>      sata-port@0 {
> > >>              phys = <&cp0_comphy2 0>;
> > >> +            status = "okay";
> > >>      };
> > >>
> > >>      /* M.2-2250 B-key (J39) */
> > >>      sata-port@1 {
> > >>              phys = <&cp0_comphy3 1>;
> > >> +            status = "okay";
> > >>      };
> > >>  };
> > >> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> > >> index 7e595ac80043..161beec0b6b0 100644
> > >> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> > >> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> > >> @@ -347,10 +347,12 @@ CP11X_LABEL(sata0): sata@540000 {
> > >>
> > >>                      sata-port@0 {
> > >>                              reg = <0>;
> > >> +                            status = "disabled";
> > >>                      };
> > >
> > >I don't know the yaml too well, but it is not obvious how adding a few
> > >status = "disabled"; status = "okay"; fixes a "'anyOf' conditional failed".
> > >
> > >Maybe you can expand the explanation a bit?
> > >
> > >       Andrew
> >
> > Hi angelo,
> >
> > I guess the dtbs_check only checks required properties from yaml if the node is enabled.
> 
> Yes, that is exactly how it works.

So from this, can i imply that phys is a required property?

Looking at the above patch, it appears that for armada-*.dts,
sata-port@0 always uses phys = <&cp0_comphy2 0> and sata-port@1 uses
phys = <&cp0_comphy3 1>. Is this an actual SoC property? Could it be
moved up into the .dtsi file? Or is it really a board property?

	Andrew

