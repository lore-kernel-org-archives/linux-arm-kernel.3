Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A56B606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CofBFS5t;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YNG2MirY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g3rGNVvOS1oWZVgZ9/2cJCzlhYQm99f5FRWSO/pleRc=; b=CofBFS5tyoCk+3NP/sQdlvtbp4
	hZJOoVk498ZF7y6dsWc9tiUwO63kJ3ZwoTD7T/7ZUzo6ROY3Me4KrYt/lmujI9ubVnjhSOWm3NOtH
	HNI7IEFmtVt4pp0CFV2A+SSiCApoS097S/UWS/YwSDDSH017wcKeH741SGWfIMpg2Gcrf9NcbGKyy
	bPVKNMb04oUmsk7KxjH2ulSKtKXh0LjBUOsJHAONpLC7K96MLf80TUXCpGIr6zW1y6B1ImEDNSPq4
	PGdRhSURSJ36dyhkvuiB1boadjsXHd6dsZyVj3Td2b4p+YvyaWGfKTvEmyMMzmT406Yidt8novLa4
	fwT4tzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYTz-0000000523E-4By6;
	Wed, 04 Nov 2026 10:44:44 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYTx-00000005221-2EV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793789081; x=1825325081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1s955WMmS+XVS3lgkXpO+uhYMyC1nNQN3ehFdSfyEhg=;
  b=YNG2MirYf7qSh4Hl88ZX0XgRHbvnmVHXJ9eq2npQYZsv3cWJmHYAfXsP
   /5k9SaeOFZEutVkkw5AaPFqcp4Eh2EBft3VVMMwvjEkXNpmcmGr5xMtJU
   ulx+BpdMwNA8xAt5zvZtsiYMyFbqxD+jE7Xqqx48hC0q2Uds4ppY1PkcX
   fVfxgfLkFs9CfVfNGQjb+hyJguuvZDLWKWMEcJwNPZSpjJOZBoxRhTR8Y
   Kp1bvtQRxQfJpIBYVnnjrYpQgo3gkwtm19gJFMR0S9NOJuMZJoqtnJLk3
   mei9AKKwoGETnCm2sQcEg+DK9HM/q+WL7TbOdN1d6uxsgLQC1HnICeLe3
   w==;
X-CSE-ConnectionGUID: TTZmUiO/QtOOiD+5UU5Mjg==
X-CSE-MsgGUID: MliKDpm2Sw6bMGLMrD2/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424433"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:44:41 -0800
X-CSE-ConnectionGUID: M23FiearRYm6Jr0M4io4Ag==
X-CSE-MsgGUID: 4Gl93YrpTUqFiwP2J50+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6542311"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:44:37 -0800
Date: Wed, 4 Nov 2026 12:44:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 10/12] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
Message-ID: <ausMk21A5PPAaycx@ashevche-desk.local>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-10-c9e248d685c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-10-c9e248d685c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024441_606010_7CEB2CBC 
X-CRM114-Status: GOOD (  17.02  )
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

On Tue, Nov 03, 2026 at 02:40:03PM -0700, James Hilliard wrote:
> The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
> on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
> its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
> offset 0xf0. The field holds a byte count, not a logarithmic encoding.
> 
> Read this field in the sunxi setup callback when platform data does not
> provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
> its 256-byte configuration without accessing FCC. The probe has already
> enabled the clocks and deasserted reset before invoking the callback.
> Leave the FIFO clock-control bits untouched.
> 
> Use the shared DesignWare trigger setup to validate the depth and build
> the FIFO-relative threshold table. Invalid depths fail probe before
> registration instead of producing zero or truncated thresholds. The 8250
> core derives the transmit load from the discovered depth.
> 
> Select this setup for the A523 compatible. Like H616, this integration
> has Allwinner-specific debug-divisor and RS485 registers overlapping the
> generic DesignWare feature probes. Use the common sunxi PIO setup,
> BUSY-safe integer divisor programming and software RS485 handling. Keep
> the APB clock gate enabled during termios updates with SKIP_SET_RATE.

...

>  	p->type = PORT_16550A;
>  	p->flags |= UPF_FIXED_TYPE;

+ Blank line in this patch.

> -	p->fifosize = data->pdata->fifo_size;

Perhaps a comment here

	/* Apply given FIFO size or try to autodetect it */

> +	if (data->pdata->fifo_size) {
> +		p->fifosize = data->pdata->fifo_size;
> +	} else {
> +		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
> +
> +		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
> +	}

Add a blank line here in the previous patch.

>  	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;

...

Otherwise LGTM.

-- 
With Best Regards,
Andy Shevchenko



