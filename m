Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECA606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A7Ga+rRN;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=efA+k4e7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PfFt5b3z6T/Dye1GZfdd20rqwauprOu5i4Wb9YAWnjE=; b=A7Ga+rRNU+5TsZKLehElYUSf58
	xzRyHttdOHKLaQZ8+LWQYfgtONpmxO7+DMkhac+ak9JjsstSIwdT170bfleVe/5WA6FRpLiJt66Oo
	stImjPH3+/X4mUer6iGAMfPDcuhBR67+IE/Oe7bE+/EvAkcHVBsRz6czlkvydmVeLqxKNXi6v0xpK
	sIWktAB4ghWDM/xa6w1a0LEvHfE5W76gHI8s5HNvj8OXZ/MMk5xlFAB9M4gBjhXEWxCHK6RG95G5p
	qY9RkCJ0857//NPJs3YaGwiwp6ox9SwfM3/FmLwlEmjLEAksoruEfmtOZrk2t4LMNE52I8np0dDc6
	P5RjP8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM06L-00000006gAY-1z7L;
	Wed, 28 Oct 2026 09:37:45 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM06J-00000006gA4-2MoG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180264; x=1824716264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIfnoQkZ4V2uVEMm5sBMRELn7o3bsPgvE78ZyMH/yWg=;
  b=efA+k4e7OldEmO6F4BQxmzXDA/v7XahT/E8a8Vyguo9knxHK0d4aIEfC
   8Im+A0WA0nsCu9lqVKqaSEf0JaAKqyP9hgoW/eC0tgd8xsZTWNfCC81Gw
   V/yeNjN/vCZ5lW3B2m8GljRM1Z9r/HPeCkPjWqypbl+h0Mdxytw4zell5
   UyregmBLjYmyuM4/L65h8O4j175w8eFB61U8kC3LzAbCAn0n5fknuUWt8
   RDgLV71ThJyW1+OIWdBrDsAcTnZQvliC9x9+mvgvACZqa0JTBJVQIfX7o
   FC51epW82ZwQXgdlrfyNAdoqdNoo/d73bl4Lz5/K/xDyf1Ym8t2/VP4+h
   g==;
X-CSE-ConnectionGUID: BYIlnoSWQb+6SS/kS6xnog==
X-CSE-MsgGUID: 0/k3qFLuQcOhFhjjPi4w6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1918964"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1918964"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:37:43 -0700
X-CSE-ConnectionGUID: sJn63pxHQrGnAsgSV+mzNQ==
X-CSE-MsgGUID: VpaTTqh/QwSf/O0Focra7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5142869"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:37:39 -0700
Date: Wed, 28 Oct 2026 11:37:37 +0200
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
Subject: Re: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
 helper
Message-ID: <auHCYdZEqSh4RX7B@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_023743_667907_ADB0FFCA 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, Oct 27, 2026 at 05:05:30PM -0600, James Hilliard wrote:
> Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
> so drivers with per-port threshold tables can use the same conversion as
> the generic 8250 implementation.
> 
> Include the unsupported-table check in the helper and preserve the existing
> nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



