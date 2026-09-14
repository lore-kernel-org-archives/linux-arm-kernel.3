Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A29C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/NEV/kLTCX8bokAeRTT4qUddiLyH+CfDie4m5wqp+I=; b=bwLWm/OaMCrH1yEawdFqhZJa5K
	IQhGqnhMQmrAtuqqQ9vrbw3nO9vt9w/lyWhukO6Vlg1U9vqHCF1Ekgr7gORfx4LS25ZYqMXSnrgfm
	LWcpY6c8z1rmnFvGoj5YuHH7Fzyh2+EmtWwzUIdmVmW7ZqD6faeAwMdIYoct+2KlD1BTqjTHqA2x2
	siyZKZEMnetB0jNHSLH4bEPwbCvmCPBx5pfGloTyGx1k9VF6cwQCUwVYgw2pwBicvmuhmS7yjlD+l
	ronIC9MBcClM6PAjgQkUDPizLk7i6eHt/4PeI1Bpede7IZ9T7V6oeudZ6s238QZTrmSYrbx8NQ/RA
	xs7kp6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zSU-00000002NlI-44k3;
	Mon, 14 Sep 2026 05:42:26 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zSR-00000002NkM-2gtl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 05:42:26 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 03C511F81F;
	Mon, 14 Sep 2026 07:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789364538;
	bh=V/NEV/kLTCX8bokAeRTT4qUddiLyH+CfDie4m5wqp+I=; h=From:To:Subject;
	b=q0xFFMEim0YvPgdD5421gOP88vBaDzCd+dwfcNZdbCweRETd8O2SMCeuhBdTwhyw6
	 TqOf6nhpt6hjjx31sK8RlMamI4jbPbC52Go+aIVe6cY5uTyNeq1jv59WFbnPV94Zv0
	 wXDk9AdqnkHT/hFHAAQrTMupQh/DVxvnXVsJ0/lhBL7ASTnKNmjQoVHFdKvLqxUN4s
	 PNe/ORkLvCg1coydLgIp2FgjTHyqDW5VQatp1JBtxW9BUPX/2St7MxHx16fkVgTZ7T
	 SiYmirpuCuLgOCP4FQ27PHsQKaPlLsWPAEPOJXybsEh3nNodPdlSpajDJin2f8gioU
	 wETC3bs56V8+Q==
Date: Mon, 14 Sep 2026 07:42:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260914054214.GA19835@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQQjCW1xaGfPdss@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_224224_398610_47B1BC8A 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > carrier board.
> >
> > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > the same PCB (the two chips are pin to pin compatible), to avoid
> > duplication create a common dtsi to share commonalities.
> >
> > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

...

> > +&gpio1 {
> > +	gpio-line-names =
> > +		"LINO_P18",
> > +		"LINO_P16",
> > +		"PMIC_I2C_SCL",
> > +		"PMIC_I2C_SDA",
> > +		"",
> > +		"",
> > +		"",
> > +		"",
> > +		"",
> > +		"",
> > +		"LINO_P65", /* 10 */
> > +		"LINO_S18",
> > +		"LINO_S24",
> > +		"LINO_S20",
> > +		"LINO_S22",
> > +		"";
> 
> Can you wrap to 4 names pre line
> 
> 	gpio-line-names = "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_I2C_SDA",
> 			  "", "", "", "",
> 
> Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd line

I already replied on the v1 that I disagree on your request. To me it is
just more readable the way it is now and I do not see minimizing the
lines of code something that is bringing any kind of benefit on its own.

Is this blocking this from being picked up? 
Is there any other concern on this series?

Francesco


