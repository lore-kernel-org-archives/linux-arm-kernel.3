Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF17606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=35HvRjff;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zpu9KcwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NJRIBxDa0PBI1ayFa5wZ+sVeSyV4S6VsRvVyFVIG9Yc=; b=35HvRjff1zbdndwUpmhH26XZ75
	85sryhdLhlNJfof0jHRQPQk0U4kaB86Mcq2E0xqiRJyGc5zDmnT67aehFh5xl/uGGLQTUBilJewaq
	r03w3ro/U92jTR0LUHUiABJ30Z97YPbJkz5y7A/JytFbqruAMgtjGPXP5F/wMCyVQl8qezY07jkvi
	hOj/uq27WjnpmIUIHYOqhoOJn0dELox9wUX3Ib5Gt1vcdBH1/zS1o6Cb8zB6RTMmuRzXVWOv+10tl
	kui65rwlB97ruydFumcso/wIfkJR/vVVnykRH8DbQ9PyDXeTHB6jsbdzuFlIMvMlyboHbVvg6iA3i
	QXR5Eqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2D9-0000000A8YL-3rFs;
	Thu, 05 Nov 2026 18:29:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Co-0000000A8Um-2ysG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793903339; x=1825439339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLP7D2diFf8GVGCCXQtzmey6vFHHS3ImWJ64xyTbLbo=;
  b=Zpu9KcwN1SaVbPBGnwJ0LTmJ0+llNunV0cIE+dpIKgC5rr4+6TDQJdhY
   wMO7jT1CaUEQdfG+IhkdGxSVTez+d1267RFWMVKWvRmOl2Es/S40ifIaO
   hePMIXTz3TZPDm9VDE8lcpHFxlznYid1FN3X70BcRm1o9LfZmS9t2HOcJ
   DR5OL9UsbPlgfOd9BO2mwyPZyYdzIro1NENHRTUEvnrFq5Q7nue2eXw7A
   MmCAMefeewSRDPGggXLsCmckPK9j2UJ1b8/xy7QJ0nRRbczszcBLBlxPg
   vOlSE1XEXpCTj7/JsfPADKcD7hwZZaSTdCJSWxMDLHYcx4bYYdytQcUCR
   A==;
X-CSE-ConnectionGUID: YwvI3sYWTzmsmY+GlLmKHw==
X-CSE-MsgGUID: 3tU9XYuMSgayspjnEVHEPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2577157"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2577157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:28:59 -0800
X-CSE-ConnectionGUID: 8AkguHEkRvWFOmYHarRzCA==
X-CSE-MsgGUID: 8hM0xRPvQjSF0gw/H+gG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7204397"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:28:55 -0800
Date: Thu, 5 Nov 2026 20:28:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 07/14] i2c: core: implement i2c_transfer_v2() -
 transfer with detailed reporting
Message-ID: <auzK5F7uOEpGpUBe@ashevche-desk.local>
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
 <20261105-i2c-fault-reporting-v3-7-515ad74ac4c9@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-i2c-fault-reporting-v3-7-515ad74ac4c9@mobileye.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_102900_038533_81A07803 
X-CRM114-Status: GOOD (  23.51  )
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

On Thu, Nov 05, 2026 at 07:15:28PM +0200, Dmitry Guzman wrote:
> In __i2c_transfer() and i2c_transfer(), add one more parameter - pointer
> to transfer report. In __i2c_transfer(), if the pointer is not NULL,
> use algo->xfer_v2() callback instead of algo->xfer() in order to get the
> detailed transfer report. If the adapter does not have xfer_v2(), return
> -EOPNOTSUPP.
> 
> If the adapter has any quirks that make impossible to transfer requested
> message or messages, put the index of the first such message to the
> transfer report structure.
> 
> If the report is not NULL, algo->xfer_v2() returned an error and there
> are any read messages, trace the read data using `trace_i2c_reply(). If
> the last read message is incomplete (transfer was interrupted in the
> middle of a read message), trace the read portion of data also.
> 
> Rename __i2c_transfer() to __i2c_transfer_v2() and i2c_transfer() to
> i2c_transfer_v2().
> 
> For backward compatibility, add __i2c_transfer() and i2c_transfer() that
> call __i2c_transfer_v2() and i2c_transfer_v2() respectively with null
> report pointer.
> 
> Remove comment "REVISIT the fault reporting model here is weak".

...

>  	if (static_branch_unlikely(&i2c_trace_msg_key)) {
> -		int i;
> -		for (i = 0; i < ret; i++)
> +		int i, n;
> +
> +		if (report)
> +			n = report->msgs_cplt;
> +		else
> +			n = ret;

> +		for (i = 0; i < n; i++)
>  			if (msgs[i].flags & I2C_M_RD)
>  				trace_i2c_reply(adap, &msgs[i], msgs[i].len, i);

Besides missing {}. the iterator is local to the loop, hence

		for (int i = 0; i < n; i++) {
			if (msgs[i].flags & I2C_M_RD)
				trace_i2c_reply(adap, &msgs[i], msgs[i].len, i);
		}

> +		if (report && report->bytes_cplt > 0 && msgs[n].flags & I2C_M_RD)
> +			trace_i2c_reply(adap, &msgs[n], report->bytes_cplt, n);
>  		trace_i2c_result(adap, num, ret);
>  	}

...

> +/**
> + * __i2c_transfer - unlocked flavor of i2c_transfer
> + * @adap: Handle to I2C bus
> + * @msgs: One or more messages to execute before STOP is issued to
> + *	terminate the operation; each message begins with a START.
> + * @num: Number of messages to be executed.

> + * Returns negative errno, else the number of messages executed.

Return section must be last in the kernel-doc (it's documented) and actually be
a such. Always validate with kernel-doc script.

> + * Adapter lock must be held when calling this function. No debug logging
> + * takes place.

This is Context section in kernel-doc for.
And more effectively is to add a lockdep annotation.

> + */
> +int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	return __i2c_transfer_v2(adap, msgs, num, NULL);
> +}

-- 
With Best Regards,
Andy Shevchenko



