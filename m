Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DAFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj3PztAnvD9vDz6xP2L4dDXDamq37tJkkDcB9UoW23A=; b=XezhEE0wXlwRkrHnXHVBU8aFDb
	euNCgovmb2O5Z1VjOLC1jtgBBpIIM6/kJdIgVxVnG9N0oO1dUuUkHQvbFMq4nDVKQ8kYvCdbeI4Wc
	3AU11urrh69je8et/QfrB6yjpgk+TioaxStC03nXEAOs5ftaVQ9UGeqv08lgNYt0O7a+nbp1BhRxI
	N4YsjReg8LANT8SQ2+1ZaQPX8PAnZJkqZdfrUtAOr8sWCRieVky0Z7mrS0k5eG78lBvMm5M0LCZAJ
	6tP0NxqkYd0STxmUKGzSVBXSN+bn6qpc/uDBuPAxcJzaGq4YTbZPPlqORJwofo49WXy30ZitAK02+
	3fIHjxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMg0-000000088a7-2pak;
	Tue, 18 Feb 2025 12:26:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMGo-000000083h4-2Pzx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:00:14 +0000
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 611F11F8BD;
	Tue, 18 Feb 2025 13:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1739880007;
	bh=Mj3PztAnvD9vDz6xP2L4dDXDamq37tJkkDcB9UoW23A=; h=From:To:Subject;
	b=0vIasmSyAYoHCecFVq8qfDEAKDf5y8zcgzKEgmSf4SnjZUhpdWkZy9p3GuieOjyRD
	 iDV89X9ERnCVMIZRnHABwQQOGCkPs8AG+tpupDCqLnV0qj+xsF9jwzTiZvWafig1SK
	 usqZmaBUTHQVPknMUVysdLDgSU/PylBZFlYh0GK92wWbJbM9M1qeny8DsiuRRjPtUC
	 e9+kCupqf02xuhszS1x6QARjQXfmlBwP49yQSoHj4FSJEAr5jXM9rPdu+U+gYbkvXR
	 oBT7KCh11h9tz2B4YIEmpkgxB0y5mTW6zaxFvbp1eEzJgeWx8NKh8cVVCBreoZ/lMX
	 Ztyk/MSWmcV2A==
Date: Tue, 18 Feb 2025 13:00:02 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin-dahlia: add
 Microphone Jack to sound card
Message-ID: <20250218120002.GA15270@francesco-nb>
References: <20250217145744.179213-1-eichest@gmail.com>
 <20250217145744.179213-2-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217145744.179213-2-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_040011_499779_629A651F 
X-CRM114-Status: UNSURE (   9.16  )
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

On Mon, Feb 17, 2025 at 03:56:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> Fixes: 874958916844 ("arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Cc:stable@vger.kernel.org
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


