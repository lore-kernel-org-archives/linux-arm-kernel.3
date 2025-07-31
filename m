Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE39AC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 02:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jEKI+a2l5XlR/E3JP8s37RLYXVe77DyLwBFBCUJqfg=; b=cJeO8ciIB6RKIg33SF0qAuyK4R
	hPE+Z6fZhAR2jdD+YreTEE4PDa77gmuIdA5UfFxLlsMJCn/lOp3/RQpkgZE+UyT3MzV2gSNIbUapY
	4NrlUUHMCoxIq5KL397wouOgjrlRTWBz8UggM+PIRfE5D24x1x/6StCKKWbI6aDpFPszDVXsqrrfT
	79qx3mCqKD8Bhx7xCJtMuTkmF/2r8H1IIQWavgHUIaBtthRNVGJ/d/lJTA9VhmW8XV9/p5Bs1d5ra
	kvKRZ98YdTMjbQRuGLm/YISIt3Ppezpq7XYPeykME6kNhl7Ox4FCjAbMNLu+YdeCxSHP3Je0fc+m8
	MT1gr3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJ6R-00000002m7w-3Jf1;
	Thu, 31 Jul 2025 02:33:07 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJ3y-00000002lzR-2mOA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 02:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753929032;
	bh=8jEKI+a2l5XlR/E3JP8s37RLYXVe77DyLwBFBCUJqfg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CyfgZAWwliTD+nM38ntQktYQ6EDUNpi1cSwNgQDwKa6MmNl8SVPJGeIz7K9giG4Di
	 e5Wz6neH3xPuwqfYdFUv60ksXRiZsq9DIWMeRGARjKmMSdZB+KefgmezJ/loQt1HM4
	 iK4SE2HpyeyLAh+aYVOdZX261BuuFO8srTPoVhLfYT2mulmzYC4qglZ5mVdDxdJ9I+
	 PT9mA5lJ6PMe9SjzCIrd+GYCnb7aGt7beSe5aMUDc2CtfgHJxMt4dfUnVCbxHTn06d
	 BJViD8JZXtPjGJwcNf/aqlBHJu6C/f1kdnQerG6xTz9ECtH9+OhSUiipnj48R7qtKj
	 O3gdcNXzV8jhQ==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B881069374;
	Thu, 31 Jul 2025 10:30:29 +0800 (AWST)
Message-ID: <b32a9de1d591d3012240919d23dbb22305cce6e2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 2/3] ARM: dts: aspeed: clemente: add Meta Clemente BMC
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
Date: Thu, 31 Jul 2025 12:00:29 +0930
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-2-b76e7de4d6c8@fii-foxconn.com>
References: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
	 <20250723-add-support-for-meta-clemente-bmc-v9-2-b76e7de4d6c8@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_193034_891875_F0EA8583 
X-CRM114-Status: UNSURE (   6.91  )
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
> From: Leo Wang <leo.jt.wang@gmail.com>
>=20
> Add linux device tree entry for Meta Clemente compute-tray
> BMC using AST2600 SoC.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>

Aside from the usual ASPEED warnings, I see:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@34 (maxim,ma=
x1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel=
@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max136=
3.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@35 (maxim,ma=
x1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel=
@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max136=
3.yaml#

Can you please submit a binding for this device, or drop the nodes from
the devicetree for now?

Andrew

