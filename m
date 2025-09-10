Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1890FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvtu3uafbueZeizVaV/6mc7Nfku5GeAYQMpYTXLT+4o=; b=MPx2U28yu4BshufnBccGZAjhOO
	R6oFwTs50erk7DYM57Y/pCGMkNVKv5ZwpKFCfu1U5O79cbhGyQzZWsKRkuJXRfbre2xAyPLrVnsMh
	t1/UvjZJjesy3OSRF3hD4inT7fEElN1r043Z4XBLUCly/SrvLQZpH29ci2DtbMC4x9MdICX1kGKZt
	2rkgs+gXrt9QucqK8v4i3F/OLvVLh1s6iDfc6fqTMUXyGxEnQGTUD/urC0RzMiEpmosjmzZ+UZ6BL
	js2bbLfexwZwPeKv4LA95UuuUBbaDa8jjInvvL/nFLox4wwTFGdLorOahfrm9+MNi5RX0okEuRM2/
	CdfFowXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHQq-0000000DKiC-0xLW;
	Wed, 10 Sep 2025 09:48:04 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHQm-0000000DKej-0aTH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:48:01 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de1f2cdeeso22121785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757497678; x=1758102478; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uvtu3uafbueZeizVaV/6mc7Nfku5GeAYQMpYTXLT+4o=;
        b=KL/dDEqCBXUC5F/wlevy3vdOAjUjBZRt9SdyVscx70xy5CiQQeP9SLkil2uVHZF/ts
         ZEGUZViESEUlOC7bIFxidVr4LAPsV2doZ+9zPwAgXxU0gG6zYSXUMsIPB5klSePWSA/t
         qb+WVc3ZdhBQ2dT8PaqhbDzZYwATbp6QKSnuzQw/VjJHQKLW2VipldS7sVMrTtsyRGPU
         R3mCWpHpWKHBpuuDCt3dsMMAeOnC1vzQoOZoI4VYAsY48tzZo/rykFPzz0BuMpF6VaOa
         okEemK2fXHcaT+uloRP/dm5tAbubex9CUns0His93ojSmA+Bt2pfA/zeopXd/ar2x507
         1QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497678; x=1758102478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvtu3uafbueZeizVaV/6mc7Nfku5GeAYQMpYTXLT+4o=;
        b=NHrpSmCDlaTrEBXcsFjcxOETJQQNlwcBio1IFyuTnztpNUR66vrOZ4o/WsfOLWVbGg
         7W3DE+L8/fRUEAdMPV967Osdfsq4K8qbh7yduDbhBSclGLc3L1x25UZfSgljFUUM4sau
         2ELH9apRCLQwUDlcmJNramisSQZnccitU49txRK0i7xt2ERSX5+TKyrRMk05MlYGOvoP
         zlIf3zFU6IU06jggQue3HovIbCKuXpd+FUNbZ+5Q3GWao/fU7IBQBov1qCjJtL2z+vCe
         RwOl8vcxm6LQNZPS9ydOpuiBbV+ITVxjVNeUvdz9rVCsOuXZ5EmddX6FV8zDh77h0Cse
         g88w==
X-Forwarded-Encrypted: i=1; AJvYcCVE95zSUJpPozo0W67sux05qU7wRwd4HTstxt0k3966PQHWjlRtq0xqm+qkvn3tIqeyJwBtoL7vHggoAYWOBMT7@lists.infradead.org
X-Gm-Message-State: AOJu0YysR9113CBvMC0RDsvA0W1r0lM2Ts9EzKyRFEPyJpcM9uarVmIU
	26Qj8D7kJRF6RPwjmmFOfqmxdQ9nsisgJ9MplUt1JSg98HEwbEks8HWT68N6jXQg/w==
X-Gm-Gg: ASbGncv/i7WXOreTRle7IWWEYJB6c+1jrnrAk3gzS3Pn+My2/ZvUBnRWjcyVtg7Ga6Z
	FM2/QYg1k1rl1SfElOHe9ETRgwD4K9SgdD0iZfq5Pkfwluqd9mMmMWYWBxHg7gXxkdGLhYf5Zvm
	mURWgGvGf9qsoh+NTMAV9Nptpt3vpDGy5oy90oMT7RJMBTaDmTR33pgi7Jvy676dwdQ7CV9rFe1
	Jzv8UIrkjvFAb0FKf16mqWo3UMGHpNLVLUNbqNLR3uhajjtiJIwd3ToXwxEeSQ/bsoFT8Wqp1tY
	EFI8iwYkD9f/iTiz6lqEuU9scv0GU18s2anJnHGEooadP8Bb2zKiZ1i/pWXgYrQ/FE3+XkWUE2e
	fmfjiUT8BICNBKE1ySxeIRJXab8/TH1YjZ8Y1tKe2obsVrU3UtMIzd5diNoOG2uEtSnzkrtGcEw
	N7Tz5X
X-Google-Smtp-Source: AGHT+IFWWYfR8ORYSi5S/6yVLRSE1Vl7ci8b3o8skMEhA51akRxc13pv3ScUUN6gVKKYUtaBgf3yww==
X-Received: by 2002:a05:600c:8b43:b0:45d:d718:3b9e with SMTP id 5b1f17b1804b1-45ddde92627mr142163035e9.10.1757497677772;
        Wed, 10 Sep 2025 02:47:57 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238832sm6017788f8f.31.2025.09.10.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:47:57 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:47:54 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/24] tracing: Introduce simple_ring_buffer
Message-ID: <aMFJSlbHRsvzYKaF@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-11-vdonnefort@google.com>
 <20250909182644.092b3e85@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909182644.092b3e85@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024800_196060_BBBA6E47 
X-CRM114-Status: GOOD (  14.48  )
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

[...]

> > +static struct ring_buffer_event *
> > +simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long length, u64 timestamp)
> > +{
> > +	unsigned long ts_ext_size = 0, event_size = rb_event_size(length);
> > +	struct simple_buffer_page *tail = cpu_buffer->tail_page;
> > +	struct ring_buffer_event *event;
> > +	u32 write, prev_write;
> > +	u64 time_delta;
> > +
> > +	time_delta = timestamp - cpu_buffer->write_stamp;
> 
> The remote buffers never get preempted do they?
> 
> That is, it doesn't need to handle different contexts like the normal
> kernel does? (normal, softirq, irq, NMI, etc).

No, luckily, we don't need to support any of that.

> 
> -- Steve
> 
> > +
> > +	if (test_time_stamp(time_delta))
> > +		ts_ext_size = 8;
> > +
> > +	prev_write = tail->write;
> > +	write = prev_write + event_size + ts_ext_size;
> > +
> > +	if (unlikely(write > (PAGE_SIZE - BUF_PAGE_HDR_SIZE)))
> > +		tail = simple_rb_move_tail(cpu_buffer);
> > +
> > +	if (!tail->entries) {
> > +		tail->page->time_stamp = timestamp;
> > +		time_delta = 0;
> > +		ts_ext_size = 0;
> > +		write = event_size;
> > +		prev_write = 0;
> > +	}
> > +
> > +	tail->write = write;
> > +	tail->entries++;
> > +
> > +	cpu_buffer->write_stamp = timestamp;
> > +
> > +	event = (struct ring_buffer_event *)(tail->page->data + prev_write);
> > +	if (ts_ext_size) {
> > +		event = rb_event_add_ts_extend(event, time_delta);
> > +		time_delta = 0;
> > +	}
> > +
> > +	event->type_len = 0;
> > +	event->time_delta = time_delta;
> > +	event->array[0] = event_size - RB_EVNT_HDR_SIZE;
> > +
> > +	return event;
> > +}
> > +

