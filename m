Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A488DEDA694
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIABMziNLvW0jGN8kMlgpZrAq89Imgr046x+DRl4Rp0=; b=CyeAg01q47osDI
	GqWLp4ikQ74F9sd689hzNcVuYHzOr9IN03t7MM04VwXbTOkQzBLu8RPx8E2HdT8vOsay6YpXNWqVk
	PYM+91mLdCGzb/m5KGMM2iozV42eIRRyE8sCQuQIbFuViabXNXOZN3STFehI7hurqvHuC18/Y63Kf
	IsTasN0z+9wuJFN5GaLZVAtzwlTI8EhPcbqDrfuS2Jpy1/DNodpuk8Ml2+1k4Jyd+78ocDyY6Jzx6
	GP0+kaFF4a5RE+uh9sYITlqdg5HJbXnmpqYSfekdZHMPhoRDw6deOWD1Yv4bgPkRTxuonwQFTR/gg
	x6ygNbHPlHuj7qf1P9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSWd-0000000FYSB-1vmp;
	Tue, 03 Mar 2026 16:23:11 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSWb-0000000FYRR-0rie
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=dIABMziNLvW0jGN8kMlgpZrAq89Imgr046x+DRl4Rp0=; b=pg6KN0dJ5ZW2AM6cCDdSSbnuh8
	PhW6AkE7BgkA004hNmbRR18mGBAQhSx99q5o9AAXWurQ7v8cqZw4Sy816/wAn7HandtGwvps2gs9f
	Rqcam9kTr/6hJ0oAXcGwT8kAE04C11Py+CCOXtzokRwkAzZE0Z/Vid+3hcaJR9LmbvjM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:35704 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vxSWF-0003Ms-A8; Tue, 03 Mar 2026 11:22:47 -0500
Date: Tue, 3 Mar 2026 11:22:46 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260303112246.0bd6238aba7489b6de499299@hugovil.com>
In-Reply-To: <920740e1-5bbb-4632-a62d-325715cd8043@kernel.org>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-5-hugo@hugovil.com>
	<20260303-rational-thundering-firefly-9dcaa9@quoll>
	<20260303095533.1c6dff174f6c9d162d3e3303@hugovil.com>
	<920740e1-5bbb-4632-a62d-325715cd8043@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_082309_342033_EDF107E8 
X-CRM114-Status: GOOD (  24.58  )
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

Hi Krzysztof,

On Tue, 3 Mar 2026 16:19:54 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 03/03/2026 15:55, Hugo Villeneuve wrote:
> > Hi Krzysztof,
> > 
> > On Tue, 3 Mar 2026 08:10:51 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >> On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> >>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>
> >>> There is no Variscite module named VAR-SOM-MX6UL.
> >>
> >> VAR-SOM-MX6? And there is.
> >> https://dev.variscite.com/var-som-mx6/
> > 
> > Ok,
> > I was confused by the "const: variscite,var-som-imx6ul" and thought the
> > description was not matching.
> > 
> > But there is still no module named "VAR-SOM-MX6UL", but "VAR-SOM-MX6",
> > with different CPU variants like UL, ULL, etc. So I will modify the
> > patch to reflect that.
> 
> I don't understand what you want to reflect/modify.
> 
> Description says: VAR-SOM-MX6
> My link says: VAR-SOM-MX6
> 
> What is incorrect?

VAR-SOM-MX6 is ok, like your link shows, but not VAR-SOM-MX6UL.

If someone looks at VAR-SOM-MX6UL, they may think that the "MX6" part
refers to the VAR-SOM-MX6, or they may think that the "6UL" part refers
to the VAR-SOM-6UL, and it can be extremely confusing. This was my
understanding at first, and the reason why I submitted this patch.

If you look at the associated board entry in the binding, it says
"const: variscite,mx6ulconcerto" but the VAR-SOM-MX6 doesn't use
the concerto board. It uses a board named "VAR-MX6CustomBoard":

https://variscite.com/wp-content/uploads/2017/12/VAR-MX6CustomBoard-Datasheet.pdf

The VAR-SOM-6UL uses the concerto board:

https://variscite.com/wp-content/uploads/2019/07/Concerto-Board_Datasheet.pdf

So the description in the binding "i.MX6UL Variscite VAR-SOM-MX6 Boards"
is wrong, and needs to be replaced with VAR-SOM-6UL.

By the way, support for the VAR-SOM-MX6 is provided by this binding entry:
   - description: i.MX6Q Variscite VAR-SOM-MX6 Boards
    items:
      - const: variscite,mx6customboard
      - const: variscite,var-som-imx6q
      - const: fsl,imx6q


> > 
> > In fact, I will modify the description to reflect that it supports both
> > VAR-SOM-MX6 and VAR-SOM-6UL modules.
> 
> Are you sure that it does?

With my new research, as explained above, this is not the case. I will
modify the description to reflect that it supports VAR-SOM-6UL modules only.

-- 
Hugo Villeneuve

