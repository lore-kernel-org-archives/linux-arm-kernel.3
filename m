Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8E0C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 01:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lzyhLmg/ziMLt4yRoZGb0hv19iiAWHl/1qxkgQ+5AS8=; b=foe5Y64AMJ64PdojK8r3eQgRac
	oBCZqsRq1/m7aizGNi9wFPMIP3/bU9OzmMeKNEd9eB6X3/5+wETZ0r61RrhzgCvewsoVm3Kz+apE3
	6UdABUXZtwiXVg9E8j4+D1ZmdOVKPgGEMeD8oqFLTariltNGcUFNiOU/1dGgroNPgWYAF3W1ZYzph
	vAxcCEPRxDNWJVEEk29ppN62p1mLEI6JsAdIPLMVZA1op9tCLyozPSmcw6BlLPxLEYBCY2jmc66b9
	wUS6n1Khhdi7WaXmGjcEleVwWj31k/T5GVKfW6HpmCy7Z6ZNay7STpe5RX6Aj12FNNJMeGcdWcZTS
	dCZemZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAIuC-0000000EOeH-2muh;
	Thu, 01 May 2025 01:40:04 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAIsG-0000000EOUA-0w2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 01:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746063475;
	bh=lzyhLmg/ziMLt4yRoZGb0hv19iiAWHl/1qxkgQ+5AS8=;
	h=Date:From:To:Cc:Subject:From;
	b=Hc7emitz9ZsUWYPpVllHGyplXQ/xhdmxbvF7vBt/NwHRylQ12oesZ7lw2Z1kYMNxC
	 suh5n8cDBmvL07bBbq/1svOPrU8T08PDB6AGkpbtpoGRYOSE6OI2j9awiiYwiNTLpy
	 ET53guqPtaHlE8trhKjWt5PFfSekPhfWlVMT6Ppd9XncwvEsddM8kSGDzwktKZcnaU
	 QoitBJUNEY3S/YUeTEekqtKBsyjKQtmvh5FEarA33/XC0XVjWNGnPcqWZeKMFS7nvi
	 zwM8eey7Nu4OUek5WCncCYao7FikNL9sXw3t0UunCG2wRtMrxdcGo/jBItjDdsL+Bp
	 558jsXQrv1PwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnxWk6bcZz4xQW;
	Thu,  1 May 2025 11:37:54 +1000 (AEST)
Date: Thu, 1 May 2025 11:37:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250501113753.53f6fc88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UFLoNUn3bPfxHBrObqHN=+p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_183804_529230_83A5B995 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

--Sig_/UFLoNUn3bPfxHBrObqHN=+p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc-fixes tree as different
commits (but the same patches):

  0530a74f3f43 ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp23 SoCs")
  6485975d7832 ("arm64: dts: st: Adjust interrupt-controller for stm32mp23 =
SoCs")
  635ff238ff7b ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp21 SoCs")
  2ae67a2e7e4f ("arm64: dts: st: Adjust interrupt-controller for stm32mp21 =
SoCs")
  97d0a619e248 ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp25 SoCs")
  e5694384b07d ("arm64: dts: st: Adjust interrupt-controller for stm32mp25 =
SoCs")

These are commits

  2ef5c66cba61 ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp23 SoCs")
  3a1e1082097b ("arm64: dts: st: Adjust interrupt-controller for stm32mp23 =
SoCs")
  1bc229e9bb9c ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp21 SoCs")
  02dc83f09c72 ("arm64: dts: st: Adjust interrupt-controller for stm32mp21 =
SoCs")
  06c231fe953a ("arm64: dts: st: Use 128kB size for aliased GIC400 register=
 access on stm32mp25 SoCs")
  de2b2107d5a4 ("arm64: dts: st: Adjust interrupt-controller for stm32mp25 =
SoCs")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UFLoNUn3bPfxHBrObqHN=+p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgS0HEACgkQAVBC80lX
0GyGngf7BksM6WgqDKipL3efzeWF/g/vQMzKp09JHYlUeES3sn6la4Z3EjVmSQfi
/7ydJcDAA388x7uYvKL+IAworDIDNlUZdWtmby9VQXbnTe9z8Zh+YmROQAKdcytz
Q9u8+Qo5EpJiM45n9Vzd5t6CdPuXHViJqsvREwC6VXqz6gdsgimuRZc8Epqgp4mj
Li5KprrP82L2nZotU1GfSPLVHjUG+v9u43tkxB1zUY/6gyZQeFYcIUzHWnNunkFl
1hBDcmDtNn8jQ4xnfDAYTFqTX+cYs+u6F1kiYYFuyeAPhzj/9ewOufedv8ppIvnu
zaHTvGI3WEmmg01ddtgAemrzTUiROw==
=E9wg
-----END PGP SIGNATURE-----

--Sig_/UFLoNUn3bPfxHBrObqHN=+p--

