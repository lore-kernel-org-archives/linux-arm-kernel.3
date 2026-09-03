Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF1C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8SSNLCkyn/6NEBlBQjAoveMER4lpxTHnqftMglQxKg=; b=dN56BtEwcdlF7htrhIRkqmZpBQ
	XrxWgtbC/bOtrPDbDHB8Ani3JwFOojO1si/Ej7eODt3TrxMiIL6yrJ6dRnwNSeaP74y4X4Op4KCr+
	4itRe3v7tA+L46BLs6if4w7t4GCsZsRnpagD7yxL6W+F0nALy38QP3FfQWonaoXaclikTKa4PiWuO
	7b3RHxHdbMwv2rTPuvk0/guU84/f15uNkUMDqAl6WuEZGeiPByLAlcAkCIZZ86Wfmh4o8HoyU0gc3
	YtY6r+YwG9Eh8GpwPuini7jJg9r5de4tcY39xdWW9UsJZAd5t+uCtzcyfNxl+7N8au7JumQwfNWtA
	10Mv6WPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22AJ-0000000Gg0y-063U;
	Thu, 03 Sep 2026 07:47:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22AH-0000000Gg0R-12w8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788421637; x=1819957637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2eZKdONamPvCP1y5RVztRq6n8gH4zttgffCWQfy2imM=;
  b=WjAT8ISnVatwrk3DKrccEU4FM3C/vMRBbJkO0lclGHRVI6jv/ZmAA8EO
   YY96bZYLu5jjUf16cYO5dQek8qGhkkQsO+vJIpAQK4DtjdYI52Zzrh8Nd
   GQDu3bw9o1T3HJyOEh0lKdXuoF6b9d0Md9mI2oGPQ6qzvNXlW6yuWdyce
   a4iOsAV0LeorAU9YLVZj22NSU7lvF4P8OJFBjem6dzeHpAkLKBfbeJDzR
   DiBZVyQIVH2lGQ1CGathun18pwhCnmthFCaRBDVIYriJjQoENSg56GBsY
   lxH5I1bN3TmuqWWOaUBCskgQbpEvmJDi5VjATb+Fsz653yT7rF2od8CNl
   Q==;
X-CSE-ConnectionGUID: 1KC3JET0TCi/wNSr1qv3gg==
X-CSE-MsgGUID: LmyFxp7RR0WVyaQvcsjlmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99555161"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99555161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:47:16 -0700
X-CSE-ConnectionGUID: Hxhn/43GRSOYkNyUr+boqg==
X-CSE-MsgGUID: aEGVW8hZTXaw6XN4m0VwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="293143021"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:47:12 -0700
Date: Thu, 3 Sep 2026 10:47:09 +0300
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
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH v2 12/12] i2c: designware: add support for I2C_XFER_V2 -
 detailed fault reporting
Message-ID: <apkl_XHaZreKoipX@ashevche-desk.local>
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
 <20260903-i2c-fault-reporting-v2-12-fedeb91792e6@mobileye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903-i2c-fault-reporting-v2-12-fedeb91792e6@mobileye.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004717_355430_4B9F3BD2 
X-CRM114-Status: GOOD (  31.17  )
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

On Thu, Sep 03, 2026 at 08:38:19AM +0300, Dmitry Guzman wrote:
> I2C_XFER_V2 is a new API that allows I2C clients to get the detailed
> report in case of transmission failure. Previously, the only information
> returned by I2C bus controller was the error code; there was no way to
> find out how many messages or bytes in a certain message have been sent
> or received until the fault condition occurred, or to receive the data
> read before the fault.
> 
> This patch introduces support for this feature in i2c-designware driver.
> For AMD_NAVI_GPU model that has its own `xfer` callback function, this
> feature is currently not implemented.
> 
> The driver uses FLUSH_CNT field of ABORT_SOURCE register to detect
> how many command/data bytes written to FIFO were not actually sent.
> 
> Also, if the detailed fault report is required, the driver checks
> status after each read/write from/to FIFO. If ABORT flag is set, the
> driver cannot detect what happened first - FIFO read/write or
> communication abort, so it assumes that abort happened first, otherwise
> it either falsely reports one extra byte sent or returns the byte read
> from FIFO flushed after abort as a valid read byte. So, in unfortunate
> conditions, the fault report may be too pessimistic by one byte.
> 
> This check increases amount of time spent in interrupt handler, so if
> client doesn't need detailed fault report, this check should be avoided.
> Because of this, both `xfer` and `xfer_v2` callbacks are implemented in
> struct i2c_algorithm: the former does not generate detailed fault
> report, while the latter does.

...

> +static int i2c_dw_fault_report(struct dw_i2c_dev *dev, struct i2c_transfer_report *report);

Why forward declaration?

> +static inline bool i2c_dw_check_abort_flag(struct dw_i2c_dev *dev)

Why 'inline'?

> +{
> +	u32 stat;
> +
> +	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
> +	return (!!(stat & DW_IC_INTR_TX_ABRT));

Not a macro style.

> +}

...

> +			/* If precise fault reporting is required, check if the transfer
> +			 * is aborted after writing each byte.
> +			 * Otherwise, if it is aborted during filling FIFO, there is no way
> +			 * to know how many bytes was written to FIFO after transfer abort
> +			 * and thus are not counted in FLUSH_CNT.
> +			 * If we are checking abort flag after each byte, we can lose only 1 byte.
> +			 */

Style of the comments...

...

> +	if (!report) {

Use positive conditional instead.

> +		dev->need_precise_report = false;
> +	} else {
> +		dev->need_precise_report = true;
> +		report->msgs_cplt = -EOPNOTSUPP;
> +		report->bytes_cplt = -EOPNOTSUPP;
> +		report->fault_msg_idx = -EOPNOTSUPP;
> +	}

Will each driver use this? Needs a helper with explanation of the defaults.
Also note, the helper itself can be made in a separate patch.

...

> +					/* Reset report pointer to avoid
> +					 * calling i2c_dw_fault_report later
> +					 */

Style of the comment, also respect English punctuation and kernel standard
references, for instance the function can be referred as func().

...

> +	if (ret < 0) {
> +		if (report) {
> +			i2c_dw_fault_report(dev, report);
> +			report->msgs_cplt += msgs_in_prev_parts;
> +			report->fault_msg_idx += msgs_in_prev_parts;
> +		}
>  		return ret;
> +	}
> +	if (report) {
> +		report->msgs_cplt = num;
> +		report->fault_msg_idx = num;
> +		report->bytes_cplt = 0;
> +	}

If we going to have many lines like these you need to introduce an I²C report
handling APIs instead of these. This will help a lot. Currently this bulk of
stuff hard to review and follow.

...

> +	int idx;
> +	int n_flushed = FIELD_GET(DW_IC_TX_ABRT_SOURCE_FLUSH_CNT_MASK, dev->abort_source);

Reversed xmas tree order.

...

> +	for (int i = dev->msg_read_idx; i <= idx && i < dev->msgs_num; i++) {

Why is 'i' signed?

> +		if (dev->msgs[i].flags & I2C_M_RD) {
> +			report->msgs_cplt = i;
> +			if (!(dev->rx_buf_len))
> +				report->bytes_cplt = 0;
> +			else
> +				report->bytes_cplt = dev->rx_buf - dev->msgs[i].buf;
> +			if ((i < idx) || (report->bytes_cplt < dev->bytes_written))
> +				dev_warn_ratelimited(dev->dev, "Read data lost due to FIFO flush");
> +			break;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko



