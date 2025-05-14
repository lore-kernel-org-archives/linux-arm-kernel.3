Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2127C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDV/O8haoOrB+ofE6rgFxaHZvrLNbVhSxRFU8YU3hTo=; b=EadvK5q48NSJSK4iCviwVw5TDi
	HzzPgmaeOMAl8Nu5y9mGXOHYZoNcJGLj+dubnLh1EMBmJC+2mIAfOuCKUpKLX5lbKFv6NZmXLnwj3
	EnS9oFH/08oytpC7cjAo2MKpJNlDaqCdhXBTXiBLXbDT0gb4+MEVZKI8RfZqB7niiG7th+XpOfx50
	mP+4ZbMLUrPLiHjGhnqM+teoeOe6sW2aJET8aNODjUV5qsx759j0KpVCqTuqx/MkAZiENgheujJQE
	vuQMT5jODXFCyoNOqkt4qlCJGp6zRhB1krORJLSuGVcKmq6WIT18OdwECvvY611cPhDujdkRmozpg
	1mSt7P7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIV2-0000000GFr0-2FK5;
	Wed, 14 May 2025 20:14:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIT0-0000000GFaV-1af0;
	Wed, 14 May 2025 20:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91B96A4E218;
	Wed, 14 May 2025 20:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10B1C4CEE3;
	Wed, 14 May 2025 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253557;
	bh=2WYpJnl1ax8rwpFL8L3G6L2FOopXlQPNK3SrFZq0AQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fbtdd/oHH/eFNDqfEXpXCkjsSKFCfZ1wdk/dFjtcP69HWJgdJQFePY3VR48iavwFx
	 DxMP7ArmTZdZ8w/uafGAIdImGvmeQLX/2QfYkSe5tRQ+L4PMJIUDJitLWSwcpZNql5
	 bCAbcrXyfYiGBD0ARw9z6Q7hoWkg/GOcp5jDP7zkQPt/iEYvgd0iSMEd+V2a4lUGyX
	 L4wuz5vVpwCJln75WamZxymz+yTuZJdYgRk4inyBH5+vh7z9U0b32nLxqb8cBUbUqz
	 r8b8xZ7Z7w5Tr++Ov2hci5iAzsq+D3dT8lmdGssACsJJOcSr5QbPM/vjYS5/MZ8LYP
	 n24j3W6gnyK7Q==
Date: Wed, 14 May 2025 15:12:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicholas Roth <nicholas@rothemail.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: ov8858: inherit
 video-interface-devices properties
Message-ID: <174725355479.2958040.5700144507602583801.robh@kernel.org>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
 <20250509-camera-v3-1-dab2772d229a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-camera-v3-1-dab2772d229a@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_131238_481925_E41529B4 
X-CRM114-Status: GOOD (  10.25  )
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


On Fri, 09 May 2025 23:51:37 +0200, Olivier Benjamin wrote:
> Update the OV8858 binding to inherit properties defined in the
> video-interface-devices binding.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


