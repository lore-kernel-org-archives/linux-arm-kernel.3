Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AE0C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=; b=wd6u0vEoXyKXUkJd41KKI61F5e
	e/I205xGSdl1YYEQE9ZqgCLGpALMU0f/gNeI+25muAaQDc6HLTrzbkZlyUJQrg1uHCtAruxOa4mNc
	3q8AzAeKChpkrBnbxj4s+xaq6IbbWyiQF6sDKI0n1vBdwXT8LcsIdKUXQCa/dJ2BlE8T+XfnbQH9w
	1FeRwZDhAXWo9gucuNhTbxA9yv8ttsncYzWVvIfBemP3pxC2Bo3ce3McD0o7G0hEoWGyqqW+Cj1+D
	V64PcgQccCPvyInzc6H0ihO+qD/jnpdmi2hbW3Wu04twW1aH7817EG3991mLd3s0QFyg1lTJv1Hmw
	Cd7dRl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kHU-00000003JTo-1YbZ;
	Mon, 21 Sep 2026 20:06:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kHS-00000003JTO-2fF4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 20:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=; b=oBB4NbsMbw+KUf7Iksocs6dyQv
	KMZe6MiRPI7N9AktMmhwHdsPavgrMJ1UjEYpaA72OUkZNLWfyyBXG6knrDE0JqpxMP6IXFtAFO8gs
	8vmMail+7jOqVCySvksLWkM6isgQpPQJFb/yDlafJz3MNzjZFbUnHJk4B/VO2EaHZ7JfnRvS6gzlr
	oJwvv9DGvXjV96nV5S+BvxWASwHDpFA/5nxmp7TAFsU2/XLLQLrOqoPC+2pWIW0dDyWNZBFMUNXSG
	ANiEfPjW0Wp4iXEFvJJISu1WGI8h2FQc3eArXfsQy1wrua5W2lOy4VomltLXTHrPNuomQwVsAvsAN
	KaEwZGFA==;
Received: from mail-oa2-x0c.google.com ([2607:f8b0:4864:30::c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8kHO-0000000Clmn-3O3A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 20:06:25 +0000
Received: by mail-oa2-x0c.google.com with SMTP id 586e51a60fabf-46a63c34533so3877515fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021180; x=1790625980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=XU/aL+XuuJ4dRPOQQp28fKAKZqLUJmapC5ji49xUAYN3aaLFfT6eqsALgo0o5PKc1t
         jlzhpTBoWVCyHYTXD9dcu8Axy/qMktrCLUGQfVAZ14Q6ToI2V3+2ZoaEozkXlijKkg9q
         7ibbAsyiU37Vyc58DkR8E9i/o6fJyJLy1zs70rPMLOskCRi8ifwtX9t8h+tdhZ54F4fZ
         zYQASGjG4r2LUR5VKsTjpmN1R1k9zNyFVW1yoGK8R1SCzkqIQsx1tQGn95RduUts42FQ
         YUgiFZ5MivnMwqd4ggBlzSXTGiTXoWbBb2LAfK0F4ysMCUfC10KtmQKVWJnEiFH8mRUA
         ppEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021180; x=1790625980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=O2ptcNhEbgWKCBQCggYa7tv0woPRUMq0UnxFcrqAcuIytgOcyq3JWBhFNMjvu0Ht6v
         cpfcmJEqYil8yP1NT+2j/lVdrUUHLa+oQdrTMh/ZYjjqvxE8DmtgjEDwjO/UqNIhZZ9L
         ribaN8GkhVLHrEbyDn3tKicilK0nCg53ASfr/zYmsTLCBcFWo8aQcT85pkZxbOBPI4bz
         3+4bRZvTSl7zTBWfM7TupvcueUJRSL2s+MpQHEYfs4nfMHUqe1nrgh/HkUXxRQ3K0OEd
         eYJ5zEzsZND0IH5Va86dGkzD6DlgRf3QOw5k9KAJiEV93Rk8POrgrcjs/9MP7uHqtUqu
         hfQg==
X-Forwarded-Encrypted: i=1; AKwUvBwRexV5mCsMMNBeMFul2hNAHEjBJ3ObTNo1fkJpor7mH/2UOMFiEblsfRkJpj+oJWbPAcgMqkQWV/HDeMl/0Mww@lists.infradead.org
X-Gm-Message-State: AFuF++nxmsh1WW+BQdTRrIs0nsthzxQdax0nWMgrKBh5pp9m9peKGTob
	ouJ/h0O4S46S6gI0ztZ5dkgEwhFIAR2pYQ+bhVXdJL+b9NvMvVtsOJwDVmFuHQ==
X-Gm-Gg: AYBFou0PYjUBz1eNUXpkSLdkk1ujF8nGF2+V1Ey+7Z33u/hm52EOUZuE/bdV/ga/6zG
	2bdHqZJW1w9yVV6tXez/JobRjndIHHgUKi2x5/U5IZdp5K/yrrlrk3Q7WtMKdu4bJc7YACKymNu
	HBwYk5tru+P6UALJr5xbUnNYi8QxYE7s99eKOSsr4Cbtf1R/efw9nSNbP/VWnY2z3Yl/vrnK8DS
	GXNFWqatgLV592A04pSYe/YNVK2PvMZEeHtRB4p3wMeCQkmfEJjft1MDCLLGiLwK8k8rRjfoDSH
	FikoAAaWLOyQFiGzPdqptWchAfh308Ba7irUqVxyGhDp1NH9W+RShGTlQT3N/eF3X1/Ss+N8FrT
	6/7DhImXmdPHHvrzyslNZI1bPNfuc2/KeVjP698TkY7IM6sRA8sT0s1kWDJ6dkBR2yQJxFinfyc
	pwphSSwYDlKEPxJ8siauENjHopYjbkZHZJmNM2/lakjPnxOIi+/GxEaDqINio8nuISFmApnFNmA
	ssEHcXmFtHIPRVtajcj0aUstI0P6/6XahB+vugxKSA65Q==
X-Received: by 2002:a05:6870:5688:b0:488:5fb0:423c with SMTP id 586e51a60fabf-48f6c2071b8mr252272fac.29.1790021179689;
        Mon, 21 Sep 2026 13:06:19 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f6ce755e5sm170837fac.0.2026.09.21.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:06:18 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Mon, 21 Sep 2026 16:06:17 -0400
Message-ID: <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan> <20260812201502.264919-1-enzo.adriano.code@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_210623_230054_B5C44F5A 
X-CRM114-Status: UNSURE (   8.59  )
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

Hi all,

This RFT series has been superseded by Junhui Liu's tested four-patch
series:

  https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech

That series implements the M-only and P-only clock conversions, was tested
on the Radxa Cubie A5E, and has been applied to sunxi/clk-for-7.4. Please
disregard this RFT series.

Thanks to Junhui for completing and testing the fix.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Regards,
Enzo

