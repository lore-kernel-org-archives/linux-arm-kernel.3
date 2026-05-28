Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AECCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiUIzz2J4mK7mbZjU50iRpjfnP1Bj6jF4LC/ZLFwGZk=; b=cx6j2t3c7PWsl9Y9kuVsk44Br4
	rEPbBeJhTje6X1XFpyJYEr8LMEWtdoUwtgzPT8BPqqbUtg/ItQYEx/hmHL+YIKbQDgw2vLIR5TJj/
	dRUFSmHkK+/3meadPpNP4dAvdJ0mPDB4s5b10Y6pxDjmdwOdj4OBWQ+P0WZz+7Eqb51AhH2l9Q+Aj
	U51gMEGKLW2x1p3RSPOumoJ/jG3zJgcz3dYtfqRWwUsQ4RnjNgbo9Rr+rTFZlOjU0/rEXO10loH7+
	R32J4I64aaqGTVk93ogQ1j73I3Kg/Fm2MF5npOGjwQLDVAhWGZx70dY40ff6uMYfhf42Lfiii8spB
	8x1jdMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWOe-00000005QtV-2JlC;
	Thu, 28 May 2026 08:47:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWOb-00000005Qt3-0tn8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:47:19 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260528084713euoutp0164a93ac1ee9af604752a3ce12bcfe390~zrmaoDB0z1383413834euoutp01n
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:47:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260528084713euoutp0164a93ac1ee9af604752a3ce12bcfe390~zrmaoDB0z1383413834euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779958033;
	bh=NiUIzz2J4mK7mbZjU50iRpjfnP1Bj6jF4LC/ZLFwGZk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lXk7I5Q0jQmOD+6ZQRsJIigr0AAzUwJloV41D4rzZWnq69/Ps4zCX/SQNbVip9WNC
	 dchsF/l3HfBFtas0kw/r1g6tUNqdn0P1NZqoj1EkM76DB4xp8QUKEMHJTGZeaZB5Mt
	 z1yivN1LA4R0opi2WSs89Bv0Y67DwM9UOOKZBvg0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260528084713eucas1p27b7c9bec1fd4c966be3666c74b4227b1~zrmafLrN62545125451eucas1p2g;
	Thu, 28 May 2026 08:47:13 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260528084713eusmtip2e222380135653e043b49419fbba35dde~zrmaDLlLt2118521185eusmtip2J;
	Thu, 28 May 2026 08:47:13 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Linus Walleij'"
	<linusw@kernel.org>, "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
Date: Thu, 28 May 2026 10:47:13 +0200
Message-ID: <001f01dcee7e$94730c50$bd5924f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHUkhLpbWZfxeh6MF+vd143+1Jt/wKaMwmyth8HM7A=
Content-Language: pl
X-CMS-MailID: 20260528084713eucas1p27b7c9bec1fd4c966be3666c74b4227b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47
X-EPHeader: CA
X-CMS-RootMailID: 20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47
References: <CGME20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47@eucas1p1.samsung.com>
	<20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_014717_390161_C40FA6E4 
X-CRM114-Status: GOOD (  10.66  )
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

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>

> Subject: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
> pinctrl drivers
> 
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> This follows discussions with Krzysztof about expanding the Samsung SoC
> maintenance team in the kernel.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>


