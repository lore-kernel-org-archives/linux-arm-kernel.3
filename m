Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E2F5A8AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ0lycRYGV4y8XaDz0FBYcKAJV3l46BXgtsUAQIkGuU=; b=0UeA4YIM8+DvlX7run86zu7rKd
	SQvjTsHyLCuUjA600FkLDuLRqLT9pCLCOEAYdcM9F16BN6fkgBI37X7wOm3oZbh78EqbaovvqDGWV
	tC0jeFueYR2ubexwYOcaKhhPT5NblHEZQwH/4hDq3HGBVIAzsh7k5bsyt0mw/YhuB30NKDi7auBRp
	5FP+/SNph5LkR45Wb72PX093S40VxOrZ5V7LI3Aa09nRzYVl+oXDb2xsM6jeAPZEGdjYmXZcNHFlT
	dGUe+b2oMyaETJrxYkQi2Mjz4UDN8UKfXvC50o69CJ7WTHkcTic/yCfbPAEYa0bNPwLbaQl1vrZr3
	GBh44o2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEtVX-00000007YMm-0hTC;
	Mon, 20 Apr 2026 18:38:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEtVU-00000007YMJ-1NUP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 18:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE5DB40830;
	Mon, 20 Apr 2026 18:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A476AC19425;
	Mon, 20 Apr 2026 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776710282;
	bh=hJ0lycRYGV4y8XaDz0FBYcKAJV3l46BXgtsUAQIkGuU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V4muTQUHbcsd7/nox7EQrxep4fA9+nM8nJx9awVFnoFuns8my/ol9FPydoR90PS0N
	 QCtUQh74HiG7dO+XdzoLfw2RPfeV2FiCRrsM9BGuF8BqcUQDcDP3+kW6BYBb9vRyS2
	 jhKMgGRxf/HCEUZhmJf/Tmq2xIk/8eVEvCm1Rvdt87BPydtS6713LOmLpmaW0mwOrS
	 alaRgSzStVGRjB0MrgyfMf/b+C6a74c3nA+2sJTGs9pg6d57WSLXVdRC8ctvat+WhF
	 /0wa7uSFULIsYrifDEIvHP1CEJgzaLQSD6QStAL0G1VmxlZmTkMHyh9o9DL3jYEsLh
	 Io8ExSk/SZouA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org
Date: Mon, 20 Apr 2026 11:38:00 -0700
Message-ID: <177671028062.5403.10359224538543497170@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_113804_411015_572A5304 
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

Quoting Marek Vasut (2026-04-19 12:35:34)
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

