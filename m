Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3360ED6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESt7B0hIxd1hLIVW0eUcxPEDQNtVKZOVOyMn6TkpMyI=; b=A9nJGZC96+NVgRIjPX5GtghWBv
	a3Ue68PYKSgwDTIsPfUL1Y7RNSnJo/SOQ9SJdU5MfGIHRZkO3W/zs9eKyu8yl2mJy/76gW6fNIzF2
	TtARGVZju+CCGHjJPVjzV/FSVCfjlNQ5cDSYIgXRaGXAErHLytJ93ERdfz3IkSYBwhgWT9pfuE7Wy
	jljo4Mt1iYvQgYkJJlUS4HMFDCixWZY9eftVm8NqSy40E/ppTnhajHnuEg7YRKa9OBe3Q1rFUZI+M
	hYWO1W+cP/1pt/FGtrVdw9JD0BdkpLnmptFTZ9KgVOBZLMykQe3JsPtgnMsnF5rbStfQekFQjoaBN
	kcrihQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgsd-00000000oWT-2tp9;
	Thu, 14 Nov 2024 20:55:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgqv-00000000o8a-3idS;
	Thu, 14 Nov 2024 20:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38064A41B7B;
	Thu, 14 Nov 2024 20:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F2AC4CECD;
	Thu, 14 Nov 2024 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731617648;
	bh=ESt7B0hIxd1hLIVW0eUcxPEDQNtVKZOVOyMn6TkpMyI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JSxljZa1jdN9RcYVX67Q3CyiIjQMq0fupvVPR9XDJK0NnBOm1HmW1WwhDa0t+MzX7
	 2nwnhwMuYYC64gBFcFaE0SX6W74ZSlOA1+kguGXNUhB707EQ0BFGUEvFL5jfojIqRu
	 CkeZUDSg/BvItq6vVSn1vSeVkjBkjET9sAwB2nd8unsGnKs6jsnYULGzj5lxgbYqUh
	 q9oOcm/nflw7y3PexST4LP7XDlZ19eYxgsUBqSeJn8nTW8aoKfM9cGd6uIexQq+wrF
	 3tmL15Awb96qE2WR7+WCyPsI04WXOa5CRzvUsPGXU90qdmcgjhfKt/As/vSNXsWrCm
	 tW+eYDB25X3+g==
Message-ID: <7088d73b2dacb174319015e7df2ec399.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106111402.200940-2-y.oudjana@protonmail.com>
References: <20241106111402.200940-1-y.oudjana@protonmail.com> <20241106111402.200940-2-y.oudjana@protonmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add bindings for MT6735 syscon clock and reset controllers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 14 Nov 2024 12:54:06 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_125409_985767_0D4EE735 
X-CRM114-Status: UNSURE (   5.96  )
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

Quoting Yassine Oudjana (2024-11-06 03:14:30)
> Add device tree bindings for syscon clock and reset controllers (IMGSYS,
> MFGCFG, VDECSYS and VENCSYS).
>=20
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

