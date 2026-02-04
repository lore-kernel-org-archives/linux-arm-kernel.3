Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C6E83F0E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7WDzb8GOFRXzwj8If0wfLvi0VKUElNNmrDDIubqGPI=; b=rgSuBP7/AufOMK06jR4Hu2w7jK
	wFo3pfXjGig3GN2NM+prpNXP7DJ8aRRTQCiV1QwVEFakbihaX6wCsgdYqA43e+wrTOdMSwqZnPEkN
	/pNAY1z1l6NPkFnea+AgXG6fs854K5HBzMPzmFN4XXRx0wt7LS77QNO/jot5QkRqNqq//e1uNpOsp
	eKxSgXc6MhYWHooNVgWrfWKjXK49CVhzEueQLSk0rHN0OGN6NKX9nBONohmN7j2ayS3/zP9+uDTuI
	/fiBH/R2sK+YygoH0xkLJmAC/BUzQC41R2GlfRwXyLtzsRdqHMrVF+rF2lanxREgRRSoZ0aZMR0G8
	qwnF4GRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhGS-00000008uH4-2srp;
	Wed, 04 Feb 2026 18:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhGO-00000008uGD-0W4w;
	Wed, 04 Feb 2026 18:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2F15438F7;
	Wed,  4 Feb 2026 18:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C163C4CEF7;
	Wed,  4 Feb 2026 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228363;
	bh=c7WDzb8GOFRXzwj8If0wfLvi0VKUElNNmrDDIubqGPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JUrbRyB9kku48FKbF2pH1h3wyzv4tXBchUcGPt67lf5rrr9LC3rFX3IiF46oF3zfD
	 ME5t5ylEkX563jdskTQK8qp24H2WJnXKLHHr96VgyIWpTr8dPNKi3vQInHENvht1WL
	 mzlm8hbH38JUIl0RHZiuGHnJYjBUqoNzCL5p9T2wx7Zm7524vPqDKkWia4erG76T+h
	 HR3qVsb34lfYCumBIZPYk97K/+/QKVQgNXlALQxJ7yPLocIegHauOhU9MDJfbuIvOl
	 q8wu0rlt8N2CNbNdJNCGaCb5CeacJNlwJPEmtoWah4DcmnGOucJlNzqPmAc6dhddn5
	 FOnrrXOmNfVdw==
Date: Wed, 4 Feb 2026 18:05:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	alchark@gmail.com, dsimic@manjaro.org, andyshrk@163.com
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add OneThing Edge
 Cube series
Message-ID: <20260204-gulf-pencil-6efd29ced035@spud>
References: <20260204132700.329894-1-jerrysteve1101@gmail.com>
 <20260204132700.329894-3-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dnYAzzgA54S780wp"
Content-Disposition: inline
In-Reply-To: <20260204132700.329894-3-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_100604_175072_F9503559 
X-CRM114-Status: UNSURE (   6.27  )
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


--dnYAzzgA54S780wp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--dnYAzzgA54S780wp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKhwAKCRB4tDGHoIJi
0rvnAP9FP/3+bajA+gnOaqp+Y6Z/qAfvuELE2uJzsbklIo4/fgD9HdxoPyRbgowO
G1y8Bye3pdr+BjD6inWfDaLylSODDAI=
=wXP8
-----END PGP SIGNATURE-----

--dnYAzzgA54S780wp--

