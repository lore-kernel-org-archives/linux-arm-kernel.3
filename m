Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318BFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qC/E2RADJBe2o2pvqCk2KKHQRYH+IEmQwtHFwnr5iwU=; b=QpfDTwVaiT7irtN62j/uFbN8g1
	basBu/kXXm1g0uxgQWkyQY2Q9mI3R3MHx79Rpfzc85VQ3JRRsxlh1nLg3G5euQPOtqSroMlRWWJ+V
	UVBqs6hH3r5TwPfHoXClP5eC+0I1BtQ5orpkjg41su5qdL5GtyldMcdhwkH+PShLAQ11tv4Na789t
	CXgMDbwbdIHUQlahCQeP3yu2mTaBthDFAbKFUs2VXe5lQNQAkVHhzFcckFfkJLdrWS0HrxUzYyc5C
	Scq0KmU4u7LWhFRO42bS9SkLvr+b9MXA0vEREsogSu8SEHVRrbMrU65SCA2NUjdWnOXxQOUeCqHpP
	Tf/i68vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJ8t-00000002mIv-2WFS;
	Thu, 31 Jul 2025 02:35:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJ5A-00000002m4S-01mZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 02:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753929106;
	bh=qC/E2RADJBe2o2pvqCk2KKHQRYH+IEmQwtHFwnr5iwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jpD8b/DVVAgtp1h122tIwK3VBpNmdsv89LZTDZPmo+lBU1vvD7FA7xo8vscY3HnAZ
	 wPyUojKTq1SkOUCMsVL14wfeezHkuKYrn71CFo9cv0zvNRDkjEHlRIDCcMsPcJOEgN
	 9+xLwAnXXn83RsRds870LwdRtVD5B6FYTqNeJsRgfsGgHneTO8BiL6PfIWNQq+ULNc
	 R6mz2k721/+5GkM/yk8Atl9oQ4pfUxOjLr4e5BzMBRY1tmmGF8V9x4ze3FcUc8LpwY
	 BnN7bD3R2pW4Rim37im6TErL1U4Vue8mzKnvi/Cpm5RijGnpWr88w+gNzxOwT7u/62
	 KNHsGWSPtOC7w==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6242A69374;
	Thu, 31 Jul 2025 10:31:45 +0800 (AWST)
Message-ID: <6f4b31063bb83a8b8c876ac6ebfdf7d1efc50987.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 3/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com
Date: Thu, 31 Jul 2025 12:01:44 +0930
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
References: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
	 <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_193148_233324_8571F8D2 
X-CRM114-Status: UNSURE (   8.54  )
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

On Wed, 2025-07-23 at 11:42 +0800, Leo Wang wrote:
> Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
> description, enabling support for RMII3 and RMII4 interfaces.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)

This patch should be ordered before the patch adding the devicetree
that relies on it.

Andrew

