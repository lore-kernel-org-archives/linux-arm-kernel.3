Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4076606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g4Cb1g7D;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=; b=g4Cb1g7D9H0xSmJlBdOk5fH2ru
	V5jBngnxOdFkf+ANxurahLGpqz2+j8wTAgSVjMfTnxJtb4Dk6zg927GitYiHyddZXHqq7kFN57pWd
	MBYf99OdunGnn6ZUx5zqayvhLTtUItb3Dsna2oVXQ0T9systX0mClbq1OQy3PpS6rsQYD4VFSAPku
	Xpk2GIhyqkikaSmdAGCIaCDO2HkQ658MNB5vAxapW1j6HFEhLDspMa/UpFldg2I42g/C4tyzi3Lxl
	EMtrJ2R/FmBv2/R5bPmWzvFljB0rQZaeA7l6SraKyZnfGloFtuAnYlPqa83OtREsOe3ia3Md57O2s
	Q9QqXIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtaA-00000008GrW-2M9l;
	Thu, 05 Nov 2026 09:16:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOta8-00000008GrC-2ltc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D3844628
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20D81F00A24
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870187;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VwLynrdcYLs5RvmTneK7ASfYo7Q77QES8CdEFfRhbXxKuL9w/fQpBSt9HVRFDWqzm
	 qMrMTx00tQQGit+nNf/abi3xEEV3vDAOtnMIVA02L/EjRJYWhJmIfTlqTHbdbQrQuy
	 G5Gc1eyz6N+TsMSPrNuI/umq31igbmLYNkzR0GKeSikNKD3ewxz9Xhwt+2XVnbHLn9
	 RmgRuzF2KBuB5oO1+4DhdmbNNgU1NxU7eqdrKqv9s+PRIh/kSQOrAe+StC60lUmP9P
	 zGqeM6bR8qxjiOmKEONh0gLGwjy0paXgDi5ZjSWbW+enxibtPCwiGr2nUoIWOTVfsp
	 cMcPYiOfvPJUg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4fea434bso407040e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx26q0/YnMrUHsrMMRH1Pb4J59jADwcVTv8YuX9whGYFYk31hVOi/L49yaSyX3v5WfR/b3hpYfExZQ+ZLSF0wT1@lists.infradead.org
X-Gm-Message-State: APuU4Z/G2q2Pqf2o1OVoyxwA8EtzugYPtV7MN05Uj3/7tqxnjK6BzXE0
	R2vKUson4k4vkBba4BuBiobLbW9OsUmDWjF9+W6fxoT/YjK0irKR5CnKox5rnQaDC/AQUzJRP39
	rfqD+SlvwJQkvqa5uJylM2B+STB+JcW8=
X-Received: by 2002:a05:6512:2306:b0:5bf:d938:b80b with SMTP id
 2adb3069b0e04-5bffa170f99mr528748e87.27.1793870186373; Thu, 05 Nov 2026
 01:16:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:16:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
X-Gm-Features: AclHuK8Z_fG5b4bwr08ALhc1h2_lYGNTUPFKnPZS5m3aB2BlXOq_Z9AX8QOoOvo
Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Ajay Kishore <akisho@codeaurora.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Andre Przywara <andre.przywara@arm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	James Tai <james.tai@realtek.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-realtek-soc@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Samuel Holland <samuel@sholland.org>, 
	Sean Wang <sean.wang@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Tzuyi Chang <tychang@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, zhouyanjie@wanyeetech.com
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,

thanks for looking into this!!

I'll wait a week or so for maintainers to pick up individual patches,
then just apply the rest.

Poke me with something sharp if I forget it.

Yours,
Linus Walleij

