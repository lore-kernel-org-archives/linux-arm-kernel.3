Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E4ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apD5JO1he70Tjrq7BLkA+rkkDaWLTCsaarVnSINXcLs=; b=vJyWAlnANckxZzJ0G1tP5yWlIE
	jp8a8XaxLyH5c2kQQUgSc+x/nKpgWlidpGy3nAW7rh9V6cGSDGDoc4MvkXG/9Q1qq85bKRFBVFien
	pE80ms8wn3d4HNbrEqd7jU3oMbj5nWxdYQ8hXiRrcg7jfF/g8WByr5JiFJ89OWv9dzc8ul/V1BBmu
	+QS1fEBlQ9Tpn0/rod4gF047pVD4hyugybiE3alDAwc064DYbrF9e2rdclVXPRPws0A/147XV3PMQ
	SVh9d3o4dRDOlA1icEA+isSJHrqD9qshINKfnBIyjkuJf1I89Auf95px/suX8CMvzetQyZdwt/BuB
	8xPuPHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEj7-00000000wFl-3gKK;
	Thu, 21 Aug 2025 23:29:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9jm-000000008yH-31cr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3229B5C655D;
	Thu, 21 Aug 2025 18:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829ADC4CEEB;
	Thu, 21 Aug 2025 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799809;
	bh=apD5JO1he70Tjrq7BLkA+rkkDaWLTCsaarVnSINXcLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9tu73wUuT45h/YwbSsQfEo6m3QDREQEqdymXs8JpkNQJl+TjzyywxnuFvijnkhpE
	 znRCGJtaLpdautPlRkBeYo5CXZjcaJ6Y0YCnykYGflxyQJfvAEaMMBQCv/hnX082n6
	 8s3wHbhtz8eSCZ4sbb7ODm/oHor9Rgztu0/hTDylUui6BifGbsRxgSkNKytTDbUzbj
	 Ej5W6J4ikpFVxEKnQQyVjrfyzbeP1naQ6ng2QujDiWD/WGrYaW9erprEdO8o1q9bnD
	 ghSvrjLgFqYHjNbwI7EOLniiwmk2vhYde2B8eFjZQSwgWDilYA0vmDIi3Yf9E/wOBQ
	 QjAjPruUetCBg==
Date: Thu, 21 Aug 2025 19:10:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Message-ID: <20250821-contrite-anguished-3098e847bf8f@spud>
References: <20250821051047.3638978-1-donalds@nvidia.com>
 <20250821051047.3638978-2-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ToW9FfKiv1Hf3JrK"
Content-Disposition: inline
In-Reply-To: <20250821051047.3638978-2-donalds@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_111010_792832_CAF54419 
X-CRM114-Status: UNSURE (   6.79  )
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


--ToW9FfKiv1Hf3JrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ToW9FfKiv1Hf3JrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdg/QAKCRB4tDGHoIJi
0r5eAP0Zi7H3YyCLpeMdEYZeG7CkWWKjGuR+jfMcNRK7sqar0gD/YwgsQHN+pFuo
nzTHksLll+pOzH3rDLm4lkwrCvithg4=
=ApFm
-----END PGP SIGNATURE-----

--ToW9FfKiv1Hf3JrK--

