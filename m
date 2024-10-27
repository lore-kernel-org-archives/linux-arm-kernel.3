Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC737D13586
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbXmtdv3IjeDBQxB55AZf9jmxsHSvyuvWmObEhgds4Q=; b=wxqXXS6uOK0Omw7CiVq99Uc7NX
	f81n/sf+JecMbXjlo08+Fw6c4CQBr/hv6lyhW5sP3O+Dye4eKTsICsk7gYq1Oq5sLOjL+R/Jj7VTm
	x64XoRcnJW3NJhHWffQP/XRWHZqLqp5R9+QEgJXJr5R1pMlUDTXG7lCVN2HcyHqcR+LiSiDzmY9O6
	9VO5VGl/E2oQovohPK7QJzB9sS4ohtZBqzcidLA3pTuSEolmutd7m6ErRR28vXDmSpdZrSiPObB8z
	D0RNaNePAIjEZULfbgQyRVDdJ/cemGpBV/J8/9bk2SIFoMswTjSmgXQDvQ4QXfQDgCugAkFAfuDfT
	roc8o3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A5u-00000008rjm-0kEX;
	Sun, 27 Oct 2024 20:42:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A4I-00000008rOA-2FkJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BEDD05C587C;
	Sun, 27 Oct 2024 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB30C4CEC3;
	Sun, 27 Oct 2024 20:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061657;
	bh=CbXmtdv3IjeDBQxB55AZf9jmxsHSvyuvWmObEhgds4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnEcATsv4UT/1vK5R7I5/K9/vJjlyku4VD0Cz9tTzKxg/1okqaOmGYhSQzEAM6V4p
	 Bqgb03IVNIqiJq6KW0v26HYIxTMTCWGjAgfHLP7db7WReBwc8ueZRCGXOE7hDBT3cJ
	 EdzATkwXfLrdUZ7w5WKD7j28Vz3F49GEQpVxGh4QDN6MJYqgAovHUBTd1vRHq3acqE
	 4tLI2AJtTNOOtFN2/MJ97OIuaLQwHvO/BIRjct6GUkBM7CTtzLW4g5Wks0Cbg6w1Pj
	 JnM5fmvSBY/n132MaqDfC7WKLFaBSRvfHCaV8xuUmVawSfjDwbKAhP0K/KlY92wRuJ
	 qH7pT4pOKG7zQ==
Date: Sun, 27 Oct 2024 21:40:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?Q3PDs2vDoXMs?= Bence <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: dmaengine: Add Allwinner suniv
 F1C100s DMA
Message-ID: <b44xrgwi3swuvliaxzzk5tvanxrmik5zm4tcqzavl32wbgce3e@yb4eerrluanv>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241027091440.1913863-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_134058_642199_C2D3DCDA 
X-CRM114-Status: UNSURE (   7.31  )
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

On Sun, Oct 27, 2024 at 10:14:34AM +0100, Cs=C3=B3k=C3=A1s, Bence wrote:
> Add compatible string for Allwinner suniv F1C100s DMA.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/linux-kernel/20241024-recycler-borrowing-5d=
4296fd4a56@spud/
> [ csokas.bence: Reimplemented Mesih Kilinc's binding in YAML ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

Missing quotes? Are you sure this passes checkpatch?

Best regards,
Krzysztof


