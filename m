Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF8EC4453E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSuyD74UXi2JQL1W616mM8c2GOODdxS4FQDGhYXd3Cg=; b=O+gQNLotlhL4LpBTRb+AeGk/ka
	iE1qW/AByWDYJ5oUIeMMgmu0K37FMbI/9Fh32EYedPy3V+Ly54L7rpe28NCFlD+uVW2mFMBdq4NgA
	JmNAj+XfCxFHvw0GhK/ivkBDeli0EDChAm3UxrDw7FVtKWklsY6uViZmxxtlE6X9KAPEyDtXy5iye
	Rq6fpxCFtVx5e95CJnfv/XvrXGdGSEc8Sn/RO8cFuf4gBVqdEdMhHDcW2FgkGEkt9NPKPEN/OSzDU
	1kAfA+lv9WLA5ZX99jXbUCTVzbEylTo3zhshUG/csEBAVN/HojlSSkG7MH/U0irqprtAQNlTRJJ0d
	4xPJp2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZYj-0000000CIMW-2cQo;
	Wed, 22 Jul 2026 16:12:37 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZYf-0000000CILl-3mYP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:12:36 +0000
Received: from francesco-nb (unknown [185.12.129.179])
	by mail11.truemail.it (Postfix) with ESMTPA id A3EB91F822;
	Wed, 22 Jul 2026 18:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784736750;
	bh=oSuyD74UXi2JQL1W616mM8c2GOODdxS4FQDGhYXd3Cg=; h=From:To:Subject;
	b=TsVBUXqWXW0JzEyok9klQ6/7lE3q8wU2gwi+Ae+4zOq9envvlQXwKrW5ApdIjN33u
	 qto7fciwWexVTlF41nRipaScMfg7r90+0cSM+25e+hL3D2xaUUJZZKGNHOzo3oyd8O
	 5B0SKZEIePeAdyq8ogmqErkYzgDP5EVt8wSNphScnuqDDrUbDt0wknC3Jpoy/uo7j9
	 TGNLggtGcqjFDuylzf4wSSZQWLvlct/ntDfbCmnq6hHW6C74pnmvFu7kowK6YxmR8U
	 7b01uVmkb9UXK9QlwFTmI73kFWaFxXMTRsVhFaR+j/NdN7bFJ/24HjP9JDLs3som/o
	 3g7ocEE6E2PjA==
Date: Wed, 22 Jul 2026 18:12:22 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
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
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260722161222.GA4216@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <3056369.e9J7NaK4W3@steina-w>
 <9ceb5fb9-edd0-408f-8f7f-74d5145ae81f@kontron.de>
 <6611405.mvXUDI8C0e@steina-w>
 <88bb9b8b-a04a-4a15-b738-0ef39c368bd8@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bb9b8b-a04a-4a15-b738-0ef39c368bd8@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_091235_095625_AE82DD1E 
X-CRM114-Status: GOOD (  48.22  )
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

On Wed, Jul 22, 2026 at 05:27:00PM +0200, Frieder Schrempf wrote:
> On 22.07.26 17:09, Alexander Stein wrote:
> > Am Mittwoch, 22. Juli 2026, 16:49:10 CEST schrieb Frieder Schrempf:
> >> On 14.07.26 14:37, Alexander Stein wrote:
> >>> Am Dienstag, 14. Juli 2026, 14:33:50 CEST schrieb Francesco Dolcini:
> >>>> On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
> >>>>> Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
> >>>>>> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> >>>>>>> On 14.07.26 10:32, Francesco Dolcini wrote:
> >>>>>>>> On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> >>>>>>>>> Hi Francesco,
> >>>>>>>>>
> >>>>>>>>> On 14.07.26 08:59, Francesco Dolcini wrote:
> >>>>>>>>>> Hello Frieder,
> >>>>>>>>>>
> >>>>>>>>>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> >>>>>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>>>>>>>>
> >>>>>>>>>>> Add the ELE firmware API node and pass its handle to the OCOTP
> >>>>>>>>>>> driver. This allows us to gain read/write access to the OTP fuses.
> >>>>>>>>>>
> >>>>>>>>>> This seems something we should have in the soc dtsi (imx93/imx91), it
> >>>>>>>>>> does not seems board specific.
> >>>>>>>>>
> >>>>>>>>> My original intention was to move as much as possible into the SoC dtsi.
> >>>>>>>>> The problem is that the memory node is somewhat board specific due to
> >>>>>>>>> the DDR. And I can't move the firmware node into the SoC dtsi and assign
> >>>>>>>>> the memory node in the board dts as the checks for all boards not
> >>>>>>>>> specifying a memory node would fail then.
> >>>>>>>>
> >>>>>>>> What is the reason to have this memory address different on various
> >>>>>>>> boards? Can we have a default in the soc dtsi, and allow the board to
> >>>>>>>> override the address if needed?
> >>>>>>>
> >>>>>>> There is no real point in having different addresses on different
> >>>>>>> boards. But the node describes memory that is physically on the board
> >>>>>>> and not on the SoC. And I think that is why DT maintainers want to have
> >>>>>>> it in the board DT. It's the same with the memory nodes for the
> >>>>>>> remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
> >>>>>>> But maybe I'm wrong and if there is a possibility to move this to the
> >>>>>>> SoC DT I will definitely take it.
> >>>>>
> >>>>> We are talking about reserved memory, so this is highly board-specific.
> >>>>> So for different hardware variants with different amount of RAM you have to
> >>>>> go for the minimum anyway.
> >>>>>
> >>>>>>>>
> >>>>>>>> Or can't you add the address in all the boards, and keep everything else
> >>>>>>>> in the soc dtsi?
> >>>>>>> This could be a possible way, yes. In that case maybe we could even
> >>>>>>> create a generic dtsi to contain such defaults for all boards.
> >>>>>>
> >>>>>> I would go for this solution, we could have something like
> >>>>>> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
> >>>>>> sane default memory address, and have an easy way to override the memory
> >>>>>> address from the board dts, if needed.
> >>>>>
> >>>>> So what is a sane default? At the end of the minimal possible RAM?
> >>>>> I'm not really fond of something you have to make sure matches to your
> >>>>> hardware, but won't raise an error if you forgot.
> >>>>>
> >>>>> How about providing defaults for the SoC part and users have to provide their
> >>>>> memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
> >>>>> have to specify memory-region in your board.
> >>>>
> >>>> I am personally ok with both solution.
> >>>>
> >>>> I think it is easy to have a sane default in this case. You cannot have
> >>>> less than 256MiB in practice, and this is just about the offset, is not
> >>>> that you are going to want more memory reserved if the board has more
> >>>> memory available.
> >>>>
> >>>> At the same time, having the memory range in the board dts is also ok to
> >>>> me.
> >>>
> >>> I'm just saying, because we had lots of problem with assumed offsets/length
> >>> in code/DT for NXP boards. They usually come with big/huge amount of RAM.
> >>> This breaks for all hardware using a small amount of RAM.
> >>> So it's better to not have a default than silently breaking things because
> >>> the default doesn't match.
> >> I'm revisiting this now and think about how to do it. I would like to
> >> put a default memory node in the dtsi that dynamically puts the buffer
> >> somewhere in the first 256MB. I would include the dtsi in all
> >> i.MX91/i.MX93 boards. I think this should work for all boards.
> >>
> >> If I put everything, but the memory node in the default dtsi, as
> >> Alexander proposed, I think I will run into DT validation errors if not
> >> all boards provide a memory node, as the property is mandatory.
> >>
> >> Is there anything I might be missing?
> > 
> > Mh, isn't that exactly the situation you want to catch as a DT author?
> > Raise errors early if something is missing in the DT.
> > I would go that way that for all currently existing boards an corresponding
> > memory node could be added, no? All coming boards will need to provide it..
> > 
> Ok, but what would be the benefit compared to putting the node in the
> common dtsi and including that for all existing boards? People adding
> new boards would just copy the memory node from some other board anyway.
> This way we could at least avoid the duplication.
> 
> And as I don't know all the details for the existing boards, I can't
> provide anything better than a default memory node.

What would be the reason for not wanting to have such memory node in the
first 256MiB defined in this dtsi include?

Francesco


