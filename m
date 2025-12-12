Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77248D4336E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3pW4njVf1DUpv0AFx57ijZPSUyXI5jespOKEgn3hvY=; b=0gF4avdpeWTGZbxvsxqg5hJzA6
	/J+IjmpYNdbwru2yx5qi4SLSUpUgsAz36lWQz4fd++g0CLzRtcE9NSDDp+HF89Jk7VQQrGHgCKGDz
	2c/UqiTMh791bj/AHDsGQrkvY8h9ub8cAB7i9YC/DzBL5Dl4sdfYDvfv4g/aprxBKkXJRe4Cg/VGc
	vYP2h97jXU2hNdqcE1UTEkDOIOhAFCy+kRxVjFRrv6F4zvxR1wSoBQ0ybq5rBji56DUoQRFBx5byP
	xKx6lAVEvkxv6tImbAvCsbA6KYqibvL5/j6oFbPNldHUMT/GAoQG6gf/4Q+QqnzTj+eIPJOsueiFY
	/TII/atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTw9Q-000000007yA-1vet;
	Fri, 12 Dec 2025 05:57:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTw9N-000000007xN-43fS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 05:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765519027;
	bh=k3pW4njVf1DUpv0AFx57ijZPSUyXI5jespOKEgn3hvY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J3PD6WTSf8ekEK5MjBN+upm8g4s4rxm4k5z12zKFqA3ek+bxXzUyS4c8MaMHvGQs0
	 G7DZqoCiA/YiML1XqCti6IxKmPt6L9akwKyHcdyzAGc1Ckfx4So0mSxZA8A9YSXF1r
	 aaCwi6OEDqZaMMEqZ/gaJ33dlBWwqctViCtVIvZnhGXJprkwX6HBbt+rIjxDHfSqYf
	 vxzaBexN5e+/qOhGZpeCU5BBosCif4uiy9AtK8ol5IToyDQb9LqIpjzriOnGpUeomn
	 9VorrpZqA3guKZtNmyXxFRFVnidHO+H91NjRfVkHTcHJlxM+h73KXkc00k8mmTdqQT
	 5zkLVYbcg/ZEw==
Received: from [10.200.3.67] (fs96f9c361.tkyc007.ap.nuro.jp [150.249.195.97])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2935264DF1;
	Fri, 12 Dec 2025 13:57:02 +0800 (AWST)
Message-ID: <b31b9876a981f782ea9481402a4c9041cfef748a.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 16/16] dt-bindings: mfd: Document smp-memram node
 for AST2600 SCU
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-crypto@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-mmc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, 	devicetree@vger.kernel.org, Linus Walleij
 <linusw@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>
Date: Fri, 12 Dec 2025 14:57:01 +0900
In-Reply-To: <176546866713.1487167.4918701456595372928.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
	 <176546866713.1487167.4918701456595372928.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_215710_225708_E69DB14C 
X-CRM114-Status: GOOD (  10.17  )
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

On Thu, 2025-12-11 at 09:57 -0600, Rob Herring (Arm) wrote:
>=20
> On Thu, 11 Dec 2025 17:45:58 +0900, Andrew Jeffery wrote:
> > The platform initialisation code for the AST2600 implements the custom
> > SMP bringup protocol, and searches for the relevant compatible. As a
> > consequence, define the requisite node and the compatible string, which
> > in-turn tidies up the dtb check results.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0.../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=C2=A0=C2=A0=
=C2=A0 | 18 ++++++++++++++++++
> > =C2=A01 file changed, 18 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml:140:16: [=
error] string value is redundantly quoted with any quotes (quoted-strings)

Bah, didn't update dt-validate prior to testing the series. Done so now
and have fixed the issue.

Andrew

