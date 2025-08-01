Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935ACC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUtTWnJnFCUFZnOCDhSCjqlj1w/7DHhEYnzdKUIWCGA=; b=1DjvfnjnIQx5Zqvs9ey+KNu3V8
	Kgkqy751vuGUqDWcVEiRSseyPSL1BNseHPvCJpecL/Ui/dYNu3Z4SOZauTCIfan1NHPRVAEbjxvEA
	5icDh31XXnaE0gZzp106gLpnOPPIt4OGZ2imVKgYql20B2HP7n4vAnFLqwRegsvLRtXkFAR0gUjMj
	FK5IIl3PTnoNu99i97NIH4yG9wXfu5VbNKg8nJ4Pr+saLEXMIkOnXbftIMlMlnaseqtBgHurDJ4dI
	bX0nrWRus99ORWa8Y6pUdq1tab/yJbvSDeSVnEZMcw6oyUQ/+wK4orrMxrNScJaDiZ5XUXrtZeErD
	LyC/ut9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTr-000000063tX-2bFa;
	Fri, 01 Aug 2025 13:07:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpIg-0000000629M-2LcT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E69DA5C65CF;
	Fri,  1 Aug 2025 12:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07280C4CEE7;
	Fri,  1 Aug 2025 12:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754052953;
	bh=pUtTWnJnFCUFZnOCDhSCjqlj1w/7DHhEYnzdKUIWCGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4q1fHlSZqScI1D+FYZNRuBmbRKsUuAL19Fff9b5hfrsGDU7TOx0e7nuTJ6H8edA0
	 lFMK0Dh27cnAmrPkOL02WAPXsZD/U0C6Iy8rFAWNivNHy9MCFomJcPOH4FwC/m4J+9
	 6w4CtFk/aifSDnBeLk8aNJQaFgryEv7YmA6BzYkUex+p/fNOZFm4TAIrwhCzdH8y1x
	 SD3/fuaogok4GYXou0SeXlvfXdG2OLy61IaNW6NKYjb4lhOtbohBr5DETMso6Ej/1f
	 EMWAGVMe1XqOBFkFhDln5EpwqvEjghte/vcLcQD2vW3HSJzHatla+B9YZpnGbW7zAC
	 UTCKAgmiN7JPw==
Date: Fri, 1 Aug 2025 13:55:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <59b874bf-e23b-40c4-b095-016fe6b14ed6@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <aHDNmVE23O4V4rqJ@dragon>
 <69f6a044-be90-490f-b0ad-e7867a4825da@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="giqwk26NsK1VBXtr"
Content-Disposition: inline
In-Reply-To: <69f6a044-be90-490f-b0ad-e7867a4825da@gmail.com>
X-Cookie: Who messed with my anti-paranoia shot?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_055554_637336_88C4EB56 
X-CRM114-Status: GOOD (  13.98  )
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


--giqwk26NsK1VBXtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2025 at 03:36:01PM +0300, Laurentiu Mihalcea wrote:

> How should we proceed with this? The fix for the issue reported by Alexander
> Stein was already picked up by Shawn via [1]. We also have [2], which is meant
> to fix the Verdin issues pointed out by Mark. However, I'm still unsure about the
> EVK issues reported by Mark, which I was not able to reproduce on my local setup.

FWIW the EVK issues are still present in -next.

--giqwk26NsK1VBXtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiMuVIACgkQJNaLcl1U
h9Ddzwf7B+1qvYnmWp1lrZr/Rt+m6pRPpt7K9BLW6292BCBsvBTh9lApj7nBItkN
Q8GNfxqVr5+tKBzyyzMj0p+0Ey//XcbAHM0y6SYHolp7t0Xarltf/4M9tFlgZWr1
qyOixSeu4dD6bMZLRg0UkBbAi0mAlfj3yPvpfLch+t9H9kdDJZ2GjrGCErdSSjEW
tbEonKmQ9pEcjxRw4DOeE+DvSeZ+i4nLBj0NiqMDoIIMe/Cz/uVTVDa1zlki0Qyi
/mb74K82IA+7oRtKaKIrV0qlUg4NixhoTehWmykKG3Ihwu6NjHK+cnG+ThmdgN4T
EdQWGyarTplqMDK7aaeRxl8Pc464bQ==
=leE3
-----END PGP SIGNATURE-----

--giqwk26NsK1VBXtr--

