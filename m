Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9155CD6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS31F9JNh91PoOVQoiqXN/QhKMilDV7i7W7at0m8jOk=; b=kO/8IF4VNRF5hdi7Jtoxq4jiul
	BWfUIwCfoUOBFJvgNYBbuL4h/nOoylZcjA/0AT+fX+59F7JN/momRQ29e5CgSvbMdOZKD5j/VQbIO
	g3a3S4wwbc80WzYFKRDKS9oSfcWyYS3B0Ns7n4R2Cp16/QDEiqTdzPBeALkTlGEg7l9cUX673VZKo
	aRiCeURtJ++DaHa4YhThr5h5TDK3eQewRVDotesRNSFXIFNxnJsRfdRF1IDhETsAfz0dqUMxUPwlN
	JrRy/Qp+kHq6gwonULEDc+l1p9kOyMqCnDzkMVeocmOe2btU+o2ZtjvTDeALAVe8fZ5hm95U4J9x5
	SarzVj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBh1N-00000000q81-1KGY;
	Thu, 14 Nov 2024 21:04:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgyR-00000000pVe-1ADY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 924BEA41BA9;
	Thu, 14 Nov 2024 21:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCE2C4CEDC;
	Thu, 14 Nov 2024 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618114;
	bh=ZS31F9JNh91PoOVQoiqXN/QhKMilDV7i7W7at0m8jOk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Vdwigqz2AbtaalJaYu6wicRZ1j7vzp6sdoExqhqRrA2u8JisOLpG3QsbfRrN8/DAE
	 zE7w7Vr3RT5bgEwSeYSGdNfS5rovrL4CmQ3Zd092ulX6Yy3BkOi3L86wx9rk0Rab6P
	 WaXNEOwqZLj+sAVS9ZLLRLz1Igj5611LM6oVXAlDdow7maduiuf4PFyA1FBtv+ziOZ
	 LmQlNK8Nn2CUg4yb2QJp33sgEglMK1tyrp/5EE29hoaZoSisjY1LFGeuepvrt2Ohyi
	 BzvxxfCHx2H9f5MbB52xLjGA8AccMxeJxcDPsKCaQ5drofIN4Z734h3FD55axatov+
	 NSzoXlk5n9L8Q==
Message-ID: <57e3bcb03685a8d88b50ab1993701cac.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 4/7] clk: en7523: introduce chip_scu regmap
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:52 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130155_378031_597DF0D9 
X-CRM114-Status: UNSURE (   6.50  )
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:51)
> Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
> memory area via a syscon node. Remove first memory region mapping
> for EN7581 SoC. This patch does not introduce any backward incompatibility
> since the dts for EN7581 SoC is not upstream yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

