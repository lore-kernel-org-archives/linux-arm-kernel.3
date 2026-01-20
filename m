Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C1D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7louDgFpxyU4n0BWWFhxWA7atRnSXCl4eBuC57wksqg=; b=p4vfPjEw1pRAS4RCbRncVhPjrX
	FLWxOZ2VTA/UqsFe7yK/nNfYiiQb+B533MDiGRDox2BrVLcCjbRPsHEqJkbw4KTXlhNJ8yedSySv2
	z/G6neY+iO0PPl4vbcsj0X+2yjR/GdPyK6SViMFnkzJiA/So1eep7mTh6cNQa04rKUSj+djjZt91g
	qhn9hwNxO82MVnPKlTlD4bo3TquO3WlYRuXsGiF26UDwr/0p8pRT94WaqcWnInBAaKon+vp3PSQTi
	qP8iVuoeVCDXTJCbe8AoOkMIcZluhbU+tIACzqx9nRYhwPTSwOto3Yz1ETG0xVIt3C6GXtt8/gaQf
	bj6yvrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8D1-00000003Xgy-48oD;
	Tue, 20 Jan 2026 09:39:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Cy-00000003Xg8-42X2;
	Tue, 20 Jan 2026 09:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7louDgFpxyU4n0BWWFhxWA7atRnSXCl4eBuC57wksqg=; b=jHu/EVLQCh4FX6xag2JDnMRWcz
	Tqa1YrbtdVCFqoTts8BA9KJk1qEUO1QD4qzOq/JktOmezMPQM0ewCcbiCKFByEktJ2lxxW9N8E3NR
	/obpZUzMAG6XdERx+GYKKTQrhlkcMHQkkDp+QQhznnOUWdR/grmqwPn34WBTzNvpOHMMGuWTzrmez
	dRZ+nM/h5w4cHRnTppYQrulIELOFmXcODGkabqWxXlhHNubl3rtYGSqcXUYowXgj4YeWTFiIMjhLj
	JCa/S12Re27rsJZ3OodC6R0MnSsxVWD7nZSJDebzk301HQ4tS7YC8REbIX5Zd+Ysk7ttZmD9kEF2H
	Uvvc8VxQ==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi8Cv-003KZM-Et; Tue, 20 Jan 2026 10:39:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	pbrobinson@gmail.com,
	dsimic@manjaro.org,
	didi.debian@cknow.org,
	conor+dt@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
Date: Tue, 20 Jan 2026 10:39:27 +0100
Message-ID: <176890189896.310054.3689082098898178787.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260116151253.9223-1-jerrysteve1101@gmail.com>
References: <20260116151253.9223-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_013933_005883_B337ADA2 
X-CRM114-Status: GOOD (  11.21  )
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


On Fri, 16 Jan 2026 23:12:53 +0800, Jun Yan wrote:
> Remove the redundant enabling of the hdmi_sound node in the Pinebook Pro
> board dts file, because the HDMI output is unused on this device. [1][2]
> 
> This change also eliminates the following kernel log warning, which is
> caused by the unenabled dependent node of hdmi_sound that ultimately
> results in the node's probe failure:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
      commit: b18247f9dab735c9c2d63823d28edc9011e7a1ad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

