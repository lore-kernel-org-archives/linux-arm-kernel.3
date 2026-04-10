Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59536E99050
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gYxyowuHupE/P8ao3pa6ZgxztqPahT8BS261CIm2ZA=; b=qqYhvISEBiBQVvySrjkid48w4G
	7ikHrnlT8qp9PjSuGmF1aD7KrJaUV1lJ2y5oy3E/Pcc/7fZqvvuFAU8RX5Us32bb9RFSxxpPCbKUc
	Q5F2ju7NszeHIJMKoQ4RLyv6LCLcjbzdvwd7uLrgUbPnHKRGasm2lxD8G7vc6JG5R/ZJkWXrhg30I
	3ERujcoWWD0ESIvICqrWN0ZNMH7+wI/F/qGCeIeXAs1Lahf1l0bKRDE5OBvnbMrmU4h2gK7vVYbdr
	WMOFRPTCxXDfQc0WsB9Nlz0300F/LzV09T6BsbvWCqkohKALoTH1VDwC3eha1zHYSCcJEWEYKR/zM
	lI1zdDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6iX-0000000Bnql-2EmA;
	Fri, 10 Apr 2026 07:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6iV-0000000BnqW-26yy;
	Fri, 10 Apr 2026 07:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1gYxyowuHupE/P8ao3pa6ZgxztqPahT8BS261CIm2ZA=; b=pR0W9t3XbjhnS7BAeW2gb1uAhm
	IFwptKhIMXPVKY2ax6MqdQah7k4t2QuSyvkfB/L2XL2yX0rAMiOdAPI0nC3awwLqMImN8rPpSi4pq
	QluqwFPq5J/w2fFIkKK2Ukz5gkC8PR5X+et5NvEmZR4DIKC24t5/TOAqjAbtb0jp49xv00hwWIvwJ
	oK8jry4qDZ8tTtQHgF6iP99+mRTZxEq8Qhg3V2ufpWYyqvY/kSgggMHLRFORSDu3A7dLb3pQujzeU
	XBu9cRwOFrTnnc8ZkqoOgz7O8iuSPHJ4uhogCwEXcDyXQfP231+LpCOZjEvIJTKL67of4gdoiLQJz
	0C1Ksm8Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6iR-0000000D2JO-1ov1;
	Fri, 10 Apr 2026 07:55:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A7rJ7Y12629035, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775807599; bh=1gYxyowuHupE/P8ao3pa6ZgxztqPahT8BS261CIm2ZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kmMrAIRU6RE8rn9yNwdzSWQeK9lNqkY+Q0SKbuId3utRpkOIscr+P4gnkV67zmbto
	 KSnI1nto9nNw1lToxXPdvvStyI9Rv4w6Wdug9CXcypbowX1V/w7Cul/sIiQWruNtXO
	 DMz69JEuDjNCtZCBw3TGIiPLtdO8h1IlCXKZaRg3VDQczfkBmNnNs75IaWpO8BfxgA
	 q5faJR5Y1I5KBOza8xxPB4QVi6+AzG1qrZrL/Hwa1oyJyrK0D71SfpndnbG1yT7+vD
	 PNCPY/5ztoe3U0NKL3n5DF5+DtAH5YXld8WSd8iQLOtZwseEMjarFoPM+Xe/BOnkix
	 L3NXunJTheZOw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A7rJ7Y12629035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 15:53:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 15:53:18 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 15:53:18 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Apr 2026 15:53:18 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked loops (PLLs)
Date: Fri, 10 Apr 2026 15:53:18 +0800
Message-ID: <20260410075318.2854478-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_SX1UJRqiBH2iM@redhat.com>
References: <ac_SX1UJRqiBH2iM@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_085548_435372_B9E026AF 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Brian,

> Hi Cheng-Yu and Yu-Chun,
>
> On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> > From: Cheng-Yu Lee <cylee12@realtek.com>
> >
> > Provide a full set of PLL operations for programmable PLLs and a read-only
> > variant for fixed or hardware-managed PLLs.
> >
> > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			    unsigned long parent_rate)
> > +{
> > +	struct clk_pll *clkp = to_clk_pll(hw);
> > +	const struct freq_table *fv;
> > +	int ret;
> > +
> > +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> > +	if (!fv || fv->rate != rate)
> > +		return -EINVAL;
> > +
> > +	if (clkp->seq_pre_set_freq) {
> > +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> > +					     clkp->num_seq_pre_set_freq);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> > +				 clkp->freq_mask, fv->val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (clkp->seq_post_set_freq) {
> > +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> > +					     clkp->num_seq_post_set_freq);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (is_power_on(clkp)) {
> > +		ret = wait_freq_ready(clkp);
>
> I should have checked Sashiko before I hit send on my last review.
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
>
> It suggested the following:
>
>    In the Common Clock Framework, .set_rate executes under the prepare_lock
>    mutex, while .enable and .disable execute under the enable_lock spinlock.
>
>    Could an interleaved clk_pll_enable() corrupt the hardware state by running
>    its seq_power_on sequence concurrently with these multi-step register
>    updates?
>
>    There also appears to be a potential race condition later in this function:
>
>        if (is_power_on(clkp)) {
>            ret = wait_freq_ready(clkp);
>            ...
>        }
>    
>    If .disable() powers off the PLL right before wait_freq_ready() is called,
>    will wait_freq_ready() poll a disabled PLL and erroneously return
>    -ETIMEDOUT? Is a private spinlock needed to serialize these operations?
>
> Brian
>

Agreed, I will add a private spinlock here.

Best Regards,
Yu-Chun

