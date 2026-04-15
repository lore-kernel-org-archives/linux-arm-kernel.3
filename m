Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0A4F433C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rXk/xHxt80bks6Xds5L48JVOXFrKrawqRWPPp/eMT0=; b=YPq8PMXgpdGHsfzAGF1rkp4uct
	WdO/tC3s+rqG9SIxI00hzB89HMRE4emsYnv6BQ7G1oyd2vIMgpzgIXJxLofyfMwNHVoxQ76fx0PUu
	kBatITSD3vMqjeJwzfwOX5cYx2iyh3e8FtIiHdV0Fm4Zii6GWxd59QB8/Hc2mPYKYCj4XB+zrxaIz
	3nhFZsR+fB2gvhk+DBJFSeWHVR11MksFcJ0h3dSuSeRl3icEzV3nlPrYvnpOxkiam0pF0tvWLUACe
	x01Uh7XWPt3PtdZiNjvk6RrKcb2Q5QgQgWU6J4ien+VZVhGIyeJRWT1p2s1dtjVcuXP/rIzt3PKGN
	/xk1R7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD86i-00000001eJb-3ehq;
	Wed, 15 Apr 2026 21:49:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD86O-00000001eFA-2HHe;
	Wed, 15 Apr 2026 21:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D09860120;
	Wed, 15 Apr 2026 21:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3B8C19424;
	Wed, 15 Apr 2026 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776289731;
	bh=NLKcyyFr09VfsA7f5Fgt//lj0YJ6MLZ+i+19K50/J90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwyBfLlfJ0kL3e9UtxJpUnZP8uF1e529T0PSfMqewkeQ9fOdWP0F9946nle9/BkWA
	 7NraekXB7ieQ+xv9P6Qa7DzHF+BxcS4O64ouUiUU4oCWBqoXe4y51S7uJH6DOJXrQT
	 m7vxx68YhHc7aNyqQrqWk1JN+TJHkhzMrAsa3wGeqEv/Vy8M40aIVO1oKQbyQ7+Auc
	 OoVY4woMWj7Wqd/vci3UMHsj+dJcZCmyexTjE1El+Sst6Wff1fEPhe1cI6vNWn38m1
	 QzCbSjJcEfiKPSvP8RFGfDT3+q/DewAX8gwY9LWz74J01pCjRUNeTYJj9lK53XGGOw
	 gFpRAfdKW2mnw==
Date: Wed, 15 Apr 2026 16:48:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-i2c@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	linux-pm@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: i2c: amlogic: Add compatible for T7
 SOC
Message-ID: <177628972872.698571.2241475535349345609.robh@kernel.org>
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
 <20260403-add-mcu-fan-khadas-vim4-v2-2-70536b22439a@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-add-mcu-fan-khadas-vim4-v2-2-70536b22439a@aliel.fr>
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


On Fri, 03 Apr 2026 18:08:35 +0200, Ronald Claveau wrote:
> Add the T7 SOC compatible which fallback to AXG compatible.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml         | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


