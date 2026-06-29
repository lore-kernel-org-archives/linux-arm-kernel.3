Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13606C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItAKP20RI9esoGeDHxr1WJWirGiHqPYpMiHn1uOiiOg=; b=y8wOQ8qzuul5GU+VUjM22engDl
	fffeUMjrGMY08xGLw5DQSJE9cAhH8D/AT8NyBlQcA1ho1bOktl7EOOnSLiY3IRXMgfQKM7w+2/7Au
	Y6mSPq5yrsqsexVe7AbXNwsPLuUd7MelzOGW3COe4wovV7QyQXbh3r6lMUAo2ZKG8ehrUS7/0FnjI
	8rvLpuv5DbqsdOJmB50lvUaQ9L0e9C9AiJ7AxQXd/MPTf6gnbpSjUD6pxhMWZJxuCsT6Cfua6MUQr
	f+Fkx+j5ogxNik3N+PvdlGFte6qmJaVcGm4dTG5IvlKhemfmMZ7ZbfIE19t+bvC8aH1QkE/GGjGO+
	S1qOAXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8w2-0000000EJ8e-0ARS;
	Mon, 29 Jun 2026 10:09:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8vz-0000000EJ7t-0y0l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9FA42E10;
	Mon, 29 Jun 2026 10:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131491F00A3A;
	Mon, 29 Jun 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727786;
	bh=ItAKP20RI9esoGeDHxr1WJWirGiHqPYpMiHn1uOiiOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GFOExlZGfw+UGyuouh6jCtu5d0nOCvSFpS4h8RSDP0p9zK9pKYvbVB2O8q5kxRIAJ
	 fKofkt07rM36nwcdthvDLbGyHCrGFr7dxOw8jAFgf49eaYaO7/5CLIjVtrc0oCUtdk
	 I88SDoAOyye5S0+9W27ng1FWVhS3hGaKU1wJvhjLda+xXBBHH98V26A81YaUVYs7y3
	 JSHL8V1ptbkUDEhInm4w4Nzpy94lno5ngYd8Dsgmgrw4Een33BoOG0XTzhZFTQHNP0
	 RZofR3PQANUEG3wV14u5NamqUiS/7TpHm9SB6gqXUacA6JGZv9lVzYYDYOykdF4fWG
	 UJt1PXyujqyVg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Lukas Timmermann <linux@timmermann.space>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Marquet <tb@a-marquet.fr>
In-Reply-To: <20260614-manta-bluetooth-v2-1-52de06cabf9d@timmermann.space>
References: <20260614-manta-bluetooth-v2-1-52de06cabf9d@timmermann.space>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add bluetooth support to manta
Message-Id: <178272778358.113362.3049339184584034398.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Sun, 14 Jun 2026 22:16:35 +0200, Lukas Timmermann wrote:
> Enable the bcm4330-bt device for manta boards on serial0.
> Also adds the necessary pin definitions and interrupt handling for
> wakeup.

Applied, thanks!

[1/1] ARM: dts: exynos: Add bluetooth support to manta
      https://git.kernel.org/krzk/linux/c/718b15471c2b13a4830e80efbb489c2a849060d1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


