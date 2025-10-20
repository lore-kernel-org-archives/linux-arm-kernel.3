Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDEDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk34IRKnBv7hiN7qUW37bwUgSoZget6//bM/ooP9Mgs=; b=hbdZmmraGU7kJDDImR6PW1I3ks
	z81tHR02y9gZ/ZDALJTbDUZ4uJlT5wSWhFjL/2I3bbTii/k31Lsp/qLYza2+L4Kv9D+Eie/wbcisk
	FRc05/uKg+MvNH6NV2RVhYjDi65C69hQkLi9NGYay9GRdA36r0LEI0v4owbAljwUA1KVynVaLaFx2
	IQLX2Rg7wkW0aadqK6Zn4qsmu0tXkcJqxykhs53Cb1Ua6aQUs+xvdLGDp7qqEufbi0Vm3Op1qEhth
	I/ZEv+K4gnDk2iPwq1At8Cq7ppAQYrx0AC/bBZ9984pxow2Q3pBr8ga/D2R735SpNMmK/Fkt1hPY2
	JLLlp8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAodE-0000000DIYu-1VoP;
	Mon, 20 Oct 2025 12:04:56 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoWo-0000000DAVj-2WvB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=tk34IRKnBv7hiN7qUW37bwUgSoZget6//bM/ooP9Mgs=;
	b=Nu3jCO5lKmRuo5fWdE++IsHfPxWG9mp+CWJ3edhFDcdSfzzU6Im9nVhP5czI3g
	NKdcIpm12uk843V4XpxLwGXPS3uYltEnnLXXQZ9vxIhxvJ8d7Bjm3Y6mKdvhBtnp
	BHpVecDEmQsrfS7yBNZavpN8S5K4nkxS69I9qpW9dd5WI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_7HNI_Zowh1TAA--.27863S3;
	Mon, 20 Oct 2025 19:58:07 +0800 (CST)
Date: Mon, 20 Oct 2025 19:58:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com
Subject: Re: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Message-ID: <aPYjzUGUR2OTPgSD@dragon>
References: <20250910233402.567245-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910233402.567245-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgD3_7HNI_Zowh1TAA--.27863S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU20eHDUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA-TOWj2I88AGAAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_045819_050034_7B86A57C 
X-CRM114-Status: UNSURE (   9.22  )
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

On Wed, Sep 10, 2025 at 08:34:02PM -0300, Fabio Estevam wrote:
> On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:
> 
> - ipu1_csi0_mux
> - ipu1_csi1_mux
> - ipu2_csi0_mux
> - ipu2_csi1_mux
> 
> As they were not documented, dt-schema emits warnings like:
> 
>   'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
> 
> Add a top-level patternProperties entry for these CSI mux subnodes
> and restrict it to i.MX6Q.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


