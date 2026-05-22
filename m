Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF33FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2te36NQZDmTtHJmgYuEb9fatJ4Px85Y3bWQ849rbEo=; b=A+7dd7DgA1nyQ+dMCz/MIaUiDf
	TB8KKmNXx7NuTzcEvoAqSphUFGjh/bM5C+LpKR0K4GyUIxg630rYjj3cwKAp4ysU4/QQeJt/qoNXV
	u1k6H2jy2SJ25qDz3UlhhUA6mf0SZLZuAy/5HmkWZeA5M1mT5aN/81tWJt5e7qYhVKj1dqpLQVf0p
	2xSpj7KEABVibyH5qP0fY1wPpIq+9WezW175lGDgIJiNCv5Ue1wcy4zvrQqElSkk1PPasUa9JOMmA
	0G/NNpjPMJr0rgt1TviXZ90UTlmAkPocZDskETjUue1BUWC18Ey3E85J59JW6yoNRIENGvemCOPTm
	KazcO1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTK7-0000000BUu5-0DCP;
	Fri, 22 May 2026 17:06:11 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTK4-0000000BUs4-0xA5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:06:09 +0000
Received: from francesco-nb (93-38-247-131.ip73.fastwebnet.it [93.38.247.131])
	by mail11.truemail.it (Postfix) with ESMTPA id 01CCA1F997;
	Fri, 22 May 2026 19:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1779469564;
	bh=p2te36NQZDmTtHJmgYuEb9fatJ4Px85Y3bWQ849rbEo=; h=From:To:Subject;
	b=XssD/oIikPaNYnBLeAVFNfI/G5//1wZChmTJ8UnFrEaVs6G/p+UT2sar2fD9kqTAn
	 VuqxiaPh8MZs4hicXvh7Eu3kNck8ZYl5NUvrJB+diUiyPPb6newfVWdwyfN6qDTIdr
	 mpH0LUp5WLe2WA2C672oldLbKyrWkNFQHL/W0cMVDqJW683sd6FR+5v0iWYn4aa3Bx
	 7fHu3ikC749VC0mMvgxyPyF++WAWruUZl3mIPFt3DfQCjz/KGtgKLCvctqeQ7vKlno
	 uABWthW1AxSTqnI6ONq8bGdlmSltO1UjxIDaiany7k19CN9zBwlpEN8S6AGxsVb1t4
	 20SWXDBCETOCA==
Date: Fri, 22 May 2026 19:05:58 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add display and
 peripheral overlays
Message-ID: <20260522170330.GA126484@francesco-nb>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_100608_420158_9A203A3D 
X-CRM114-Status: UNSURE (   7.75  )
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

On Fri, May 22, 2026 at 05:11:04PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays, expanding the hardware support for
> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
> and peripherals available through Toradex carrier boards and the accessory
> ecosystem.

...

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


