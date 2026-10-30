Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IStM1Txj;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FcPcKCDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=; b=IStM1TxjzE44Fu
	6cZem76B8KoMLcjerBZc4rNB3IOFVxz4+Fx2OtfA9yOOo4HGfg2b3kl4ie6Xuo4pBIZsdc6wYCRSe
	OMTM9hhbarIEsX66HK3yb6mRg9vd8VzXGpvrxRhPbUsBrPCF3+UZm+RFMXP8NbYFEcBDQenY+Z8sO
	EUbUJHTpCwq/5vP61BO7MxNuGLJ1bOKIdxmievMYEDVXb4DwvwJeWOAgfpIR6q1qQdqMJYBLJGDLt
	AbXM0D7dUNxTOJ5QdgWw+rpN4KM1kQcTHKH3b+XywmUV+SUbO2QW2zUhiWahh9zk5drxSSUTcsSLi
	Q83Zg+rMZeisCTIva/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiX2-0000000BC8k-3vvE;
	Fri, 30 Oct 2026 09:04:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiWz-0000000BC7T-3trJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:04:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso279883f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793351051; x=1793955851; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=FcPcKCDkBd7Vat7mnxF4kWJ6JvWLVd2mgUUFuO+viv8gcF2WqWX9op33QUICyLKqor
         O3LykCGHWdiSAtMYTooibcd05vXDR88u7x7X3CDK2C2D2KHO1ccAdblCOTwY5Zr3jxL+
         GA0cYrtRDeWdmUCUYXZoiMGS5Z8e81lAA6CLRjEJ0JuyQnPz/NZRCjAGO+/TGNb9aT33
         8hVItT1ocOWvKqJYvYN7tYjid2VTtZ0+KE26y10pS+F2lgr46hKgsrjPDIx7JapssXfB
         7FpA6tKN2V+a1+RRl1oLY2uHoY+DOb2zvtAgBy/iQYx4YVjQXtMSdC9ZRMBgRolzcEe4
         tKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351051; x=1793955851;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyeem7zbd9Dj2v4p81+wNT8qJ6Duf4aQ5ILsHn2QZOY=;
        b=TrTcRtj7lMN4AjTlgPQRCcgXTbKcE1CayE+Jc0+RSb9U9lKHDcl+r0NWMJyhQgqq0W
         N7y1EuE0DNFIOUK9cBwON27cNx2dutEgwKeuqAIz7SSLKIbxntPA02SZ/JU0Dc6auyIF
         RPZHyL4S/FsO3Fi1sdMszbwzeFai2D53HlJDn4HyAbVlZ2Hp4Q5HRzuen6E1I63/+HxA
         Pgub1InNMvZhzB+AczzE8UavjzargWiLkfUL8GPkviNuJ2acXHh1j2KBhnM+RPs7o4qT
         f+N61dd9ze2447xjqxru3geJs9EbfqCco+JECMaCcI5yOjsTbHaFcntMEFKRPn4bUcQX
         Uo/g==
X-Forwarded-Encrypted: i=1; AKwUvBzvYscZ9WtgIET0xXHV8Y84JlksNudlgwhLjDhqyPqUhlxR6hy2VPqXQZCfOHsggtSfPtSoauZs5izC7QKZDxoc@lists.infradead.org
X-Gm-Message-State: AFq9FYIOqx+sj4w3D1RC6lwQLAZeR8dkJpIzCe0TKiYAtefZ1bRK9zR9
	ML119iNsT3SYF1ZhkTWqZBMdMIFAjMoLGrvK2FG6GGTw+cbvuJXDXqfSPA3YNtEJI8g=
X-Gm-Gg: AYBFou3jrrnBTqgL8OA5EhBsPQGfOZ309Pm6hdFQ0zUlZZtZrP/lS+qYc2lLlE4gEck
	E+zyzul7d0wnAH3Onj+Sj0TJuxqcL8+NYSvq6rkOmjWuYi22e6E0fCoQm5P/j/js/1MWXME2ok1
	e+niU9Lv99fHJ1dTA+AXuNfcQv3m+oia0wiSi3YjyCTjHnPnrxfmYBbae/dWqjO0KDZ9iG+IY6C
	n1t9ltdjf0LD7z050s6IETT9BDs68ONj1/Hp0DOdC9Z4Z8zgYbZAbMbsNPQqyFOQu+VECFUrKFU
	VsFnq+T68rKHmxf7WpJ+rIaTfWijygwPWgpTbSkT6/yhhUYY2fNb0oILX31e81JzfP0JuzLK/Nj
	hftEVaIb4JzWgpz3IBpRfMf2wL+MNOXpRjiptpKJL05BgFaQY1JWqlhNwRSwIOWto+n60mAjFX4
	EZya3/E0YxYRKGAUcdKrESw2KxiEvHDjI9QnL3+b3DhLlb48uqoVIBVvjcoOmcCTQRzcdyAkPLG
	5z+ZKcKqUXC2ug5bz19fG3Ss2nEX5w+ckJ2hcXuQ+q6ReP9mdKfbs7NqfgkqPJLtYYxBScONKc4
	KCp8RDwu0b9SF4WNFrJHX0mpIhEoCxSfnBYSYKImynMa6vJt8g==
X-Received: by 2002:a05:6000:29d3:b0:48e:5df2:a011 with SMTP id ffacd0b85a97d-48e6e2c14a0mr2402572f8f.5.1793351050905;
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm1977127f8f.42.2026.10.30.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:04:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: meson: Fix PLL enable timing
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
References: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
Date: Fri, 30 Oct 2026 10:04:05 +0100
Message-Id: <179335104535.2573818.8004160070280286355.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xx/eVbgodhm0RN6K7j9bFweBrB1LQw7pZ6RJPufC9Ko=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPYjsvLvb60dNYISrD82ePdkjGlu8bu59yTpnJIHckl
 d9Fel5hRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaiIcfwP+H5ve7nf765rXFe
 3Xhp8cE/jpN2ld5xm75PWd5+WuaClckM/zRXCy/+OTWaq/BGwcM/q6vN/z03MD/MvFqk3Sg99NV
 zCT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_020413_977791_AEADDA3A 
X-CRM114-Status: GOOD (  14.42  )
X-Spam-Score: -2.1 (--)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The hardware requires a 50us delay after setting the PLL enable
> bit to meet its timing requirements.
> 
> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
> may fail to lock under stress testing.
> 
> For example, enabling the GP0 PLL at 1512MHz may lose lock and
> result in an output I/O error:
> 
> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
> sh: write error: I/O error

This is something for the cover letter or bellow the --- for a single change series.

> 
> Add the required 50us delay after enabling the PLL.
> 
> Testing on GXL shows that the PLL works correctly without the
> additional delay and continues to lock successfully after the
> 50us delay is added.
> 
> On A1, remove the redundant 10us delay before enabling the
> self-adaption current module, as the new PLL enable delay already
> covers this timing requirement.
> 
> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
> 
> Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")

This is the commit which introduced the enable bit and it is not really
what you are fixing here

A more likely candidate is b6ec400aa153 which introduced the delay
sequence you are modifying here.

I've got this other patch addressing PLL delays in my queue:

https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com/

Which one is it ? both ?

Please consolidate and resubmit.

-- 
Jerome


