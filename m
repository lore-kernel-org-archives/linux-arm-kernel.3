Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A8C44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTNk+mRSaobE7bwGj9PaTvAUpa6/FCcQUxD4xSxPefg=; b=mk31NZMxrZpKqYWTfLYNRjDsuT
	mhZW+R07cqDtzBlWxPCwcRXyid1w8XjfHUpAWFx9p6iunSfvoZo9PDvtDBp1bYACjq8pFuSoVV8A5
	0ZPJqteUYusFTneLu8k4V9GPP1rVSs3m/kihyapBABxfZ6m02H/zi8PIognpWxydjw+xbk6hWDbKd
	PH2wuQfLlhja4Ufnpwhwn1vYDi79GASO3jCbkxP0POCA9LJVUoAEbv9itVKY+S7fWi50BBd62AzhN
	Ki65/CQbExIvSNLHf7kwUiQabZm0Nly9jEY44fxjCYPJDoZ0Ic15ffGxpsWMBhtDAQlbNYnEOptKA
	FI/eFWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQX3-00000000Lb4-2SyV;
	Thu, 16 Jul 2026 18:10:01 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQX0-00000000LaK-27OP;
	Thu, 16 Jul 2026 18:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784225398; x=1815761398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Okw3RFWG7FVuL2+E+b2U06t94SSVvQwqXkAr8OEAKqU=;
  b=LqB1Xcew+XZigMwi0Wv0DkAML53EpLQGeVWrNAk5Bs+fO/X9BRUFytpH
   b4HnJddrPhcopOYfO9U5QRPyJw+/4IVxW6PrFUS3udFtJNJB1Dj+I4kX9
   M7RgWdVX9eEQTnIZOUhjiw/1yyJbcAp7r7BBgbjNzZUOaGcytF8omPF5N
   yYR6nxJUTnXDvv0+XbUkPegM/8qsUGyJyG8BhLe4QbM1z9yjPFq74pSQ8
   E91FOl7VUiFcj13q2BZca61hEplpxsc3Pm/0/U49SmGQgOSgUG0QSmKDT
   JPnXMy7lEeZ6xV2eJLefOha39n3BqLFm1TrpfGBoE2pCcvD4aA18ixEdf
   g==;
X-CSE-ConnectionGUID: coWayIuASLiHZkPOF1UepQ==
X-CSE-MsgGUID: JZcS/03XSAWsj4ZtADvR7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="72428741"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="72428741"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:09:57 -0700
X-CSE-ConnectionGUID: QdmQqkseSuO0mjX2xbzbJA==
X-CSE-MsgGUID: f2U++eSsRAqSyMQQF+RlRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="286635995"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:09:48 -0700
Date: Thu, 16 Jul 2026 21:09:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/4] nvmem: fix a const-unsoundness in reg_write
Message-ID: <alkeaYNKHZO5Tb3p@ashevche-desk.local>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716142415.28718-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_110958_578160_526697FC 
X-CRM114-Status: GOOD (  12.09  )
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

On Thu, Jul 16, 2026 at 04:24:07PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

...

> - Actually test with COMPILE_TEST, which I forgot to enable before…

Hint, you may use folder as a target in `make`. To avoid this just run

	make ... allyesconfig drivers/nvmem/

(In the similar way for any other folder and its subfolders.)

-- 
With Best Regards,
Andy Shevchenko



