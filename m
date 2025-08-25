Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA49CA0FF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMWCTdGAusm3hQWQsg2CdgEGKQ7dsznpkjRuCSAWWVU=; b=B2GDV2kAvh6vXPYMS26IH0Uwog
	EZFcyo0mhrLiZ4Uct1JLVdGlKhUzDPO+aPgcmC33Zij6mEDvzRmLbZoL92bT98JBAgF+mX2CEbTvN
	9mEsVTpQvQLLJft9VLn9blEfLBJ+tlcb1VAQZaarnl41or37+KJuwAkksVRUjY2NRkRUncYAncOFY
	GTCZfJtu7mL4lrvvL4r9aeyLgZ0eRmYi/A2MmBevBbWzJE7aEqvu6Orf/SzuQ4DlpZdiVOTIhpBox
	2V+sI0Q5e4vNfkj1mOvOGmvYlupiaeYu8NP99rMKvJ02rgGPBrqhBa/28l+PVMd8hhyb8tzauJ+lk
	LnAPryDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYD-00000009Amh-0hD6;
	Mon, 25 Aug 2025 19:08:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaDN-00000008hxD-0NxD;
	Mon, 25 Aug 2025 16:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83C8544C9F;
	Mon, 25 Aug 2025 16:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D244C4CEED;
	Mon, 25 Aug 2025 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756139916;
	bh=CMWCTdGAusm3hQWQsg2CdgEGKQ7dsznpkjRuCSAWWVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ecv5mkxgN/I8RvhUlsb2sIAZbuxajeGKci91xhxLS+e67mq/3IGp2pManh2kl9JtF
	 juTegqwAkrr/6I7CbaeEQsMNKsNHDQTELIPHwmRQCUZUKrEBhxTNplr921edcyoouj
	 99Li2QuK44VfKmxn7X7JeYXs+fvPNSNDlqpAcXcmeLutceImVFZ/TCQ6eQjtQz3Pjw
	 wUvoa0DFQnub7yXeEYGDrj9RtBUDux+d43iWw7uYYT6sNss+TSs6vHAg05UIrywMLD
	 2MaevT6zdKRaM58sWPA8nqIhWnF4BnZsS3xXDSnSw7Z4fpFxC5umZ6ngnqjM1tBTQf
	 zvX3XZSoYhagQ==
Date: Mon, 25 Aug 2025 17:38:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhanzhan Ge <zhanzhan.ge@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: mediatek,timer: Add compatible for
 MT8189
Message-ID: <20250825-tissue-rewire-2e74b3f6918f@spud>
References: <20250825033136.7705-1-zhanzhan.ge@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UI+qKYtt++1CWu95"
Content-Disposition: inline
In-Reply-To: <20250825033136.7705-1-zhanzhan.ge@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_093837_142688_69FADC40 
X-CRM114-Status: UNSURE (   7.49  )
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


--UI+qKYtt++1CWu95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UI+qKYtt++1CWu95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKyRhwAKCRB4tDGHoIJi
0tFZAQCZfUIEHKet8aipJi3IzMKDa+KfIG5vdjT00QVZWuO/fgD/YdNzRLdgrJAq
cZBGuWpeXaboQnDiisCuiTDzRKtFowI=
=37rC
-----END PGP SIGNATURE-----

--UI+qKYtt++1CWu95--

