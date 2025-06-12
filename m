Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0AAC71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VR5y0yctXr4XPaqy1aKaXDWdxCZQO5tubS3+gM8YMY=; b=QJrMNsxFrpB52zLJBGQNdygNXZ
	9YZiOyxVm66TZke7eq39xucbGZ39K1A82pPAgO60Vs6tOC2kZJJ/39v6wcG2g0s5s5fiVU1GJRomQ
	9jLx2IoAdvFpL0hjlSPDclmG/FoN6OiS1u7AZW5RcP1WdCLxj95IYUCG07HhNg87LqT1WM6uqzU8x
	M1oHkAT0SlV7V+sKlkmXze95VzGFVxDo9NnpmsV0EP5yKJ+bF5J0/qz4SfcUeNq9n1gIZLOYZixfp
	H7/Sy6zWXjOQ0KVajqBrE/HYp82FG5ohzPWkIfpL7Hw4VkwfW7JnvjP8mveFNqb6UNJR5ZnzOmYyF
	WtHyiZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdme-0000000CkSb-3ewu;
	Thu, 12 Jun 2025 08:59:40 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd7I-0000000CaT7-2uES;
	Thu, 12 Jun 2025 08:16:59 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E7AD31F918;
	Thu, 12 Jun 2025 10:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1749716211;
	bh=3VR5y0yctXr4XPaqy1aKaXDWdxCZQO5tubS3+gM8YMY=; h=From:To:Subject;
	b=edDjj3BdUD1gnQTpkEmdkcP/wnYtbxZpJQrdMyg+rC/QFXCa+JIfLShC/OZlNzqXg
	 siW651XVhV8xzKaR41qq0o55LePizdTglIfnsFfkIaei2IWPK3XPjDRCGLc7DtWliH
	 15l0Ln5GvzV7C3u1AzGxO8E7fdhQ89PfiYARKBmK48unDPrYwQfMQ+8335QnqrCBIP
	 oKNsXEW1QdCtN8RwAAmRcx1x6nysHGImfBL5SI6TncUmcQVSS6d9MpCKVqT9mRVOfU
	 ivF4lOQaobzt5BZ2WKmfUn5UbOrNE457dQvNqLFBpOHibGKmiOQM6A4fCPO2K00GKU
	 kwXJvloiVXvFg==
Date: Thu, 12 Jun 2025 10:16:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: David Lechner <dlechner@baylibre.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Tomasz Duszynski <tomasz.duszynski@octakon.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 09/28] iio: adc: ti-ads1119: use = { } instead of memset()
Message-ID: <20250612081646.GA316795@francesco-nb>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <20250611-iio-zero-init-stack-with-instead-of-memset-v1-9-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-9-ebb2d0a24302@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_011657_782626_4DA60E24 
X-CRM114-Status: UNSURE (   7.76  )
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

On Wed, Jun 11, 2025 at 05:39:01PM -0500, David Lechner wrote:
> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


