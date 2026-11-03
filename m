Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C829606A806
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QCJaGJWf;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jz5uDUgG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8a26RZ//Qtg7PWOhT+gYNdz+nzXL3hIE2ryE6muV1To=; b=QCJaGJWfGzeEtMpDe+1pFV0NAZ
	FPFtElf/lF3Cf2kYDVGsWarIlaxrYGHpX9j1IXGaLxZmBv4Lff8ZNMDsWKNWyCVyrCOiS8VjHkCRs
	ksA+fVzc9jI2a1hNYXYFZ8Zjw67MGtsuacROESLZ4BU0n3Xyo8bmCClJY1kZqUgcqMRCpuQ5R8ZHV
	TnmtX58ta+C6bbXuUQPou2Ei4KcGeNwFAt/SjtgSiCDOsqjl02kqktPEUTbtdw2t1E47ZeN8qs9mh
	gPcuIoMEPfOR8ddJFz9WmQGdfRkk49XkvSLroIzTFyWESiYvISwPSwUk0+aD6sx2EBOh2HwKpOeCx
	HX1eb/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCGk-000000027q7-1afI;
	Tue, 03 Nov 2026 11:01:34 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCGh-000000027pP-28oX;
	Tue, 03 Nov 2026 11:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703692; x=1825239692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isPyd43z5OJvaqRmypRcgJb/3JEcg26FGP9GNU8Jnxg=;
  b=Jz5uDUgGDHIzX9TQrFvoLaebBVS82yikNne56wDNoWQnd/Na88JViFoh
   Gc70svTFs1z/RyNEN9ya/JXPyYteKsNaAzZUiubz9WAzldkgrnJsbmYFp
   i56MfnPVCZ+82+oZf6uQy1zwPEX0f6NaNBmiPS3rCMWfwsvOm8WZzT0Xh
   y9albzXQ4zD8bXchacEwgCbPeMwGmswdWgxS3oV0H2v0XlNFbbhiwXoCt
   CNLKYEJNCgV+chJR9P5+YQmTDm7Ji34zIrPZM3UA9BWtqSeScJdSeRnul
   6gC8uuMbPuHQsCO0fH5BSCunwL8Ra1WkUsFLzd/mWOJ45l/LTq/bZXfEd
   g==;
X-CSE-ConnectionGUID: RyjAcUBkRlGKN+Ks6GNUUg==
X-CSE-MsgGUID: T42yuiqhQnCZTMuMWgbgJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2435500"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2435500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:01:31 -0800
X-CSE-ConnectionGUID: /lpbiyi9SyyhftS+tJ0+Pg==
X-CSE-MsgGUID: DTOZTd/bRieydkAcc32OPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6720677"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:01:28 -0800
Date: Tue, 3 Nov 2026 12:01:19 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 3/3] media: synopsys: csi2rx: add support for Y8 and
 Y10 bus formats
Message-ID: <aum-yLwvGgNiTmP5@mdjait-mobl>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
 <20261102-v4l-y8-y10-csi-vicap-v2-3-0a4149d96dae@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-3-0a4149d96dae@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_030131_583236_66C2C332 
X-CRM114-Status: UNSURE (   9.64  )
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

On Mon, Nov 02, 2026 at 09:22:44PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The OV9282 camera sensor driver can output in those two formats, but the
> CSI2 RX controller driver didn't advertise support for them yet.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards,
Mehdi Djait 

