Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169C1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04q0DmnzmhNNpx9f6JqUjDJPGYAENcek8KIV+aPyp0c=; b=oJe7xi+g6Iqxv7ApQ2aQ1dJTbF
	XiGMbLLB8Y/8HjC1mUSzly8CwSOM0gTjkH9a+0tyUWW/3A0wKwmRL5kyF9k5wvznvEQKYiT6e9o6z
	3x7IhThw2mwG2nR5yKwmzXvEN3KVahTsbZYl67EBvdDts5D4b+kONUvnaMkmnhhp1firbm7ClSrsu
	Hko26dDfPD3mv1tfeiZtBzmttbaijzwmDEqdoJPyNR6NGy4cP1JEMUKpY4fIEqpbx7zTeC2alYGg8
	c79sIoNedMv+06ej84TKMRFFPOf7SmDKJkKwykAvq10QbO+wnmuGp/YC3gVn5bT5n7/V2pCY9PfNf
	uTZNdrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf97-0000000F6af-1tq3;
	Mon, 24 Feb 2025 20:33:45 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf7e-0000000F6Ln-1slE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA4E761134;
	Mon, 24 Feb 2025 20:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F2C4CEDD;
	Mon, 24 Feb 2025 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740429133;
	bh=LEHxu5uUmeaV7+NU70Sza9810F5pHO55NG+jcIxXdLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWb+AJ2me2apk+gmPLWDZXowwwAyEGuesvKDYbTkGbZHkofFvMw3X3ejLPs2COr1o
	 ZgWG/ZCnkVCXoqmgHOlJyw+MFXK10bkkBCq0uU8+r9oj8XVlreLKT9zfngo86iM40E
	 aPuqms5vxELWLUCfMdDPKextu5DeajD2SxRgSCZ2P3x3+EQAI6+YZY9vNjOxIFmkFJ
	 EbuLfaAacYExZJfr99LMkww9uW/iEkHAJg3kx8mPaiQhp5p9Ywi4v05Lb9LR3WoPfv
	 Lg537vsSWQwVwA2rJXRKVGHKoCT5bnYp/D99eniwkRm/sVY4LM1Kl4VrxGEXC7IfKu
	 m3ysrKMt5H7uw==
Date: Mon, 24 Feb 2025 14:32:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Liu Ying <victor.liu@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 01/14] dt-bindings: display: simple: add BOE AV101HDT-A10
 panel
Message-ID: <174042913116.4047506.14844482036971785905.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-1-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-1-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:51 +0100, Maud Spierings wrote:
> add a compatible string for the BOE AV101HDT-A10 10.1" LVDS panel
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


