Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ABBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 06:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz+hH1V+WuQ3MIMg5eXD97Fl665gq8f1oJ9WsY5WqKY=; b=ZC8v7dobpcPzEB5OAaPDixO/Mi
	zI+vd+iOI5uTREmTDEmbga0ix8dw/+cs2DoLHIxFuq3yJrTnwJlNeSMCHNcDWRbfy6dsVRg9aj7Gx
	6ROZXZnPuNAV5NjDI5ZUP3On7TK47F+WtMyP1u7ZHjpSwKFQULOVUh6ssT/f1ZNt7+jNbwXQYfrry
	D8bkglezpQj6OfUN3Kb9J6l58UrJIIw1Qn3eeh6BDs17mfM+p+PcGEzcg78+GhWqVfCcjHgxYPQ6b
	Y5vHCGfhyU7UWLuQ7q7LiSgmgz0XeDu22Hp7T/isLAFBMtbln+7z53MPtDZKFvVxoCbVB0trzdFJB
	WVAkgr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkAf-0000000GOYN-3UTW;
	Mon, 21 Jul 2025 06:38:45 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udk8D-0000000GO2d-2INa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 06:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753079767; bh=jz+hH1V+WuQ3MIMg5eXD97Fl665gq8f1oJ9WsY5WqKY=;
	l=924; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=WZFHfjQlx4HKgd2BM0FIUM5RYC68XnMBy2OR0xR57vwiDOgZYekJ6tq/FB0UjBON0
	 PLQ4++6zpKlB4sUL0QySMakvfyngkjfGkrfABMkSlrpSPel68UZgTMkjgS4q+bAJBM
	 +uTB9MORn0ukH0hRFqWbKjhhErSI0sYwtgfdqtN8=
Received: from unknown (HELO ?192.168.1.63?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 15:36:07 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: smn1196@coasia.com
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
	linux-arm-kernel@axis.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
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
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <28c32b2902ea03ad665f36301b6ab665fe7196d9.camel@coasia.com>
Subject: Re: [PATCH 13/16] dt-bindings: arm: Add Axis ARTPEC SoC platform
From: sungmin <smn1196@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, ksk4725@coasia.com, Jesper
 Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,  Ravi Patel <ravi.patel@samsung.com>,
 linux-arm-kernel@axis.com
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha
 Todi <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K S
 <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 15:36:07 +0900
In-Reply-To: <e805be4b-4fe8-42e6-9269-84112a16392f@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-14-ksk4725@coasia.com>
	 <e805be4b-4fe8-42e6-9269-84112a16392f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_233614_247952_9A714904 
X-CRM114-Status: GOOD (  10.81  )
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

2025-07-10 (=EB=AA=A9), 09:15 +0200, Krzysztof Kozlowski:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Ravi Patel <ravi.patel@samsung.com>
> >=20
> > Add device tree bindings for the Axis ARTPEC-8 SoC platform
> > and ARTPEC-8 Grizzly board.
> >=20
> > Also move the existing ARTPEC-6 related bindings from .txt
> > to yaml format.
>=20
> Don't mix conversion with new boards.
The original intention for conversion here is to satisfy the dt-
bindings check warnings.
I will break this patch into 2 patches where 1st will be conversion
from txt to yaml and 2nd will be adding new board.
>=20
> >=20
> > Signed-off-by: sungminpark <smn1196@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
>=20
> Same problems about SoB chain...
Ok, I will update the SoB section in next patches.

Thanks,
sungminpark
>=20
> > ---
>=20
>=20
>=20
> Best regards,
> Krzysztof


