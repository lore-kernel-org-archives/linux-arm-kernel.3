Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26351C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGvE3+M4u43M1SZQpAfJA3EfRI6JozazVv+5YhQ9wt0=; b=3BWgqQUrt6QCez6MedbOg/5bOE
	nwHewb8CIMXEP3U2F6P3B77348R/KbK0VpJL4CUtjIOEOOjxaEQvB9OEtxzrEZfaCSCrao/9YHKfX
	agH1irIZRVTlUKvHXskWDQEUWAjrRu1d38oaisxTnh2cq/cL+a7DP08F6X3Aoo8fuSoqay0esaRdA
	b9baTQlucMEzXSKRLjrL9zGKSzoGeB9NiAkYyMc2pgNiWCZR6C3l+IK9jU4BRo0+VRFJjGqQIV5hO
	zz+DYkC4wbzt3DKPkyiCS0S5kszSfOjrVwpkAqHJ9/v1sRkaKDPzU/y64VyFJpuLfcflOSr7vo6CT
	EOnTSFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVPH-0000000BfqY-1Z8R;
	Wed, 22 Jul 2026 11:46:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVPE-0000000Bfq8-2myY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784720785;
	bh=nGvE3+M4u43M1SZQpAfJA3EfRI6JozazVv+5YhQ9wt0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gOcSr6C3tjWVfaZA3tml4aiqNrprIE3MYqA2EGVKAd1xgO3G+530/9cspGms1beWJ
	 F9IVfyh5udQNuBsRR+TPwe2th7ay3oX3KpIlhqU19VBhTgUQWwGYpHQ9DiLJwVm/j4
	 gGwKxjklw35Xp/vw0KZ/9OF3GhUCnDhJrcx1maKji14u3wifbiOBkk5UiLm+kIoQvX
	 BKZSY3ffjkZHNsGG9+p6cEam2xQK5XpaUL262GE/+v0VdIGzGTGjot+VIX6zKLCcLi
	 +vg561piDz7O7A/UQnf09b19wer4yOabsZyTC8DwLHIFMnfavMjeQ8ecbe8jiezgD4
	 Ccv2T8G6h1hqA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6E977662E1;
	Wed, 22 Jul 2026 19:46:24 +0800 (AWST)
Message-ID: <8a75ad0ae44f1231fd75be6a617962a4d2c58e7f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:16:24 +0930
In-Reply-To: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_044632_917950_2A1EAB4C 
X-CRM114-Status: UNSURE (   7.72  )
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

Apologies for the delay in getting to this series.

On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> Summary:
> Add linux device tree entry related to Meta(Facebook) ventura2.
> specific devices connected to BMC(AST2600) SoC.
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>=20
...
> Kyle Hsieh (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: aspeed: add Meta ventura=
2 board
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: ventura2: Add Meta ventu=
ra2 BMC

The two changes don't apply cleanly against bmc/linux.git
aspeed/arm/dt. Can you please rebase them so that they do?

Andrew

