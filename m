Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6A7CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3GyaXOKkKvLzK7c4V/rn3jVlhkCTZ4qzh+NDvYWL1s=; b=Vq8nwejW9ohmcU+cmOfbdytdH+
	M3mMwZNjmYGUzMLfWxmtSA73ufij2U68fGhsq5RbWk+L3xuLm/H5QPMVGrQIjDO9uNKMxFuNmOZw+
	bENB9chQfhHoYKaBNo2cC0BOZYMVnCKki9aY3XlrsTiTSI6PiPed/GjGKQk/EK8Qn2hGV1tANS/s+
	bB+AJh5DjGRUAsWaxedq4C/YniMsO/Bje1bg9eSEBbVxC+VG91mtbUf9bDoYMjUXD2k0z18hag3aE
	fm3TI485bgdWDO/t+1U7GLPoHOBGF99lFR8X59cVwXQvhnaKW9a2ZLcKZyFmCEr9/evGDSohrO9Mi
	j3OhGKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3aF-0000000Ee2U-2tuO;
	Sun, 24 May 2026 07:49:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3aC-0000000EdyD-0wd6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 07:49:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49048e043e5so12537565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779608950; x=1780213750; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w3GyaXOKkKvLzK7c4V/rn3jVlhkCTZ4qzh+NDvYWL1s=;
        b=AUEKwVe9qQ4A1imvyxrRlLps6hxX3iY9S8lODT0nqefgg6W47C+eLFE8L2ZMZBGTl/
         peb0i18F/E3aszsCMpN46YeZsdpsdPJUupOOV+LgCAXUGO3ZilQUO+3U6K3SiLNwUTXu
         xQWYh/wgJHdPiGmiiZpw9Jvzj52C6w7sh+k6nN4Tkz74nBP4rrKHAWzidrxa9QimYRvg
         D9c22+yKxm2dDaJMADOqqMOsyyHpsmaPvl/ZQOqPlS2zrr6uxc6yy/HeOqOzcoILEY28
         FhuL9y62v5g2o8Ze1oT52sGPWsT91SWG/15nD1SiKD3JGIrFduckjS/a+/jdsHDdvdEH
         8DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779608950; x=1780213750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3GyaXOKkKvLzK7c4V/rn3jVlhkCTZ4qzh+NDvYWL1s=;
        b=azqhET6RI8uu7+n2A8QXNRuV6Zh7xDG5DMvG1G1NY6CmTS9mRpKk8MSLaXF7c5U5hC
         X9ngSUfQH2wazMeqxrBl9T/9mbpwWzU/e24D/4o1L+0AvZLJMWWgNUaR4biC9VHMY/A/
         Y1q4+ZvYHtL+LUxYiDz0/8QMhpts45jtBJbUy5G7QYKG6E41bL/Jebd+tolOhAH5QoB9
         o0mrEMHFmTM47LkSgybAeMUgC8qPBKSc2YbctQFHPESZrma0X7LiGw478SP3EyMbU0Po
         JL/5hButyCGa6ieyFCu7hqFJMsFY5UbJd4L57M3QYcicQz1HCB+660tydUnK9kU8jBrI
         vFOw==
X-Forwarded-Encrypted: i=1; AFNElJ/MSadFSOLKGxJ/hz3XammRAFDIu1pBP7iHwf/4lhipjrxN7E0LoTpidmG8cXaSRVCgzfN4lcYhQx3jrFW75a/x@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi7G8HCd2mJKv0qq5Q6GV+2qAiYga3sdlJNtqJSbQzOBQO7VMq
	owAXlpQf54HJWDK8vcz+QfX8Tz28B5Rha6S3NdhPc2GzM0rmYlDp0Xmk
X-Gm-Gg: Acq92OEhDKObdvnnfWMMI6nF50DtQR87/H0Aa4uhSxZvQ+zSygPeWTLPJ1oW3257h/1
	G24vcwSuq5A3YYI+eFjBngzJaq6AXlSqQfzSN8Z4hgKQwgLYZVgzHz3r1KtudmNl8ORduk7+yO3
	J0swUwd7QZsunrF5eBn1trZfqp44z8H/uZlfq8tsa/UoiEqb60Ueg3Dj7o9sPYN8Sgcu93LJPzB
	Y2IWNTdCO2VnzQN0zZPV3AumlGQY/0+xSTbUz11uvJUTBjcfW/vo2bAsBjN39R1P8QtHqpjK0/V
	4QE88dbSu8FifRVduBg+a8YR4zs/ARZF60UhTneBRVA0Q6ln12SHrtaVrbruvfjxwyWItBeC5uH
	6VoRcY1c5cTEUDUrK9Iy5Zx9K5tLSjswAkz6/8KmRKMQmdwRwFCHO4KXHm0OpCbciS4zGrt9eCI
	8JvgAPx2/xh3SOZZNjQ5WWH03CJZQKgX4V94AQsa4fOKK3ZQVDK4EUNFAYmSu7I9HY/l4yrGpJ9
	xi+CPg6p6sIsUZASFx+IXIiQwfoqfKGCc2WBfe+YXKYkOO6k/QroH79Sh0KdmrO4hP7fsnk57Nf
	YOSTMAr+pkPlkQvZA1IEVjIN3i1I
X-Received: by 2002:a05:600c:4ecc:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490426d4d7fmr160170825e9.17.1779608949829;
        Sun, 24 May 2026 00:49:09 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3e0-e401-c487-9725-5e6f-67f3.310.pool.telefonica.de. [2a02:3100:b3e0:e401:c487:9725:5e6f:67f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904179826dsm75306345e9.2.2026.05.24.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 00:49:08 -0700 (PDT)
Date: Sun, 24 May 2026 09:49:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: entry: use byte load for KASAN VMAP stack shadow
Message-ID: <ahKsgJ4qT7zC5Isz@unknown748F3CBA5068>
References: <20260522211503.25219-1-kmehltretter@gmail.com>
 <CAD++jLnhONOMn=7hG-EC_uB80nxXfAnRMuZC2xoJjf2Xzcaiuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLnhONOMn=7hG-EC_uB80nxXfAnRMuZC2xoJjf2Xzcaiuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_004912_291605_98108750 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On Sun, May 24, 2026 at 12:08:57AM +0100, Linus Walleij wrote:
> Please put this patch into Russell's patch tracker.

Done: https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9475/1

Thanks,
Karl

