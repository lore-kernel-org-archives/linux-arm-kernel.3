Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BABCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ck+TzNVilqQY/t61zy/0IPuuHN9u4piAsUrgySTcPUs=; b=vxJ/MhCKDOcADp0Ed5W08A8rEa
	h/dkLOeEzqVsN9uG4v1siohyT1I3ydeyYtcKcfzUDzbjK2xetEHd0zEFVZzeVnYAvZO+GJ2uEAHwi
	fNAnDkVtqLwek8Pgk9xX7mg4XMgtsCRFUids4m2aUyawfrVdA32DzcPS+sS/MDDoLgz0BrTlx10kS
	beT7YgMTr7EMXPWLS3N35Jraam5WyVruNDmoW5/pJ0AT5X1QWZoiAhxTHiXyAJJzitpOEY4IZ0LXM
	LKUHM1wxgQmhnuodLQjPcf0RNL68eeQVvtr4J3mGa+YEmqRct9W5SsynaDkzTQhVt2rzx77XmkiZ+
	bQVa6Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9in-00000000UNF-0psA;
	Mon, 28 Sep 2026 11:40:37 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9ij-00000000UME-0ueW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:40:36 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 692D21FCAD;
	Mon, 28 Sep 2026 13:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790595627;
	bh=ck+TzNVilqQY/t61zy/0IPuuHN9u4piAsUrgySTcPUs=; h=From:To:Subject;
	b=RxelkcjaRglR3eb2moD+QraCo7PnUyVi/lf+U/cFdD3THIO9n9mylKZp73EuOyyut
	 5ocDi2VCuvtdt7gyFEvLG5s94oX0jVT1W0rIQvqjuJw+JFGr7SbLIHDJe+zyz7p7b8
	 JZXWmQoIQpl2WFqNOrgaQwj9I23fxizVRLlnOKq6Zxc/jr2vimC+pzQYuCWaishCCe
	 30QxymNkbJNqitbj7E5BhLoe6NrBVDENaVe2YGhzAIJvJiQXbRNQ2ECpKYmfn4Ar5j
	 2SI8yxIvZNRelfBXdePXtKtG4M3EI3Pg0BYZF18yyS/VKPe8DaUgLO0Yeb89aqjV8/
	 0QdpeUkZPFlMw==
Date: Mon, 28 Sep 2026 13:40:22 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v5 0/4] drm: mxsfb: Support LCDIF interface bus width
Message-ID: <20260928114022.GA67479@francesco-nb>
References: <20260917140042.118181-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_044035_145039_74E12E01 
X-CRM114-Status: UNSURE (   7.77  )
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

Hello,

On Thu, Sep 17, 2026 at 04:00:35PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The width of the physical LCDIF output bus can differ from the input bus
> format advertised by the downstream panel or bridge.


Can the first two patches be picked-up by some DRM bridge maintainer
(Luca?), so that once they are in next, Frank can pick-up the two DT
patches?

Thanks a lot, appreciated
Francesco


