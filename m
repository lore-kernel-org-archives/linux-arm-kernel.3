Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA86C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=US24++JqmjXV0mttrUPY2QvIqdLYwAQ0fJFwmF2h1iM=; b=PWybxn6XW/Axvw35xuwC6gO831
	9SvWvxDhyoql8vu+AkZhVBKW0lP//K5jLEKI4hTsN6qcED+EUsxbuOpHJDKjVO8uxRSReKNtL7/pF
	PTAZWw1u/6/qGAbARwaoNhQPTERDOvyIa3k6zEIE3JIA/YXRyWl/gB9OntUc/mYi2BMETl7C+WJh6
	azdOohZapCDMTRZ452cIgvIRIWsD95xUYQ6b87dWWCn8uhEn3K9ao5we735zYU6j3Irjhc1/UQlme
	WG1bNVg6tL21Hx5BudkCvsbMw0T0NXJqMXTNnoSFRg4aNmXOq8CPc1RloOmkaJDeYVnCAvthznKa1
	v4/JEq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPch-00000004B5u-2MqV;
	Tue, 04 Mar 2025 10:35:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPMV-0000000467Y-0nAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:18:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F612A4542C;
	Tue,  4 Mar 2025 10:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B9CC4CEE5;
	Tue,  4 Mar 2025 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741083534;
	bh=US24++JqmjXV0mttrUPY2QvIqdLYwAQ0fJFwmF2h1iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRwk3ZPYwAxWAV6U9csf40AiEHopJoeD26ORP3qPEHlojXU/Hqz/f4BUtXX0WKzjQ
	 Ho0GYe6lKZUdZ2N3ZLmtyCAZs6/ijv+r3jzKA5rk8eHddV9J9ty8n/DtdzeJfr525A
	 Boj4mz/mwN0kuOdZC7MeKiDHIiO85tlCunzm6MkZblDI6kUJlmLztTeiZR/70SUv0V
	 YvgDQqmnqFWwecKGKIzEn7JnKWBs9V4ifas3YiQlPcGD/aoK8y7Qh3rM6/JB4Es75k
	 Mdcs1fEIJB2dvKdajjPTRYd/u4rH1dp2ROgBD5G8xOWl+9rlvCxUen92bGNT/o/FEu
	 FumwBhup4TRqg==
Date: Tue, 4 Mar 2025 19:18:49 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v6 2/3] counter: microchip-tcb-capture: Add IRQ handling
Message-ID: <Z8bTiTWa11iqxUnH@ishi>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-3-csokas.bence@prolan.hu>
 <Z8alaOTjZeRuXnUI@ishi>
 <9fcf9cf4-ba02-4583-9e14-bd650dbe32ee@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7g4U+VYmFuSmHd1m"
Content-Disposition: inline
In-Reply-To: <9fcf9cf4-ba02-4583-9e14-bd650dbe32ee@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_021855_295509_60B33984 
X-CRM114-Status: GOOD (  15.41  )
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


--7g4U+VYmFuSmHd1m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 10:57:05AM +0100, Cs=F3k=E1s Bence wrote:
> On 2025. 03. 04. 8:02, William Breathitt Gray wrote:
> > In theory, the error code could be something else if of_irq_get() failed
> > for any other reason. Handle all those error cases at once by checking
> > IS_ERR(priv->irq) rather than just -EPROBE_DEFER. Then you can just
> > return dev_err_probe() with priv->irq for the error code.
>=20
> Yes, `of_irq_get()` can return an error, for example if the IRQ is not
> defined in the DT. In these cases, we just don't do IRQ, but still allow =
the
> device to probe. -EPROBE_DEFER is special in this case, because it signif=
ies
> that there *is* an IRQ to set up, just not now.

You're right, that makes sense. Thank you for explaining.

William Breathitt Gray

--7g4U+VYmFuSmHd1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8bTiQAKCRC1SFbKvhIj
K1K/AP9CBln2kj4VmHF/sMQlwpaOMV7DLh7MzYGOOQ838jE/VgD/UIhocl5J3TIg
+n7JyYuGK8FXUplttva0FRj47UXfoAM=
=E6wR
-----END PGP SIGNATURE-----

--7g4U+VYmFuSmHd1m--

