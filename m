Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA2CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6AwYAdLe44pys5Ry5RSwhd07Xp+hbvu1esrmSpPeng=; b=ybVzAZmj6AF3x8ogEwv1cP8vi3
	/ZrUIeWfbuogKOOQlIMhZZhawnaCjBPQ1h/8rnSBSUmrucoSPLfDkq7S7c3lCVzFJtU9Dg91AZJ4S
	A+OgM7ow0NQ/wVYkzhZqhIen1TdRiFy5LkGTFFRQ7EF0yySUYb+71z+BT5C2oJOSmRVIvMwGKVpc/
	k9lN67i5g4go1j1M3A72Yvf6y+HRofACoemKseJI5ZPehMZIrpo5v8pDf/8PK9ud73BI2IPJ3PaDs
	SrX8NqsDlFzGxEzyJPRO0gje1GkV/oewGyoVO8cRNnCEP3FP3rXltjpooUBbaBZFi0sbp+NE6WQSB
	zn42aC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Uy-000000007Uf-2wjM;
	Thu, 21 Aug 2025 17:54:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5Ei-0000000H2XG-23V3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:21:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1up5ER-0000UN-IZ; Thu, 21 Aug 2025 15:21:31 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1up5EP-001Q3r-0n;
	Thu, 21 Aug 2025 15:21:29 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1up5EP-0082gA-0L;
	Thu, 21 Aug 2025 15:21:29 +0200
Date: Thu, 21 Aug 2025 15:21:29 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Varun Sethi <V.Sethi@nxp.com>,
	Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [EXT] Re: [PATCH v18 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Message-ID: <20250821132129.hwnnqdagalvxw2uk@pengutronix.de>
References: <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
 <b02055bb-0995-4fd8-99f3-4ca5146eedd4@kontron.de>
 <20250630121722.wviidlggt7hguyt7@pengutronix.de>
 <087b8689-7443-4720-a94c-160edd31a5da@kontron.de>
 <AM9PR04MB8604C05882605EDB4913DA089549A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250714094124.e6fnkrocnqagbm22@pengutronix.de>
 <AM9PR04MB8604EFCC5400DEBB7DF0CF49952DA@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250806132701.fouikyuqtzdsxqwh@pengutronix.de>
 <AM9PR04MB8604A636762E81DF9EA9A9B89532A@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604A636762E81DF9EA9A9B89532A@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_062148_527638_659E0837 
X-CRM114-Status: GOOD (  33.00  )
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

On 25-08-21, Pankaj Gupta wrote:
> 
> 
> > On 25-08-06, Pankaj Gupta wrote:
> > > > On 25-07-09, Pankaj Gupta wrote:
> > > > > > Am 30.06.25 um 14:17 schrieb Marco Felsch:
> > 
> > ...
> > 
> > > > Lockdown: For a verified boot setup you need to burn an eFuse at
> > > > some
> > > point,
> > > > to tell the bootROM to boot only correct verified firmware images.
> > > >
> > > > After this lockdown it's no longer possible to burn eFuses from the
> > > > REE
> > > albeit
> > > > the production line setup still requires the support.
> > > >
> > > Understood. ELE access from both secure and non-secure world is fixed
> > > in Q3 release.
> > > User can be able to modify eFuses via OPTEE.
> > 
> > Splitting the read and write between two drivers is even worse.
> 
> This could be use-case dependent. Depends on how customer will deploy its
> solution.

I don't get this. You introduce even more segmentation if the read-path
uses another driver than the write-path and if this is optional.

> > Can you please point out why you can't just move the driver parts into the
> > tee? I do see many advantages if only op-tee is used:
> 
> The ELE's KEY derivation function takes account of world from where, the
> operations are requested.
> - The key derived from secure world and from non-secure world will be
> different.

Which is correct and no reason for not having an OP-TEE only solution.

> There are different use-case for ELE accesses from both the worlds.
>
> Using OPTEE ELE driver for Linux specific ELE-HSM requests, it will add
> significant overhead.
>
> Usecases like Transparent TLS offload while securing the secrets in HSM,
> would incur additional overhead.

Of course, the ELE communication itself will be faster if Linux
communicates directly with the ELE instead of going through OP-TEE.

But to be honest I don't think that the ELE usage itself is much faster
than using OP-TEE and the ARMv8 Crypto-Extensions.

For the ELE you need to:
 - setup the context (incl. the message and all mailbox mechanism)
 - wait for the ELE to be accessible (only one ELE, only one
   normal-world MU).
 - transfered the messages to/from the ELE
 - the ELE processing should be equal to the CPU processing time

(Side note: What is the ELE behavior if the secure-world stresses the
ELE? Is there a MU priority so the normal-world MU may get blocked
(never addressed) or are both MUs scheduled in round-robin?)

For OP-TEE you need to:
 - setup the context
 - switch the CPU mode
 - make use of ARMv8 Crypte-Extensions

On i.MX8M, which uses the CAAM (the ELE predecessor), we can verify that
the ARMv8 crypto extensions are much faster than the crypto-engine
itself. Therefore the CAAM is mostly unused.

Are there measurements/application-notes that show that the usage of the
ELE is more performant than using the crypto-extensions?

> IOT-cases where real-time encrypted feed from sensors, will take latency
> hit.

Does the ELE support inline en-/decryption? If not, I don't think so.

The data needs to be read from the CPU first, afterwards it needs to be
prepared for the ELE and transfered to/from the ELE. Also there is just
a single ELE with a single normal-world MU, so you need to handle
concurrent access if there are multiple ELE-users
(sensor+tls-offloading).

If CPU is used, the data still needs to be read from the communication
interface but afterwards doesn't need to be passed to another IP. Also
there are multiple CPUs.

Regards,
  Marco

