Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F07CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvqWhgq6E9yIB8u3zsh04lPjz8o3zonnYZU1K7EJUgc=; b=KSCx7HJVeODBaQOl/vM3Xe7kBQ
	veYDSmXUhlEEME00/XFi7lmBFMaUB7l8D67VaeNHEdUzyHFu4PYOv1nVIC/oF150n+iVEg/uoDSgA
	l+eBuOZjoXolTkzwe0+VhLFV6xZhyQawUNoP9Zc+X78dZqsnr/HtcI3mO4JGe4vCf1jqE+x19/kLL
	5j4pLZiVHyTlloRJSh30864uB4AYHge1TedrcimrPTChKJJD5++bZGQG3ezIQnr0XnRGixAVAItE7
	iVX4FsiR69uJ5pEQbwQjIBiVN4kBqoOdAk8WeCWOW/shbrFtcRq7VXN6eWdorVK+TfkJR9lmtzoTz
	U0vZrpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmtn-0000000Ebti-3DZv;
	Wed, 05 Nov 2025 23:26:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmti-0000000Ebrk-1Jl3;
	Wed, 05 Nov 2025 23:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hvqWhgq6E9yIB8u3zsh04lPjz8o3zonnYZU1K7EJUgc=; b=z6DV5tbdOsfeSMjMAfXbHs/8My
	NXwEqvACRlFCms94Wu6NvxfSPC1rd2g5ahqikshqIpgsylZreaZ3onosBto0Moe7LnDMplW39kwC4
	OFwTDnHb37ks2Y1oeJV4q3rCANfyzqa/4yewEqIiX+kYc7NL8VtRxjov05bD0nB+vYevyFfVefNNa
	TnYonKLAyLyFonw790VLuLDGxG6zL1wtfLwBiw6fbFYoZn5iZ8HT+rZ8nSlUnx6t74gleKdOI2t8Y
	PsS4aDwFS2vb4PmJLmS0nXPeMt2m081CZ1dDibd/Xd2rM9OitiUxQLcQIf8wisIPExFcR+dLBQDLF
	3ehSkZYw==;
Received: from i53875bde.versanet.de ([83.135.91.222] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGmtf-0001FA-Qo; Thu, 06 Nov 2025 00:26:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: Re: [PATCH 0/3] SCMI clocks on RK356x
Date: Thu,  6 Nov 2025 00:26:33 +0100
Message-ID: <176238518187.156498.15783284183828303705.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103234926.416137-1-heiko@sntech.de>
References: <20251103234926.416137-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_152638_375476_C0BE405C 
X-CRM114-Status: GOOD (  10.66  )
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


On Tue, 04 Nov 2025 00:49:23 +0100, Heiko Stuebner wrote:
> This cleans up the existing use of SCMI clocks on the RK356x SoCs.
> 
> 
> Heiko Stuebner (3):
>   dt-bindings: clock: rk3568: Add SCMI clock ids
>   arm64: dts: rockchip: use SCMI clock id for cpu clock on rk356x
>   arm64: dts: rockchip: add missing clocks for cpu cores on rk356
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: rk3568: Add SCMI clock ids
      commit: 88b6a93af4345e901206d0576bdb4e88ea3eaeb8
[2/3] arm64: dts: rockchip: use SCMI clock id for cpu clock on rk356x
      commit: ff8912700f31782021ec28c530de1482fa99eab3
[3/3] arm64: dts: rockchip: add missing clocks for cpu cores on rk356x
      commit: e06a419eaab9cee7cd5bbb0cfcfbe49e443a9d75

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

