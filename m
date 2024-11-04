Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2594D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OojBnYfT6ky5Txir7dwbgnJ7YnOMXxtI/5l+8am4S2I=; b=bz/9nYu73pqaI2e9HviyaPlSrg
	7JQ2wMNujthCe6PAbl24cVf2FnebjoTd9yRjQxRaw5fU0V65FazEoS4h2XO/No4S+E41N0+Q+2Ofs
	aldTEKeBB/d1cK0/ZXZvKEOeJq7WsHneJpBBBjn40zI7f7sC0nCd8isNThCFrc35cj7bmjjM0uzD3
	w3+LqVHAjJ0JTsgIiry6+07mL7/6rUwKW5MN4+jTGj4MGPhZMnT0NaMwIpZjwoVtc48br74+ZZmPd
	mOntWlIsBrQXi4WvV5wc4/ggCxmZItqbZYLE11SonVDMrVxjazUpyn/s61NVc3FG7ZikMMokqh8i5
	IXMrxuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Nr-0000000EqOe-0rFg;
	Mon, 04 Nov 2024 19:05:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82MA-0000000EqEF-10TV;
	Mon, 04 Nov 2024 19:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B80CA42889;
	Mon,  4 Nov 2024 19:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D69DC4CED0;
	Mon,  4 Nov 2024 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730746996;
	bh=3r1E4jlJB4SLcbXZTrwJvyUumCnga/Bf9P2eoxkAa1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mr4xnJjNlzjgQEcOHb/8xwXRzqZFAhsVuBIKZ2Clp6ZbOR6fkLm/drcc0ImyQ4ObG
	 N78GCyjslMDBjxJhwyZ28Oqwzp6SGzU+J1TiTkBHbt+Dx4AWUR+wwwDlDuwlAz6o/M
	 nL2u6pT20zkxEejTkM6OWVJfRen0JOHSdrzIgiZ3DqsJlPGLUIBXmrVCNgnF17UYQR
	 IrEpfpclIOPlWZNMEO3NAuYD7ZU8mnGcjPNQFwbQ5EUeqzJZV4CGkNBUHRrtL/wTeD
	 YLirdsTapUiet/BNrNvkuq9J1pzE6qykIXQb8BKL23dQnd5Y0s7PdN0zKnVUYnWv3B
	 qtYPoFpqDn4Ew==
Date: Mon, 4 Nov 2024 19:03:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
Message-ID: <20241104-lend-lark-ab46a268213a@spud>
References: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOrBdxecZKGerwZn"
Content-Disposition: inline
In-Reply-To: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110318_364250_82A3BEC0 
X-CRM114-Status: UNSURE (   9.66  )
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


--XOrBdxecZKGerwZn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 04, 2024 at 05:31:08PM +0200, Ivaylo Ivanov wrote:
> +    soc {

> +        #address-cells = <2>;
> +        #size-cells = <2>;

FWIW, you could drop these two if...

> +        cmu: clock-controller@e0160000 {
> +          compatible = "actions,s900-cmu";
> +          reg = <0x0 0xe0160000 0x0 0x1000>;

...you dropped the 0x0s from here.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--XOrBdxecZKGerwZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykacAAKCRB4tDGHoIJi
0n0GAPkBL2R9XB/l1IMWxiCtryHJhv5Az3c5Ns/wRAlZQqj2eQEA9fvaT5wEeqmS
HYIA2tKZf7xhQTbA+sdSQZ6HO3Qfzws=
=xDDY
-----END PGP SIGNATURE-----

--XOrBdxecZKGerwZn--

