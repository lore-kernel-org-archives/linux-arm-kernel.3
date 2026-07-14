Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4273FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmtdyuoVms6UjY/WUUunlXxAOdDcE/a7uik36L4Lfvg=; b=kgym7gXK4SMbvqWPFqibxtWq6d
	1eW9uZM+NqIOYjYPfgPXgLygoDA/sQnow645Kc2D5JzV9AL9G4SFuId8NN3SMQSTtuIFBONkVqorg
	ACLAVxo2RP9JvtUq0tDZujSTR2uTAHscZk1xUC6sn/bhRoM/ZpOgD1UZMrRXVDtYu/F545gjoUHP1
	CC7wEXrL4N3eg8NifOwZKLZyiDG5vxnv+k3G4+NftouxQ22CybCIBQvcjduYjw8a/DOR+O7kIwFeZ
	eO09ogs2CM+ovEbVhBlITIWTIGlPSi2DXIg4qP+Nme6RDqOsIeI7xSVAT0Iv4iFR+z+2SkH/Nt9lJ
	yylWR9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZWb-0000000BSxy-2s8K;
	Tue, 14 Jul 2026 09:34:01 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZWY-0000000BSwY-42iP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:34:00 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 113FC1FFA1;
	Tue, 14 Jul 2026 11:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784021636;
	bh=NmtdyuoVms6UjY/WUUunlXxAOdDcE/a7uik36L4Lfvg=; h=From:To:Subject;
	b=F1EJYO++cqfmtggaxaq6h1UX2lV8bnrkAdpYucgdF2/SzG5zJ6apS5gSQtr26giYq
	 35WrkZJAem4m2s7oWHOJAglM+TBVpiFFrCySuhH/4HRhW5bk9dhIjDY4BIMWqmfMaY
	 QMT2uVuUoxEbQyJ425qePPYbTCRjzfgtfh0b28C8wZF8l3Xk0iikYPeBfRYt4JwYsA
	 uMJGzImN4ZUD5vbmIYX8g/RW3ftL0Hc1Llh/zZ2uLJ7vAoAA0seAioYs0yF6f13zpa
	 k7Pj/VZSI3XQafyMtvEhwEmMSolbA8OgPrIRlXMj6PNCC90mNMndfk7Iz1ofo5OFaL
	 EaMYop5AcdMWQ==
Date: Tue, 14 Jul 2026 11:33:54 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260714093354.GC22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
 <20260714065947.GA22086@francesco-nb>
 <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
 <20260714083259.GB22086@francesco-nb>
 <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_023359_176970_770D5273 
X-CRM114-Status: GOOD (  28.48  )
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

On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> On 14.07.26 10:32, Francesco Dolcini wrote:
> > On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> >> Hi Francesco,
> >>
> >> On 14.07.26 08:59, Francesco Dolcini wrote:
> >>> Hello Frieder,
> >>>
> >>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>
> >>>> Add the ELE firmware API node and pass its handle to the OCOTP
> >>>> driver. This allows us to gain read/write access to the OTP fuses.
> >>>
> >>> This seems something we should have in the soc dtsi (imx93/imx91), it
> >>> does not seems board specific.
> >>
> >> My original intention was to move as much as possible into the SoC dtsi.
> >> The problem is that the memory node is somewhat board specific due to
> >> the DDR. And I can't move the firmware node into the SoC dtsi and assign
> >> the memory node in the board dts as the checks for all boards not
> >> specifying a memory node would fail then.
> > 
> > What is the reason to have this memory address different on various
> > boards? Can we have a default in the soc dtsi, and allow the board to
> > override the address if needed?
> 
> There is no real point in having different addresses on different
> boards. But the node describes memory that is physically on the board
> and not on the SoC. And I think that is why DT maintainers want to have
> it in the board DT. It's the same with the memory nodes for the
> remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
> But maybe I'm wrong and if there is a possibility to move this to the
> SoC DT I will definitely take it.
> 
> > 
> > Or can't you add the address in all the boards, and keep everything else
> > in the soc dtsi?
> This could be a possible way, yes. In that case maybe we could even
> create a generic dtsi to contain such defaults for all boards.

I would go for this solution, we could have something like
`k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
sane default memory address, and have an easy way to override the memory
address from the board dts, if needed.

Francesco



