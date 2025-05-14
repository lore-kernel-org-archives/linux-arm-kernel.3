Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FDDC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhClRZd9u2fVbJeHjTJbnbVMboM2vvgj7V8pehLdSVg=; b=IRJAI3bI2b+LrvWk+r3PuSmibC
	KaxubmQxGIk5nTt8MvqBlnl8mho7Pne4Gzqy0p7djOXJ3di2ycrRKAc8LpLhRoLM6QjLxc7VmGWQ+
	DuebvrtQ6pireEpbXCFUGep87Gub73Aj8areRP4M2AjBeb10MPmVbGijECh31SqB9j7rmTWZLDKTj
	0uwS05rwv/7cAHAIQoGwS9kqS7upIjw0Gkopy1OsQMrZMoueMzCfaO/23zWg5JgqYwsifhHlEc4bd
	u2Fuy5CLysW8aZuuCxTwvmVW2PkXe/4evlS0ap9YJyleH+TSQWdgRRMmvfCN3Y9OtglZVWaUCK3//
	LUAd7Iag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIX2-0000000GG7g-2Vfp;
	Wed, 14 May 2025 20:16:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIT5-0000000GFbC-2xpK;
	Wed, 14 May 2025 20:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28E4C61155;
	Wed, 14 May 2025 20:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB4FC4CEE3;
	Wed, 14 May 2025 20:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253562;
	bh=OzKdPvbRk8hZ5qrmc01ogW5Qt/80h78/YBJYjWWOc4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjrD7uF3s4MzpmCi5++bmuEF1uYLGz2YMBnsiMqoFW7YDj5mc8aOQESHbZu88v1DH
	 /d18hc+b+qCiFIU8wjE+VT3AUBn0WHkoTjMtfQSxakcobRGXhUIUhXcjPqfE+3ENm4
	 50iYiKTv8Q57RXy9OlgNnwEWWkUcdDj30VbH5Lu0yYNjQhv5K538xqA5La1qGLzQyq
	 J+Y37RDoc0V7KiNuD3QEUxsqrff7ZF0EBInFFBUijITqyrdwWAepJiQqqBBdPcRYzZ
	 baQkY+Gry6SJbiMS9tY+h8YfTzXl7CVbMG3lItpymdu1EpEzqXNWmzOfa9fyCEN98Z
	 xI4qL7dgk4dgw==
Date: Wed, 14 May 2025 15:12:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicholas Roth <nicholas@rothemail.net>,
	linux-rockchip@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: media: imx258: inherit
 video-interface-devices properties
Message-ID: <174725356050.2958291.9709026924364137236.robh@kernel.org>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
 <20250509-camera-v3-2-dab2772d229a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-camera-v3-2-dab2772d229a@bootlin.com>
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


On Fri, 09 May 2025 23:51:38 +0200, Olivier Benjamin wrote:
> Update the IMX258 binding to inherit properties defined in the
> video-interface-devices binding.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


