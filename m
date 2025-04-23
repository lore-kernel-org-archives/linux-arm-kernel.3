Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD1C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpUgGYYSAAKZGIFCG/nSCZXQYMN9IB2AgKsoywhruMI=; b=RdVV4jB6bGstcO0XWyhXJwDfn0
	64StjSwpnB0TNZ38B++N4/NF0jv7LYwPxnwk2DrnPE5YdV3DrBAqkAm1o7zPAoAeyNiTDiz6bIP1e
	cLDREqgn4BJkOje1TZaBdA19ySIu+oB/c+0R7pd9tvJj7jL/eHHnVE98gqUENJ/SKM8Mqmkm7fTmL
	V74uyA68U8L2fnyOAqsDYr8xO/G3DxmaGZSLLCxDG5MByfcRIGv76krCwl/5x4/y6/45rPsw4EMQK
	miqXyA5CwC0EVDTTdNT4+4SBPvUE3KiXYNLbTOSg6wWi9ToyiThEXMcZEmQn/dTjysDJyI/qXw2hx
	aKxIR3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y0j-0000000AGkd-0F0w;
	Wed, 23 Apr 2025 11:11:25 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XEl-0000000A9Ez-3K6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:21:53 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 39DB71F971;
	Wed, 23 Apr 2025 12:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745403709;
	bh=UpUgGYYSAAKZGIFCG/nSCZXQYMN9IB2AgKsoywhruMI=;
	h=Received:From:To:Subject;
	b=bs9vJAu8mvqc64WiUDtIkUvfcUb4obpM/9YuSrhL8j7Vf7lxVPdfW71e+syvIXd1a
	 Z5lEEGZEWw1DTQnmiQFEiVdPLzJiUThmOm5/z3mgV298aExt2W5sPjXWagKqSnLEqY
	 KX/SLQeGzGMWzNkNp/QyLeYq+CIxgSxMSV7me4oj8/4qud415eWABSKV+rzFXm6YpU
	 zVPFjVu4lOM2/b3UrIH/MPyyPog7ySt+d9Ob5Us1hr2WRQ8R/MgEYBur+xIBooNxWj
	 g3ZYkcSG/fIurgTtS8TcwVQuSv2gSfthjHosrHA+uBiVcsl3gXBo94k+8HZgcg5gm7
	 aXSusdN1PxU+A==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id E57297F820; Wed, 23 Apr 2025 12:21:48 +0200 (CEST)
Date: Wed, 23 Apr 2025 12:21:48 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Philippe Schenker <philippe.schenker@impulsing.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <aAi_PPaZRF26pv_d@gaggiata.pivistrello.it>
References: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
 <20250423095309.GA93156@francesco-nb>
 <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_032151_985496_45FBC6A7 
X-CRM114-Status: GOOD (  17.50  )
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

On Wed, Apr 23, 2025 at 10:16:43AM +0000, Philippe Schenker wrote:
> 
> 
> On Wed, 2025-04-23 at 11:53 +0200, Francesco Dolcini wrote:
> > On Tue, Apr 22, 2025 at 04:01:57PM +0200, Wojciech Dubowik wrote:
> > > Define vqmmc regulator-gpio for usdhc2 with vin-supply
> > > coming from LDO5.
> > > 
> > > Without this definition LDO5 will be powered down, disabling
> > > SD card after bootup. This has been introduced in commit
> > > f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> > > 
> > > Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for
> > > LDO5")
> > > 
> > no empty lines in between commit message tags, not sure if Shawn can
> > fix
> > this up or you need to send a v4.
> > 
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> > 
> > Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > I would backport this to also older kernel, so to me
> > 
> > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for
> > verdin imx8m mini")
> 
> NACK for the proposed Fixes, this introduces a new Kconfig which could
> have side-effects in users of current stable kernels.

The driver for "regulator-gpio" compatible? I do not agree with your argument,
sorry. 

The previous description was not correct. There was an unused
regulator in the DT that was not switched off just by chance.

Francesco



