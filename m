Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B10106ACE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEWf7d7u2qtY1h7kt2ogwyBl8RlAkVQjKkU0vbu9Csw=; b=4ZFxXAnG8xGBrWBVFpVC52+S/T
	rEtrGPun8o1zSZKdS11fe6JTxRqMb3q2fVX3zNwr3nPK8xRly6BwhLtXY2pxUVtdem1Bbufkoz5+Q
	/IZ24LFoVoZf3jXz05Tsc1fI0G+a59vPNITxn2IUdzr5oAn982fnq8M9Bw9SgEm+JOh4aIslqclMe
	QD2FDTkgl4hte1BNoLToxqc2SmcVxgAVnkHoPDRYxcCGTQj/Ds0XB14JJV0qwVXrjlTuVnwJue18O
	z/wlgm9r6mlPmBAokS9qHnXc5YQpDsEO1cDK1CnHqEYNh0a5xu9cb3AT1tLVsvJVjWWWSlpesnSRt
	mrSlwhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mEX-0000000FCWy-0LQ3;
	Thu, 12 Mar 2026 20:02:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mEU-0000000FCVg-3dbL;
	Thu, 12 Mar 2026 20:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dEWf7d7u2qtY1h7kt2ogwyBl8RlAkVQjKkU0vbu9Csw=; b=GObeaW55IjuMyneDDClwv1kUfM
	tApPzylWbRw4/VYHK8NuDJusvOMQIr+WqWCFHmgCJzRbcufM6IGbt73W1pmB5Z+eoZuPFyy2hmHIF
	/mYYGuOkj0Q/sPRkjDRQNjjr73dN+FLK2RPfhpwvfCRe1VV/aEo0/S7KTtJgEjPPIzXJGMiaU+Vv3
	C+8o4wi5GQ3hIoFTu8OiGmhZkgfjJh542HYyYlwIApANEDlxZ6zKAXExlXUbePy3r67GQr1E9LHCM
	GuOqbCKY2DRYV8zMhBFMlq7Cjo0DZNz/bD9/gBkQ24Q7zfjIcbnmx3zxCKqdm10zIuWAz6jvJRAGL
	xDQLm48A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
Date: Thu, 12 Mar 2026 21:00:57 +0100
Message-ID: <177334565380.2520391.18416759606426475557.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311135604.21634-1-festevam@gmail.com>
References: <20260311135604.21634-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_130210_906065_EFDCD05B 
X-CRM114-Status: GOOD (  10.91  )
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


On Wed, 11 Mar 2026 10:56:04 -0300, Fabio Estevam wrote:
> According to nxp,pca953x.yaml, the pattern for the led names should be:
>  "^led-[0-9a-z]+$".
> 
> Change it accordingly to fix the following dt-schema warning"
> 
> leddimmer@62 (nxp,pca9533): 'led1', 'led2', 'led3', 'led4' do not match any
> of the regexes: '^led-[0-9a-z]+$', '^pinctrl-[0-9]+$'
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
      commit: 8d11cbff066fd9ba866b20ff823eca15301095a6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

