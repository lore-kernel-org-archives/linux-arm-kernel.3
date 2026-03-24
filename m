Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64948F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0t+oQcy1b0wNBqxu5SQctA+VyPx8zQsKT5ERHccPGCQ=; b=aV5metUqwkv2x+W3TB3fWuDIa9
	vNHk+QeRoJ7A4iAoSyZdsmHiVhH2b6vo9mFJ1rPeCgf3rALDOUXMOhk6egmiehtjV8QL6I4DMV6gY
	uvab1vhIQBf42QB2dpRoqMauUZCV17eT1rf/hvZ8OdyXpaXQwt71tIHu/MvnaaLRWTd86kKm+z9ih
	hYGulGVgPc6j5+6dFyFGLWrh+xL92t0v7eWVYQPmr+R8NKZbtHrrx3h2WTo3BlfkljfcmkaaLSVMQ
	Za2nnNyISxgqkmD74JNhC1e0puDtcQU2XjhDD8MB6A4bmyjXky8OImRIz9VyKzG2DyDfkJmB1yUUh
	Fm3DoCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Bz-00000001y4T-3Ep3;
	Tue, 24 Mar 2026 17:05:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Bl-00000001y04-2ERP;
	Tue, 24 Mar 2026 17:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0t+oQcy1b0wNBqxu5SQctA+VyPx8zQsKT5ERHccPGCQ=; b=i35miYNIRP18uL0KgzsFD3vHdk
	Gq1pmFn8+Tf9XOn8UJ9OLQ2yHL48PWhNSK4FS4Mad/mnFQV6oj0sLtQ+kuJ/g/GMYs3o7KLfnf4LK
	9IosGWCaXgBphwGmPL4okhcb4obf2EB5PIzsB5ZfOna/Uo5ILJiNRQKcbLHiBxUSXINhGp1saKDoe
	BhMj6sKCsxU+befN48vspJ9hnMed6hc7FlKf5KAK70L/72dSlHeLr9iPHGnAS4vo2nR+2sSvorl+Q
	tjL4pF3Vu3aw1WgYf3Ub2DMACNHTBqdBwx3za0DaSAd+GTgm78H12zZAEDEe7TqoeaccqOgH0hqmk
	8lUpCYEA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	=?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix RK3562 EVB2 model name
Date: Tue, 24 Mar 2026 18:04:53 +0100
Message-ID: <177437177533.786081.8620014414771033959.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_78E7E3F6991FB4403D5ADC9E6A6BC3BF8307@qq.com>
References: <tencent_78E7E3F6991FB4403D5ADC9E6A6BC3BF8307@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100509_577647_0A90D7D5 
X-CRM114-Status: UNSURE (   8.02  )
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


On Thu, 19 Mar 2026 13:55:00 +0000, 谢致邦 (XIE Zhibang) wrote:
> The model name should be "Rockchip RK3562 EVB2 V10 Board".
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix RK3562 EVB2 model name
      commit: ede6a05606892bab4f6d785ffcfc124150c2eb32

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

