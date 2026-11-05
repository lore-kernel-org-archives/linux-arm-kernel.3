Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C8606AB17
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U1WAVoHf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yckc27hE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rD8RmJQMPrsB8PneNmgZfAY2EXizpS1GrqOCM57L41Q=; b=U1WAVoHfOrMa+ZgcfUwYLUovH3
	wW8I5z5iQ7O6xSjTGHjnpFOGh4hDDCuVS4Ozd3Cqyk0Hjg2vH5ldXLBOoFDNv20MlXkwN3sOBTxDb
	K8B+az+mC+FZTi0R7YNXeMXrUVCSG5IOhjo1FNL2mw3zh0ATQyzD3KjclPdiG7zTCjGd2qlBMLKf/
	tGbNt8EtxRVm0C16wHAQBTJ9qthFr0zi18ZkgNglqFzTIA5wlpiyhnoqAlM8Bm4gWcx1ICJuU/EVh
	BA3jQUDYfdSMfeEknQTOW4J+rWEvSQtG88ecEFKDMi1j5calItbC8G2ow7croFPevWJ+gbs/h8hu0
	px7AHepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw0v-00000008mDi-0uSj;
	Thu, 05 Nov 2026 11:52:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw0t-00000008mDY-1wk1;
	Thu, 05 Nov 2026 11:52:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29C0040820;
	Thu,  5 Nov 2026 11:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BAF1F00A1E;
	Thu,  5 Nov 2026 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879535;
	bh=rD8RmJQMPrsB8PneNmgZfAY2EXizpS1GrqOCM57L41Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yckc27hEL9olUgu869FUQCQ9mLJcNnti/uo61805ZdIL9ud0XP4WrNlW6ZRhmCsDU
	 E7fI3BMRFZxKzMWFrz+MqsJAfTvE+aKYY5tG5+ThqSlFGqfjKbOoPNLncfPdVPHJ70
	 Ll+YnrbD8Dm8KML02lcJH8mGPCH2dXuHorKsjB9C3dD0T6FtRy62uddEWYBIphwU40
	 KCkJuhBECKiW03R5p2mjrlrEa+zWGIRsSYxHg63jVlYW8LYxmMOYcJfRN2Vo8mltbg
	 3VLOZgxgcY+uqNvRDVWTZDpcVtoQpc3u89DhK20bBDTKf3NoJJE1pGgjyXAWRTJk6F
	 0FGz6ZspxCuzg==
Date: Thu, 5 Nov 2026 12:52:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang =?utf-8?B?KOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>, 
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261105-kind-macaque-of-enhancement-ee0365@quoll>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
 <20261105011751.4058411-2-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105011751.4058411-2-hongliang.yang@cixtech.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 01:17:59AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, a multi-port
> SuperSpeedPlus PHY supporting up to two USB3 lanes. The PHY block
> drives both lanes and all consumers share the same initialization
> sequence, so the PHY provider node itself is referenced with a
> single #phy-cells =3D <0> specifier.

So previously you had two phys, now you have only one. Confusing. Where
did the second phy go?

>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Same issue as last time.

Best regards,
Krzysztof


