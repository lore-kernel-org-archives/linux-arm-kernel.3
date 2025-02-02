Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC6C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9qcRsr2BxIoNxKgQ/6L+t7eeauOwyp3Y4FXjhnpts8=; b=Bq8mUuUxMY2D6nUuPkVze9BSGg
	+2pRxKvt3Ot68LTtFmnn3GWgEp6TzTSgvmWiGzmj9SVjR4A4gfVOBfsiOf7LO/09CWOVUu3C3G7iK
	ZTWmw6I7//CLfHX3CG+PQmkPKd4JH0bhD3e6yHpopHzb7lj+wmITP4ewpIjcBPBSa4AGrlL/FhDoO
	bnwfQS/SD6Pi7FFi9ExCqSDsFvVbyywETUl7d0CYtEUdd5XRMrBaZgRtlX1PvG565vHsW9aXBMRBx
	+3Z3pKREgIT4f1eFNAdg01u2eJ1clL70Jc4hr7C2AqlQIGBnZ6QQJt1OtHVnfKfHketMpz9V3jyfa
	pdQDDz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teaRp-0000000DpaY-1XiA;
	Sun, 02 Feb 2025 13:55:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaQU-0000000DpQL-3ve2;
	Sun, 02 Feb 2025 13:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B215CA40BDF;
	Sun,  2 Feb 2025 13:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BF1C4CEE3;
	Sun,  2 Feb 2025 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504457;
	bh=NJbQEhdRphOevzblAXb4WZu9Pe0ok04Io7JS0PPxMrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaWYKT5gxQMaF1jyfn5v7U6RcVb15LvzykdzWu7X4te/Yy66zmvzKM1+XC9SjQhxQ
	 GJaWcVPvqivyxwE9A886vlFOyEFlFA7RAcp3EWaYNlAsGQkYeCJ5bp65T6hEP/9VeN
	 zyDqNtv62Pz8S2zm2mnDA3tusFDPIUij8ofPOQB/6ax81D3QuUDgZklny1Ekr7KUvx
	 A6OaSyzY9O64ZNc3b1RjtO7vs57RIX3dh+WkY5+RDHGtwDwRmh5fgL/D/sbf1Zh5HI
	 62ArNwJyV1hOgeJU9rB4z3UJVCW4sCtyrSpvWxVhJ9ogTGAtDvCDphdHLNyKBloosS
	 oINuBc5jNPo2g==
Date: Sun, 2 Feb 2025 14:54:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, 
	Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
Message-ID: <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250201193044.28856-2-funderscore@postmarketos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_055419_039740_A29B681E 
X-CRM114-Status: UNSURE (   8.62  )
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

On Sat, Feb 01, 2025 at 07:30:43PM +0000, Ferass El Hafidi wrote:
> From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
>=20
> Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
> xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
> few minor differences.
>=20
> Signed-off-by: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>

Please run checkpatch. You have from/SoB mismatch.


> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Best regards,
Krzysztof


