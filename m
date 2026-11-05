Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C83606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MoN2F6zQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+XDdZWS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AaiS4Lhu3Gc12pXmISRStNRQ98+XBetbUVdlh6qdn2I=; b=MoN2F6zQRx5mOUhBlrfwOIZnpL
	I1xRH4iBnyN8+rzoDNEFKOETjRAaG65E/zi4hNOzKpC17Q+lL5tCBfbRFkxbO4qWMZQYTxUeroto7
	qLp1tzzoty8ySN3rxnMWnMuEMLCfb8EkBk4O+8FtoKN40MsA3keryZotOR14abAGVrdzuNcNL4CPL
	q2Ef/3FErjQi8Ii1f4nFU8UA1wIUI2O+r1OmSLNNVGWdrdpqeKpKRsgE3RlVo/YvOizZlf9aWnhXl
	rvxLYmmCQyUBggn0HK8kbMS3W7DkSsZVwnxg74Xt2gK5q0tNmYaLs++/ZfAfv6YW8Clp9Y1Rk9JeW
	MospLDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwUw-00000008vQW-38Yl;
	Thu, 05 Nov 2026 12:23:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwUs-00000008vPc-43TG;
	Thu, 05 Nov 2026 12:23:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF2A61105;
	Thu,  5 Nov 2026 12:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9491F000C1;
	Thu,  5 Nov 2026 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881393;
	bh=AaiS4Lhu3Gc12pXmISRStNRQ98+XBetbUVdlh6qdn2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+XDdZWSeB01xzdwaOgG3108M/kGN83vSH7Ry40EEjvC+GKicYKAkwW91XAjvSZlk
	 5JRslvcVNnIEyl4Sf/XtbNmRvI4d69Q5qDhBHjg/2vTsFaymBRcJFR5OF3xbb7wZK+
	 kc0ZYIpS7oV+iUImBLR9NtioBe8scemTIB9mjZSAM9O9QbuRdhCA6zApbGmdp0n5F6
	 m7yIXTuCvBc8xDRn20AgNvPT/UNwy79JvGCGiu21CXpXI/PKBUQ5dn1A4a+2YO7W6I
	 U09+FKgesD61ti7ug40xWZtrAH6Ke0YY8I2+FCY4Y6ZVpYWaSYyA2trPArpkSxvWZs
	 FteFHx6FP0IeA==
Date: Thu, 5 Nov 2026 13:23:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Enrique =?utf-8?Q?Hern=C3=A1ndez?= Bello <ehbello@gmail.com>
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, dlemoal@kernel.org, 
	iav@iav.lv, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add
 PERST# inactive delay properties
Message-ID: <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
References: <20261104215848.2087944-1-ehbello@gmail.com>
 <20261104215848.2087944-2-ehbello@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261104215848.2087944-2-ehbello@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:58:46PM +0000, Enrique Hern=C3=A1ndez Bello wrot=
e:
> The driver holds PERST# asserted for T_PVPERL (100 ms) before releasing i=
t.
> Endpoints disagree about what they want there: some need longer than the
> default to settle, while others stop answering configuration reads when t=
he
> reset pulse is stretched that far, because PERST# stays asserted for the
> whole wait.
>=20
> Describe two properties so a board can state what its endpoint needs, nam=
ed
> after the ones the Rockchip vendor driver already uses for the dwc-based
> controllers:

Vendor driver does not matter, it is antipattern. Do not mention it here
as reason to do such change.

>=20
>   rockchip,perst-inactive-ms      - the delay used at probe
>   rockchip,s2r-perst-inactive-ms  - the delay used when resuming

No need to repeat the diff.

>=20
> Both are optional and the defaults preserve the current behaviour.
>=20
> Signed-off-by: Enrique Hern=C3=A1ndez Bello <ehbello@gmail.com>
> ---
>  .../bindings/pci/rockchip,rk3399-pcie.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.y=
aml b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
> index 720a5f9..7ac915c 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
> @@ -40,6 +40,21 @@ properties:
>      maxItems: 1
>      description: pre-reset GPIO
> =20
> +  rockchip,perst-inactive-ms:
> +    default: 100
> +    description:
> +      Time PERST# is held asserted before it is released, which is also =
the
> +      width of the reset pulse. The default meets T_PVPERL for a slot th=
at
> +      is powered at the moment PERST# is asserted. Some endpoints need m=
ore
> +      settling time than that, while others stop responding when the pul=
se
> +      is that long. A value of 0 selects the 100 us minimum the PCI Expr=
ess

us or ms?

> +      CEM specification sets for the pulse.

What is the nature of this timing? 100 ms is a lot. Are you sure you are
not describing RC delay (we have bindings for that already)

Best regards,
Krzysztof


