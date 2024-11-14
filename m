Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685FD6A22F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke4CSsmoo37ob03EFZnj/Ddi/Mx2+bZe+XEedCadk4g=; b=shdDbHn7mxMe0bBSCt7c8UuNcW
	8dN5o5HpZQBJ1jdK6fTclqAFp8hSShMCKVL/KXBT3E0aL6QLbaShyfOLnXz4mJk9P0tRmxv98MoDE
	tEsP/HvXZVm5hnjaN38PM5jEy9KlZx2b0/AZYPpFAy/eqrCZy6M+ck+FvTlS4898ibX9mAF7FQVLb
	z9nDhh7Jum5GESeN96UPnkkdFE+R4Ttyww/+Ev1XTiRfWCZaDPGQqJ3sQfexWbLCnxkfteq6kxqLF
	WV7kUvS6Az6VvD96RbMyz0aGJJu54DNKHu7PMOHls26aUuaxFH3wji0SbpR6GO2AMfqil3gHz24/q
	JlsU2zuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgya-00000000pZE-1MTy;
	Thu, 14 Nov 2024 21:02:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgxe-00000000pIy-1IFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69A5EA41A94;
	Thu, 14 Nov 2024 20:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FBEC4CECD;
	Thu, 14 Nov 2024 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618065;
	bh=Ke4CSsmoo37ob03EFZnj/Ddi/Mx2+bZe+XEedCadk4g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EsBHO+eOl9nchowEo72O8J1roMutK49GO/Rjk2Cvppzm6k7UA9YheZMuyWxHMF+Tl
	 QX6uBrLA+MUntz2su7sPm82Ho6Sjit8KSlOE5pzrYpu3zROeBFQrUeCEjdyF+Yxgx5
	 0LmGhrLtRfEiraKWw9rmx/61Z1Prn5Q/U7AMKHNmfE4tLsJpp8MerjdIUQKxQOc985
	 gSxNcZHQcM1KmI2WUnkHWx1VvEL2cJ9hsFbxEgO3xf/Zy5L9BWr/rjWOtpIPP356rd
	 VCo40Edn5NrQS4/g9Xb2J+zM6AG4B3WVREE6KITbZrzdhEcLbQYWwQEaGMXvuHy5hG
	 fPaFe/7k+ez4A==
Message-ID: <cbee144512ba1f4c1dce6aac7f6012e5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 1/7] dt-bindings: clock: airoha: Update reg mapping for EN7581 SoC.
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:02 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130106_406097_3735DDDD 
X-CRM114-Status: UNSURE (   7.79  )
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:48)
> clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> while it is configuring the chip-scu one via a syscon. Update the reg
> mapping definition for this device. This patch does not introduce any
> backward incompatibility since the dts for EN7581 SoC is not upstream
> yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

