Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5085CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykSuG+jlMa59PgQtNlOKjt0WWar3y1ZxZjMPxMcJ7KU=; b=Qtx2YKfNdF2bNHUVsDvKDUQ/zl
	wzdlA6Fa/6oDhIBm6uT32ON2Bc1Ekm9yoB/Lm0D3f4BqFiBDlEJtENQvaVNkiytnS4wn1BgvDj6pa
	RPvark8lKiOm2q3jjJxT+KwPMiRkDHoFDb+SCpyN9WuJMSxhCSQnRmi0lsm90OX5FmtBt7iTaBxV/
	Vrqmm02rDWhJS11OeTqx4YDbOnJ7Y0lBPONOHZVsoiB8HeN/ZvVmsXA9gDojsvVUCMb06ZXX7Fnvi
	kXbuU/63RcmsRZcSeiozvhrkhJHlqxKs5+9jtonj2HDcBlcU7sKdxq0UtquwyaMQ+1pqrxOBvTvEB
	GcbgV/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tDH-00000000sxl-3qew;
	Mon, 06 Oct 2025 21:57:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tDF-00000000sxR-3lxQ;
	Mon, 06 Oct 2025 21:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41981611A6;
	Mon,  6 Oct 2025 21:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C8EC4CEF5;
	Mon,  6 Oct 2025 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787865;
	bh=yp9tR/3bMmlgJmoJe+O7mORmnlg42QVaBRKpSQK+faw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTyoIor0/sVEIADuKwC2wgz0koY/pk6wANm9phf3dA/bKr5hBzcYwHqszSKqpPCX2
	 cA4l0i8FyBxnWUi31SE26Qw22ZzmmwFflHH2APVfOv7uEGxUzoAmxxZncclZhC2yvi
	 zF/0Ffbfq2BJEHjUvUzaIOkIKVrB9F2cUszSPmI1sgfzD/jR6Y9GOzdRwE79/xP51m
	 el9HfnvxsvKbZSGHiuOhx7KhB0kEObs9wrwscFDOkh64eaEo0Aw3D+2A6LuPhsHOKx
	 mMdvE1E+KkI/JjaVQC9qQuGuxTHSsxNmxY8GR3GYFgPIfoNwRj9Z7UMdnqHPFtvQPP
	 7xor4IFATWACQ==
Date: Mon, 6 Oct 2025 16:57:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: watchdog: airoha: Add support for
 Airoha AN7583 SoC
Message-ID: <175978786337.652658.2471025622526650707.robh@kernel.org>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
 <20250929114917.5501-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-3-ansuelsmth@gmail.com>
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


On Mon, 29 Sep 2025 13:49:13 +0200, Christian Marangi wrote:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


