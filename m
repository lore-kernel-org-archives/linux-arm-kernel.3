Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xDqQ1ZFb;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=STwM0+9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Udd4b3hqYW73jXGQP/nuGmi+H6DeMLECfO5utI+4rqM=; b=xDqQ1ZFbtg5lx4BJHckpL3CTMD
	eCJt+UrPKl2GcMpvx2mqg/ArTg6DDGCX1dCq6U7Aeb9juKc+c+beKc3zbw2cdoGUCpbKke2imI6Nu
	giXTkKVOXh5Fvs/GtM9d1hjioVA0CCuYjeevgImoRdgqFlEiIlVJfAyz5Vuz0xUNuV466xcjqzUnn
	d/fPwiFUe+bb2/d5UQYW5uxg84jjb03TDYhdzmtO1GjLI4qf7fdq8a7tE890hcas/7LiCM3AvFBly
	EclPZT31Dt5xY8w3Pz/7WxQsjirEw2D1fVn0jhF0oibeCDOD+NXQDqGZ3/K/Bx4zn25Mr4XpMJxPc
	IOvmmyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzSe-00000006bNf-46dU;
	Wed, 28 Oct 2026 08:56:44 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzSI-00000006bDn-2rkK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793177783; x=1824713783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+FW67hCHNVW/28PUiBcTZ5ylUucOB/eNbJlsjZQ+VNY=;
  b=STwM0+9ZgJ+fIqHBJzrcaTpRfJo/g4fb1kUyeX3Hr7qNVUf5CXRWDNQ9
   IlLaxKcn6iLuXCM+umIL38dLDhJdSBrDFowCO5fQtBKO92ZvlNqILMDOy
   TY2r6hPkbxQ2NzGSsszgkkGqZREYSGI9sVOLTMJ2GB8Rq7nRqt3JFgw8A
   VcgUs0VIDfAPxkkdgLaF5mSyZcQ/2De67taJXbJWBQXw3pV+tNpLAbAoP
   lYzk1jQafw7BxSiyiMxyMR6AJP0wvgdw0xFzXjR4PVjvkmyNJnVfWYKa7
   O8umGFUpSRLJSNHQiO+KkeWxK1A41sbNJe+bMFeg6SAPtqn7Bf1gM2sDu
   A==;
X-CSE-ConnectionGUID: wnHVMo9iS2ShEUDVy8Cd9A==
X-CSE-MsgGUID: uavl/OOMRQuEomukESXKEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1779030"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1779030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:56:20 -0700
X-CSE-ConnectionGUID: 3iD4nZurQWyZoQy5b0BrYw==
X-CSE-MsgGUID: pCxkqi9iRbeXb6W3eJ57QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4718097"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:56:16 -0700
Date: Wed, 28 Oct 2026 10:56:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 1/5] serial: 8250_dw: select port setup through
 platform data
Message-ID: <auG4rIHPQZXKOd6j@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_015622_769810_0B33E204 
X-CRM114-Status: GOOD (  15.12  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:05:29PM -0600, James Hilliard wrote:
> Select feature discovery and DMA attachment through a platform-data setup
> callback. The generic callback probes the optional registers and attaches
> DMA when a FIFO size is available. Integrations with a fixed configuration
> can supply their own setup before the port is registered.
> 
> Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
> Octeon continues to skip optional-register probing while retaining its DMA
> setup; on 32-bit builds it retains the generic setup. Keep generic setup
> for devices without matched platform data as well.

...

> +static void dw8250_setup_dma(struct uart_port *p)
> +{
> +	struct dw8250_data *data = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);

> +	/* DMA setup requires a FIFO. */

The style of the single-line comment in this file is without period at the end.

> +	if (!p->fifosize)
> +		return;
> +
> +	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
> +	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
> +	up->dma = &data->data.dma;
> +}

...

> +static void dw8250_octeon_setup(struct uart_port *p)
> +{

> +	if (!IS_ENABLED(CONFIG_64BIT))
> +		dw8250_setup_port(p);

I believe the Cavium OCTEON  is 64-bit only platform, so you can just drop this
conditional altogether.

> +	dw8250_setup_dma(p);
> +}

With this being done, you can kill the entire helper ad use dw8250_setup_dma()
directly in dw8250_octeon_3860_data.

-- 
With Best Regards,
Andy Shevchenko



