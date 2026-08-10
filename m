Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB42C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBAEe+UU9sXt1mvWPEutfdPd4IyZkVpv9j0uHiyaduk=; b=zMuGwO53l+NycyrlEdErZNXPZW
	rXa92uwGAIIeYnzNUZjBU4yOsaBv7abxQJTMZra4l35j3d9QLJxML9H0/hXAfM8Pd/647auNdEzyf
	6ENHW8Caqw7GT/LYEl9LCC4Djp/B1sI1nI4XXBwJsS0yvnFpsrLaWqfUYsklWOQujHk/5J6nlT0tf
	yyZRkS13POujLlxHJAZbSAr0NyRX/79ZCTsUmm+SOTwqfLhF4mX7qDEy6u7VrKDLg02CYaUcjBglT
	s/iFJ92omB81GEN5Nyyq1+YONVaENEzxYLwYSoKzDywXcqgXyG5SnF7T8DQrRfT5xkO6jQVHnWQ9G
	yA70zKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRNy-0000000C77K-06t0;
	Mon, 10 Aug 2026 14:53:54 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRNw-0000000C76c-0U6O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:53:53 +0000
Received: from francesco-nb (93-35-5-212.ip52.fastwebnet.it [93.35.5.212])
	by mail11.truemail.it (Postfix) with ESMTPA id 5FD451F984;
	Mon, 10 Aug 2026 16:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786373629;
	bh=MBAEe+UU9sXt1mvWPEutfdPd4IyZkVpv9j0uHiyaduk=; h=From:To:Subject;
	b=D75cIULQ0Rp3v1r6vpLPeYGJO9yd7yOg0JwOVTpZOUo9s7BNTQxXZsID72rXGPmnK
	 PSct2MRsC/CbqERvtCHgT1+XGTC9Sltogr0RccCVTTQchnZRdANhrYREUI0e3OKsWz
	 uL+W1VCh/SQ8L3ZAafBIvp9JDMMdw+5f6A015pgZk3lih0jWIz4QIW0o7jnO/AKuMo
	 gvS15TFZHBoJuSyoL1fWx++YPplmef0KeaHJU/DCig8KTeaJeLPn6llsC3naRzJits
	 upBsMzju5GjriFbRU2A3iIZMyn18soM/pV9rMPnVSabfJA60W/bvLL/O/SmO621vlX
	 /A4wMJ0xfhaFg==
Date: Mon, 10 Aug 2026 16:53:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex
 Displays 7" Parallel
Message-ID: <20260810145346.GB81453@francesco-nb>
References: <20260723105225.194366-1-francesco@dolcini.it>
 <178604616242.431490.2877142775301570674.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178604616242.431490.2877142775301570674.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075352_305738_893CE802 
X-CRM114-Status: GOOD (  10.49  )
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

Hello Frank,

On Thu, Aug 06, 2026 at 03:56:41PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> 
> On Thu, 23 Jul 2026 12:52:16 +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > This series adds device tree overlays to support the Toradex 7" DPI displays to
> > the Toradex Colibri iMX7 SoM (eMMC variant).
> >
> > Francesco Dolcini (3):
> >   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
> >     Parallel
> >   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
> >     Parallel with Touch Adapter
> >   ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
> >     Parallel
> >
> > [...]
> 
> Applied to imx/dt-indend, thanks!

What's the status of this? I do not see them in linux-next.

Francesco


