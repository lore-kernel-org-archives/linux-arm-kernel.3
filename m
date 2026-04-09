Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8966BF31E3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgHNWQIVNQLVnmYjQa3phpy4f8LkLj4MRmL9b19wYtI=; b=qyrunpZ8nKJ09AJsyhJn1QbC18
	gna0o6Y8lDTk3Br0YaOC9fDnC61t5MpyNyltBirw5zH+PjYYAwGIfvYWZyLwqHNSAIQfD2JedQYGc
	+9wbMcb5utKSQnYb5EeqpErQaJqzAAHDwEsynqqWIg43BMvgN60HQa1vvAWHn7xajYEtugYxaulQ9
	JIDscsDFDXR6oAop7tJdLAihO0Idt6q4yNLh9hFx+KK5j49/6mA2MonNYtOZ0m0fMQgtOgg2HW5uG
	CYkvFbueiJU4VVAClt2Nn9mtjrPlYbXevqzO5RzVVOF7GqNIdCVaHlMeMsFJag0aal9eTj159SQmF
	t6/qDnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArQu-0000000AoF6-31Rz;
	Thu, 09 Apr 2026 15:36:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArQs-0000000AoEM-1hOL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:36:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7DA64028B;
	Thu,  9 Apr 2026 15:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66950C4CEF7;
	Thu,  9 Apr 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748997;
	bh=vgHNWQIVNQLVnmYjQa3phpy4f8LkLj4MRmL9b19wYtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bl3HTEr+tRTCJMBfshW+D0LvT7+dVBTWHSVRPqwJg4GWRC1ZuqXeKWilLsfJAMsVk
	 NUN6t6sZeE1thBJbl2Kginnj0r/IxSLfPBkGtNKz9xYtpkPnUmtg2PB/qAtbv65/+9
	 3f2gf4qZaxr+kAIAi9OMoZtmY57x2HwVvNaRq8P7WgjnvgxhCPB/kki6hiGBz6Ol6w
	 lNP7TugPcnxA3T/T8vVT4NgWa3QzQUbN7s/bQ60y5NIMktwnD75TYzHUcZP/V3rg9j
	 W0J2hPaCl2AS/366YMN9Rlt1mtLsbQMqM0pg242CnTRb2Rku/de2xP6IPIeCLF+tYL
	 cC7KtRAboBOJQ==
Date: Thu, 9 Apr 2026 16:36:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 board
Message-ID: <20260409-foster-stability-f77b38c6f7a0@spud>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="94RiNPJk8aF+VXXp"
Content-Disposition: inline
In-Reply-To: <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_083638_463034_4AA31C0F 
X-CRM114-Status: UNSURE (   8.18  )
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


--94RiNPJk8aF+VXXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> Document Anacapa BMC EVT1 and EVT2 compatibles.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--94RiNPJk8aF+VXXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadfHgAAKCRB4tDGHoIJi
0lTBAQD3cz6MzoGwGp8mKC6FkE8r1DyqVtkBVRvjGhBwfipPqAEA62JE9BQgRbH1
0Zd5rQtyVO3BwX5MMW3LwT1FMuJtPwI=
=AvG8
-----END PGP SIGNATURE-----

--94RiNPJk8aF+VXXp--

