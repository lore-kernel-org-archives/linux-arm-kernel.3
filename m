Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391AACD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AX6G96TYePTiSoAJUK+uHiXF2wePd1gQB45nXwOGqA=; b=m2t13M+i5BOBJV1/Upk30wjbV9
	hKkZYdDlLtMxaV8MLlEMC5t1bLmVi+fDUyG25wbfFTE6ny+Dp/N3kgsVPmADmf0kZp9+27bzgWDvt
	7DfQt23jAB2irPsgwozuH1X7cmOQvck2mmk/IEvbB/s17WtEbjGAuAkbFUi/Vm+z9qDqVbPu9w2Hz
	WD2P67s8JIov1KWy0rCjkzcRtGGc6EfIwbAAA3xfqdf/Nr4/kjYcoh+tpVnJ/icKna7ww4SAp/ykL
	L3A4ak4bOcXTUdPUX5tmVhGbnMpiATzCafwN/mH5S17a4ASVIjmgE+kYlPflxNSfRdKLE7aBOBawr
	hQhsLiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgNR-0000000BETA-3XN0;
	Thu, 13 Nov 2025 23:05:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgMs-0000000BEDO-0GE0;
	Thu, 13 Nov 2025 23:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2AX6G96TYePTiSoAJUK+uHiXF2wePd1gQB45nXwOGqA=; b=GSR/XQSTWVBZy1nix8gv0SzolE
	/VRDAXHQutN/RlxjNe1dGk81xhQTw+1mUd474nuqifqyR0glyVr/JVnfLNKEW4Wm8kMrnV4g17g46
	ZMScoicKKrt7rzQcOp2fLhmZwBDmYZBjm6lh702jDaB81QkH9YToCvZ1mOzQh92n35+Bzrsyft1Ng
	OhSVXOuWSBdmivUbc824jPokDkARi2GRMfA2ENfuLtGG1dK9YniG/TR7I7/Ey/nbLhe8zwnq6PB41
	t7dEHqhxSUStXby1f9Gn90a4QO563hm6Gk2KOKqIqu098iMFuMYNCPq7BQzlq+UOJVpWEw5Roa9gz
	FIB4DPuQ==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgMl-0005bo-2b; Fri, 14 Nov 2025 00:04:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	diederik@cknow-tech.com
Subject: Re: [PATCH] arm64: dts: rockchip: use SCMI clock id for gpu clock on rk356x
Date: Fri, 14 Nov 2025 00:04:24 +0100
Message-ID: <176307502896.495066.1180507445671783497.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251105235408.163282-1-heiko@sntech.de>
References: <20251105235408.163282-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150442_129828_18963258 
X-CRM114-Status: UNSURE (   9.85  )
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


On Thu, 06 Nov 2025 00:54:08 +0100, Heiko Stuebner wrote:
> Instead of hard-coding 1, use the more descriptive ID from the binding
> to reference the SCMI clock for the gpu on rk356x.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: use SCMI clock id for gpu clock on rk356x
      commit: 4c609425988969e46a6d562329f4061c82017945

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

