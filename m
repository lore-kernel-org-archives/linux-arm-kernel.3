Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B886CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBDEY71A7aCboQvqZmdLZCfK9+flfFgYZqgP3Td8iQw=; b=WsUFdLqbXr+59EZ2uWB0tS8lMK
	KdM7V6zEFe/HpEDxMOInwZudPjM3uFWtGMq81U1hQTE9xvmgTCu2m5D01OSp3PgbIyxw7gDUiLAyu
	DdZdsImKTBSy1PkiQ/FNwk96q2JmhYo/j4u3QhdXn3qK0G+OlsYUObAjnjGkkYstrGwO+d+B0olZi
	yLBUaCxmx/+Kh0P09C1D7qf91wQ8497eUftisTLmqfOet1hM5n4Uck7iY2HWJPyiVPVOP0YkEQQch
	q+ovcaOBRVx4Tdf2STto4TVVTDi0huXzfNmWiJrbe9vDvgt+D/PCG2DI8FNCRv7GFTtItRQTjzvgQ
	YK/jj0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH0v-00000007WQI-3417;
	Wed, 10 Jun 2026 11:22:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH0s-00000007WPi-2eVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781090544;
	bh=aBDEY71A7aCboQvqZmdLZCfK9+flfFgYZqgP3Td8iQw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LVch8VCH0zomK1nWEJ90cjd/By0E1ewlQ5r2fkj526WecOoevRMgO1i6dynMrgDSC
	 CMKfHYRsoLGH5A6+q/WeH4LpdgVjogq8E6BWaft5NDo8vMO5YB6DxQO+BFizdyoToY
	 +SnQjofpJeFRyril0GtxrqlER1F89XaqcmaC9W/+RyoGBFHJTtxx+SlGRCPRSHzBFE
	 lZjas42RoA5evv+8gaWjzM0IN+KYkV3pni3kb+J09X1dg5bJ+pPZZhvIZL//ZHpRHW
	 MxUFftFZQ3jez5zOGwZ3jnQ1sIoaP7BCTa8OzmYR/Ed6kNmaWIydKoW1s2SogFhFR4
	 IkdElg6fpkrLg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EFA2C60A14;
	Wed, 10 Jun 2026 19:22:23 +0800 (AWST)
Message-ID: <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 20:52:23 +0930
In-Reply-To: <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
	 <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_042226_863191_22FA6EFE 
X-CRM114-Status: UNSURE (   7.80  )
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

Hi Kyle,

On Wed, 2026-06-10 at 09:22 +0800, Kyle Hsieh wrote:
> Add linux device tree entry related to the Meta(Facebook) rmc-node.
> The system uses an AT2600 BMC.
> This node is named "ventura2".
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>

I have some comments on v5 that are applicable here too.

https://lore.kernel.org/all/3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@=
codeconstruct.com.au/

Andrew

