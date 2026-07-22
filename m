Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80669C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fhUXRBucbEjHSBxCAVReD3KXg+ZJkdZM06djNRZSSc=; b=c1fxV5lK5IXLL2dcZpCxMnHmqs
	vW4R/hgG3lfFIGVMAqslyTi6P/JJxrnZHPifp5OreatbDanvesnX8GjiNY6oNoAHKw5a7CqhvU6kg
	7y0/z+4WIC40CncIQvnXeXJcsR1ybRAHwPrkUbmKRmnC41QIf8ptkERqUpbh9YdmxaXM6HSIH9oXb
	X9vpoeen3ZH3MrmcrxA4sazw3fdMcNKG68qEZiz7Mk73Btz98qZNfMCGkWzomkR/j3uKpoV6MUtN7
	yJSKKNMxbG+kiAGtvFaLMyck6yr908INLGiWHOMoYdrM8jBNd7N1aLcd0Pux4g6prTM6RwAshjb67
	YU1TzAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYa7-0000000C6xJ-0odB;
	Wed, 22 Jul 2026 15:09:59 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYa4-0000000C6wN-3GLy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5fhUXRBucbEjHSBxCAVReD3KXg+ZJkdZM06djNRZSSc=; b=D85Grurx16yfpxhrk5PbUCYh18
	ISnQbDhSF/dsGTJDRoMA+3D9XPeiF3JAMYZM9rN5AUbVZbuuPGLfZDHyJY4X+DJiLpdZdfP9f4kfX
	0OE8N1HcmnPT2nXO16omTb1b69KksrX8/5fnk+TfHcSSIV1GZ9YJBJD7HVkXxgp4XWrZ85eFduV3q
	3EmDq7EU8j5MHjbbHv3TIkMwomc2DLXpqW+4NfskmtOEHeVVIhxBpF2sfWsUV/8JBotjEM+d7zex0
	HqUeij0dem8o7TrUuBarquC/Fr8vlmOl3U23ZSZJA0cNsK3jdgrad+JcmPdqPKJ5q8k9PWULGmkNp
	IV5mVDhA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmYZu-00021G-2t;
	Wed, 22 Jul 2026 17:09:46 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmYZu-00020D-0U;
	Wed, 22 Jul 2026 17:09:46 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Francesco Dolcini <francesco@dolcini.it>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-arm-kernel@lists.infradead.org, Frieder Schrempf <frieder@fris.de>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware driver
Date: Wed, 22 Jul 2026 17:09:44 +0200
Message-ID: <6611405.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <9ceb5fb9-edd0-408f-8f7f-74d5145ae81f@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <3056369.e9J7NaK4W3@steina-w>
 <9ceb5fb9-edd0-408f-8f7f-74d5145ae81f@kontron.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28068/Wed Jul 22 08:24:50 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_080956_948475_953AD51F 
X-CRM114-Status: GOOD (  44.36  )
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

Am Mittwoch, 22. Juli 2026, 16:49:10 CEST schrieb Frieder Schrempf:
> On 14.07.26 14:37, Alexander Stein wrote:
> > Am Dienstag, 14. Juli 2026, 14:33:50 CEST schrieb Francesco Dolcini:
> >> On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
> >>> Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
> >>>> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> >>>>> On 14.07.26 10:32, Francesco Dolcini wrote:
> >>>>>> On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> >>>>>>> Hi Francesco,
> >>>>>>>
> >>>>>>> On 14.07.26 08:59, Francesco Dolcini wrote:
> >>>>>>>> Hello Frieder,
> >>>>>>>>
> >>>>>>>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> >>>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>>>>>>
> >>>>>>>>> Add the ELE firmware API node and pass its handle to the OCOTP
> >>>>>>>>> driver. This allows us to gain read/write access to the OTP fus=
es.
> >>>>>>>>
> >>>>>>>> This seems something we should have in the soc dtsi (imx93/imx91=
), it
> >>>>>>>> does not seems board specific.
> >>>>>>>
> >>>>>>> My original intention was to move as much as possible into the So=
C dtsi.
> >>>>>>> The problem is that the memory node is somewhat board specific du=
e to
> >>>>>>> the DDR. And I can't move the firmware node into the SoC dtsi and=
 assign
> >>>>>>> the memory node in the board dts as the checks for all boards not
> >>>>>>> specifying a memory node would fail then.
> >>>>>>
> >>>>>> What is the reason to have this memory address different on various
> >>>>>> boards? Can we have a default in the soc dtsi, and allow the board=
 to
> >>>>>> override the address if needed?
> >>>>>
> >>>>> There is no real point in having different addresses on different
> >>>>> boards. But the node describes memory that is physically on the boa=
rd
> >>>>> and not on the SoC. And I think that is why DT maintainers want to =
have
> >>>>> it in the board DT. It's the same with the memory nodes for the
> >>>>> remoteproc drivers to communicate with the Cortex M-Cores in the i.=
MX.
> >>>>> But maybe I'm wrong and if there is a possibility to move this to t=
he
> >>>>> SoC DT I will definitely take it.
> >>>
> >>> We are talking about reserved memory, so this is highly board-specifi=
c.
> >>> So for different hardware variants with different amount of RAM you h=
ave to
> >>> go for the minimum anyway.
> >>>
> >>>>>>
> >>>>>> Or can't you add the address in all the boards, and keep everythin=
g else
> >>>>>> in the soc dtsi?
> >>>>> This could be a possible way, yes. In that case maybe we could even
> >>>>> create a generic dtsi to contain such defaults for all boards.
> >>>>
> >>>> I would go for this solution, we could have something like
> >>>> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have=
 a
> >>>> sane default memory address, and have an easy way to override the me=
mory
> >>>> address from the board dts, if needed.
> >>>
> >>> So what is a sane default? At the end of the minimal possible RAM?
> >>> I'm not really fond of something you have to make sure matches to your
> >>> hardware, but won't raise an error if you forgot.
> >>>
> >>> How about providing defaults for the SoC part and users have to provi=
de their
> >>> memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. Th=
ere you
> >>> have to specify memory-region in your board.
> >>
> >> I am personally ok with both solution.
> >>
> >> I think it is easy to have a sane default in this case. You cannot have
> >> less than 256MiB in practice, and this is just about the offset, is not
> >> that you are going to want more memory reserved if the board has more
> >> memory available.
> >>
> >> At the same time, having the memory range in the board dts is also ok =
to
> >> me.
> >=20
> > I'm just saying, because we had lots of problem with assumed offsets/le=
ngth
> > in code/DT for NXP boards. They usually come with big/huge amount of RA=
M.
> > This breaks for all hardware using a small amount of RAM.
> > So it's better to not have a default than silently breaking things beca=
use
> > the default doesn't match.
> I'm revisiting this now and think about how to do it. I would like to
> put a default memory node in the dtsi that dynamically puts the buffer
> somewhere in the first 256MB. I would include the dtsi in all
> i.MX91/i.MX93 boards. I think this should work for all boards.
>=20
> If I put everything, but the memory node in the default dtsi, as
> Alexander proposed, I think I will run into DT validation errors if not
> all boards provide a memory node, as the property is mandatory.
>=20
> Is there anything I might be missing?

Mh, isn't that exactly the situation you want to catch as a DT author?
Raise errors early if something is missing in the DT.
I would go that way that for all currently existing boards an corresponding
memory node could be added, no? All coming boards will need to provide it..

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



