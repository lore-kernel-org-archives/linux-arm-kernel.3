Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A571ACCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54FTAKHIcGVENuiw11l7Sv+5PeP644opcRULdrdTj1c=; b=yzXRY6tbYXE11dNPmSgFyCEgw0
	yP1nhJVgi4SrnnisuTAx24AFhbMvJhYwuK3Ty0NRhLrxMHdl49OafYdp6nE0nvuOSEc/jqQp6Da7y
	iRB+q/lwZqwcg4AxZtwlgX5tacD1gWHztml92D4U9+WBn+JHiioppaLlvqlkP1oyWVihBkebt2kRl
	w5/bTdDfIYp3xXP/HWtTt993S0qKlxGy730J/hZZMBW3g0VzqKhMvsuJEBFKfcnTtLt+wwKwJUk6M
	wtUvCZ4yYPxzFu8UuCjeLXFgJCZpYtLKMlO2ydaRW/5zsd4YLhT/NcqpwHIWIKJSmiWCneUTNz8Ck
	GS1kTszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mdf-0000000D6si-4430;
	Fri, 03 Oct 2025 20:44:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mde-0000000D6sc-3Y1G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C612605A1;
	Fri,  3 Oct 2025 20:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419BDC4CEF5;
	Fri,  3 Oct 2025 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759524265;
	bh=54FTAKHIcGVENuiw11l7Sv+5PeP644opcRULdrdTj1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7q2LwPNDbXvjHjRnXvx36WeZNGTODIuolwlQo5Dqt2rxOMq9O5AGLC1dVo6RgxHO
	 QuzChuBQrxbsV5sWYgWgYF/uKW7caIwbg1qMB9pCIGJ6w2D+koTs/BqtT7aNKzgJfQ
	 6itLFtDVrsGLd8C7PYftNHLNuOrqF5dJB1TcUqX87MuURgsK48K7jZbUTYeqIxPPZW
	 0MSxlCWxe4mOT0umGkVzgzH5N/4BtwrKcXx3ZogEUl4CGFCHu9uFcVUAXQh8LaIbfp
	 Q8DPvR1mZ/MrhjnLRAIuYuwkApF55a9ueDibizajlb/R1E8Pff6BeJl2O/+X48BaLx
	 NfJvR+sDLmu1w==
Date: Fri, 3 Oct 2025 21:44:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org, adrian.hunter@intel.com,
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Add support for BCM72116 and
 BCM74371 SD host controller
Message-ID: <20251003-appliance-unbend-6b74b95545cf@spud>
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
 <20251002210426.2490368-2-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ielvYfLA4/Su2iIO"
Content-Disposition: inline
In-Reply-To: <20251002210426.2490368-2-kamal.dasu@broadcom.com>
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


--ielvYfLA4/Su2iIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ielvYfLA4/Su2iIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOA1oAAKCRB4tDGHoIJi
0h9aAQCCTsMeWOs+cV7oDBxvmtOM2qgehIwmpGL2CnnAXKRk7QEArXDstpWr8c8G
WasCUqneltZCOUzT1SsXj20X9q1DzQY=
=MZV4
-----END PGP SIGNATURE-----

--ielvYfLA4/Su2iIO--

