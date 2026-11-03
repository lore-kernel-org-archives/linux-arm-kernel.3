Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963CB6082BF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PA4iAaTV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aAEEOYGb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wNK5yE+IKNHGruns60ZbB24xYrrfVH266RRG8NSyk88=; b=PA4iAaTVpnsWBQsr0+x9tFiDt/
	qwajHdlqajBZ82/GFS6Zk8/O9M0/TRscYH7coekeBBOKz+/e99ZeLr0nq4m/+mTT5PwurnhVhFSxK
	LhZB5vpzMCPg5PltmzlOgAxLrcgrGuJES10E4ZCnaWrljMOJNZEb4Pz708UWnKYC+HCJLJ9jbXHmD
	+W4Bid5hxXcoSNcH2z2wyrYkBAxWlprTGDsNxqv9uaOR43U1cu7dbW2WKCFQmxYuraRheNqmvqy8l
	CXlgOTl1SmFKDeSxlDPrvKH50zH+8TU15B07ppBC1IXIja3rkn4MFZ8eR+XgNjt7GDSfLLvIJWxK2
	WF835glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCvN-00000002FKe-2Kal;
	Tue, 03 Nov 2026 11:43:33 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCvJ-00000002FJo-0NCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793706209; x=1825242209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R33tyjVH912C46YNAFlpD0lwhhatqNbKNycpwT/u6J4=;
  b=aAEEOYGbU30BV2lyfOht2ih5/h4vqg5XttNIeGCtgiPoNwYF1M9eIuvq
   rwQOvj9zi48pO4PQDaZ57hlbSyLOx6w9o7VluaLYWb/ZyNT08lwJxq02d
   YylDAWMyzDK9DOVRowrkI1yXfBWj3pGqltw1dEJDjZEP/ChXfy48DYWcd
   gygbYLS9ANwTpTvcwtoo1gxMQOy4/OtvILmZU40JcBJAjGdtiTWfBfKZE
   93RDJnhOjKQbTfvs0Q4Vfkjmag67dzOCd25aptHq5YTusXaR15otezDhT
   pqrQuQi719W/mJ/v5AsvnBnhAfJsv2jpSVshCjm7/WSvFdLEjJiUZGsbG
   g==;
X-CSE-ConnectionGUID: kt5ARTNRTl2weho26ivSng==
X-CSE-MsgGUID: pfUIAzkNQZuWpFX3rpPPgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2303797"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2303797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:43:28 -0800
X-CSE-ConnectionGUID: 07rTJIgmQNOYDJMCTvmoWA==
X-CSE-MsgGUID: FLQemTavQVC7wR+jV2LW6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6308772"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:43:24 -0800
Date: Tue, 3 Nov 2026 13:43:22 +0200
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
Subject: Re: [PATCH v6 1/8] serial: 8250_dw: select port setup through
 platform data
Message-ID: <aunI2triZPyB3_Dv@ashevche-desk.local>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
 <20261102-submit-h616-uart-fifo-v1-v6-1-25afcb346b0c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-1-25afcb346b0c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034329_171019_F9975F34 
X-CRM114-Status: GOOD (  11.41  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:55:16PM -0700, James Hilliard wrote:
> Select feature discovery and DMA attachment through a platform-data setup
> callback. The generic callback probes the optional registers and attaches
> DMA when a FIFO size is available. Integrations with a fixed configuration
> can supply their own setup before the port is registered. Allow setup to
> return an error so integrations can reject invalid configuration before
> registration.
> 
> Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
> platform and continues to skip optional-register probing while retaining
> its DMA setup. Select the DMA setup helper directly for this integration.
> Keep generic setup for devices without matched platform data as well.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



