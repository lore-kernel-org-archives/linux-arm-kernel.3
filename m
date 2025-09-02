Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A4CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iwY/DvHmnwsyLorWVY60Mu75ZP2JaPCrgAdT0NkVYY=; b=mScrut2Z6sw7fzEi2oNUe8zbnG
	BF50OhodKSXnby6/XmGn3M4wFgazKu6HnP9jVu8Qo8RbXFnMHlj56iMGDgXn4v1nfV1KNVm67iUt5
	1bn8Fs2JQvj2J9JuM+ZabWRwrBJd2GjPuK9lARnV7UbS1crv1MZVvjxzeIdS7gcPbkhrgMweuu1Oj
	SZIg8lnQ60cw6sNycBHy1LYrVmzWur00bPxuVjV3R1LuoYhfEAYuyJlmRrJ9qSwAUYpp9RjZZeM2Y
	MRzvL0At/lMeye1PQBm7gVjIGZ2Gsq6AnGbf0xWXQA4ZYaeMvsuFdQB3iVH6BNlIk7Ykz/haquBdP
	P6Y7zk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOM-00000001aYV-1uRZ;
	Tue, 02 Sep 2025 19:10:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQu2-0000000HaGy-3LPs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51AE044AE3;
	Tue,  2 Sep 2025 13:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD50BC4CEED;
	Tue,  2 Sep 2025 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819106;
	bh=FGa7ZgDMj8ZzjbgcMztCURZjWDqJpJhpglo5MQK07Tc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vIG2fMUYOJGTB+1YSHvjxGf5Q3T8tqmuUCNeaKMpRfHsHGBWnBDv2cUL5UIrEPUcc
	 BwfgQ5m7FwJ4Iz7GfpdQEsdGZmUrzW0oDbMJZNSCtzIcw4gSCv8ep2sCNCwORgj18L
	 /6dZN6PIRi0gYetVeUI66IXga2yu1KfMV/Zq1HHkmAaXJgjFHqsXU5upbxm4ZM/e9O
	 /qXAGi1F9/PEYL1uuFbG9ylCRtdtU0oGDxfjydI9f0NGlLGAP1w2g/DnAVwrXCcgJw
	 XYCTiJJ3bvliyZ2NoizvFArBO/XaKPdXVeAlOW4uvVONWck3Mazzp4lCsJ+1s/taXZ
	 rE6Gvn5rdaokg==
Date: Tue, 02 Sep 2025 08:18:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrew@lunn.ch, davem@davemloft.net, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 kuba@kernel.org, mripard@kernel.org, wens@csie.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
To: Conley Lee <conleylee@foxmail.com>
In-Reply-To: <tencent_57056C4B1E98EF5C0517A5685B2E4D060508@qq.com>
References: <tencent_57056C4B1E98EF5C0517A5685B2E4D060508@qq.com>
Message-Id: <175678731473.878204.3446095909067556324.robh@kernel.org>
Subject: Re: [PATCH] arm: dts: add nand device in
 sun7i-a20-haoyu-marsboard.dts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061826_860885_B87A8D65 
X-CRM114-Status: GOOD (  13.44  )
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


On Mon, 01 Sep 2025 17:05:21 +0800, Conley Lee wrote:
> The Haoyu MarsBoard-A20 comes with an 8G Hynix NAND flash,
> and this commit adds this NAND device in the device tree.
> 
> Signed-off-by: Conley Lee <conleylee@foxmail.com>
> ---
>  .../allwinner/sun7i-a20-haoyu-marsboard.dts   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250829 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for tencent_57056C4B1E98EF5C0517A5685B2E4D060508@qq.com:

arch/arm/boot/dts/allwinner/sun7i-a20-haoyu-marsboard.dtb: pinctrl@1c20800 (allwinner,sun7i-a20-pinctrl): 'nand_base0@0', 'nand_cs@0', 'nand_cs@1', 'nand_cs@2', 'nand_cs@3', 'nand_rb@0', 'nand_rb@1' do not match any of the regexes: '^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$', '^pinctrl-[0-9]+$', '^vcc-p[a-ilm]-supply$'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#






