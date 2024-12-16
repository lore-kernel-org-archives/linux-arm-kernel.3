Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAFAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNPRrVzX6nCcQ9GmNUYUwhNaOVU1omb7V4G6/y5Qd9g=; b=kO2TivqDs/2d3BDN+7OSscSRr4
	7ly2OlyfJsrjmEzSl/ggWCydGquklANcDCFwBf90k7W2seqyiTAJKKwErNHH7eUKD+A9WtopfZpDa
	3fc6gYG8e2r61JCl+k7qJhwUSgAtpptrJr5FzNYglb5VJ/Y8k1z+hHLD4nFXPrGqAUHshtiIU88Ma
	/ETkwBqT9pZG08ZjWnC/Bn1MOcIfra5qfvg5EktWFfaMSlUdLzvi8TP5ssBRjBW7izs+Q3nqKYYJd
	LuEyoVplWmA2D1Nf6NJetftQVkBN94Mw1ssn+/yk6iF7Kzj2Ib5jyAEm5tnOEESJP0YnWE8mqGjcJ
	SCQPEtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7QP-00000009XgB-3GNj;
	Mon, 16 Dec 2024 09:30:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7Oe-00000009XNs-3WTh;
	Mon, 16 Dec 2024 09:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37551A40AB3;
	Mon, 16 Dec 2024 09:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40C0C4CED0;
	Mon, 16 Dec 2024 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734341291;
	bh=zplvDS/JfEKmgoJ/gVJLJ7g8FjSFAlfcgjYGedG7zmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pElc97kdQ16eMIdJ0baZfJlFx+orrh97gDCgqBl4L0z4QnDHvBVE7JHL0IOAUT0g9
	 +bGEXcfrbenR6AFVHKWu90CPoavRiA5G1BH6R8QjWUWOVZKZFcD9MD+HzlIRvnQWIb
	 AK4pipDyVacG/UcT3D8QDTP8u9r6BJ0TYMcm3Ad5pDTEqOXlh+Lr8k/Kv3vgozNWiO
	 dWkxH8QCMTZfsSn5D9PNT2IO3QOembvdsREuETSKOsaPBX5QxhSkrEYD7Isu3cBscX
	 yFiP+ZBhPUktKnF87GMho/D6Dw4WuXgR039vaLugO27/n5PF0jt3xJljlhADiOAH9r
	 JHnn29sWfMZUw==
Date: Mon, 16 Dec 2024 10:28:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: arm: rockchip: Add Firefly ITX-3588J
 board
Message-ID: <x7y24y3bkbj5fzx5pdprjr5umg6egxsy2xscfbj3xgzgzubvdk@ppncjiqoekk7>
References: <20241215032507.4739-1-shimrrashai@gmail.com>
 <20241215032507.4739-4-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241215032507.4739-4-shimrrashai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_012812_948226_548ECFE6 
X-CRM114-Status: UNSURE (   8.55  )
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

On Sat, Dec 14, 2024 at 09:24:55PM -0600, Shimrra Shai wrote:
> Updated DT binding documentation per @Heiko St=C3=BCbner's suggestion, to
> reflect the bipartite nature of the board.
>=20
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20

Order your patches correctly (bindings are always before users), so you
won't receive feedback of undocumented compatibles. See submitting
patches in bindings directory.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


