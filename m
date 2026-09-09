Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA81C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHgUijc5vPlHoNasDHjsFJ3kz5HjmE2t49kAvqhiWGI=; b=ZWB3Ox0/7oEZCXTKR0bW+TObQd
	uhgNVyrlZTJgcyehMGqiOhJvNwy2zGIQ1c5P8iJ8bXPYVe05feXT9MYOdIwFtCFZJPQGG2NBRo5oP
	adCIu8xjDARCl1/2dpT9/ET8zROeesDXzB2N7I3dAQcztBKKcYgfzBWsGUImdLWXBt+BkywmAE2QA
	V5Qf1ZWWiYE5q2acBIyK2iVtjuTDTh81tIy+QJU5JZaTL6KdZR6/iM0N2IZDM7w+s8hohp0xm/HN9
	Cq2ln3pa7HND3mqoktopJHlrhD1zL0hXvtGug7/OQvDhYmnOwb3JOIz3M6egs3ddkFBI3mQhdM4Ym
	KchRALdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Njk-0000000CgQE-19cO;
	Wed, 09 Sep 2026 19:13:36 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Njg-0000000CgPM-0cbA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:13:34 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 290D220B62;
	Wed,  9 Sep 2026 21:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788981205;
	bh=VHgUijc5vPlHoNasDHjsFJ3kz5HjmE2t49kAvqhiWGI=; h=From:To:Subject;
	b=M2S3MVS6V9Zk0gJ0Rsy9dth6sRa0veNstdOq5lQXRtTIoUd/3itXFBF0culKlWDlL
	 Fgqa1g+sZTO0CzSWGqZp1S1F5BwaNNZAuaC1PIXtcJZx+NcxsKQ9ISSc9ixWpZVmet
	 O6yAWe0dS7BobfYaLylHFo9zkZol5Ih2LMPZOps0EPgTsB6haCQ2WbWeXDpKKsroj/
	 u/aqarnGajx3VXWN9+tLoukIClg6AWRz/oNFKU2bevVtVs/o8C3HLLj76pI7N4j1kX
	 vX/UGS149sdZuK/yBspL5QbiuCUt6mD6Hi7WC6nXIAIimc1HM7TFYAhr+43WIb4mQW
	 1AhwjhPMngpew==
Date: Wed, 9 Sep 2026 21:13:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: u-kumar1@ti.com, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	leonardo.costa@toradex.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <20260909191321.GA23582@francesco-nb>
References: <20260909181332.1081552-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909181332.1081552-1-leoreis.costa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_121333_265760_3985BF3E 
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

On Wed, Sep 09, 2026 at 03:12:09PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>


