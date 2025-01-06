Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10564E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 23:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2C+piIFBCEMvDxMS2yr7zW+/zN9TQ+BeI1mYmfP1vEs=; b=TrPbwUHe5PXx/UmPPDSV05yKqM
	SWN4GeAcjxGnp9e9bGybYkr4d55KX+iyf5donu8bsVm9JqxIBPf61Z7Rlu+FTFQw7hixflaUJXgwd
	eeJhS/XTX0KOKdEF0VYlwR0VfAPAR6Gnc/+PtjUQibPCQmblru2A6ZsMS5OiIIT3aY/+W3oTnHjfa
	eAvtf4D+9nVDqVjQrj23/hMGYKqUJFwc29xLfDaPpnGdNzSeguPGotF4jIQZc/GExvKiJ1XvXfboq
	zxVmYzQAOrIRi+G6QEhqqap8HiuhBpMZaFAv6Nscu2jT5BW/lzdk95ukegIoGjrb2pHHj3mDwFTaF
	0qXDCvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUws0-00000002yjI-3k6c;
	Mon, 06 Jan 2025 23:50:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwph-00000002yH3-14h9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 23:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B793AA41EFC;
	Mon,  6 Jan 2025 23:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAF2C4CED2;
	Mon,  6 Jan 2025 23:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207308;
	bh=2C+piIFBCEMvDxMS2yr7zW+/zN9TQ+BeI1mYmfP1vEs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rtx9m59D3tlEqhPXfLZPMQObyYKTgR3aEx9acpP8+qa8iMQD9ajlTJbZhf67LhzYY
	 TSFOweT75yjjrArLJ0mbrH7cVyfRJMw0zN9VuDQ7zsgX1x0MGnQb+S7xWZpbQdEAZn
	 316WXcyUofy0A/CtV3/yXJF4oPXkvjJQhP67qND7JzpdDbJoM7bv/GL6KFlQWdioEl
	 4QR1FQBaCF+lgwz4WQSnCNIVqhFmBc8C+15mga9xtxgYtBcpKQJn5EoQNYmJmruiCP
	 bOdylbVTaFpAP2RwcbzeNk4ubawo46pY/A0y0U90p7Qjhy1+yVbGmWA5jDrrrvDAYS
	 kkGUQ5NrYACrg==
Message-ID: <d7440445064e515e7cb517c80a78820c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: st,stm32mp1-rcc: fix reference paths
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 15:48:26 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_154829_359951_613F7ACD 
X-CRM114-Status: UNSURE (   7.87  )
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

Quoting Dario Binacchi (2024-12-31 07:01:40)
> The path of the two files was wrong even at the time they were added.
> Let's fix them so they can be correctly referenced.
>=20
> Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM=
32MP13 SoC")
> Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to =
json-schema")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next

