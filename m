Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtsp0NpkPJ4WQ4u/blhA9qZ1XTn9tRUT9Q8TaCBl6ZI=; b=Qdvf3WijYtlo2Amabop6ZgaoFR
	XgJdOby/IGz2Y2He3piwbGMP/0mE4thvMnARFOTat+WMj/xfZiyoMPNueF1sl3iNA6qp4EtXs4hao
	TG2MYzjwnNaEZAUhuZ7zeoqwP42Cecr0cEcBcshSjxTdWpKAc8IuXLK7/gA3N2LYLaDBLNHGWMyTr
	t8wsaMEC12TyVZraPDF+umW8BUry+oyWg61KcifFMhUl7Mb5BhE91iJPcto2hYKPcDThSEnlg6p3e
	oH2r60dGGKFwIFFqmS/uKM/Je6Y5i3c12R0v0VVrHJZHko/MBBPJfVKiSMosuRf1KOgWTdNBmPTQ3
	3PFut2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EMy-00000007RfP-2RDB;
	Tue, 22 Apr 2025 14:13:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D9r-00000007CXj-21dz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C76444DB6;
	Tue, 22 Apr 2025 12:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF79C4CEE9;
	Tue, 22 Apr 2025 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326525;
	bh=5J5vS+tSTeC2z4T6bEh4qSkSbF4o4ICwzhXYHWtnIoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0MKeG0i9UB1rJMZhVnH1wFUcNcgQXUdMCCFUNcuFJzt85/QZH+ittf0htZg4cFSF
	 zp8erxnPGi2pOrvKMLF5aBDtOGxqWr6/7ZsWv7igYe4rFDTJvoDfxvk8ixAMs4Auk7
	 aCWet/lbt2351cFk8n1dg5LUfOO9ez7Mu/jsVCvRCGl7CgukrhN5EXWfVQYP7PipCA
	 N/y53TKsuY11paq2Lz5R8KweS+rdnG+vSqmNwqw550FL8dG0vYTeGRZxRdMxexyPeC
	 FonJtKBeOh2yKCTOU/DhfQhIB0fA9IvUuewD0tzPo1Gmmu4sxPEh6XeAxZlshg5RUu
	 03dak/v+xBmeA==
Date: Tue, 22 Apr 2025 07:55:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: convert ldb.txt to
 yaml format
Message-ID: <174532652176.960722.2664945532929851168.robh@kernel.org>
References: <20250417145742.3568572-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417145742.3568572-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_055527_541209_E918C576 
X-CRM114-Status: GOOD (  13.81  )
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


On Thu, 17 Apr 2025 10:57:41 -0400, Frank Li wrote:
> Convert ldb.txt to yaml format.
> 
> Additional changes
> - fix clock-names order to match existed dts file.
> - remove lvds-panel and iomuxc-gpr node in examples.
> - fsl,imx6q-ldb fail back to fsl,imx53-ldb.
> - add fsl,panel property to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - use oneof in clock-names. imx6dl use imx6q-ldb comaptible string, but
> the clock-names is the same as imx53. To reduce dts impact, use oneof to
> allow two group clock-names list
> - fix typo pannel
> ---
>  .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 194 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/ldb.txt   | 146 -------------
>  2 files changed, 194 insertions(+), 146 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
> 

Applied, thanks!


