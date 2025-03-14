Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A16C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 01:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ikqSiSlGwOzvec8d70BbsPKNMTnuEBZruFoscFMeGU=; b=UrJe38jsgAsjjyypPpCRd8fkqj
	VIHnEURcX1LO8RJN68sT2OG/RGEHKm8WBLsvhXwWt/Q/NWi3+yxxsawvFHwQn7JXelaeynfEw+Pt+
	XbkmN3rx8NOu4bzRpWXGuqUQ+47STe13r0tl4IEWSux6HeEqrL9ceRK5Doac7uQHYlf9JAn/7DpnL
	sR/tDKXcY+Iwo+6gHD6luJ9NbrpOTmpazC30alZ0k6fLocPzmAbCC6ROaZGxWHRT8ENi5hTQg/iR3
	XMwajCiSxUNhWiK4Z8XdIBh8GoWj592wCpeUqAgexnqj+3GPKVk8N979jsSZFsn/F1CjUdAs5Y/jz
	/OoEqhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstSm-0000000Cqwm-0b9B;
	Fri, 14 Mar 2025 01:03:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tstR6-0000000Cqr8-42kv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 01:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DF835C5F23;
	Fri, 14 Mar 2025 00:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72D2C4CEDD;
	Fri, 14 Mar 2025 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741914124;
	bh=0ikqSiSlGwOzvec8d70BbsPKNMTnuEBZruFoscFMeGU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SvOew5P9h5BbxX9vImKhATnabBrm8ydaXSCGPbC6igFiBFS4PNT8fh9iExjljGXV7
	 HN8tr5/PZNINhS1xJXslNzzqdWc9fI78PiDymyFZ8LwGNm2E9iBFP12qh/iEu6eB2O
	 0g8sAS0Dxm8sUzoLt8+fIhqPQpweysNFThto6SdifyU1HUieUk58Vo+YSTZBvIg5vn
	 SUGJQH39jYAOqq/WicXjMa2Djs4cVD/fx1qATklMwLZTRjVc/vTTnO3Q2zha+y0gwG
	 Nx6BqLrxIiRcp2JdwCwMokzQf0NaZkw+GY4gqB05uvuo0kOlSZFDhdWTaKc76Cvexm
	 5QjVi/Qy0K3OQ==
Message-ID: <da70e2f173b056154d906056469e13f9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
References: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org
Date: Thu, 13 Mar 2025 18:02:01 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_180205_043713_4DBD830D 
X-CRM114-Status: UNSURE (   5.59  )
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

Quoting Wolfram Sang (2025-02-13 01:26:34)
> The driver support more SoCs. Add the missing ones.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to clk-next

