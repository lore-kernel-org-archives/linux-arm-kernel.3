Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083ACC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FhrRIA7cVdLxuOcagDHfSX9sqLVZhlAdPKy19NgXco=; b=ocOj7D3SXDDWU9bTxhYyhFXIdz
	NN3ADrYRVdMwSrPpI82kzCaxHV43mmT7bjfqoox+ndAyqP9zqSOPFi66AAjuVzPLUVuHSiPaSJYax
	+5x6wMJ4CkSYPaJJQdwkvlOD8C3SjZ6m1/eXmdOxPvd3T88JFqcEFpOnFu/C5u3Hkx2KtdJcPUPXZ
	Rw1TeNMcXaxpnCJBromVo8EtO25bg6CenyKFlg2DtfcFMaRgWD8FGYL51IZTVZtoWdAxl7ZYXmA54
	TKAvf/8OROff+F6bEwr1MaC6jgChSgLk+msqFUO5Qzp5JCFBW4qxnL34p6lyqYqoROMESX9Xy+xRq
	96sBLMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th38m-0000000ENfZ-2hWd;
	Sun, 09 Feb 2025 08:58:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th37O-0000000ENZb-1Gx8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 08:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C3AD5C03CA;
	Sun,  9 Feb 2025 08:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4F0C4CEDD;
	Sun,  9 Feb 2025 08:56:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 792525FAC0;
	Sun,  9 Feb 2025 16:56:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Lukas Schmid <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250205164716.2509650-1-lukas.schmid@netcube.li>
References: <20250205164716.2509650-1-lukas.schmid@netcube.li>
Subject: Re: [PATCH v9 0/4] Add support for NetCube Systems Kumquat
Message-Id: <173909140135.1184685.5784910677727356231.b4-ty@csie.org>
Date: Sun, 09 Feb 2025 16:56:41 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_005646_390830_7B37F9BA 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, 05 Feb 2025 17:47:09 +0100, Lukas Schmid wrote:
> This series adds dt-bindings and dt's for the NetCube Systems Kumquat board
> 
> Changes in v2:
>   - Fix the devicetrees according to the "dt-schema" and
>     "make dtbs_check W=1"
>   - Fix the License of the devicetree as requested
>   - Create a cover letter for the patch series
> 
> [...]

Applied to dt-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/4] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
      commit: 9a8463c68e0d1144e6af492a920796fcc373fef8
[2/4] dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
      commit: 2a120293fb8fc84017cfab3994ad4fe338148288
[3/4] ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
      commit: 3199ed9b375870079c1bb857a10c55a95f90fdbd
[4/4] ARM: dts: sunxi: add support for NetCube Systems Kumquat
      commit: 6e085e64a2907bb9467360b7607d1257874c2626

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


