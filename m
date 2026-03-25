Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D4E109E52E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 23:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnwxTt1L/KFHjhq4SgpWoQjkbViqtcYR70ypPc9O5cI=; b=vBLWZ+icyiJvMzG/Eb5DeN9lPv
	JrFXBZgUlw17tRtzwoyObahAJSNOALhcMtVrIslnCb5ZhvfvWG3GEz88zpEtqCfZTWcHO7QOfkrgr
	ksUwBHyr8GMw6zNiId35Oz09sH22Hx+f7h1S13n++hDII7T5jP77L6IkDotQuvqMZ3MPIGTfxx3Sx
	Kr5Hon7zP1rn/zzcdHphZlP5uJ07oKyCIPkged/M0d0z0l6tX1JY2KgWYMRZ7zJtuPmc2f1N/9Ey6
	kRnjOsyUyH8T21qKJsBeELv3YKaOBe6mGhYN69H5KxZTcOG/fKI0aFVIDvWXrattfYlQW2I0CfXqo
	wQKL8bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XoC-00000004Rch-0MpZ;
	Wed, 25 Mar 2026 23:38:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xo9-00000004RcI-1LvF;
	Wed, 25 Mar 2026 23:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cnwxTt1L/KFHjhq4SgpWoQjkbViqtcYR70ypPc9O5cI=; b=STyksvvPwh9MaOK2RojGKf0AZs
	PjDtRWYh6XRe4A8hwDdtY1fQYoljnL2jsyLnbZZ5okWpIsLNUlPzY+bwZyWt8XtalNSwqumyIM0bE
	pUJOJuh8xa6qiiXet0roD8Tf3BXy2+3xSFNsjyzla4wsSduzU+bmft+/+ybAm6rcWTh90rgG9SQ5d
	+Gxyqg9wE++W3ftt03hB3hyvgobJ/dWTB6Ga6GFbmGdNhbrv7D4OVAUzOOO9piBmvbGt+kTuwfcpi
	H+OCQEdt0xuLaQhsmeC93qCLd49dKTLGeMxXmu74MeVm3O7ogaVgnnvVPQJShAfGOcY99rs8N97rs
	xeKMM+mg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pedro Alves <pta2002@pta2002.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Thu, 26 Mar 2026 00:38:30 +0100
Message-ID: <177448190116.1054629.6633892031656832251.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_163841_422234_3E5593F5 
X-CRM114-Status: GOOD (  11.39  )
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


On Mon, 23 Mar 2026 09:25:33 +0000, Pedro Alves wrote:
> The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
> the Rock 5B, but this was not reflected in its DTS.
> 
> Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
> and hdmi_receiver_cma nodes.
> 
> The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
> the hdmirx_hpd name used in other boards since that is what matches the
> official schematics (HDMIIRX_DET_L).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
      commit: 6cb4ec63ba9a5831621cf951b7af55c67beeb97b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

