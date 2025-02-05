Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909B5C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Nd8zkIFo+tzIlu+MtfTED8nED3c+ndCBfj7taqna5w=; b=tIcZ+/d8cQ8cciYj8YVvrH8zhU
	x5hQjDoqI+Odke9EZ8iXJze0KXh7wFxOVqepDr4hSaam91b5v7+g5oKaKuNN5dpjIH9f2hAIUmigP
	j1ZIucyrfGmKDu1SmsE7HJLi/ggtSaJaQKRtnOD4uIP4JzYjIoU5KwUuZmx5WlqCeyToTy0srI+Bk
	5wUGreq8oZHqg7MsQdm/LBBp3BJulVQRJmtY5F5RdwfFFWS/6l1exivwlnT4cEmYUh13fwVPbRlqS
	pkd3tpWHUyxuOZ6cTtFfh9e85AgRbr0v0Muimw0ATEZJBJqjm8W/qh5CmBqiZ2JUyEfGmZEIYfCuZ
	TNDFFf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSso-00000001sbR-2LGo;
	Wed, 05 Feb 2025 00:03:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSqW-00000001sLk-1uKW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 00:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFC535C0C4D;
	Wed,  5 Feb 2025 00:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F40FC4CEDF;
	Wed,  5 Feb 2025 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738713647;
	bh=4Nd8zkIFo+tzIlu+MtfTED8nED3c+ndCBfj7taqna5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aORGDcQSqOG6EIfi3tvCAq7oMs4ru9E1QvEnqHZmnnl3CtK98qQAg4ZatwXtAWXjV
	 PqDYyI7DaRQteyPE2398JPTR07YkrtwdrOv+Eq2426kBz0CRWfogGU2xtY/kkKSD6r
	 2ieqdxM0HbPhRA5rmmmbTE8e4lAuGmWkpecOS3aOobH4GitMupKrSyt7Hm0Idu6cIO
	 5zLNKZ4f5PLyNZ9jATGzxV6QahKwtT/xKBvwVTCbWGGV54BQI3getRxmmGly8Je3QJ
	 YFaCJJgtcaPUycEAV3AkW1NdLwfeAi+EXBbfq+0F3BFGVnYFY++wv2VBYqjk9ux4lh
	 bYDbdihl00oIQ==
Date: Wed, 5 Feb 2025 09:00:43 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v2 1/2] counter: microchip-tcb-capture: Add IRQ handling
Message-ID: <Z6KqKz3YDQypxgok@ishi>
References: <20250203162955.102559-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8lN0NPUSkqhcUrXT"
Content-Disposition: inline
In-Reply-To: <20250203162955.102559-1-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_160048_533795_E4D0ACDA 
X-CRM114-Status: GOOD (  12.02  )
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


--8lN0NPUSkqhcUrXT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 05:29:52PM +0100, Bence Cs=F3k=E1s wrote:
> Add interrupt servicing to allow userspace to wait for a trigger event.
>=20
> Signed-off-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>

Hi Bence,

Thank you for the patches. When you submit the next revision, please
include a cover letter as that will make it easier for us to separate
high-level discussions about the entire patchset from any individual
patch in particular.

Regarding this particular patch, update the description to mention the
specific types of events supported by this (i.e. Change-of-state and
Overflow events). Even though you expose the capture data in a
subsequent patch, you can push the Capture events in this patch so that
we introduce all the supported interrupt events at once.

Thanks,

William Breathitt Gray

--8lN0NPUSkqhcUrXT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ6KqKwAKCRC1SFbKvhIj
K8yjAQC1lN6++3uASijjfZxAf8Pql7nv0XxqlRvX3ZF0WeMs2AD+ODgK8IcKjycD
CLDCfn8zbJyteMJjJTcJW0uvh2INkwg=
=fnvp
-----END PGP SIGNATURE-----

--8lN0NPUSkqhcUrXT--

