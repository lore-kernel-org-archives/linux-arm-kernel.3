Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BBF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zSfj2uzn;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AG/jofRC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o/9wK8ypPDBVfzWamrLQ9Cbs+itMuvLYD6oeTJnRkog=; b=zSfj2uznQ2lmifXxmSSIJaXDhl
	OAS3eCOUpwLLvyj+uCiIDqKkjIuJoYbdL3gFBW4Og+6R3s7EAbk4nyyetr8TUAQCHj0XHrcjokVqz
	G2++XPPly1MH9iAAm2jKUW69PAxekeTOLGbIe2c5Vf07u8gyfG2SeYPzr8jv/I0KfBJJrr+Aen05B
	qRZY8WLUxaMSiz8Nku5R1Q6TXO697nx+l6NX9/foamE978wRaz+44MraWhqwKg8ND0LR7j88Dg1Ir
	gHmtRmAdOXxSrR1QBEFTLVzZTWCybde9Qry6kvYvSO01bpXhhcFmzLki2X/HzsgdX65Z3WWawNBvK
	QJH3TGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk9E-00000005NgH-3QEG;
	Tue, 27 Oct 2026 16:35:40 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk9C-00000005NfI-2ryA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793118939; x=1824654939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Utev8fXbgts7UcDCdj3uyCBF4API0Y6uebtPL9YZJpY=;
  b=AG/jofRCwhvlzzbJztJSJBPFamqUU1/oR7/uIjuXJ7cem2D/iESvDG9Z
   UHCN+4AaKtALNypaGkz12rJsWywxtRy+uRR5MewgKF0Im2Hg2FhmcV/nH
   t2E+GS5aHgRUpNKUGquMqk1bej+vZf9Pl16mTpDAueQI6hy14lgmV3ao3
   dQcAvzTNc94XHpHp/1N7DrrtD5SbH/k1FmxIgqTyx7qO+Rd9Q4ubxRxUe
   K6wCliMJmJnZwIWn0c5VrTi17AXFBrVm/9mVMXY0JVQs2aa+XXB6fQbX7
   cqpHmdEelewVDsNDLm2kRPGmhPlZZqAQeAZ+/8JmEWI2KjHM5XWSOUfs6
   Q==;
X-CSE-ConnectionGUID: k6EjVbLdQVaB+X6L1oE4Eg==
X-CSE-MsgGUID: vENqAIQ7TSSpCKWQ3whKdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1701107"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1701107"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:35:38 -0700
X-CSE-ConnectionGUID: s49YAcbWQDyVutQPsQymtw==
X-CSE-MsgGUID: qDTWBopHSNi+M/18y/ykAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6461434"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:35:35 -0700
Date: Tue, 27 Oct 2026 18:35:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Message-ID: <auDS1FpY-kQhP1C6@ashevche-desk.local>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_093538_759940_9175CE56 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 08:09:29PM +0800, Peng Fan (OSS) wrote:
> 
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



