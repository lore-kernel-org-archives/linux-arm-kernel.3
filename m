Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CA1CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kALzxCILqnsDSi7OPFFkSWPNmnSPH+VmVuXXrYuTw8=; b=Sab0uxOt+mqMQDmA1jAlxRp6ne
	OQ+cvIg1I7Ewl7//TCU2wKdxKUnWFU/1b4XclVwDmJYQ2zc0Zt3CX3OzRNVZ9YFPpouxF3OOSWLc8
	bS7NOo3pEpY3mUHH/F+N0Pggwm9U3k8t2bISNkd3nz5wKmzPpSwyUvaSlvsFF8bVKVSnr+cjaodLZ
	b3TPqeUk9rsLJxQS+WaT6dH/jmwLtB4YiPQWKCYJ71t5VrONsRTMhdFdPj1Lx/ELbUZ65EVdcg2cu
	E11DOvObPWwpMcEHrw9A6aTjBlXJ7QwoP0H04SOknITiIPCyjskoLZTltZ/mpDr671xF+M3QGOTMS
	Ru+Qz06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg6C-00000009ZiM-1Xzm;
	Thu, 11 Jun 2026 14:09:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg6B-00000009ZiG-0qbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 14:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55078600AA;
	Thu, 11 Jun 2026 14:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A0E1F00893;
	Thu, 11 Jun 2026 14:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186974;
	bh=8kALzxCILqnsDSi7OPFFkSWPNmnSPH+VmVuXXrYuTw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j2QYmsO6wI/9HS6mTERq8MJ2UEEhkhsafRuog9gDXd+PUHdPScMk7N5Afh3ALsi+i
	 6An2Pb8fmu777x3aA+ynIOBEPfTwkp+thMtFlV+xOJ/Zn5lsKjPL2T+SxTssZpCvWp
	 YGd4PSqgIsiROAiZRljc4qgXrqor6uDvNYd0d+bsng6tPKeuyxphkL70+4MyAJvTlU
	 YruMzB5wh469SWXSN+PS0JqKnN/q8rBrOBVINFJXCNtjAbEu32OpVcc25gUOHU8t9B
	 ZF2XiOBVtKE2KU+157Ck+jDAYlPycCKcX58Nf7IKkaNYMx21MjFny9ssBBVn8tZNsf
	 ibeLKh97WvHZA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 352681AC56C6; Thu, 11 Jun 2026 15:09:31 +0100 (BST)
Date: Thu, 11 Jun 2026 15:09:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>, stable@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] spi: uniphier: Fix completion initialization order
 before devm_request_irq()
Message-ID: <airBmzYhnxuK_xdh@sirena.co.uk>
References: <20260611113137.139673-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2KgV7ttlSOAuFoMN"
Content-Disposition: inline
In-Reply-To: <20260611113137.139673-1-hayashi.kunihiko@socionext.com>
X-Cookie: Leave no stone unturned.
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


--2KgV7ttlSOAuFoMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 08:31:37PM +0900, Kunihiko Hayashi wrote:
> The driver calls devm_request_irq() before initializing the completion
> used by the interrupt handler. Because the interrupt may occur immediately
> after devm_request_irq(), the handler may execute before init_completion().

This doesn't apply against current code, please check and resend.

--2KgV7ttlSOAuFoMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqwZoACgkQJNaLcl1U
h9D0Jgf/RBZfe+cdXTQ3yCoVQhnlmf/yAUsGSFW8vWNaHhOKevTLgHWYc/u8U4+o
EH+h7ITKfQCJZ1dDNfjqjNVWDzAsp9DKTtr9GtY/PINxxB6F6vJuTNiAyEb7wKOM
ORlcnU795uLloueMNaIF8LictF6DIWoM8czmMT41qh6GoTeWo0j3p9stf/Xu9Cqs
ggKVnP/rmfQYqBoyifm0AHxFQOnSfZU8ILVwSWNzIxXH5Sxyg7j21Vnfmt2vUu+Z
HHIbJXDhOnPXN2IgTFdrC6uGOh6kbHXfk3PKhUISEL+rPbp6Lzax/nxCjxXDR5Rc
4QWkwS8ZVPf5eh3ci/YA1DnjaJu04g==
=pTxp
-----END PGP SIGNATURE-----

--2KgV7ttlSOAuFoMN--

