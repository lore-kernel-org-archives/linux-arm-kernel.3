Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F755C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEUrM8x3sX0nMe6PzqR3wBKzu+FAH+7Z0tCazYHvPJI=; b=WyA1Yt+QEPDxm3Wfmo7dWcOf5F
	yt5L71t8zmdMqBYfs+bS4fKJn88VmPpZAaxeOD2/pNWKCdqu5isotg4h0cbM8txg255Bcq7WyrTVQ
	Xrolwv3d9ONO4UKMH3nfNLXB/bM0hNeNB+XR5LzkNolh5I+5wvhThHS8uEVdC3p49bfCHR3inNEye
	a5sOleneOTTiSym+1iBBW5x1rv4/qXO9jhWNJvQk9gy4skj5VNKcmHZZi5f2GDZhU7j7SYyP7srEH
	7f6tStHcPTppsdbY5DkD1xqQ03i0uCXSbOGRrSL9Vs2ILC0DnsVa1ZnYi3HW3kh8yimvBR3/rETIy
	gD/7ht9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfX4E-000000068Jp-0VbO;
	Fri, 03 Jul 2026 06:08:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfX4D-000000068Jj-0owd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:08:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A73F5436A3;
	Fri,  3 Jul 2026 06:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505DD1F000E9;
	Fri,  3 Jul 2026 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783058880;
	bh=mEUrM8x3sX0nMe6PzqR3wBKzu+FAH+7Z0tCazYHvPJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M7SMh9pL5doMGKIm/4H0MQ+2m5BYfS/1JNlz0g0NWquKsb0CH/F8vbM8DkYEv6Yim
	 NfV8SZtjCR5ysa/WNF7wjCB44//ZNuhCO+X/vSzFb9j0XWHEqsfPqVMDs23+/oSV21
	 euAxPPd5+h5VfaiFCUgM7eIPDmA/zA9mtimCV5LP1X6OF4qcYqNGEL/RgMWwfzArbK
	 vYxt5kRT7FNEvpdz4ktckdQEHWgtIoOwyv88nYeKV8pTV8yvk5PLn8d6CVMtEFUJei
	 UnTIRGpd7X2Gu65O1J8B6uY7njmX+9oUPpjNMl5H8o6FFyfDChtw4DT+PsrpyrQL84
	 RxNBhVEtx5g4A==
Date: Fri, 3 Jul 2026 08:07:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/12] dt-bindings: soc: zte: Add zx297520v3 matrix
 clock and reset bindings
Message-ID: <20260703-cheerful-salmon-of-agility-1ed1f1@quoll>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-2-377b704f80c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260702-zx29clk-v6-2-377b704f80c4@gmail.com>
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

On Thu, Jul 02, 2026 at 11:27:57PM +0300, Stefan D=C3=B6singer wrote:
> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> A simple MFD driver will instantiate independent clock, reset and hwlock
> drivers.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> Changes
> v5->v6:
> Add syscon compatible - Conor suggested this after v4 and I forgot it in =
v5.

Please explain why. syscon has meaning in bindings, so if this is not
accessed outside, then it is not a syscon.

Best regards,
Krzysztof


