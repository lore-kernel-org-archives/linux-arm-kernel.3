Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4054C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paNA/eS2MtpoanVjKHZPdKPquAcJHGEN2GgFqTnCFII=; b=2zbXd71jkkY7SlEFSqg6DvT3/l
	t3UNwu15UodC/1zhUgHSEpENBe7hCN2H5QVHLJA/xveJ6UhkUxVBHsILYw/rxMWYSgl4H6mgqFWQX
	v5b0jpRDHLb8XA2KmFJyckYrsmRZNS314GGsRTrEBnfGBkl3aE0FTt23EfYHirAnqt8GiWdCXUQZR
	R2U1XlDoIaZ+iPlJZrGt+8IXsO8Zq5m4CSQ1AloLlssQyl6MTn7/JIjRfhmI6A1VifuBeyR1abZcc
	Kiu5am80C0nrcT3KZyrC32rrgZp2ihaDuqcumyqNMc8qPsaiWAqhJzYsVrG2D74Rfjf5vESg9dHKU
	xOiQnINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq3A-00000008P7N-0rSh;
	Wed, 05 Mar 2025 14:48:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm2F-00000007gxb-20kH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB4805C67C2;
	Wed,  5 Mar 2025 10:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807E7C4CEE2;
	Wed,  5 Mar 2025 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741170690;
	bh=1PHHIjKZHtToxm/thyNV4FJackLZax12wRG+bi6VJ+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge8yM9wJBNgbZ+1QNXotg8b9WSfyESHAbsIwCuZwpniZ740iP8LUBXiIWwR1edV2O
	 PwKp97k55Oje422t60phP5I2ogchQlYsE3XNTtvNjCTc/pw4dht/2U1ZE/64KhfwVf
	 xfHsR/R8+HlCuRgYJqURFxf7FJehd3vv6tfmvorXWx6/vH1AoiPtLEhq6JFJf1L8qv
	 XuWW0zhhd9PwYffCw922OyD8FuBLdGW0shPQzO9nEFmqtenfRT/wqZuJSQma3l6RH8
	 i4tYC9kWqmTjVJyjqZvM2rmAP1cI+qi3s+IFQXN1oQhx0622mBsE3mIr8RASComzXF
	 huf7wMvketdvw==
Date: Wed, 5 Mar 2025 19:31:27 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix undefined counter
 channel state on probe
Message-ID: <Z8gn_4qxtEqbn20O@ishi>
References: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dPcNFR/ox0/r/xIu"
Content-Disposition: inline
In-Reply-To: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023131_580125_B5CF2B70 
X-CRM114-Status: GOOD (  18.12  )
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


--dPcNFR/ox0/r/xIu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 07:01:19PM +0900, William Breathitt Gray wrote:
> Hardware initialize of the timer counter channel does not occur on probe
> thus leaving the Count in an undefined state until the first
> function_write() callback is executed. Fix this by performing the proper
> hardware initialization during probe.
>=20
> Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
> Reported-by: Cs=F3k=E1s Bence <csokas.bence@prolan.hu>
> Closes: https://lore.kernel.org/all/bfa70e78-3cc3-4295-820b-3925c26135cb@=
prolan.hu/
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>
> ---
> This should fix the issue where a user needs to set the count function
> before they can use the counter. I don't have this hardware in person,
> so please test this patch and let me know whether it works for you.

While developing this bug fix, I noticed the following code in the
mchp_tc_count_function_write() function:

	if (!priv->tc_cfg->has_gclk)
		cmr |=3D ATMEL_TC_TIMER_CLOCK2;
	else
		cmr |=3D ATMEL_TC_TIMER_CLOCK1;
	/* Setup the period capture mode */
	cmr |=3D  ATMEL_TC_CMR_MASK;
	cmr &=3D ~(ATMEL_TC_ABETRG | ATMEL_TC_XC0);

It looks like it's trying to choose the TCCLKS value by evaluating
has_gclk. However, a couple lines later the cmr value is masked by
ATMEL_TC_XC0 which will clobber the previous choice by resetting bit 0.

Is this a bug, or am I misunderstanding how the TCCLKS value is set by
these defines?

William Breathitt Gray

--dPcNFR/ox0/r/xIu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8gn/wAKCRC1SFbKvhIj
KxQeAQDGA5JfQLESH4QBAqulBaIKYPC1mduU3pyCbQQQP/9c/gD+NbXPM34DbK8Z
mIl2wzt1U8ZKDlQ5/4ZvRHv4BEqn/ws=
=SzRC
-----END PGP SIGNATURE-----

--dPcNFR/ox0/r/xIu--

