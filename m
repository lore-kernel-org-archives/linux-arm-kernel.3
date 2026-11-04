Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5734606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hvk8Batm;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvIoOA8Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CS0Bcd+TO/Jxci+J+a3T0fIVilgOspvq26vn586Zfs0=; b=Hvk8BatmybQE04K2kth7F57TaO
	OpMYhO1H6ZlkL/vbZe7ivPZywFD3c+JQfxKj2gMj00doHLst7DN58R4oZDlbJvGiFDSdKM8cREG9u
	e9SWs27ybhyEQtUd+MtteRXi7xjusgFcV8r4VNM6hfyn5nwSbyijO0GLXuzHhl0Yb5fiarmGxtHYK
	yMhWyh1SbinaUXyFO8FoTLmyRy6P2NcwEMWNK5L99NqHB847Bb//+KRPYv+JhKvMm/n5c1GM1wmrA
	XUU1p3lKxoFYBZResxphBR0kAwKPldQoZZ4FyndpOPsrEpInBiLwJFIOWHPWjamrF9tMgpbKdSg+l
	cTW2wvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYRW-000000051gb-1YKi;
	Wed, 04 Nov 2026 10:42:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYRT-000000051fv-3DAI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788927; x=1825324927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=marU6W5CSY6FdRX0Caihl7DYJeuF2MxHXBp7DfI9PNQ=;
  b=hvIoOA8ZHdycdc4tlC4lkAfWn6Wo/6wP2LMdVoXPXZD5GJD4QJsRv8+3
   VaQoa93XDlnl7sk5QfqpY0MMmrMKj9UhIWG9yTA20DJNkm6YAI98pW04U
   bhSX/qvGQRRvsz3Tlq2zqqAaKnoI7FiodKYOGEr3u+udLRcckYVbD426l
   FMsfhijBZ/TjERNzEIZ/Cyc9/Br8nTQSxXiOVCawOqwDTiWqgz9fDu6uW
   5kRWDfHiF1bTx2R2FrHum2zRBpFV3IDSouv66mXLnTc7GOQodHoB0BEmI
   /ndH7uGYlH1HpBj3ku4YRghy29uyQjJgm4ckt4z+cY8oPo6eS8nXgWMm8
   g==;
X-CSE-ConnectionGUID: wJMTeoojToe5oJPAVlTbtw==
X-CSE-MsgGUID: x+H5o9OOSvy/W+X6g0lm8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2556095"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2556095"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:42:07 -0800
X-CSE-ConnectionGUID: EXafsRbiQzKK3mjg7li3Kg==
X-CSE-MsgGUID: D9BJfz7fQWKrrIZWPtZy0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6544549"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:42:03 -0800
Date: Wed, 4 Nov 2026 12:42:01 +0200
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
Subject: Re: [PATCH v7 07/12] serial: 8250_dw: configure the Allwinner H616
 UART
Message-ID: <ausL-fBU1vAgZzm3@ashevche-desk.local>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-7-c9e248d685c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-7-c9e248d685c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024207_851223_D483E1FD 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Nov 03, 2026 at 02:40:00PM -0700, James Hilliard wrote:
> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> 
> Keep PORT_16550A and supply the fixed FIFO depth through platform data.
> The 8250 core derives the transmit load from that depth. Use the shared
> DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
> thresholds, with the normal half-full FCR setting selecting 128 bytes.
> 
> Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
> DesignWare termios path for hardware CTS handling.
> 
> Select this configuration through the platform setup callback. H616
> has debug-divisor and RS485 control registers overlapping the optional
> DesignWare feature probes. Use the fixed configuration with BUSY-safe
> integer divisor programming and software RS485 handling.
> 
> Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
> Its clock is a gate on the shared APB2 source rather than an independent
> baud-rate generator.

LGTM now,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



