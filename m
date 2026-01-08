Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4334AD232C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvaLn6viyg9kXapGmyY93KyT45eozmIZAkWSd+113fM=; b=rFL0fjiYXpRwF6rZmHUUIrekpQ
	AZrEuCWLOLVbSCdF8tqCXtqr5DlxkmnvS5W7eKU5cvUeJFQsdjcB+xc6/fYxIYdVNEuAW4cJvdpLm
	N3p8Zo/dpnNDW2O0EjCR3XRLNME0S2y0jjpQYSID24VTHhmXbfiWkM0HeT12moJdyB8fehcoqSpne
	irgba6UlnB6w4e4Wdjc6qIb6RakLbqceKZW22QNWd3n991HXQS6wCG2AlwlnyLqylK9xKQjtsGCy7
	G7sdk9giBcLUegII8tPr+Cw7pdtnMmxddKizde/DN4z9tK5Dw2hAuZwHHg6z8PeQ+rzp5STzU+m5S
	uKzh8NBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzow-000000010sv-15Ga;
	Thu, 08 Jan 2026 23:53:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzot-000000010rp-3AOo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 23:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767916414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvaLn6viyg9kXapGmyY93KyT45eozmIZAkWSd+113fM=;
	b=WYFa59w0oWHFxqNfgE/rJLPrIgW+5y93uXIHD81BS1mewoihkyIKiz1HTZmSUsJVuu/Fh9
	vJkmI6dGy2zrdPTVtre8iLAYfFOEKRNmyy0tiUpkJ7CSYD2rzMJDcsV6Rp8xqq6vHmh7JK
	5KhGFcXWIDz5p4U6H8bx7rYkDp3MbSo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-nkV-ZeRXMMesfa1PJSknLA-1; Thu, 08 Jan 2026 18:53:33 -0500
X-MC-Unique: nkV-ZeRXMMesfa1PJSknLA-1
X-Mimecast-MFC-AGG-ID: nkV-ZeRXMMesfa1PJSknLA_1767916412
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so680337085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 15:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767916412; x=1768521212;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvaLn6viyg9kXapGmyY93KyT45eozmIZAkWSd+113fM=;
        b=ifxSdmM+eIlCWWpY8aG6HFif7wz6lh+8ZPBkuCh5mbt0u3BnZo2oTFQmnb/6InBUoS
         Hwzp78zrLej0uOio3e+nc3rD0xWLok+MYNaXromDnqjge/uA7qpTL5299QJHdoPGIocv
         7sKf93X+AN4TiuqpEuJNDvb18IDM3soz6aftEeU5sidHOoW+KQn4/qfw5dJagrhbq/Wk
         dUG2SKACXz2UO1SWwbcKsHoIoM4oDBW7/CVSkn6E/yT6YNv4UpSquQlSljOOMdr+lMPk
         rHPWUd5JG+ImZfJGSP4IME9/i4vOKM8PmIhiWxjnJjSSPYCnk9VyUEizFW6smhzu/PzM
         r/+A==
X-Forwarded-Encrypted: i=1; AJvYcCVNfa+E2w8JWun7YjU/ZxJ4FBxX+pJF305r6ncdfu4oLW7sEofrRdvYwj0eyRdzuHgiOBaqW9/4oD3b1H7kwkUu@lists.infradead.org
X-Gm-Message-State: AOJu0YwbhimWpvxkmYM5rt4yH0Cm3vYBox7Oqzg85KKyIUTNMu0SSrVd
	GUqaBmAxXK9WuGpBw3Bd2jpM5c4eQvrVC+eaLEmv+turoBqmTlDkNQOfU794XvJbjhs1O9+Lt2t
	GBmhcMPwG+2YVICId0ZFn+2TmbyRSl16QY+ow0s1Ln63XSaLY8OmXrm4jf0H/Q9WXPbHfJf+aVX
	R1
X-Gm-Gg: AY/fxX4freCLeIYkiZiztqsws4jYvUw49+1xUjVUotZ5fhoF7klJR+A5yvbDFM4qWw8
	m8e/7aNT5d66cstyqoahXApcpBIfQCW+NY1JRz8AgYLhMo4ts0/BZC496P3e9dcuyms1c7hwFU7
	7bVtSrwlWrUSJk88SJ0AFikhn9tz/mipxy2+TGhz5lHUjwo5nhFJSje3tuEvKUbca4lGSFejI45
	1qVgEXc/i8rjrcWc/bMXzMcgoBYf8hxEGlwjH+klp5n9GARFi9DtexhY1uDzux/bs9XL1gmfDI+
	d8Xn9HBBbf/Vmel596rJigTOKEdd4Qm73YSBUDiqZwbon5OtWXzJxBs4kZ69EyNDSrkhNX55gtx
	8j2q8y9s=
X-Received: by 2002:a05:620a:294a:b0:8b2:e638:7dce with SMTP id af79cd13be357-8c389419060mr1129791485a.75.1767916412577;
        Thu, 08 Jan 2026 15:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4aSIvh5903rUXtL5jEtQ1zOb6hKj/5LGmrWgk9wivP+NEURpK64IiEcwSkjpWLrpqPNhyVg==
X-Received: by 2002:a05:620a:294a:b0:8b2:e638:7dce with SMTP id af79cd13be357-8c389419060mr1129788885a.75.1767916412239;
        Thu, 08 Jan 2026 15:53:32 -0800 (PST)
Received: from redhat.com ([2600:382:850d:c75b:2aa0:b08c:d81b:f52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b8b21sm677303285a.16.2026.01.08.15.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:53:31 -0800 (PST)
Date: Thu, 8 Jan 2026 18:53:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, radhey.shyam.pandey@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	sean.anderson@linux.dev, linux@armlinux.org.uk,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] clk: Add devm_clk_bulk_get_optional_enable()
 helper
Message-ID: <aWBDeO1KJ__eGa1M@redhat.com>
References: <20260102085454.3439195-1-suraj.gupta2@amd.com>
 <20260102085454.3439195-2-suraj.gupta2@amd.com>
MIME-Version: 1.0
In-Reply-To: <20260102085454.3439195-2-suraj.gupta2@amd.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HwPVeCXzMIFYxK3n2F7pCeuBrlfVIu8Kbu4T4gXzIzg_1767916412
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_155335_861959_63027472 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, Jan 02, 2026 at 02:24:53PM +0530, Suraj Gupta wrote:
> Add a new managed clock framework helper function that combines getting
> optional bulk clocks and enabling them in a single operation.
> 
> The devm_clk_bulk_get_optional_enable() function simplifies the common
> pattern where drivers need to get optional bulk clocks, prepare and enable
> them, and have them automatically disabled/unprepared and freed when the
> device is unbound.
> 
> This new API follows the established pattern of
> devm_clk_bulk_get_all_enabled() and reduces boilerplate code in drivers
> that manage multiple optional clocks.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


