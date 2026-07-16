Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B63C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvZU34hVR18uwXsCqsccdKkWSe8qIC0D/7BHu7+fEIk=; b=s/IU4jf7+xL1goY8nt02iDDhQB
	nkk4CGdmWMj7bBPRIipCCXpB+4EyodxfTfjDt8eVNMkL9HYWi/d0FkUkQ3adv0FC29NWmh4IhjDPw
	qpd+nnEALYAkCm0M+QsW+1Axd4o+tR/wbWnnQCfl8xeqT3aAiJ14+Ffs8RDO01JyxU2htYzaVgI4x
	UUyKZigQqGsHFDJsD86cPsVpHmYl6AYJXo03I3AezCOuGBwU/93SHf0eXaGLHD6dLV2clzXsuhmFV
	s396eyTJTe93LGLFdxaTzq/GAezQwtAy7FFBxXvc3nDB/pq3BOjxvaAX2icXJr3Zvs3Ka/7y1BW2/
	Mh8h0Hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLLD-0000000HH57-2OGG;
	Thu, 16 Jul 2026 12:37:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLLB-0000000HH4v-1vvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:37:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8B7341573;
	Thu, 16 Jul 2026 12:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041EC1F00A3A;
	Thu, 16 Jul 2026 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784205444;
	bh=jvZU34hVR18uwXsCqsccdKkWSe8qIC0D/7BHu7+fEIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HcumvihsdX9y/RwD9GPro51qfsAPRYPYeMlKd0H+MnGKMkPh/pR6iwabDXuUQuNTQ
	 9N580m+l8p9FyOPkiZhJajmzrLy2KGq80UBAo06qOCHItmB/38pk3sXNjmAyQ2n98z
	 dMlewxSQ4rawlsVji5EUwWzg2SNm6zlx08XKZiAZR/euS4baxfJIQC9LbLQJ/7UTb+
	 xZ+WNNRA1o0VUKeW+VB1EfRTf0BBuN7yUyWYqHFXABh5aZNDa9Ugo82aEI7FqB02Bf
	 P/7fg0884O7OtdOfCL34xi8rHtaYMbHOmQ+FgVQ8BjutgokOURQG9rBgf2VrhYx7zi
	 cay6wYLLdEgag==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
References: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
Subject: Re: (subset) [PATCH v3 1/1] dt-bindings: mfd: st,stmpe: fix typo
 st,stmpe601 (should be st,stmpe610)
Message-Id: <178420544173.1331431.4812862969734538129.b4-ty@b4>
Date: Thu, 16 Jul 2026 13:37:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 06 Jul 2026 15:29:32 -0400, Frank.Li@oss.nxp.com wrote:
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
> 
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601 (should be st,stmpe610)
      commit: 57f3718680c0e976ef23fd7a7fa586d5b065d42f

--
Lee Jones [李琼斯]


