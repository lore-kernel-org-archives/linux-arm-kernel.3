Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA242606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ywr9u9TJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTLPdmUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=; b=ywr9u9TJ5YpFE0
	A1iPNw03w/c/F4vCNG1Oa+x2d91dAMMZXt+vKwP7ti0BkthcS+vyv2SKLC7ZlqoIEoKTEAKoIjEQ+
	z2LvMGa0/odP7QKaLVs/vqw71w2NfSa+M+Q3qzLM4cuxXXS3ecxCZP5k/dEYI4WzLwpBCvVSWEzuk
	ZKaavnTcBfx26+d0VVbu4qnaGsSXy9u5vuwE1TYUE0VTmdYN+8Q7iNswQWP3gcfVw73FGnBH+jhBj
	RUR2IZpr9OMISzR3fUWyWqpPQkpSNWoyojMxqfauBHt6rEmz+B9Y+6vmpX8RQhhHpWI+JOdcVlslZ
	Dg+CzGBhI8kcV2jl4YBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMP0z-000000097xm-2Gt1;
	Thu, 29 Oct 2026 12:13:53 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMP0w-000000097wG-0Xog
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:13:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a98fc80925so23822361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4gei41bjBKKTyuF2Px0yr77lEkQTH/0dM3rT+hrFU2d/BUXcvffF7RpczWlddQ/Ft
         nBeLx8FkRAo3f+c2FlUfac3VYzIltXb6bI+9oBVan7Zgmo8fW7zAIa9NORRdhAqX5YPm
         KKIaFfdmaxAZTv56FahzDR3Sv7fVvNFWWtKbQK5bEQmdcy+bD/3WchSZ7Ax6xbQ+/fQk
         SoHkQiy1crr/jJCaRADivBSAWJ0/GjyLBQIRPUw5JYKvA0/aNN3b569/5P/4tSJzMHpS
         DzypzyH+a0dbVYha8yDWdrUoU9GUwY/etN8cBQI1LzgMdBnXBNdIKkb1qYP3G01fcEUU
         rvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=y3grj87uBm2YyndRHO2ldjvtJf7miGZNHoC3NOWdDpQ=;
        b=D6ZC+HXfad3YwDTFngUKw+1ucnx7aLHbuzB3CsczKKXnMyUKfX75yVkCCxx9zKZ0vO
         OG3jD0B4IjpmtiXX9c4htj8Q1hWJ69PQY5DWH4+WeHNGwcliiN8J55Caje09aCFrPFMe
         flnyXyfC5NuVwVILU+Zex2iLsdf/CDgsD/kqFpOESoRAtEvM5tfMisb4t1KFqlJcMbA+
         dRz/Ji5PvPEwHsuG6WlIJZDcBhc0MnD1h3E5RdQF66MzQA6WJYNKNmkRx1plKCuHAsUD
         GlpVMLkvuzZF/4fxGeFDLW+eZ68HsgeXpMQR5GmvLHp+3gd/8w9AYnOPw9djqbDXhSdC
         y5qQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=JTLPdmUs5eVdtSSrKrnfdQDr+8m+s31sNFBqp5Q07ScQa3hSzx2gyIz8z1Aqm9lRCk
         x98oiS71iJ5iR8rkWtitkXjRxKSXiq6trgtPo3LLGUK4YhvL84U5F2hOUWaRUjFNa3nh
         +hbmllypF+uvYHm5wSTKUQYvaOBqXiXzEDfzhIto9xBNkp15GnfGR8fiUH5yTB9R0vxa
         Gqk0aTF/DojiA9O0Hqmj+BInBDlWM7BFiO+tPgGgOMo/g2DTKrcUfkuhyMUAnu5NXXMU
         c+oqYstncuTlfAX9Qr9+/IBHYn8+eeCtrj9toDTo6UyTRhjQgaZrSBfIgJPgSK2QjRF4
         yHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=OjQU0aCPER2U9wEurYCmIzOr5mBnss+yIin3vv04kM1echiHGkj/AMn9nQByTYlYlB
         nSkPQsE8wV9LFijxvYGUtRzgfepXGlqtiU7y1ooadzN0AbgMXnCCu/zdgguu0iuikqKI
         E3U+F1yxzGrFYbljG21Bf4Vu0BwBDi1MFjGykdWk0zln8GzjOhnsK1PP93fS2UK1Ivxf
         h4FeY5a8urF643dJdXjTpSTOakGuw02a7tBlIOy/eFapYDjA7i5XdHA5K3ML4yp7uSgh
         xIvfbyc0dVCCS9L9R20oSGH48QNAC3D8Z5wqNBy6CmJViGtQhdhdlZSi+SrvBbuFWpu0
         gYyw==
X-Forwarded-Encrypted: i=1; AKwUvByw0V064tamGvv7V9k5YmeipKbu974q6YVykcwk4uRLiKkAx3LP9vgNfrptP0kZ/pa4Xk8iADN2gPzyDSi559NN@lists.infradead.org
X-Gm-Message-State: AFq9FYJZth0jRF2v0ahxEYDRoExsqBDCbzBfwDYr4go5+HM8X4Y4t+Lo
	ouaF+CQciKOK6zqDmYNZAJdTR9JaDcpsvY2jLx+Si0I3RJz2TEZWmiuwJnC7uSNtALj9JEmOBnP
	M2X77o2+Ev3iO+i5Ot/v5hfWpjcG3Cqw=
X-Gm-Gg: AYBFou0L1U9Y2I30TeL2uTi8Vf9Wox1nAgpkijgNvIYm/AY7L8wMvkT+XgN2yo6XvUs
	BwoKx5LMs2g0BCgPpNPGCGY8+ssUdCZ5hf1akW/LuaIpaMFG9cI9t5+I6PODYiJFGQLmL08fywn
	7nSJbhPmYfQhVb2SL056C4IT5XpBTOWnj08aFgqWHh1YVyqPVOFhICiVKa1U3hTW0TnKasKvfOh
	QHRuZ14MD9MuSKsN4twAFtMw9sn6Zn7uuxzwRnE1PzIgJbi3ydVdcCnoQZp9j9xusPL77pKgOEn
	/QdGl5lMBVoqvp9TfeCfLkSORzILk0TknzxkL8a/J3MSRWuqnt5fTi3gWdxuhjzMpvqYKozBjSZ
	cETebVF0BqhXBHJf+1v4XkCWTZM6tF9d/wO59i/WxWiTNY83iiCIWLnb2bGYsq70jQMosd/M7Sz
	FtSkpmgFZWRZqWVVV8Ntybik8=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_051350_189676_025C8570 
X-CRM114-Status: GOOD (  11.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang

