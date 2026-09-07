Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E35C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7+6vonuTo/YtbxMNn6QXoxeFA6rMnEkdHoOHKAsPwg=; b=TbeSyzEkM/pe5fhvXp1Gr1Kdwx
	Ap1CKg84mk1+MsOdLkgVwrszjiZQu/wRdT36DkwYE9qpAHJcb88IpN8IGsSyDUFFzl18QhyZY61r1
	MHydKuValr0N+qRiM7hCNIkvjGHMrB0FxTe9l4nqJw2z2g6zm5Eb4PvHQv6w8mqlIBaFBFa12OphM
	+w2ivb1sYOCNvh8NGwNYKpGwAhWFJlkCjd6wEHq1CFnt47vdY6L+LsCmwb97ZSMLhxjlBVs8DDKv2
	RtDdu7X49XBw8mnxde47nY5Bdx5sPzzGM2lusF/j0yt546EW2XuWlqLyF3W73yAhFocDf7IBC4LIB
	2eyPQXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dEe-00000007Uyk-1OdM;
	Mon, 07 Sep 2026 17:34:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dEc-00000007Uxi-3HTK;
	Mon, 07 Sep 2026 17:34:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A5AB601DE;
	Mon,  7 Sep 2026 17:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1610C1F00AC4;
	Mon,  7 Sep 2026 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802461;
	bh=h7+6vonuTo/YtbxMNn6QXoxeFA6rMnEkdHoOHKAsPwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R4N/as2ZBJAAo3a5nxIodQZ993qPWVf3Zfsb53ragSDHywYnC1pVDxeZvSMYU7HBf
	 xX/eHzeRBhIxCdyqQLrrjiGAGB5K0obTosVd9d3wwvoRRQpYZuTbN3cjKe+vGy1kih
	 hdOPOQQ0gs5ewfRndINWZvjS9WXp/DeChTRXdqwlxomxffOJ1B2Ww5NxFLmR3dMM4t
	 dj2/Wi+h+1VH4QStCiResiIcxMunjIbw+wzJ3rw9mtZANVC+tbUgBdGhbockVwYLJf
	 QaucK6IuTmd1DjbEE40FIRhcu96yD5fiSYhSK6m7uwRvyjxG/4J4QS0h7hJsFlSBVs
	 PMwrpcezJVw2w==
Date: Mon, 7 Sep 2026 18:34:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
Message-ID: <20260907-commute-number-b2648457cf3b@spud>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y9wvMkw8fwCVflBn"
Content-Disposition: inline
In-Reply-To: <20260905153234.133217-2-tanure@linux.com>
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

--Y9wvMkw8fwCVflBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Y9wvMkw8fwCVflBn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap71lwAKCRB4tDGHoIJi
0pcLAP4ng1dRPHZcitmCBSSlCvIQwzxhMkILiN1Uhxcx5OAiGAD8Dk28O/iv7sPo
8wsW+AsDNlaahZW9weiof6Xxs2njpAg=
=6NKD
-----END PGP SIGNATURE-----

--Y9wvMkw8fwCVflBn--

