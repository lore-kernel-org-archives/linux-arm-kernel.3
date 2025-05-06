Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36441C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKDHa0bNqRGou8tssWC4DP+HvyHvliqv34GyV/Vyj6Q=; b=41BaTlZB20wr0BR+SPKzLlH818
	T1rgriGEY+uOhJpvXNDvbszCX9QNqC1PgNIONfyNx0XNHY/g2kbQxJq5LGSaTggeXxCS2TqXE+7Ij
	PQm5aekptt3lZ8h1s117myE8k/KA4z1YMyAIs68+WrNwwm/OSpywweJt1dNQkQ7gRPLmkUoB2sOP5
	BZb9JjAyOaRO2KzXychRMMKSa0dvmRI6eqsqIYGtqyU8f6p/l4R9rhIbWmxDsrtkMNNPiK0mN+27n
	Xszxxnc3uY4/9A5h/FGMGzgayO9b8NVfWTX8V4YIuWJjF7KsFRUALsqG5mN7Az/SmcHGQozkU4od5
	RPDQE1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbR-0000000Dw3Y-2Esb;
	Wed, 07 May 2025 02:33:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPd8-0000000DQ1U-3sP4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A8F243D4F;
	Tue,  6 May 2025 21:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F4CC4CEE4;
	Tue,  6 May 2025 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746566109;
	bh=UKDHa0bNqRGou8tssWC4DP+HvyHvliqv34GyV/Vyj6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lf5pmecR/+hvX5yBph9kRNqb/T/VN8CvscGLViGx20XpFvd204wWNIweCzGnFEs7f
	 gbZ6Zh6B+ppM9NxyAehlXoYUbgdwThSzR33NLcZ6BEjaucB+2pvrXKSzvJFXYMFmW4
	 M8RUbVPcZ2tUXBVtJpZTo7gglW50EsQemQ3SbHEe1dB/tR0tI3mdx/NpqykILiREKI
	 D9n4KPuaBOav/Z4u7kt0SUA1UGz+x+RSFWeiqJSnHklfESqK1prvR9cmjN0A/YgErX
	 Qcio5j9h/damgAm/3SD0UtpCcDyYgN7R9jVnalDF46wyj7JHPEYMM+PDKGR9u8mJjk
	 zC8IdijU1AcLg==
Message-ID: <673e96e58a1f5043c7a073b8f971d29c@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250505161933.1432791-1-robh@kernel.org>
References: <20250505161933.1432791-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Tue, 06 May 2025 14:15:07 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_141510_984252_CC049ED3 
X-CRM114-Status: UNSURE (   5.82  )
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

Quoting Rob Herring (Arm) (2025-05-05 09:19:32)
> The binding is already covered by st,stm32-rcc.yaml.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

