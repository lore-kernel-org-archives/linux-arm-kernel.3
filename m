Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17796070A80
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e90RI7jv;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGBubTkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a+tEIyoGMg5X/kIk5RYaTo3wb9FBGOUfJOQ54VEe2jA=; b=e90RI7jvTN5ui4nbDnNK1XKQP1
	amh11c3N+aQzGhhalTjrSdQqm46F7fzivILvisB2QmQbC/0XCe/JzUrL3JuDy4LU/S4DZ/Pc30Xji
	SI6ee2OSg4qk+WsBSvXhi/rlOPrKy2IfyT+GpHUU09gufMopLnN/YAaAwJOEdXPFpfXupQPsQXpnu
	uLbdC3SGKLKS9cmnJr9li2sUzPa+oCAR76cv9hdhelXztk0nBkiV6lsmi8aoa1mn/JY0sBXMA8XiY
	3o1QcxwGGGVxLu2cZ+YPzYpTZb0J+b7i+14Mh8OUVYAo86MrFiJLgysZbQ4rf03mT0dcAkG1wnWlm
	SKqQSaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCEf-000000026qj-0gP8;
	Tue, 03 Nov 2026 10:59:25 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCEa-000000026q6-3QrB;
	Tue, 03 Nov 2026 10:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703561; x=1825239561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHgNKws9vXz9ZhAyp4mI9ElEf3AipzUq1kc3YQztZ3Q=;
  b=QGBubTkU7eGIEY9dfqOAPkCSoNY/yojc7++ST5pDFlkwNj2/Y6YkhylA
   j8ftrpIUHCHe78o0YuIHpmAKIUHr+7PHt1yLbjQU7AT0VOq9LlNw4OxFZ
   V/VZmvFdI5jf3bf4ASz/isDj0IHsDOEt9K30NLZNhCvZ8W4P0HX4m3cxh
   SFHUibXIkgU0wvKTntU9JkEvcbtwaSpYuuZewVPUPdko14+iLkx6Gh65l
   +CRv6Gxltu5qkoqJTKNM0DsiZ0ZiMtNESoh1mEXb/QqcFCNgMNznCkRs+
   xJqKsqNsXlkty24fV+nnVICmkFWehEpErpZfdYHE4boKmD7vBSbb/11N1
   Q==;
X-CSE-ConnectionGUID: eKVcvPFZSrqEVUlrySmQIw==
X-CSE-MsgGUID: KFMCLCogRn+nFsxWO80cYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2438851"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2438851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:59:20 -0800
X-CSE-ConnectionGUID: 4Fa9DxYETqeqkhNR63VMDA==
X-CSE-MsgGUID: WbvKq0PSQWe7YaZjAHLcLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6408986"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:59:17 -0800
Date: Tue, 3 Nov 2026 11:59:09 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
Message-ID: <aum-QHNr9hKEt60H@mdjait-mobl>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
 <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025922_543713_F6FCB02E 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, Nov 02, 2026 at 09:22:42PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Add Y10 format to the v4l2_format_info table.
> 
> Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

