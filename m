Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF0AC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 03:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whpn/jQ/ZPICmR96kW9h0JyF+OMKrcXAKh09CTAM9Tk=; b=z3VAQcftoJJgol7ePfTibwzEg0
	DksF3XurVtBZy/8DEotWJlnUzH93qYC/vyf7jSdpJZpsfFdGVlFwlhoSYmPQBK1ZNEzU3KrKDkpCZ
	DcNbk1MxrJ3+44GwGRE8rRbWScyUiCC3ju+RW33y2YrNdMuuPp9X9LliCt6k8bPtuOtkiuNFGWQwy
	+aUgxA5vB8yhE5CrH8TGi1mnnuoeVi9VC1FR34SBfArJ33/RsylSNxCXdOBb3DVQRpAVkk6y+KVyk
	C58KCC8+TKGAhzHZj0O5opO3tPQrTf+FP0PrL0NAwf2aZACly7xY1amZEmEiwcF4om146IxSa8ak9
	YQDTyC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznVv-000000054hU-0rrg;
	Fri, 28 Aug 2026 03:44:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznVs-000000054h9-0Ws8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 03:44:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4956869750eso2715955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 20:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888658; x=1788493458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whpn/jQ/ZPICmR96kW9h0JyF+OMKrcXAKh09CTAM9Tk=;
        b=h/sjAI/MEBmqYN570kKBwsQJQxsuASK4v54CvayYfjdwmiYA7W9FQCDL2/Y6GnsZ3f
         63lKBkiqKGZv9P/d7sgJ5MqrPwizut3Zyk00lBh95yudXL6lr5Y0Rr81/LyxLf8lRb2f
         f8hYqfeVIBkg3kfGa+p39Q87zq5cMrLBK8OHViZd3m9pMT+8puyKMxGHbcD1WU24zN9M
         eYLft92cE54XO5nKWYQZXkMgShZ2YxJ/0k0kaC+IuCkMa8h/rL5AT4kJCvJPPZ1wMET7
         CM5d3EeG60XP97F6ntAhIEkPiBQQwxdzyPOBQYHFdlsqI5BWlPez6jCOEe//Zk6LpDg+
         HepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888658; x=1788493458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whpn/jQ/ZPICmR96kW9h0JyF+OMKrcXAKh09CTAM9Tk=;
        b=hVj9DohYIDFMIQSB6nUFX45VqZU6jpEfsjeDA+UAa0Ft3oF7gAEpMykDPEdeHcJnJ3
         nTMCt+S7HUuNvNHGG0LlyhvH04yW4qy/6/V+tZG8PFDbVJQuFsDgPIS31LJd87/bqguV
         5Fz8oA2/o2/+RZg5EeQ9bEoAlPWiP9bcKh3ckXAB8tAWhQpIoC4MJokClUN2EfIUYoWq
         70rZGJMHagVXLDnM4UnROiJOvfe7zU3gLhp/7Kv+BKQnL9eT6aM9oXOrS8h71dHrcfCp
         NoNGK83zdcARl0wIKco5aS5OUCnR2xVe32CDC45B3v254zP91XmiWWLcVHSM6omFMB+f
         75IQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFLhAA3VngyqM8geYG+MUeFYEZHFwFIl9DQr8k91JE0AfcyBprC6OcbAGwf2WK9LrTtsZcDsGFsO/dTdq3GlX5@lists.infradead.org
X-Gm-Message-State: AFuF++kFrnsmWjV9IwFarATphDQMicIeBK7qdnWfe7K3IyV4FSQd/sej
	QqbapLJUuielCDjonKX61RMy2rUvu0Bbzn6FIx4ORM9osAFcVpn9Doqj
X-Gm-Gg: AR+sD10zaRG33qkMCSgKxgV+xGeGVpoIdQnL53qiPGGdCLWhy7ua5tJv/u8OjJcq4/A
	YMrLJdGPVoyP9x24vqYSU7s7QzU9y25qTPPyQ9Ieb4aBcFMpgKSjgr6AQZjeu5LY8AiPzPJsUvq
	e2cREbL88cDsVibGImshWOBSohieMC6QQkLJYlDN5CVLJJfrmrH5lp9nyMgnI8rBnBDZs6ajZ6L
	Vt/HBnuH0NFMbp9mtMpil2hSU8X8yd/4VnoHAhtnE5FgNsByG9UjQsu0E73++ZnPuELjrR34y3+
	kr5+pTHJa7utmnFYY89kcrnlw/zD0J/xxGrQcEQQMuY9He0TUek6ihD7LzTqRWNC8wkkD0alGll
	TeFe8QBoSnO/+UG1o/dvf6AmVS49DGauQTTNBchNAFnz80f+FA5w70AvaCGD0qaasjahgzkgvkh
	AGMiFG4OX8yM4sB47AELETPlvgnQcRO0p9lTOvkIqsmgTpArDrHUbQ8CNmSt6h0T6xyAr36qmuO
	rZqBQ2EytWO/V80Tv9iU8yNn4vkDaaVNeZB0FOnnZLIXd+lwkEeUNBSIYUGqXeOc9Pl8tZT6k0V
	gELvIkNAqbnqUJ56
X-Received: by 2002:a05:600c:a03:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49b91c5096dmr41739775e9.15.1787888658041;
        Thu, 27 Aug 2026 20:44:18 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-077-007-099-087.77.7.pool.telefonica.de. [77.7.99.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm17275445e9.10.2026.08.27.20.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:44:17 -0700 (PDT)
Date: Fri, 28 Aug 2026 05:43:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Walk page tables with interrupts disabled in
 show_pte()
Message-ID: <apEDnrEbpvXq-mTe@gmail.com>
References: <20260815211316.974-1-kmehltretter@gmail.com>
 <apBKADD1xiGWzHCB@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apBKADD1xiGWzHCB@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_204420_200272_BD12E6B7 
X-CRM114-Status: GOOD (  11.24  )
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

On Thu, Aug 27, 2026 at 03:30:24PM +0100, Will Deacon wrote:
> > @@ -151,6 +152,8 @@ static void show_pte(unsigned long addr)
> >  		return;
> >  	}
> >  
> > +	guard(irqsave)();
> > +
> >  	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
> >  		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
> >  		 vabits_actual, mm_to_pgd_phys(mm));
> 
> Curious, but why did you add the guard before the print?

Good point. No need to cover the print, I'll move it below in v2.

Thanks,
Karl

