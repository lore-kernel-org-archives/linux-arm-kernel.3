Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CF0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc5lcecJxiwtEE0Af0MunMTBMcGQkaxRIJrARkZNSok=; b=s40Pf7Jc7rJAUIAbfTGoyjIBKQ
	4yrMYRuCFx6WymE30LAtO871lmUl+ZeF4MbQhzeyaiz10C1KmoEABq9r8imotTPsf1+NUCzuoG/sE
	9zmSx/1ESPbhqW23H1pN8rNp2w/ATPbp/GWfYMzvLZ8JbN1rECtvGQlqx9U0KRp2Oy237bJQkll1a
	kcI0EFXk4QWUax5qqEacQOKwA2H1aV6SfEL40hSzXI5FuIM9xPt6ebxw9oYVjrBcVa+hka6XNQc/p
	xmutaYZjtRkOg+uAYYLRm078ZeprnTdmtGr8waYRVMloWa114Gg5Bsy2jfamsDjhaYheSaaaDEmtq
	Lq38zLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYwJ-0000000CD6M-38zx;
	Wed, 20 Aug 2025 02:52:39 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYrl-0000000CClv-1Ziv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 02:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Yc5lcecJxiwtEE0Af0MunMTBMcGQkaxRIJrARkZNSok=;
	b=pOPwXL3EiV0xsVgk5GMwiUrF18UOtPsIYMTTDufGQvrwpO+ImuAYaoHQs60lhN
	cZ4I6h/ejWc7/EDsrOzfzZAwbyfx5BE1//FyVL/t46DpS72v9+/WDM4lnAFuvKFQ
	PDCfPzNtq21PYS/4PSJLJs1tIgukvOMiVEU4p1np/B1So=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3t9tDN6VoS0n+Ag--.60563S3;
	Wed, 20 Aug 2025 10:47:33 +0800 (CST)
Date: Wed, 20 Aug 2025 10:47:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mark Brown <broonie@kernel.org>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <aKU3Q69B_MFswwZX@dragon>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <aHDNmVE23O4V4rqJ@dragon>
 <69f6a044-be90-490f-b0ad-e7867a4825da@gmail.com>
 <59b874bf-e23b-40c4-b095-016fe6b14ed6@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b874bf-e23b-40c4-b095-016fe6b14ed6@sirena.org.uk>
X-CM-TRANSID: Mc8vCgD3t9tDN6VoS0n+Ag--.60563S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw47Zw47tw4UtFWrtrWxCrg_yoWxZFg_Xr
	WjqrZF9rn8XrsxGF4fZF45tFy7KFW8Z3s5urWrXr1UZ3yYqF93JFZagFZ3Xw1xJrWIkFsI
	9as8G343tr4IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjgyCJUUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQVix2ilN0Uc-gAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_194757_721504_3F3DDEFC 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, Aug 01, 2025 at 01:55:47PM +0100, Mark Brown wrote:
> On Fri, Aug 01, 2025 at 03:36:01PM +0300, Laurentiu Mihalcea wrote:
> 
> > How should we proceed with this? The fix for the issue reported by Alexander
> > Stein was already picked up by Shawn via [1]. We also have [2], which is meant
> > to fix the Verdin issues pointed out by Mark. However, I'm still unsure about the
> > EVK issues reported by Mark, which I was not able to reproduce on my local setup.
> 
> FWIW the EVK issues are still present in -next.

It sounds like that EVK issue is a separate one and has nothing to do
with this patch set.

Laurentiu,

I suggest you resend the dropped patches with defconfig fix in a
new series.

Shawn


