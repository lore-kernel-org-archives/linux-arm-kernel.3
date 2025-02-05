Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA38C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Imwda3hgHKMCs/Rndh0QC/FNODGVbXy7opyd55mzzg=; b=QSg638y569oLFe+dpjr15Ysh4P
	3U2woiZNj30MAKdf/jSz3HgC6l3OFi6Sfte8/t/aei69U+X5WKQsRen4/23sxnhmGFUUrRZ6XzVzZ
	QQuLNfubrUQ3ajNrUA0mI+5NsC4rW1EaY8vFA73vWkybXJjtg3VWCqCWBaPMzL5LJkioc0Q2ZZBxM
	84PjHRa67HQjSbqCqpQawjPMqn/6YDXWQBcdKPLh55wbsmM48dH0b3fOBM/jW2p4NkpoJE5dOXx2j
	PG0nPQgs4Nm8G/0E3/taTil5iEsQWW1hYxyd93lp6XERT61vzs0mBZMWe+aBSy7sbZsqyWJBQ99Hm
	iuWL9qgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkOz-00000004J3P-2uu0;
	Wed, 05 Feb 2025 18:45:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkJV-00000004IEY-2pSr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFA3F5C6E0D;
	Wed,  5 Feb 2025 18:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74B5C4CED1;
	Wed,  5 Feb 2025 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738780792;
	bh=RZJ+o703dCnyn+DGJQBzmv0okn1Q4nOsGUDRznitTNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufT6cP6quBlHFB/mc66SetiVY2Qf07vrk3Lc0jGhQLIt4Y9cphNj/LQtJN09H8U5A
	 vzC5ptFacPMLSWJwhTGaJpNpdFHEFJuwHwc6pKm6EUjXX21ucKBtKrzBgKEGr72+aE
	 KOqsEbOxXChmLOQkhgW0SfIgFCB9jG4J20jbLowNf+zgTgopaQ68JweHx6yZVz7NTo
	 NcAw8Ae2AHeB+f3gRWZQJyQ72qD1QTNnIiyBrAMqNTH7HIQdYsPBHQ+fopzIdZoTs7
	 vgXlR8iJ0zhsQt9WWdi8MfWF1dpi5CqadCfo3M8BAC1priBO8pVw86XG/E0Vj/DaVo
	 zKTe8VvLY0Vvg==
Date: Wed, 5 Feb 2025 12:39:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <173878077870.2290384.3805470934352312489.robh@kernel.org>
References: <20250109154149.1212631-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109154149.1212631-1-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_103953_753286_1FCA7671 
X-CRM114-Status: GOOD (  13.05  )
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


On Thu, 09 Jan 2025 16:41:49 +0100, Lukasz Majewski wrote:
> This patch provides the DT Schema description of:
> - powertip,st7272  320 x 240 LCD display
> - powertip,hx8238a 320 x 240 LCD display
> 
> Used with the different HW revisions of btt3 devices.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes for v9:
> - New patch
> 
> Changes for v10:
> - None
> 
> Changes for v11:
> - Combine both separate dt-bindings patches for powertip,st7272 and
>   powertip,hx8238a into one
> - Drop the quotes for in "title" entry of powertip*.yaml files
> ---
>  .../display/panel/powertip,hx8238a.yaml       | 29 +++++++++++++++++++
>  .../display/panel/powertip,st7272.yaml        | 29 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> 

Applied, thanks!


