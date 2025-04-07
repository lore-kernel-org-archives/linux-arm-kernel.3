Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7137CC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PrlT27m9EP8rauA//gYPo/7ZjcRwVCAYzD7lAeAzf8=; b=xyCO8ugHVcrzVk9k7eW3W4QD3C
	myDrDcYVHgJ3hrAWEgE2bjrLBymKlED5cAcZxWb+n4VJk+3Wj6Ik5r804oRmSXr2eDAIIB5F6lWDK
	Em2C9f5jZJmt3huSru9wyeOCoxTJrpfn5R72XIAmRScmYAWNMic1etnQfVCAs4/m5h7w+z/gB5K64
	vu/qZkthB97My1pMbYXkcxQrucJJEa+eFce98aXeneQzZPN4mc0Mn4CGYsc/eIOjj8TmP3CYZ79Fx
	oAFBnuxnyAnqppoQlcOTB7OA88aEscZoghBMLD2l2tDYWWrpCJE7g+QU31kbFaGbDR3bFaPenJGzm
	SNpXoEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1h3g-0000000GoGI-2J3D;
	Mon, 07 Apr 2025 07:38:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gk8-0000000GiTY-0b1X;
	Mon, 07 Apr 2025 07:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4PrlT27m9EP8rauA//gYPo/7ZjcRwVCAYzD7lAeAzf8=; b=BKNm6qKL5YDNJ4RtcOlsTx3pmz
	q0Y87boZY7QNW/XctkHIjm2fywnulpwanlL3Fm8OeAgMdvkSmhq9XcCgV+s75GVyGHCCzjIIjjbcS
	g1t8lcboGl+ssRG9HG3Mex79tnMgk8TCg37CyO69hoWzlx0JSwekOpC8aXwR4qiFVdbQcNTVze3bV
	IanHrqCgmGv45szjSRPRKGRoH/pdiludTsU+/EYs/WB7Fzcylzy7MjJPmBbe7G9oNFltlQwGKPQq2
	NKsOtvho71+nVnAdFAqMtc65jmobpTQ/Z0DzWYsueNoLhNmyyVavyDqw480NCdmbcheFO1cSnp+7C
	WS7VBGKQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjx-0000tP-Se; Mon, 07 Apr 2025 09:17:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: ts433: Add pinmuxing for eMMC
Date: Mon,  7 Apr 2025 09:17:45 +0200
Message-ID: <174401024397.372530.6675456820651613380.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250319113138.125192-2-uwe@kleine-koenig.org>
References: <20250319113138.125192-2-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001804_199830_D8E9F84E 
X-CRM114-Status: UNSURE (   9.82  )
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


On Wed, 19 Mar 2025 12:31:38 +0100, Uwe Kleine-König wrote:
> With this added barebox is able to access the eMMC even when booted via
> USB.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: ts433: Add pinmuxing for eMMC
      commit: 7fc027e894fae7c8661b52b1fde223004b2a8e0c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

