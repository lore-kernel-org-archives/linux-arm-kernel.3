Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D6AC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgnLbbDsz4HQmQCmQhtR9GGT2j7K0do7fmhsJaorGvo=; b=Uim186005M5XU64z4wmmsTteLB
	RytpdX2a5FzTjQ1236E4D7uhPI8z0mboV8mmU2WHFu2jeRdGVarHUDqr4e+T5ei69XnDnXrnIBObL
	GoANngyvY/ncC10uLGxRrUaPZrxoiwLTVH97VK0DLDZlmD1cbn3hB/zOKN/+UjVAegdrOISJNjQ3t
	gPU5obV4Lfmp+RU5202JeUh22utARUj8zIyWckzZsoIXe9f7OliGr+wkLpqSFPvKskz3e8+sKI9x+
	FvQrF7bcUnqqZ5+GuvqJs21QX163F/UvkBk4psVCxtCMV9sDuXG7my2Hzl8ybODGoSj6J5ECxIntf
	4cdDOHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiEI-0000000GAj6-2pBv;
	Mon, 21 Jul 2025 04:34:22 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiBq-0000000GAPJ-2D78
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072304; bh=bgnLbbDsz4HQmQCmQhtR9GGT2j7K0do7fmhsJaorGvo=;
	l=915; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=JlqRXQCymNdkc80PVNqFxOjSe2TMmviAP4a+FPHsJf3covGIC1bEOTi70paDJe3si
	 BvTkCAIQnuDm67kUIQ0r895XSWqjvDjRbik4kckPXye5s7NONfKetqGV2dEBsA0Zm2
	 Xq/5TmrFPjvq/I+wTpeLv4U9Bj4pGT9LNo/ZR4ZY=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:31:44 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: hgkim05@coasia.com
X-Original-RCPTTO: krzk@kernel.org,
	ksk4725@coasia.com,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <5bf8677f0779e06092f912a92a8e63225a4fe627.camel@coasia.com>
Subject: Re: [PATCH 01/16] dt-bindings: clock: Add CMU bindings definitions
 for ARTPEC-8 platform
From: Hakyeong Kim <hgkim05@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, ksk4725@coasia.com, Jesper
 Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,  Ravi Patel <ravi.patel@samsung.com>,
 SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, Pankaj
 Dubey <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
 Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>,
 Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang
 <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@axis.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:31:44 +0900
In-Reply-To: <cd5c268b-1340-4d66-9b08-75e2b7efd241@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-2-ksk4725@coasia.com>
	 <cd5c268b-1340-4d66-9b08-75e2b7efd241@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_213151_111663_0963B878 
X-CRM114-Status: GOOD (  12.11  )
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

On Thu, 2025-07-10 at 09:07 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Ravi Patel <ravi.patel@samsung.com>
> >=20
> > Add device tree clock definitions constants for ARTPEC-8 platform.
> > ARTPEC-8 platform has separate instances for each particular CMU.
> > So clock IDs in this bindings header also start from 1 for each CMU
> > block.
> >=20
> > Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > ---
> > =C2=A0include/dt-bindings/clock/axis,artpec8-clk.h | 122
> > +++++++++++++++++++
> > =C2=A01 file changed, 122 insertions(+)
> > =C2=A0create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h
>=20
> This is not a separate commit, squash with bindings.

Ok, I will merge patch 01 and 02 into single patch.

Thanks,
Hakyeong Kim

>=20
> Best regards,
> Krzysztof


