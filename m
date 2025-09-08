Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A077CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=; b=a5X7cymy1nvn+ypplsR04ddyov
	ROrH/ZpqTOEjl+6IRqf8m4HuMoAAbc6t10T1hq91oYkZBJqCwv7P/gOnNIFMAackNRLnxqtKd9vV5
	fg21pHbntpmZAnFkZLu5tutMfSuegZvCXkSIOKr8ZcnbKFeFKdPFJhXvf8fIDAbOc5J/qashu3Avb
	vhZqkzDjcAzfclts5/a35stkeG80kvz0O9rthyMN+m2LEmrW+Vzi4WAJXj7dbQNTtd3YSMxFS4/7O
	wgd4yfBlRU4Lgdgf1yDIaCaj5uva9oWhfxOVT2d+jLjN+UQA+OxnxZ+YJ0iQfxOFM50v+MDpZ8jEX
	crHGEGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvimS-00000002HmH-1MHz;
	Mon, 08 Sep 2025 20:48:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfQG-000000017Va-1Fhd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Sep 2025 17:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=; b=IdAS3Z+4uIsFJX+XFXLqP37SWS
	tkD4RVsBhUlgxpFzAyfimzlJBnl4RAXzIHOxY8FXeb62d9uJkcnp/8/rcCZnBcq+CnxkfNUzfAKnf
	n/JQ4umQY6y90RJHYk4Mm61Orf8ZmfFsMmeSnfc3hSwl5Xwt9PZIFRIvfWTmzKy59oK9fu2Ygwav1
	MCu54uD6CEShdgMqiM0nRDcFhHdudKBqwvc9sLW2UGdThhSbhyKPXWDqtAlc1nCIEkV6Nf/dZCWpk
	D0/cN1UVRkRJP9+atojHm9D0swRPoypoEjctEqbMJIQmKHwgqSid4nQWZ+hl9j6Su0F30lsnO0z52
	T6lVyEug==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfQB-000000056LZ-1kde
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
	b=IDJYzrtWW1mW5btKMV3WgM8DI/B5y7Frhb1WxfoNub7NIo4XayvUWnJiQ4P/4Le76RacFc
	0Vp0bHwODbFj4kUaDfiwnO6p75j8i2SI4IDwv7PqPnekFDerUBO8rQ54MO+kOI4AhBvsFr
	fPPF1eZmLDuvyEmWSDq0v/D15yRwNPw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
	b=cjwKjvrdj/TEnERxDtsbRi5xR9OPoEmQKrAKwwdJZBddk8h/gBEuh/0iXuwhZN/SWx1iqI
	Tqf+pVuKfoYrGKntiXKvOHPHIc3qmPvWtqLYrVmfgS5k3sCgY0Vn14wtXPfYRRHlXo+BC9
	E5cYQVVLyonYLb3mTcpmCph2QT+QksI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-ZvKuxtdKNF2wOEXRrwMjCQ-1; Mon, 08 Sep 2025 13:12:45 -0400
X-MC-Unique: ZvKuxtdKNF2wOEXRrwMjCQ-1
X-Mimecast-MFC-AGG-ID: ZvKuxtdKNF2wOEXRrwMjCQ_1757351565
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870315c98so1856486185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351565; x=1757956365;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
        b=AeYTOOWPT5VpVeduAQprWe0pbScMfwsuFVrrsos7JPRB16sv8BhRtgBZpBMmq2YP2s
         xMruHUQ3O2MD9mkLLyrnumsaFr1GdMoRPpuilkqZDEmfm36E3muYggLaV1in1Hsz7sUa
         PGZmz5uxxlqhJ9COKsbjLazxnuXiJ1BlauLBLybwzKqnRRtA0MalcttKROtAw9gP7meI
         VMFiN9fxD7V7g/4zdj53P1/+LvGpWtr3BXDbLZETfrII2/ZZwixrvu6WvcGFrzMywgrV
         KHxxNVd0/rYXVlRWdaBCbTreOBJjUpgEkyheuQqMK9k/5pKRR11/hyX/cSNLiC/SPi8t
         MqlA==
X-Forwarded-Encrypted: i=1; AJvYcCVBUCfcm/OVA7KyzhM+5UuppjPx5JMR/0dnA/YaTxKPc7m1mv3q33fL40ajnvbnDDy+NfB6VpTz6SnMg4xVqg4x@lists.infradead.org
X-Gm-Message-State: AOJu0Yzroqx+7k8fBRJNi3MWzgCuEhjBjWaVb5IZALgh8TXT+IUhpzyk
	Uk0q0FQ9Rbt/FBJrZVCO262bUXhTtvuBgBNRI63l1nxWJFCH3tATHBl+aWQRhssM7QcuQg0rAZu
	4QJvBtdUj1svA3SDzC1/QnbgyVjAqAFvm9pSWroIDmvczZr2UZK67jAVnXpy9/0GFQ8GCWSkmvQ
	2s
X-Gm-Gg: ASbGncu68lVp8pDn23A23I4eVRdD/g5LQrZ+5xyr7UXjXf2T7BJd0e5C1iFOkcS93h1
	CgjDoKstPQHi1no/HTcFXnNbO0BG68uHeUKB3eb+VS5wjDW/+u/Q7fFnDMHKtAeeGj0WHXaFdcR
	ZeZPT1zE6sNTNpI88496GTskrchpyecwpZ8LcKaaYxVB1GFJ+oaLqurqfQz3ZQ/vKJYWiMre/Tk
	sukpVUHhs4AcANR0qaMxo+08curO32zJ7fslTYPs5c/ffoyzsS2yp5o+rsgv4AyDfMZGbeMQOXb
	I1ApRiyEhA7Aunwjyr8fLDnPX63NnAF9/CAExs6tVJmP1RSOpGULXmqw3j8=
X-Received: by 2002:a05:620a:4714:b0:7e8:3fbd:4190 with SMTP id af79cd13be357-813bdf6a9c8mr829190785a.2.1757351564673;
        Mon, 08 Sep 2025 10:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwMZsEl4SQNKbeMqNXOZc4NyVlPYCi+ENDx/Vjfad/o+tQQ/qJhvSwRqRuWnLNVWOHla1Uqg==
X-Received: by 2002:a05:620a:4714:b0:7e8:3fbd:4190 with SMTP id af79cd13be357-813bdf6a9c8mr829186285a.2.1757351564056;
        Mon, 08 Sep 2025 10:12:44 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8138798dfcesm600461485a.34.2025.09.08.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:12:43 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:12:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Message-ID: <aL8Oifz8zR9nJ_Wg@x1>
References: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BARFJYiFuOTGSvd4odsZNZHxVe1n3dNKZvqut0JecT4_1757351565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_181251_675605_26030CF4 
X-CRM114-Status: GOOD (  15.93  )
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

On Wed, Aug 27, 2025 at 01:12:07PM -0400, Brian Masney wrote:
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops.
> 
> The existing scmi_clk_determine_rate() is a noop implementation that
> lets the firmware round the rate as appropriate. Drop the existing
> determine_rate implementation and convert the existing round_rate()
> implementation over to determine_rate().
> 
> scmi_clk_determine_rate() was added recently when the clock parent
> support was added, so it's not expected that this change will regress
> anything.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I included this patch in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian


