Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE977CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NskC6dmigOoRB1jTRDCnQm+BI1ydTrbvAWPVyxSNjRQ=; b=MTtl3rf7V/WLvH82FBXBDMJd0a
	F1LF+ANrZO4pHeeaW3UVD1Pr192Q66FSuBmBen+BuN0XVUe5OLZ9Qek0BqaLH0lZ+pVRr6Z9M1/Xb
	NBebviDx8cgmwP39R34R5fS2ivij5eEm6AMB79ydSp2j7qG46kZ6HQZSuLfOXnyGt/SafDOzQGFt1
	Pr7Tt/1vsp1XsE19PEFSq5rjj5hfvbq6q8UOpN6O252WOc7V2GAwKYHKQx6ifpCLBbkA81c6iMtev
	LpRYS43hA4ePdfn2m93HB+9aU/M7YoFh3VxFKe3ll9Bw3wkXOtRqZcRU1E+lB6akFsGrQjpeVostP
	6SdgKnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTM8-0000000EBVN-1Q3H;
	Mon, 11 May 2026 16:19:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTM7-0000000EBUq-2YRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C81B460126;
	Mon, 11 May 2026 16:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D67C2BCB0;
	Mon, 11 May 2026 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516382;
	bh=NskC6dmigOoRB1jTRDCnQm+BI1ydTrbvAWPVyxSNjRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmZOypqqo6QnvKsLUdTwqp6pILghve+sC7s8KM6pR81WAgISwe1xyUGKA8njgOMA9
	 9IE3QLVW2K0lw0PDXZEmeVZfv4iZsWXQ3gGSYRJeX7zqceAY+00Zg8G8DVQlJPyCCP
	 l5p1lpqKSYg2vFkUlqP+wS+m5NmjkAVTqJ1IEoBQUCLvwVQGeWIvhZfiXp8KkHJDHQ
	 RYemROhI5U68K6udVikO7mfgoHZ7kJx2m9RDtviJZp+I1MqVdxsIXUMsM0hyrzjIsM
	 6Ljfe42+IBIkEG6BaZUrZGQJiSpf3Iwqhim7jPyojQaD0g2SXtfNlgq8lZOcYzvVpr
	 3oAtCdKXPtUqQ==
Date: Mon, 11 May 2026 17:19:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lee@kernel.org, ukleinek@kernel.org, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
Message-ID: <20260511-frisbee-boss-00653c53fd47@spud>
References: <20260509193928.19030-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KXR1VqJkuf+OgG2z"
Content-Disposition: inline
In-Reply-To: <20260509193928.19030-1-manishbaing2789@gmail.com>
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


--KXR1VqJkuf+OgG2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KXR1VqJkuf+OgG2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIBmQAKCRB4tDGHoIJi
0qCMAQDhDpruGAoFgO2RUtQlivn9XcuSUa9Y8R0GXhaqpERu3gEAvM7LyeQiv/2u
fF9MGycLBRVQ89lLxkL9Ow/EIPU1Pgs=
=vIpv
-----END PGP SIGNATURE-----

--KXR1VqJkuf+OgG2z--

