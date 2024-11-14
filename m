Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16EDD6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ny8jBLlC1faSs+d+SgKuo5GECTaTBR5nVaEj3pd534=; b=L0LZSQXUYIS/C3dBE7uSoB1lJz
	naiatJw7/wUcSLdVUdwLNLVKdnGEUT45Nx5H62+7yjxpa214BHjbjKkIJkXc/o1QhVmnjwyJ6wTqA
	rUI01uGDFFX7qghmNW5PlW/RFQIbRwK1fx7/XWiYZ58gKdoicS30ZPtFGdv8Y7Ltw1xIKZcnOM8bN
	ogUrZI940cVg3/73kxA+1RisF/kUl3xg4CKgmSG4cz+skhLtZg+199LWniUrqelJttA/cAS26Z8TB
	3j8wyHZro40PO3g6Wz9NZoDcHfbXsk1nZk//LfIBHThpHhw6hPUgF1WixMyx++SLGy6LvBAG7xqkF
	3PsxekqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBh3A-00000000qXq-2O1d;
	Thu, 14 Nov 2024 21:06:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgz7-00000000piV-1eXi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D0EBA41B97;
	Thu, 14 Nov 2024 21:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A4BC4CECD;
	Thu, 14 Nov 2024 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618156;
	bh=7Ny8jBLlC1faSs+d+SgKuo5GECTaTBR5nVaEj3pd534=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TY1IrQj0MpsSaKc5C7yUKfOL7uP7bp8/+V6IadrFHJTyTtc0sX0VKwt4MtGCA8/Hi
	 RElr/heq1lwIUj/1kYIrizo8ErGul4QlJ3dbmJKSvOBLtIMmogp+dYbXianGGfKY6E
	 e9YhqlLVXwV36ybiDW/8tvT+rlnUG0VnFUsIVXga9pLQCN+Jk1lUYosj7FRgxQMO5V
	 jGVYs7svLUYh7SfFLiEiAbUrb7AsA+tbs5k4T54KN1+eaQ+98Mgh4KA3v8N+8HQsI6
	 JD+nP9unqaHhId3uQUgUh0lXTnexUWH/LBZVTZVU6ytgxXRI0g+VCsXEMZEhUVnv6l
	 2Z5RuZpDfEMMA==
Message-ID: <3437542ab1b8ed9d6159b9f4660ad499.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-6-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-6-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 6/7] clk: en7523: move en7581_reset_register() in en7581_clk_hw_init()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:02:34 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130237_495848_3223C6D7 
X-CRM114-Status: UNSURE (   5.80  )
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:53)
> Move en7581_reset_register routine in en7581_clk_hw_init() since reset
> feature is supported just by EN7581 SoC.
> Get rid of reset struct in en_clk_soc_data data struct.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

