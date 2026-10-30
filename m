Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=doGpa1I6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Lposd8Qn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QVKMydU/thLME4tk0hjz4sP1iIZCD+FNDdETjFTH1wc=; b=doGpa1I6TQa3VQ
	uRhA3ffkyKxsZ2yJPU5DS9y0Vx1z9QpCH9eaxHOgmwcQx9DMrtQnEBuO2+YOSvv64HxjxlhesbVn/
	H+6BVqvQFuHpEltcQPZ3sX17oSJaTPxwdFTN7pAVb+Y3D0+icXoWQOSAVo1VY2Nvy1/KRgfxSLJQO
	bTEhX0N1vH82jn7zFomi5G46sHTGuDQD6/Ub2hMKdVuLZYIfhVvlUeqb8UNqBqYpJ1jObGkws1aLZ
	puqIQGwNXfbqFKbxly4b4XUHmuL5ZX2l+y9EmSrvboGKrFgC4DnPXI9iZ5BaosRie3ZwLsMFQeDFd
	DIh6Gur0BMJ7KqPlxwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr1K-0000000CMH5-3evs;
	Fri, 30 Oct 2026 18:08:06 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr1G-0000000CMFJ-2byh;
	Fri, 30 Oct 2026 18:08:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793383674; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=D3MBAA2RV9JUP7T4/6JJ77ZbLpLnUGmQ/f9MrNVw4WNZBARPtkxqnAMycgC/xNDAPEDv2qTbNMxscTwgNBnxzAWVKMa5r8KKL0eGriVTorMspzOOFXwtkEGy0s7DPuMiMUjNlaegbLPAW5q4cAQ9H5GPugl3ZvVszL88FAdhKDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793383674; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QVKMydU/thLME4tk0hjz4sP1iIZCD+FNDdETjFTH1wc=; 
	b=Vbi6DAafjCVdxAwf6rg5DHUhXcXD2xRYQxxnv19Rf9KxZmFgQZVzxm1Ne/DEnGzFeJY8elq7OmWBnjUVgFP9TD9lcPsOOvxX4Wcv4ifYBT0nkJ7MeFM6/XwRCgWGKD+rxkOB0HQvdbVNWrdsEw7M8ELvTf/qPsSQ7PLMboCBGm0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Lposd8Qn9kdkRC2sYlxa0WOlkAA0mdUn3f0TOBw4v4w4+IF365qd8Ir3d6eaXQ0+vDAC8JhV8+cWFCuguva1v/4S+OWFZvObVFblzFE2C9crKE8F3KHvtz30JTSYCjecrxq/b1CBY0wxs/CNFsEbuGj2wI9PXEN9fdWmR8kLEPE=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=QVKMydU/thLME4tk0hjz4sP1iIZCD+FNDdETjFTH1wc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793383672930887.0016081954384;
	Fri, 30 Oct 2026 19:07:52 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>, Francesco Saverio Pavone <pavone.lawyer@gmail.com>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkvdec: Do not keep the clocks enabled from probe
Date: Fri, 30 Oct 2026 20:05:00 +0200
Message-ID: <20261030-rkvdec-runtime-pm-clocks-nicolas-reply-1@iav.lv>
In-Reply-To: <76e2e993fa5a8fd054bad97505907d3c4e88e11c.camel@collabora.com>
References: <20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv> <76e2e993fa5a8fd054bad97505907d3c4e88e11c.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_110802_932592_BB0623FE 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 08:49:03 -0400, Nicolas Dufresne wrote:
> So if CONFIG_PM is not set, the initial resume will never occur, and first mmio
> access will likely hang the CPU. We need a clean pattern to handle this, and
> perhaps review other similar drivers while at it.

PM=n only happens with COMPILE_TEST: ARCH_ROCKCHIP selects PM on arm64 and
arm. rkvdec had the same gap until 6a846f7d72c7; rga and rkisp1 have it today.
v2 keeps the clocks enabled from probe when PM is off, as etnaviv and v3d do:
https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v2-1-8ff510a231de@iav.lv
rga and rkisp1 as separate patches?

