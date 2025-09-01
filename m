Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2979CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+XAQjMNJbC+UfP3tvqyry/VLGlCKw3+EfhF8VvXLLY=; b=bAwVJSN0RPiB7EJZmWXhHSn4Rf
	XDRQ4Pp/RUJmlWPRJ4YEwCnCODQlTIFow1h8if5leJK4UhPrBUpc6SIoxZTcllkGKrsoCIWDHX3sB
	UTpa3Yt5NwYU9SR4wMKyHhmUOfdbsY1iusYZ5I66ZppgNU69mr/D/G3wKDKcJq1hj1AtOdRIEiOu9
	MWHjSCtugeYOufI4MPU/wiB67aOCAiwBBwNoz9doO0dq4FAMFMZNJqGIvzl3b5d9SCq4ll4APZN1T
	DxNotU0rkAkxW4s9FR8tOMscsiRZktufOE2J4WfysO0uBdFpkaG/S9D7Rel3k5BNdyy2wqcA+3S2T
	a8Pl/KAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiA-0000000EFkg-16fD;
	Mon, 01 Sep 2025 23:13:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80r-0000000DPP4-0JwJ;
	Mon, 01 Sep 2025 17:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B30784516A;
	Mon,  1 Sep 2025 17:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3B3C4AF09;
	Mon,  1 Sep 2025 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746492;
	bh=Ja93BNF+w9Y+juSkpFLMtct5ihTyu7k3QSDMWQqxw+o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=nqzJr3/kInRF4RAUv1LtECAn7lgX/SE7cXFYTn8hEw81z0y7CsnIczEVggZnPzrIg
	 37dciELZGe6Jo1Io/agHNcO+ZIsQqH7N2FBabD2rxBOlbP+/LtwIie0cYj+PD0RFXg
	 tjNgPwwiIITnzkTs8QcVWCdzLhW2Hg15Wk33FoXnY3a2ibPuhl7xnTWydblQ9zsrr0
	 hg0fk2RIHmQD+qrfs3m/SOsYy+UVzScTbbhjG2434+KRG1hE9entEFp9868HTey0Cs
	 DmAezIVP+DTrxT/HLiR8vNuIz3ov0xU267maYJL51Y2KvR1n3ISQjBqvKpJD4lNUK9
	 9CzOfX1aW4XNA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Liao Yuanhong <liaoyuanhong@vivo.com>
In-Reply-To: <20250828122401.17441-1-liaoyuanhong@vivo.com>
References: <20250828122401.17441-1-liaoyuanhong@vivo.com>
Subject: Re: (subset) [PATCH 0/3] phy: Remove redundant ternary operators
Message-Id: <175674648843.186496.241265078555502799.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:38:08 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100813_138360_DF98EDA4 
X-CRM114-Status: UNSURE (   5.79  )
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


On Thu, 28 Aug 2025 20:23:54 +0800, Liao Yuanhong wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
> 
> Liao Yuanhong (3):
>   phy: hisilicon: Remove redundant ternary operators
>   phy: renesas: rcar-gen3-usb2: Remove redundant ternary operators
>   phy: rockchip: usbdp: Remove redundant ternary operators
> 
> [...]

Applied, thanks!

[1/3] phy: hisilicon: Remove redundant ternary operators
      commit: da938e39a81642748db3ec2385e8a53fe03d9bd1
[3/3] phy: rockchip: usbdp: Remove redundant ternary operators
      commit: 0c5375b06060fa40a8f8ce2e926bde125fdf6c3b

Best regards,
-- 
~Vinod



