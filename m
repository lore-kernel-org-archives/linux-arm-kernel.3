Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086EEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja10dpay0PFbmloo3P4uBr52vlFLWwA7lf07LoI1zL0=; b=uZ9wQJnvs8mxqkkUVD68to5zfT
	RHZbQ8f9ZA6ADd0L8Prhe6AcBsw9fFLP/OFXgd1dHlpBKB6Up7IaDcgGqXCJoE0phx4dF5zZ6xnJL
	W8tTU14X/YXEce8pOJnJ9hHjQlgjUtpg7+w0Of160tY4zVbEYefiN5inu0+YED9ZT+Wh8sX+ofgDb
	aSNJVK/dmYHQ+CMSygYurfoET/U4KFLYi5u/55gyZKaYUhGBxTqnZmcToYZU6CKY0D1E5GJaT+A0H
	n9kRVFhP3ITBFzmTJ0k86RENj+9GK9ZlZN32CzAVNL6a9Qa9tmfy4xrpF02/IRF4LajFGpdcYWlyR
	pEtUnZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9erl-0000000ARRA-2CgT;
	Thu, 24 Sep 2026 08:31:41 +0000
Received: from mout-y-209.mailbox.org ([2001:67c:2050:103:465::209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eri-0000000ARQj-3Cpi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:31:40 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hqhrM1vZrz7vBk;
	Wed, 23 Sep 2026 18:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790180099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja10dpay0PFbmloo3P4uBr52vlFLWwA7lf07LoI1zL0=;
	b=PVZlWJk+fZggLM32PaMTY84s7k2CUe8rduhWyYm4jR5cZouzL/3StaNPCV0OKs54bcurVM
	C2SFhh+SLxxLgOwl7DwBdv0YIm2KR++LJ74wyTiECVXUa2OTX6UK2Xr1FdJvQkt5N4MqAs
	fyD3p00myaKOn5IJn+7ulSDlut8sjB4nXLaPWpfh84HYi3cD94oI3NosjEdLCXY6GYK8ek
	Oyns30ekLT0b77TxTZ7dltJqAeoqR2meW84PZSOhtPwaVPw1V5GnuSwg4dcBiBoVP1bSb2
	Eyg9zYSq4InC94I4g42LXyuUR3Fs77iR0X78dL211bL0GMHez9d1VEescm58tQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of alex@chimac.ro designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=alex@chimac.ro
Date: Wed, 23 Sep 2026 19:14:55 +0300 (EEST)
From: Alexandru Chimac <alex@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <1343593353.60484.1790180095661@app.mailbox.org>
In-Reply-To: <d679c0e9-febe-4069-9c2f-a2173a5218aa@kernel.org>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
 <d679c0e9-febe-4069-9c2f-a2173a5218aa@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Queue-Id: 4hqhrM1vZrz7vBk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_013139_056293_5A826926 
X-CRM114-Status: GOOD (  14.24  )
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

Hello!
> On 09/23/2026 5:58 PM EEST Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>  
> On 22/09/2026 14:15, Alexandru Chimac wrote:
> > All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
> > to them, so force the nodes to have clocks assigned to them.
> > 
> > Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> > ---
> > Most Samsung Exynos9610 pin controllers (except TOP) have clocks
> > designated for them, so allow the device tree node to include clock
> 
> I don't understand above. It's contradictory to commit msg which says
> ALL. Here you say most.
> 

On Exynos9610, only TOP pinctrl doesn't have a clock (as far as I'm
aware; haven't found a clock for it), while the rest of the pin controller
blocks do.

> 
> Why two commit msgs?

The first message is the commit message, and the second one is the b4
cover message. I wasn't actually sure how b4 handles that.

> 
> > information for the driver.
> 
> that's ABI break without reason.
> 

AFAIK there are no (publicly available) users of this device, so this
change shouldn't break any currently available device trees.

The best (most correct imo) implementation would be having the clock
properties be optional, pin controllers for Exynos9610 don't need
to be controlled by Linux for suspend/restore (change is more for
information(?) correctness anyway), since the CMUs should have HWACG
enabled anyway.

Regards,
Alexandru Chimac <alex@chimac.ro

