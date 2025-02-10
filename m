Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957EAC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9/EsN/95mOk5GgUZajh0Z2EPjpc3hcsNGRkohiWLNY=; b=kcQHazSFM/h5sWp5UuWrC4wFmm
	CjrMGolwW3VJ0VmL/ucHfI2J+mCROUZi8AYHClgpAhThf6BIiB9pCv9xcozELmyDXV3NJgTm5ykDb
	2TfgVdkimoY0eTIaSnZy1ACEy+pvM4N/FAs1uvn7WFZYV0aLClLc58fXPKpbLR5FQgpBQiR/f19xl
	S/bwlUkJEBDBCtOI49AfrKTkWpDAximr0hc1iaBsxwg5L/cf/68/8HVnJWhZ9bcnMV6mbTyKpuU8G
	F86KgDYDBl4yeTIv4AZLvzKTZ9OVKpCytdLLVdGtoH0M0cU1S3YFNdEAcRrKtmiE/c/mlrv1/x6DS
	XcnJYi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUxv-00000000AeZ-11xj;
	Mon, 10 Feb 2025 14:40:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUsb-000000009JB-0rUa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C99ADA417F1;
	Mon, 10 Feb 2025 14:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51660C4CEDF;
	Mon, 10 Feb 2025 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739198120;
	bh=vpa9hQ/El4h+MKRpCG/R3weC/8RAuXffKub+TTbKj5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AyiFDHn3p8xazpYaThMd9DbNUsLO28eSLGVOyphoegC1uVrt7fS9sDQEv9C98NX9c
	 gYMW62OSE1L+NHEqkiqWESNgpxkusZxvO49MkG9KOWXjLP2NFH/awwd7sZpOhy0Tb0
	 oFkSJ3gCoGHdgBLD5/DJpCv7EpZ+ASL1YcD6H6TA5cZ00AAgxb+0pHkQdnfpfxu/kN
	 9goJ7FaSDi1Bhl0G3+TNCduVuUuy5Kw4Lx5XS4Cnxt2jMGZUNM6uPeLLGyR479rUo7
	 4EZSotFmuA1tNdw1jc9Cb6ylhWvUIFtZs50G1dF+IEpZJJipu6fwybNw6zKGsXEE1b
	 PUJHPPX1kWhBg==
From: Vinod Koul <vkoul@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Charan Pedumuru <charan.pedumuru@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Durai Manickam KR <durai.manickamkr@microchip.com>
In-Reply-To: <20250203-test-v4-1-a9ec3eded1c7@microchip.com>
References: <20250203-test-v4-1-a9ec3eded1c7@microchip.com>
Subject: Re: [PATCH v4] dt-bindings: dma: convert atmel-dma.txt to YAML
Message-Id: <173919811594.71959.2580959368736151197.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 20:05:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063521_313280_EF86FACD 
X-CRM114-Status: UNSURE (   7.96  )
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


On Mon, 03 Feb 2025 11:48:09 +0530, Charan Pedumuru wrote:
> Add a description, required properties, appropriate compatibles and
> missing properties like clocks and clock-names which are not defined in
> the text binding for all the SoCs that are supported by microchip.
> Update the text binding name `atmel-dma.txt` to
> `atmel,at91sam9g45-dma.yaml` for the files which reference to
> `atmel-dma.txt`. Drop Tudor name from maintainers.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: convert atmel-dma.txt to YAML
      commit: a54ec770396ce2b6e786acde22f4ebed8d1e9555

Best regards,
-- 
~Vinod



