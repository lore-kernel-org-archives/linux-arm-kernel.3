Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFB606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QOxnTyH9;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AhfGHXuB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zRXqrOpqPdyVMxadAbJbOQp1pF8T1j8qh7t5p4OQo+c=; b=QOxnTyH9GThSvnPdu3lWcOr98s
	vBmzOSczdaz1QiETcyATOruAq2GnZ+OcQRJb6DWZBgW85K1IpWKizdDasm11vdwaPduYekV9hwvtq
	3syZd8i1bvegOmgmlFhKzm0egBxgXoF/JgCjWKcs/DC2Y25KRs6lB7+T60kng7trtfLvJ4EtUm7Ff
	1GQo5c+htO0CC6QRnnSsjHIO7C9dziqhCmnC/6bxTDBrjoQK1Ck20CMPnsl28ERSnuRQpG5AcJRCq
	DjKRwJZKYXqjsNFK0IA+rbPg4mxzBBF/+aT/VJZ9Cd/pt46NhJ5SfM+m3IYBPK2sT3Aah8bkpsXjc
	pngEGNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCxw-00000002Fps-47wr;
	Tue, 03 Nov 2026 11:46:12 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCxu-00000002FpK-2tYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793706371; x=1825242371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k34J5bk1+MbWLLiN/cBv7+iaC1FJgNw6KnASGpx22VU=;
  b=AhfGHXuBASUCsFOab01Sha8XssuHLx//1MzS+LmdGqZmfYdyN/VuXqNf
   2mBzDT7SQnS0LVyiVUh4NYmAGuGUFWpvbJbvooY5h9G/x9ZMJcWmq6Mxf
   jtY8ilphIKpa4N7/mbXvp9LZmjeV7ZTD/bqn0jvx6vaSzD5FQTCkvCI3o
   8WY4AIe1nqVrJzuBnGpeRgqy3/Ktngem29IyHrmooNGqDYJ4NVVK8b00G
   HJ7AizWIoC9o2hdlPvZlDzfMWK2y5HyrIfhaEVYonOwqbevC7L7fqsILo
   eKM5Fw1qLJ2GkT6ZjWNvRyYp9Oeb4gSvI1nRlX4Ahc85MA0mDkh1ZMePC
   A==;
X-CSE-ConnectionGUID: SJnvIyEuSHKtvN6beOrE8w==
X-CSE-MsgGUID: jQZHWtlqRki1P5YCnIqsPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2306708"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2306708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:46:10 -0800
X-CSE-ConnectionGUID: +50rtPemS3qs1F87pbe9vA==
X-CSE-MsgGUID: 5a1QMZAXRhCgk3MDdtV4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6494861"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:46:07 -0800
Date: Tue, 3 Nov 2026 13:46:04 +0200
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
Subject: Re: [PATCH v6 2/8] serial: 8250: share the RX trigger conversion
 helper
Message-ID: <aunJfAPQMuiiH2N1@ashevche-desk.local>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
 <20261102-submit-h616-uart-fifo-v1-v6-2-25afcb346b0c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-2-25afcb346b0c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034610_796770_9483B11B 
X-CRM114-Status: GOOD (  16.90  )
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

On Mon, Nov 02, 2026 at 12:55:17PM -0700, James Hilliard wrote:
> Drivers can supply receive-trigger thresholds through the RX trigger
> callbacks without adding a legacy port type to uart_config[]. Extract the
> threshold search into serial8250_bytes_to_fcr() so those drivers can use
> the same conversion as the generic 8250 implementation.
> 
> Keep the implementation in 8250_port.c and export it in the SERIAL_8250
> namespace. Include the unsupported-table check and preserve the existing
> nearest-lower selection and highest-encoding fallback.

...

> -static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
> +int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes)
>  {
> -	const struct serial8250_config *conf_type = &uart_config[up->port.type];
> -	int i;
> -
> -	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
> +	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
>  		return -EOPNOTSUPP;
>  
> -	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> -		if (bytes < conf_type->rxtrig_bytes[i])
> +	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> +		if (bytes < rxtrig_bytes[i])
>  			/* Use the nearest lower value */
> -			return (--i) << UART_FCR_R_TRIG_SHIFT;
> +			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
>  	}

Strictly speaking cosmetics should go into a separate patch (for-loop iterator
locality, (--i) morph).

>  	return UART_FCR_R_TRIG_11;
>  }

-- 
With Best Regards,
Andy Shevchenko



