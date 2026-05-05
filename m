Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8832CFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdUe4UPi1xfrH6SeZFh0BDIwDN7xDOV5Uww/aWy2a1s=; b=o5y+70AvEdOijld9SU7JeGcLdd
	hVejARniU8zT9ibwYdAZiNeKGEULurUbfJSAgCCeAu1gqdbfqjtNSqOZR6jR5FpiJ/qmuM7cqUPdS
	QuI5DZR9I/Kme8jhoE5uzoMLOEJBCofGoCfnso8x3RFfsof92w2ML5gsE05iBLfL2LJ/7KTr2e8v7
	EyvrSp8o4G8+xrsI0BfcDJ/LR3if91VcrhkJWiWVOwb7uy1YkmXZsTRiyOL5in+1q7SDy+JBC+Uuo
	tDkVN27lCSEIQQ8fuTbLkpbYzB2eN81kMW5lE1U5BQyQgyk826o7siZyqF2cbXFOc58FurFOVRVWk
	1wK2gVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKvN-0000000HEGP-1g4H;
	Tue, 05 May 2026 18:55:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKvL-0000000HEFl-1IP2;
	Tue, 05 May 2026 18:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EdUe4UPi1xfrH6SeZFh0BDIwDN7xDOV5Uww/aWy2a1s=; b=lWWGss4A+4AyrPW69TEmA9O98n
	3luVcHPpCd55cDntRjiHdHeN0CKdMkn5Va2DankgUsHK5gvtEP0s/TK6VcXoKnNzg6bwhkB+IrdNJ
	rh9FMCyXucbX08zIXSkHikJ5lwdAWE8NMTlJehqORiYOC9k/f56kFWTxA5YunsbOIaX8ezGxOoRa2
	z1LOx5LSU4QWL22axnWabxNUiqBHwvkaRzUw3/4KsapoQQepYTHPyTxdZpTDctIUIiXy25002lx2I
	TcuUL4Ro2HP+OXmTar1l/l79oSiX2e2XO4bN1BfUwP+0QQPzNzKhr8GLaRRqPiW0l9zLDnev7yHwR
	vynbPytg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] media: synopsys: csi2rx: add support for rk3588 variant
Date: Tue,  5 May 2026 20:55:02 +0200
Message-ID: <177800729427.3301010.1526029967373808485.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
References: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_115515_348776_8210F722 
X-CRM114-Status: UNSURE (   9.77  )
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


On Tue, 28 Apr 2026 09:27:22 +0200, Michael Riesch wrote:
> Habidere,
> 
> The Rockchip RK3588 features six MIPI CSI-2 receiver units:
>  - MIPI0: connected to MIPI DCPHY0
>  - MIPI1: connected to MIPI DCPHY1
>  - MIPI2: connected to MIPI DPHY0
>  - MIPI3: connected to MIPI DPHY0-1 (only with split DPHY0)
>  - MIPI4: connected to MIPI DPHY1
>  - MIPI5: connected to MIPI DPHY1-1 (only with split DPHY1)
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      commit: 5052c99cf05271b91fe2b4e6540f7a7d9b6db62f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

