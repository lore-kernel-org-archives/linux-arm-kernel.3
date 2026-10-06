Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25C9CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWSs4Kw/X/0e9iE+zFBsnsCjC3xgNO/d+m0BXklci6w=; b=JEYEttOXhmUC3KxldHTVwnqPgj
	8jJvl/znrVZV+Rcprld0lLpMHChkWQDP496OgV2J5m0AQ06ghFWq2zwH90CITxsrUeoZg1OwaGyhM
	38ylmUNcRnmRfFoN2rQqvLi0/fmTBp0XHmmvuoJTxsshu5Ao5eRAYaHHm9/DNav4fIWOueDqBS6Uh
	07r7W/laOtL8DpCZX4+j7blVDGTjOxoA0nelILEnurfKKg+q3u7LNbsIL/plgegVSmcRYSkXudUfP
	qeSTnMR3VRin91l62tAjLnlnO1JuzO9XGZH9HQI0I9o2/opogBHVZwHr6YD8SNzdMw8SixE+AxI1p
	gBG16cQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzit-00000000Cdk-2wiu;
	Tue, 06 Oct 2026 07:36:28 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzir-00000000Cd5-0dT8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791272185; x=1822808185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yeWaKhrm+WR9bLBovNZ3j0cg/B3ktN5heCYTCG/FzqU=;
  b=BD34T6utnmlmZYOrv17K9tKONFIiDG571QCIabiHvAvwIOQuk4O4IWbx
   Cs4izXvqPWznvHQVs1VULrH9bUHo9MCbp7bpnzWYzZTnAGhaWSuTx9RBC
   dksSC6IY/VN3iivg7Mr1Dj32fi3q++we2vha+RVKU67wiW1Cr8Da0HTDe
   9DxQvmSoQUxwMljGlgrB8f6ejZlCNJHaF8NV6In5YE2nepp2Gz7ymlgpP
   FJM8DHkf9ltv7ufdxHWxt/mlEClGQj0RgYpjeHVv0UvEJh4FzuydE0Af6
   +T61xWOoIjljiEKDK0RLxclkLp4suTJVkq91MWIvCriG9KGlbq6/hsK8O
   Q==;
X-CSE-ConnectionGUID: vQdeIIKKTO+TN0muTynxZQ==
X-CSE-MsgGUID: xGG4JhUARZKoO6Z2av92ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="8867"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="8867"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:36:23 -0700
X-CSE-ConnectionGUID: fvjocqIcQz2EJtYqpGak0w==
X-CSE-MsgGUID: nRfyIxf3T8C0XksoKhGq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1105882"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:36:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D586121BCD;
	Tue, 06 Oct 2026 10:36:20 +0300 (EEST)
Date: Tue, 6 Oct 2026 10:36:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
Message-ID: <asSk9KW-lzuiUJa3@kekkonen.localdomain>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_003625_202519_89592C00 
X-CRM114-Status: GOOD (  10.01  )
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

Hi Mirela,

On Fri, Oct 02, 2026 at 07:16:11PM +0300, Mirela Rabulea wrote:
> Laurent, Hans, Sakari,
> 
> did you encounter similar situations? Any comments or proposals? The concern
> here, to summarize, is: v4l2 control cannot be committed to sensor registers
> right away (even when streaming) and we are also unsure when the right
> moment to perform the register access may come.

In practice there's little the kernel overall can do about this: the timing
of everything is handled by the userspace. Drivers that aren't directly in
control of the data path don't even have frame timing information and even
if we did pass that to drivers, I²C writes always have some uncertainty
(system scheduling, I²C access failures etc.), so one needs to be prepared
to failing to do the writes in time, which would further complicate the
UAPI.

Do you have libcamera in userspace or something else?

-- 
Kind regards,

Sakari Ailus

