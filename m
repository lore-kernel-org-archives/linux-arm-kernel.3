Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2CBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxZRHUz0odpMCAdOXDZV2Gewb34GcPHensWB6qpYNW0=; b=ztwWKIO9G/jFdX6+30+f3z3xui
	H3q1zShNFSJIjVoWwaOmTat3vWSq6fHSN/ya7ZfSWohYk6eN9K0uxV9lySZmOysSlGYvXyy6xVx7R
	PC41vLmgfPjNsatzyhbLwiy/4R8pjHfmMsvlhjtCumnqQ86Ss/vRK0+/PaFxPWa2kQGkdYZU12/xC
	AWN5vo3z62zBs/bgfUUNM9inn85hgnH4s65O+5jsPkIcTZTHisYCZuRKJiRC2rts70MTpqDing8fJ
	Ski8ynX9Dy2K5qesgWXhE+M0NYp4+tqx9fH/HYPfjvmeTlU6gMXMSr5IvM7ZDLgIoe1w5ICP8nI+B
	EdgLRb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgeW-0000000B1jj-48wI;
	Thu, 13 Mar 2025 11:23:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgWK-0000000B0L7-1IU5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:14:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6C2343152;
	Thu, 13 Mar 2025 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741864470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxZRHUz0odpMCAdOXDZV2Gewb34GcPHensWB6qpYNW0=;
	b=K57RJVVry+aqhLyQrVxSO4IAxED4+E2G+7+fkUvNhgvK7Q9jpbbOqar2SDtepqXnrMWaVB
	LTT8Tn/GX2Q/yC3FHeXUxH1TrSQXNYQU+WJslfCY6/o6XRlpdl9RQbp1xtO0wDFIOfpORM
	itwbhKXW/COXgf3O68gErM3szNiCucaOtDlksnV+sv/rm4eVQ8kZn1EoUQE8D+gujujYZC
	G9acDWmdcUhDRR4QZksDRmrXpGOBpumVsOUYlRgUAT71aGXP3DaNy7KjArTC7vGRYOO2KJ
	qe/dqoT6aTaBp8x0FASOVeSyE91RzsvOKDRM51E8m4Uzi6OyGgeYDCySyDIRBQ==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 12:14:26 +0100
Message-Id: <D8F3F4YLD0ZM.19X0451BIIDVO@bootlin.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com>
 <20250310-varsom6ul-concerto-dts-v3-1-551e60713523@bootlin.com>
 <63f8aa7d-fcd4-450f-b3a1-44886a29fc7e@kernel.org>
 <cd2f3c97-53bb-42f5-a3cd-4385bfda5dc7@kernel.org>
 <D8CQAAKOZ1O5.8JVESQPJSSM8@bootlin.com>
 <20250311-omniscient-fiery-bison-8e7feb@lemur>
In-Reply-To: <20250311-omniscient-fiery-bison-8e7feb@lemur>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtfffkufevhffvggfgofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhueejkedugfefffektddtvdehheeuieeggfetgfdvveeftdehudduteffgfevgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_041436_494156_577453B2 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Konstantin,

On Tue Mar 11, 2025 at 7:34 PM CET, Konstantin Ryabitsev wrote:
> On Mon, Mar 10, 2025 at 05:31:32PM +0100, Antonin Godard wrote:
>> > And now I noticed you used b4, so I really do not get how the tags can
>> > be missing here. :/
>>=20
>> Sorry, that's totally my fault here, I forgot to run 'b4 trailers -u' be=
fore
>> sending... :/ And I don't think it's part of the prep checks?
>
> Mostly, because there's no clear picture of how this would work reliably.=
 All
> other checks are on a "ran since modifications to the series" basis, but =
this
> one would have to be time-based.
>
> Should it check if the trailer updates have been run in the past XX minut=
es
> (and how long should that XX be?).

Had some thoughts about this the past few days.

What about checking if it was run at least once between vX and vX+1? Maybe
during the `b4 send` command? In case it wasn't run, give a hint/warning to=
 the
user before proceeding?

This could also be enforced with an b4 config option like
b4.force-trailers-update - either set by the user or the project configurat=
ion.
Not so sure about this one though...

Now if I were to speak for myself, I would love to have an option that just
fetches the new trailers during `b4 send` and errors out / warns me about
it if there's anything new that isn't part of my series. Which could be als=
o
ignored with --ignore-trailer-errors or something like that, in any case.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

