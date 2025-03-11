Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA359C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZDiTxBYo3ZyyWN3X3Z5hKEwsvfLP5Vn1/SvMYumTaw=; b=DynRZCKZJ8WWXTEapWaMfLwWcN
	VX+dYmp5UJq3sV0nIE3oeXEsBH4ph/Ur/eEvUNlKub+/ef4BFuAm+cNrzE7vrZ+FC059487yUONW4
	hEEFQAigBZ4sncTdSwOnZL9vdZB6miP2b8C0v1jKWsNrQAkrDSCwDRbb0SHiunyR/33oefLJQ/hgW
	QPJN3ielKR8GJFfl/ujbUvuktROD6FseL+bzPqKuUyqCmosH6xz3ZeUjUi5KVu8rbwE62oSkq6Emx
	VsoUIgkW2PmSUK0vMGu5fvyZJOYwOnrT5WgxTC5MmNI1PJxWR4CVWRog6Xc69Q6AlOWAn20tmFSEv
	0VzFreZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpyg-00000004UEb-1ntX;
	Tue, 11 Mar 2025 03:08:22 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpvb-00000004Tyn-0RIj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 03:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2ZDiTxBYo3ZyyWN3X3Z5hKEwsvfLP5Vn1/SvMYumTaw=;
	b=IrsYn4zp4+0mw7TVf43NqjNeiXSYfSlzXTAZxDMTVojxnHx0wegJnZiffevyeF
	GxK/zyytQELZ6IaimHsY7JVaNUA4PL7X+FCUJO73Y++QD66ZBsBJ+U8MRDoSXn9D
	G1QOal4WXjxdT8bevHNxZ20xqDsfhwalUPQyiz5LeYgMs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXVUJVqM9nUs60AA--.48820S3;
	Tue, 11 Mar 2025 11:04:55 +0800 (CST)
Date: Tue, 11 Mar 2025 11:04:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT
 freq. to 800MHz
Message-ID: <Z8+oVEFcKCS8n6em@dragon>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <20250226164513.33822-5-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226164513.33822-5-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgBXVUJVqM9nUs60AA--.48820S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrXryxGF1rJFy8uw17Aw18Xwb_yoWxGwcE9r
	4UtFyYkws8Wa1UCr1kAr18Xay09ayjyFWSqrnYqrsxAF95tw1DJwn5uFWkJr4kWF1xZw1r
	u3sxKF4DKr13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08hLUUUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRcNcmfPqFf+BwAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_200511_493941_51B83C7E 
X-CRM114-Status: UNSURE (   9.40  )
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

On Wed, Feb 26, 2025 at 11:45:13AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
> SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
> applications running on the DSP expect the core to run at this frequency
> anyways. This change also affects the AUDIOMIX NoC.
> 
> Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Applied, thanks!


