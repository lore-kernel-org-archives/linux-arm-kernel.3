Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F8EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO9f88LeBetQWeK0wi0uVMRKku3fwGmKFJbkIHyQjbw=; b=Xy3AerfQs5mft6q819Cafrj+Mj
	dhWrpJJuVind0F2uJvSpjx285KsVSrYZcQ6SyvrzEi2ww51hjoVQ7k9tPmt1XNmdDqm0rZ/zQcJh2
	3JarjANQbMKVz6CPk+1Qqlm8w+u+tXCJ6hQH+vGtHL6GOT3EOcL2/IXipzpDtvTJJdJJp3CTI01xr
	VLiceE6NjVvkyuLQwE8HeNsxXsfkEke0ZkP9nBi72G8UAvjQieLvUIdLhAKszHHnSMGmEvtVp2R6y
	TmlzOl4TZzB1xQh0SiQvhM8suVbHkUaU7xlCTWRpK6wK/ORGZDMDM8SzPDb46n3xUkcBXuHSVbMnD
	vNcd+w1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrps-00000007XiQ-1SrT;
	Mon, 20 Jul 2026 17:31:24 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrpp-00000007Xhp-1d7G;
	Mon, 20 Jul 2026 17:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784568678; x=1784827878;
	bh=cO9f88LeBetQWeK0wi0uVMRKku3fwGmKFJbkIHyQjbw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jEnI1ye9WDJTttfanXzHusDpkUnDvka+waQ8U2QuUOEYlGscl6pA2KZNYytnROVvD
	 DILR6ucvJFXgh9UtQwjGinq7Rwg4437kd9w7VChmxUcSnUSqO7OmWFtlKKoKCE6lTt
	 JQpwnfgwc13MrCUkXtnI/UUVMIPOiuYHa/HgL6IiB7iNqfIWrRGmA8/2ZfoWuiFmUW
	 5OiCQ+uJAKtuOp81t7DBsssrg+uMjisIB/HrG3BgZekjQLMWltd8hvU3PMT6eY7SKe
	 VunR4KqQ1hwt4vASRHidxwClJ0+ymIgqTiwqV9gyB4dJ/l83UVfJJ7usMMSz1tl8BC
	 il7IHbEtyWJGg==
Date: Mon, 20 Jul 2026 17:31:12 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
Message-ID: <UBb0LTozsXND4yCm-5gQEAG4QXz_21gIMGXI5HbsQhBzbfJnwk6ShZN0Sob-K8w-0X8l4gf0KF4qjpnOK80l53gTX471Dh18dUaiUhrsb9U=@protonmail.com>
In-Reply-To: <LQrjqkJAVzl-TSaOAypAQdfM8rR4F59aSX5yJIw8S3neOhFlPmTeFrW1PBK4JDos7v7VvL8nTblX22lK78U0FlVE_bwuOJYR36CK3eDE5RM=@protonmail.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com> <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com> <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com> <LQrjqkJAVzl-TSaOAypAQdfM8rR4F59aSX5yJIw8S3neOhFlPmTeFrW1PBK4JDos7v7VvL8nTblX22lK78U0FlVE_bwuOJYR36CK3eDE5RM=@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 872230804a0fa388bed88c134d29216f79c87a3f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103121_975929_21A54CD4 
X-CRM114-Status: UNSURE (   8.32  )
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

On Monday, July 20th, 2026 at 4:33 PM, Roman Vivchar <rva333@protonmail.com=
> wrote:

...
=20
> Something like this:
> - mfgcfg
>   ^- mfg_pre ('safe' UNIVPLL div or 'unsafe' mfg mux)
>      ^- mfg (if you're here and your chip is NOT mt6572w then be prepared
> =09         for crashes)
>         ^- whpll (or any other parent, but downstream uses WHPLL as GPU
>                   clock source)

Oops, WHPLL sits behind the gate, so the clock tree is this:
- mfgcfg
  ^- mfg_pre ('safe' UNIVPLL div or 'unsafe' mfg mux)
     ^- mfg (if you're here and your chip is NOT mt6572w then be prepared
             for crashes)
        ^- mfg_pre_whpll_500m (or any other parent, but downstream uses
                               WHPLL as GPU clock source)
           ^- whpll

(Using 500m is a bad idea for the PLL which can change frequency, but
I have to revisit clock tree once again to make a better decision before
sending mt6572 clocks to the upstream).

