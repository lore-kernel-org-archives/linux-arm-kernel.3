Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8888C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 01:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgqQbcC4Ac0v2YdyZ7o/7PpW2o0/Jn3QFWS121gTOFM=; b=olPdELKOr8gIOrPc0w5AA6lGxW
	LUalHhR92C7a0fdbg9ve8BBmaqpjd40eYJ9R9NufMMaSDIRh9kU+yvOX6BA6A7it/r7y+HzF8nVbD
	iSyL4VA/MoiWI+NMCFNUEExTd7QCoyWYjI5Oka8TTpEyVlm8+csPzcm3Bw8XIuadNi5XZhGUBG62p
	XJmqUfuZYDg+mujLrOY+3X369kB64V8dn7PnBk5zzxjGxlHbYIzmQ7XLPG7cmSQ7ZCKKeSU9x6DIc
	/BtpIjeFyJRoLNp7Ba18sOxdoPTO6qJblCIOxBf67uGs+KKF9xglDHSChtTMv6PJPGtjz6jnpMCzm
	bWr8y06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72PP-00000005W2d-2VNH;
	Tue, 22 Apr 2025 01:26:47 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72NX-00000005VqT-3AxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 01:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sgqQbcC4Ac0v2YdyZ7o/7PpW2o0/Jn3QFWS121gTOFM=;
	b=ccggECoIV5cjU/T7WXevp9cZmZ2ebAt/jWpnx2F7PCBHiz0MlPgvTLRPf+JRMj
	e2nQVZFfsvKxaG4mYNBWi5c5rSU1jjqptuZ/UbgjinMSXg5qKGSczsBVgmgfkrdt
	gWdYZlVA9U2i4iedmoBpO9qjSvak3/kuD7TtP5oJO6zUM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3b06h7wZoBuypAw--.471S3;
	Tue, 22 Apr 2025 09:23:48 +0800 (CST)
Date: Tue, 22 Apr 2025 09:23:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, marex@denx.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v7 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set
 lvds-vod-swing
Message-ID: <aAbvobSqxSLt+uFC@dragon>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
 <20241216085410.1968634-4-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216085410.1968634-4-andrej.picej@norik.com>
X-CM-TRANSID: Mc8vCgB3b06h7wZoBuypAw--.471S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcTmhUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRI3ZWgGsHT8JwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_182452_142982_5562327F 
X-CRM114-Status: UNSURE (   5.92  )
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

On Mon, Dec 16, 2024 at 09:54:10AM +0100, Andrej Picej wrote:
> Set custom differential output voltage for LVDS, to fulfill requirements
> of the connected display. LVDS differential voltage for data-lanes and
> clock output has to be between 200 mV and 600 mV.
> Driver sets 200 Ohm near-end termination by default.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>

Applied, thanks!


