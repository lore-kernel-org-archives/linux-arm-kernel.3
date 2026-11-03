Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F6A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21sCTuwv;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LPDHmzBY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2BZzHGBrxrDynjlciM/IOkYpoWMh/eNmCaKGvdvZKlU=; b=21sCTuwvXbBYnDIvF7r0Zz7Gfd
	ITksNiUPEyIBkVX4Bbd15oZepCucfG74AkjzCSERrFyz6GG5GP/tRawrTwHDkS9Nk+3EyXLfnOeXj
	V3WpyHkL31vhv3TszbAgeUf+mqrqR5WjxdJXxtaBycl4Pz250VolQTSQcAXNeCsRJoQKIzAAaZVMB
	CfEOWPptmU4e014b4RpytGuRspzYNo9ZyFLND8+jWKg98gSz8jN/m0ibXidEDJiPGkgkDxBeIP4PA
	wOn+f09WxnZL/Q61V0i/pgM9alpenQclOBd8No11E8qSa+lRE7l4dYu17jorgM3rEKn6KpBfh5aY7
	SUqDp4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCFm-000000027VO-3uzq;
	Tue, 03 Nov 2026 11:00:34 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCFa-000000027Mo-2dhh;
	Tue, 03 Nov 2026 11:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703623; x=1825239623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBngW06WVi78h0U/JDu5fLgTFSHgLjUZAJXfg2OnldQ=;
  b=LPDHmzBYWgYTDuE9u7X0FBE6bDoKWXc6xYJ0PHi935pK2Z17p9R5qPLt
   j70BNTLsJP4A1DfSZImBg7vIKFX8/QLlWuQe1n+ecgtPmx74DNMhLA49X
   jXMQT9liYAYlfJzb4cCYadONm+WtDqxuiz2eu4AJE8W3HyoSSs7PPH40k
   iHyL4XYjH5O6t9cNn+E9SHwQGkKVc7W1SIoRP5Z1ygRTABKhqLlBJ/c13
   6n5opqPSTZ31bLsRWmCZEcjznRN2AMO54oAauLrPXtMaN386twwJ/SfdI
   b7zMllumhG1adJVA6EARbB3h5X9l+tXIEy02Vg5SnU7PE+XrrvQhXYuPM
   w==;
X-CSE-ConnectionGUID: XBSG4uJLQieaHEKfHSEFbQ==
X-CSE-MsgGUID: K9aq4+0ISaCkESNR2vV2Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2301523"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2301523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:00:20 -0800
X-CSE-ConnectionGUID: E0OVLXAoTmOcIIkmeYVOIg==
X-CSE-MsgGUID: 1yLoundNQbiBptQGYregdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6238771"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:00:17 -0800
Date: Tue, 3 Nov 2026 12:00:09 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 2/3] media: rockchip: rkcif: add support for GREY and
 Y10 formats
Message-ID: <aum-kOAg9dm9KZdv@mdjait-mobl>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
 <20261102-v4l-y8-y10-csi-vicap-v2-2-0a4149d96dae@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-2-0a4149d96dae@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_030022_772751_DC159D49 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Hello Quentin,

Thank you for the patch!

On Mon, Nov 02, 2026 at 09:22:43PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The OV9282 camera sensor driver can output in those two formats, but the
> VICAP didn't advertise support for them yet.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

