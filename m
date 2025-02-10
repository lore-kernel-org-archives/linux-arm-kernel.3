Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DAFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i0AGLd99zO9PPisviE6AdnYOR4wb3NHpW6/eGahu5k=; b=Rauh1DxidFggBz4gdskWOLlHO7
	QnX+S2g0dviQk5xmTcHig4EDgv4Q7KavVc6Z1RfMdrT4ukZT6ZZ5NcGe1rw2vg7QQMlpIhYjBCy7X
	VQL9J7ldZJ6yZOi3c+8ZrL8pfrQfOUWLnsEaEwXBvuld2SZ1AOsg7ojCaZvfzqWeOo/K/kMu8GEqE
	D4fKorjplAUFwckwKnSujHWdqsw/gROTYovpqQWwtNYU1hMzI1tU+lefkulFJTpThKUD5f7WILm39
	bqQ/rbFASKbxCRVVgauWbg/uhfpNFHOQu8Gh6XpOQr8J6cRdArSJiBkb7ziF40sD2FNnWgphi4jP3
	NAFbxmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQuL-0000000Gz55-0xW2;
	Mon, 10 Feb 2025 10:20:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQrL-0000000Gxr0-0Axk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:17:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f4500a5c3so78167885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739182666; x=1739787466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9i0AGLd99zO9PPisviE6AdnYOR4wb3NHpW6/eGahu5k=;
        b=oCivMkn3DqRFObozQEkKPgqpQEbpCgwytFskHV7MBRy4YbPs58GSqmBxX986IpA3XZ
         6K7OoUpXXwpCCFL+sgr21uPWOJc5Wdk+4bu5wGu1AzoMpTcC/jYZyRmigCeNWDRKo8o2
         t7zKAJquRoylBbcc1SMKH/yiaaXDCDej8+tYr2Tmi3oe6uuH3/nfw2iVBr3tfv6NcKmo
         mNBnc1WciBaoW0mCLvSwD2z0NbkPyyT01fV0chSzZfFlz8Djuv5n6/fxeN5cLwdVGlGs
         phJzdYTyFrIyR3cBIfMRy7b0B8GbT8BTrlz0cUDGRNJZ2EaNlKPimga1xsQmJkTn7OOF
         8yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182666; x=1739787466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i0AGLd99zO9PPisviE6AdnYOR4wb3NHpW6/eGahu5k=;
        b=BdkDFXUDwcEgeicHQqIw9icyNliVNN8wSoL165sQ0TuYz8C/a3DHiQlUC09yGxbC9K
         49vYThP2twrdHj63f3nD61evKvPsU23LQO9Nu5KOeTzbPmTlCym3dQjw+WtQNbBrx247
         2vNjDhlQTegnGtPK05CC63herGzzMXKrOo6HSglHM7pk4TKbhEQHmt8hC22lBqPfiwaI
         +mJdAjZRvCyoqNEhqp8UnNK2GpvPrm8m3ebaPtNJ6S83ruDSWF/yoDp+7fyCVCcmckxJ
         7wS5XMH49lnaT5gzNDgMEOHWyxHNTu+mbYIL3HhyEPWNvGiu4MY6e/KKbht9/BsnRYPv
         8RXw==
X-Gm-Message-State: AOJu0Yy6SZb5milJQ9AEkYfCE7D5DrRNOWgPGwcgsKpiGeCP31QVi5by
	Qlu3iuYDBFhumQVIRxVlfo6G6IibSlYo8H4IdUUq2WgoNStXvH4dk9W+n3JXlf8=
X-Gm-Gg: ASbGncvG6CY8OvzXQq+amKobtu/5HeBeBbmgwshQG6tfrmQ+/87Cdjzt+oNL7iCtXtb
	4a31fwdibvIIaBORpvokfBeLNKTJZ3gL9SUD3b1EFxaEQafr4p5wWmiaSyk/N5Q3S4CtdXGgF8/
	oD7laxMjiU/br5A6+jLcO+mHhiQmba2XRevnsJcnXQc7GcNq/ovQ2YHSgoZxOqc5QtrrYysHJE+
	faxkX5HjzZMqbK7/ocop8oVGf1UPC4xel2qFuYgwrOqc+D0HWbV/mMVi+ckwSOj9sQvZvG62nJJ
	JZ0Kzdwsz3/U+7vxJQ==
X-Google-Smtp-Source: AGHT+IGNZ1LdwSLrAygAeyU2l4PUTGtgEddlFC4BdeZIasrbNWW51em0a2J4IYoXDABwR1ybMH65yA==
X-Received: by 2002:a05:6a21:9985:b0:1eb:7da4:305e with SMTP id adf61e73a8af0-1ee03b70cbcmr19829114637.39.1739182665838;
        Mon, 10 Feb 2025 02:17:45 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308540cb30sm2399099b3a.115.2025.02.10.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:17:45 -0800 (PST)
Date: Mon, 10 Feb 2025 15:47:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/18] firmware: arm_ffa: Add support for handling
 framework notifications
Message-ID: <20250210101743.aqbhqqkdbvka2i46@vireshk-i7>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_021747_092888_C99E4BC7 
X-CRM114-Status: GOOD (  13.43  )
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

On 31-01-25, 11:24, Sudeep Holla wrote:
> +static void handle_fwk_notif_callbacks(u32 bitmap)
> +{
> +	void *buf;
> +	uuid_t uuid;
> +	int notify_id = 0, target;
> +	struct ffa_indirect_msg_hdr *msg;
> +	struct notifier_cb_info *cb_info = NULL;
> +
> +	/* Only one framework notification defined and supported for now */
> +	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
> +		return;
> +
> +	mutex_lock(&drv_info->rx_lock);
> +
> +	msg = drv_info->rx_buffer;
> +	buf = kmalloc(msg->size, GFP_KERNEL);
> +	if (!buf) {
> +		mutex_unlock(&drv_info->rx_lock);
> +		return;
> +	}
> +	memcpy(buf, (void *)msg + msg->offset, msg->size);

Can use kmemdup() here instead.

-- 
viresh

