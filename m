Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099D8CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8HxvMsbOZxtQTKCjlW7Kh23DmVfi7q+asxmvEAD1C4=; b=TwhSWfjd1dT3NFp4ZSdpIejcOL
	zE1ej+Z8fNgbrE6h0hlFrmCVUvUB90SzI5BE5fkAEoQ/FT+rw0gJG1+CkQ/hMBOQvjf1cFB4joc7f
	dAsG+Ev8U4eqiZ0r3uTIpaanShoJt+GpdGr+ql1Xc8cKRq/p810d+EcWVqRJdzkylRmandxjKGPyK
	93WJ0eYXcr/skEbxc3Pzwxpj9SCCgeDcjR9/wqKdePuZ3M1rjI65BhALI2Ms5iLI49eOAXSMHSrXS
	1TD2zaCBsWnKQy9jp9Df1bm0FjhM91VU0dYyP4qPn14K4aFOg0xgv66wir1DXikplKLsoKk1PE2k7
	DkvmmJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CzX-00000002THf-0wWZ;
	Mon, 29 Sep 2025 12:28:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CzU-00000002TGy-1Gv9;
	Mon, 29 Sep 2025 12:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=B8HxvMsbOZxtQTKCjlW7Kh23DmVfi7q+asxmvEAD1C4=; b=YnZatRgIPhzKJONzIVGCaHMQQY
	1nrYsVtq/K941C5fGf/uwNRKN5rpgyYTJxcdEqv01pa3i/io1qTiUIeD2E13IysRIRmGuq7WVnolv
	0PH8/3iDNtsHv0GA8H5JZVDb8tYU7K25jONEw7wcLq0smzrOVKJTdYJggftRdF7iBGjjCuzyLeLz8
	CESZJ13RqBC3+UmFqITlg0lh/cGlu96DLslx6zJFrh0+0dC3FLKc2Z8fBZVms31Al+8ilqiE7/kJV
	/SpF8mDF6ZqnhzquOzCIPes56n9bUSSGnGA/b7XYgIUXIo98F4Eg5bZ+qWSH1SXpr6eB04jWUJrmJ
	7AKnu1VQ==;
Received: from e227-076.eduroam.tuwien.ac.at ([128.130.227.76] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v3CzL-00072s-3M; Mon, 29 Sep 2025 14:28:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com,
 honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com,
 neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
 pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
 jjm2473@gmail.com, jbx6244@gmail.com, Liangbin Lian <jjm2473@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Mon, 29 Sep 2025 14:28:17 +0200
Message-ID: <5700676.tIAgqjz4sF@phil>
In-Reply-To: <20250929065714.27741-3-jjm2473@gmail.com>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-3-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_052828_339549_F92C9BC1 
X-CRM114-Status: UNSURE (   7.46  )
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

Am Montag, 29. September 2025, 08:57:13 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Liangbin Lian:
> LinkEase EasePi R1 is a high-performance mini router based on RK3568.
>=20
> Signed-off-by: Liangbin Lian <jjm2473@gmail.com>

In v1 this patch received an
Acked-by: Conor Dooley <conor.dooley@microchip.com>




