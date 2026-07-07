Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA243C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=; b=A5eobWvoh0POgBS+s0E8v8854o
	8E5Bsul/aILVtHomIawdufIcYGOg+DjQrph72CYFPHBbaSwUGlUmCEH1OhySOUo4JJKShw9I7m7cb
	UO4u8niRClbhY+pO6ynnxRgNiV02xAJbzrwCP8UCvPfrUQym/3GI2BAgidgqIGemoZ38/aEM2pUQm
	18Up/FWqXwXycN3xBqGgR7UgjelkObREgfRWXa7FQ28iJ1YIbjQq5X7T1K9e76A9HDOIHjiHGgrn4
	lJJ7j8ckIJIfSXeoZhSe3QW7Z23EXbsQ3JxI0lLN/bcrK6LaBsRZA/bkS3SJlvSFmll3P92vNgLjd
	/1OK3PRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76X-0000000FD9Q-3mXG;
	Tue, 07 Jul 2026 14:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76W-0000000FD8W-3y2k
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Jul 2026 14:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=; b=KrBv1cwba2J69Ikxvwxru7RpAG
	HiTzPAgbD7QIhMqqIpqm/sGWBhrdB4ghO8k34oWM2nKEebvOWW9UFqxPS9RPDFonofyowO3OfQxhJ
	9sDu0hvEKJ4JEvK+oPoY4M1nFk8wJnXWBBw1/nihRsWoiftySviBmvUbjPIDH1SekEICHEy451nUE
	WJUa69vaqaopiw3ZhV/1slzG/eOKFwO6n55SVnfwluQA4S/54lVDrgrUu6BxY7Q63DkgVzjG4A7fS
	X6K2dV/0fVXiDgLlcBRDrjxf0rW61TdM4mwgNdCMVJqnF6atU9vOeC0SY4ZXNlu1eFjHv1StrVlVr
	Ewy/7u7Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh76S-00000007ZHp-3niR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
	b=Xl3zARvUqOhTfNHFrsYltJxqcZjO9pXiX7FutjWLgIK5hoXdjhFWAeTVl1oUEam9IHjcrt
	a6l9atwwYUsU4nzGzl/wbF7C3g2hC9Egg52VqLZs/ibrpiQqzo8SBVbefCSvpMY/PlOYjF
	f94Hh4AWPdPvytIale9SIaZOHT9nbo0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
	b=iLZbY2YLYJPj/tejE6j0fsKIqCPkmxGxbxrV8uIbpvA37v8godM/oZInhAQLuxjQ1B9CEj
	Fzfs8DaCPtH20YB4vQNV1x3uB0I9UO7h45rP6vs5rXGzwI3mPdvOC0UZkxAjhGoWzHQ8/R
	5h0ucIcAqEjo+0csam81Li8DRFxmyO0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-FIW-bE0gPJCOTNGa0L7urQ-1; Tue, 07 Jul 2026 10:47:26 -0400
X-MC-Unique: FIW-bE0gPJCOTNGa0L7urQ-1
X-Mimecast-MFC-AGG-ID: FIW-bE0gPJCOTNGa0L7urQ_1783435645
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e0e71e05so6522473a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435645; x=1784040445;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
        b=HTtAdZgWmM8tf7/Fx5cT3ZlIkRyP19eLwz7Tm/qHG/9DNnHHG+YdTrznm6R4Nb4KZ8
         nA9Sps1UtXk3s9xpSe9hs1hgvu3+LX9smlZswo/wiLI7NMvOuZ/J4kwkFWlhPyK/mJB6
         Oih8hP5x7EYSsr/iADmCe7ygcDpW1c2U0XEdbB9Y74JVJUPZRVMCyQ86vQcgGGhvCyRk
         QCYMI5eZdQ+/PhLffllEjSYRlFTcuypMnAhVzYjDYg9PHLVN2JcnSKO/85OEkWC03wgw
         dNGRsT8RJaChBsoYOvzhs0OKUpchMcrX7RfsQnjAtcd59zNrqP3SpPM8Ovm5/c4bBVYm
         hzGw==
X-Forwarded-Encrypted: i=1; AFNElJ+a4EpUb2LqIRoPJ/R/FCOhc+QZHuDuh/C7bqQtfuAEDiu2+mHXw1wOENSkOTJJagx1XlQlfN2/fS43JpfUlPyQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzD0BWK6KPvXvccoaFOn/ZVVH6z+PV6syiaeJ8BbjbsWeO8QLjq
	TeLUjh1Ci8SuQEaqouCQyHAAW9al1CpHEKWuxJq9mRkiYUOtugG8fUBmMjNvSXkhyY+bQTCgZ+I
	66XtCwmQIx991kxSXDgOiDGrn96qKytL9Y+Xyn5VR/nF+Pp7ml7ErGLWwTpnkTc7LKMcRluSn2U
	nm
X-Gm-Gg: AfdE7cnYdArKXDXFSh3i1ZTJxPU195Xs1rTig9nfqNXA12shhXr3CETdPkyEpYQZD1b
	ezDlNnhneI9+Saxjr4vVKvT3G35VkcbGSkOHAk1r+q6NBT+arTkNTr07dBi4ZsNa5PLi6jNjo7n
	4MHDEtC6oQnU708uO0gNux6W1d3ge9M0ZZxvuelL5Q6d2d9oOHT04Jhk4OMWde3mKmxkZEN4wH5
	tIOF4h/wpHAnY4A8Oq7rqMdjtw7Z1rPxB0gjVzslWOMHc3ahne2RqZhXVmN4T/ziYO6EjV3W4Nt
	KjsyBBGwqF/X/4FetjlGEKmLwwuVzM6I1att8yF/4LYRjfO7IhRPXpJKiPoS7JGoDQKzNx28GiO
	E2fD645BH
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3395672eaf.17.1783435644629;
        Tue, 07 Jul 2026 07:47:24 -0700 (PDT)
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3395595eaf.17.1783435642165;
        Tue, 07 Jul 2026 07:47:22 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544a1725sm13981552a34.16.2026.07.07.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:21 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 1/6] clk: mediatek: mt2712: fix memory leak on module
 removal
Message-ID: <ak0RdSkV71J1_1By@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-2-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-2-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i9KX3zMwELSg_rkC8bP8CBGKsoVLTgNsIopgkomf1Sc_1783435645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_154853_111125_2EBF9A2D 
X-CRM114-Status: GOOD (  12.51  )
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

On Tue, Jul 07, 2026 at 04:48:30PM +0900, Akari Tsuyukusa wrote:
> clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL, which leads to
> calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


