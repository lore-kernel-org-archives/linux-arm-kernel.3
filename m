Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99E6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acsjePRWNLnww5ypFbcZNelU1TUuqtmk47sDOAGJPbU=; b=d3DWxrnIW40v32AVPn1rJwVeGP
	+GBEjPp7eIWBztSz1gkslxanHAqe4iuZtoTKCb4nbbvnY7fbYqNav25a7FmkXWR7tj0HPso3kyChK
	pSvaTqjH3+oszPKeZhIcRJJJvMLpeKVyO2JoJBh12BS7Z7yPQptrYWDowILVAc2tVF3qGfWIYNdVh
	iMAnSMmHzHYbmwuvLOoSBUti9DNJcgIsJu0wCab/wio3/QbrFL/4SbG4donvz6QGkg6SjT7fna6MB
	OjsVcqrz/ZlGm4FmEudTjMWhO5PkJlM1B/a4ki96DI02FUQYvo41stVK4qDxUMGAwysCVp/L4JnIY
	e3JcN2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqDZ-0000000G3X0-0BaV;
	Wed, 18 Dec 2024 09:19:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq9H-0000000G2ll-0VMG;
	Wed, 18 Dec 2024 09:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FD05A42092;
	Wed, 18 Dec 2024 09:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAF9C4CECE;
	Wed, 18 Dec 2024 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734513317;
	bh=fbWSISg3pqwIP3gp/FXBpL6JXIqp0/i4mzGvP6dEieY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwfvaUxuNabK48hCNq0fMTSo9p8Pbil63clvCW98USkYSOTvsHZpHiEa+EekRsX6K
	 U25tvqI0dMKdIUVo2u4zuGoGRXZvxFrifNwoOuyhoeq6KYD99VOtde2lnh/osEwOUd
	 r+7GXex44fQkvDMBfJRlEthMg7vWj99bjueJfG/hOhHI2U+zh1DvW5wrLn1qjBrLUt
	 No5sHjxfHAIUWnECmHRFIkcgIVrn5PrBh6fDq3tyfNLF8ONCtIiy5PDz2jmnsoesUO
	 GV+3VzPCJCTL3llr3oqIVemH3ilLbQtShBOeY5277hPLmM6KRS7iWaiyiPggA00h0c
	 YbWrK2l9+RiSg==
Date: Wed, 18 Dec 2024 10:15:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	mripard@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 4/9] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <euujxcd22nake5s4wioc7ew4rxhqwijh5vucozjorotn3nqdvc@q65uqqj2bjwj>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <f2b7beebeb99ca69021ca24744e29af3454f5620.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2b7beebeb99ca69021ca24744e29af3454f5620.1734340233.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_011519_226055_4AE4D4A3 
X-CRM114-Status: UNSURE (   6.01  )
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

On Tue, Dec 17, 2024 at 02:51:46PM +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v19->v20:
> - remove data type link of data-lanes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


