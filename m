Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD405CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oO4tiFGAdqxKMTswk4ob2XERAePKrFhJOeLys+Ifew=; b=U9UZWoJOht/QFrdc3TO/mce0tu
	xFAypo5/A/gT9mwt8jtjLm5+OczRz+S8Axm5dKM4sq4vJsEKqjiJqJXVvwbspGfzsDhfVFXZDpNyi
	amhUYUvC3QmiScYZv4cghgRp4acIqs3wNwr9RF2lxPlxVMT5enA8lmwba5BhI0F5fJVJD3LCAMh0b
	ykvXtr7Aoyk19uRIrLMUqNYrH81/qP/Lw/g7fIeIZEFui+Ta7tPdRRtKmUNx/2dQGSOFZ7t9oaEzr
	O3MA8PxFafiXAfcNg9atG6DCOPZHIZUFNAyF0gIpa7ugyG9q+vNcgz3ya8Y78tAP635ZE2PoQvK4P
	nzs8SEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTaO-0000000FL3h-2VzM;
	Sun, 04 Oct 2026 21:17:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTaM-0000000FL1b-0R7B;
	Sun, 04 Oct 2026 21:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4oO4tiFGAdqxKMTswk4ob2XERAePKrFhJOeLys+Ifew=; b=pe1VteL/U5+snLmdkEXLeskB63
	y3H2K/FUqagbR0Gv8ALxXPqR1hwpdFrXwohxpRcInSveDHyYl97e/9Vu4qZVZXqGCz0G5emHldsei
	rmp4m2YvkIkgViy/ICHBfxt4/Ma6Tzocov3YeemaLZ84Hy7LoiUUKYk15jRPkAUZHmMDMwEsC9Qy4
	W93vM7bVr2HCleT+SQCwdDx8ZqwmjmvJGs8+fWqrtzztke6XKrSEY+Llq8UQEJDrtrU/ywlW+sddE
	3iot9r8o0SgtkRJUnODyJj9d7uLgkQmkxrRfteBgOJAbw20si4smfuWdRjOV20QoT9UUpTX02fugU
	HuW1xQmw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: fix audio on Firefly-RK3399
Date: Sun,  4 Oct 2026 23:17:24 +0200
Message-ID: <179114864087.3283966.13415883647539059222.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921063431.103-1-yaozhonguwl@gmail.com>
References: <20260921063431.103-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_141730_141047_1E5605C5 
X-CRM114-Status: GOOD (  10.95  )
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


On Mon, 21 Sep 2026 14:34:27 +0800, Yaozhong Li wrote:
> This supersedes my earlier two-patch series [1].
> 
> Patch 1/2 there dropped the &i2s0 override outright. That is wrong: the
> i2s0 pin groups also list GPIO4_A0, which carries SCLK_I2S_8CH_OUT, the
> codec MCLK. Dropping the override unmuxes that pin and leaves analog
> audio dead. I have asked for that series to be dropped. The HDMI patch
> depended on it, so it is not resent on its own but as 3/3 here.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: fix analog headphone output on rk3399-firefly
      commit: 23eab1a5e36099fd1269f8a18dc389e04dc19011
[2/3] arm64: dts: rockchip: disable unused i2s0 on rk3399-firefly
      commit: 9416a641cfe5b75dd9178c15960ee741c1091b45
[3/3] arm64: dts: rockchip: enable HDMI audio on rk3399-firefly
      commit: 86936f4c25cdb2d138a09dbcbbdd587c3d73cc1f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

