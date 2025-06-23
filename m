Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E21C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF90YOu/xZCEJdWpWRxJN5Wl+XS+zaJZ9MhHtd8FJD8=; b=yxkQ5zJOQyAQMpfhGNm644NabM
	ZEcySBt6ZvoaQfFMriTjjofeqahvFAAJKjvsejusiBmaiw93enGMtrOKUYE8rqoYYdcMiS6jQlqIQ
	nfGw95iOPAiTah3Gp8BbVwOlhLeRCwRi7Xuqs8uThq5wsY1cwutY6em0Kklhkk6Gi0rxoo5WHVt4F
	NDT4a1Z81ep5TURqt6DvBbYPWIW/rzccQJVgPuzwiNtZVJHJZ1Ec35hupnnxtFZ2pdiOCAY5OMiUD
	0m2K/PnPADrnAML+zgsSa2I7mHpwnC7N+M7ej7iYyNKCoaMah94UdZeoao96J9lG7Umpf/jEkF6Nr
	z5PfrG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkc4-00000003VhA-1aqM;
	Mon, 23 Jun 2025 17:05:44 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThde-00000002wgy-332y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 13:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750686911; x=1782222911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jLWJrmtgJQZJVJKqAox7BA1rst37kkty3zeUjLnbPQY=;
  b=GDjV/Efceg5tiPMTAH1kChzm/gtguCbEhcSlCsBJGqCVkd2qOiqSbn1f
   VztxJzRXRN0XqjJt+xhJyiWwV1r/t321ryguoTOKw0u3voBr2uveFBsHS
   9sDi9dYPiFTL6ll00FJkOfP3eh1kYJqK7maL0+ik2AfzgIJr3evwloo7s
   wgpKhjogsk6SE+AJ2FsRxtogrXumcGZtKXHWUVwoc5OgcgRmwcYrM00cK
   dENgvNT6zckwra6QDar8B5dcjguXWrw77A7WRrmBlmbaHUyBEptZRL7kQ
   raGLtRh3YnzbatuboVuwY5INPzCWAlOrvkSoEJTm5RrHF97f6CcN9QVgv
   g==;
X-CSE-ConnectionGUID: 0S1hssNIRMSy3YSf5YpS1g==
X-CSE-MsgGUID: K15WiCZvREOqGmk0g6aUDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64326480"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64326480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:55:10 -0700
X-CSE-ConnectionGUID: Kum29rmQTeCauBg3e0FQ0w==
X-CSE-MsgGUID: miDSXAgITfqad7c96MLUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152287874"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:55:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3C08511FC36;
	Mon, 23 Jun 2025 16:55:03 +0300 (EEST)
Date: Mon, 23 Jun 2025 13:55:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
Message-ID: <aFlctybsb-HM8Vzr@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
 <20250621181751.GA9125@pendragon.ideasonboard.com>
 <ed0b8fe3a20111477cafb1de7b399afb99caaa0c.camel@apitzsch.eu>
 <20250622171320.GA826@pendragon.ideasonboard.com>
 <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
 <20250623114658.GB32376@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623114658.GB32376@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_065510_819847_8E610B9B 
X-CRM114-Status: UNSURE (   6.48  )
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

André: the set is already in my tree but Laurent had further comments. Can
you post patch(es) on top of the set to address them?

-- 
Regards,

Sakari Ailus

