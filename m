Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24947C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoxQc7fzJrKUrTxldrOBJXnShQqyA7cSsU6H1m8i5cg=; b=xnEN17t7f476kWa5yCSXZFBJ/B
	HjuoARQCZfTjhOa987GDbO06bdmF+Hwe3tQd7FUKadyyu6yIzF6Zsksf3LhKwzBwr3MTiQlsfXQa9
	F4o4auvmI8UvqHsnWDj9fCd4+/yyRxYS/S0HMZGx7+py2R/7IJV+xpLLZ0jU3ggImnULpiVdFS7TQ
	xeO2xUMHwXXUvNxdEWIB4j/YtGX9otlNlkG4xTaBksAqAcVwoeZ7NAK4miaQsaUPQPCK5H7kGARrj
	O2eCKj5Hw57OpSkYCbTEKmvvNMqtLKL+vwi+m4KW7cXztazBjTYxfKvtMjg5khD1tlaKUeaaebjv2
	LWbh6vSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IIk-0000000EY0D-0k3y;
	Fri, 11 Apr 2025 17:36:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IAx-0000000EWWh-2mZ6;
	Fri, 11 Apr 2025 17:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28FF1439D1;
	Fri, 11 Apr 2025 17:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5CAC4CEE2;
	Fri, 11 Apr 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392502;
	bh=Zgeijt2L3xmMVOj41zXB5W/Ov2bbKub6fLsjPUsMN/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5Obqq35/zWhTa5AFgJOeB9pKQWOMMdtyWUJFFbyyhjwHWnqbwSh8qbgfa35tWzil
	 JhaKLuYyFp8Bp2/sOJLTC7mBIO5DzmlbnPXp32LrvEvEATfxtNFhnkgvUynw2IaYRc
	 bWD/fhNC/QXPblXhZTu8vIpUpXlKa6x5qQCXjhUN64LcJXfg77t1K/HR2Bvf5JPkQo
	 Jj9x3xdAM5jm8LhBtTnUEOO9+tzRHRUdEW7SUwrvtRr4Qzl6cQ2nc7yNI+3GJohY8L
	 LTAkz1KcnikoWMVz9PKIBx8vt2ho1qv6umMapE1aaHb/6rmyJTXbJ30n11aRxfaVel
	 O2xcTSliYrbSA==
Date: Fri, 11 Apr 2025 12:28:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	broonie@kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, henryc.chen@mediatek.com,
	krzk+dt@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com
Subject: Re: [PATCH v1 2/5] dt-bindings: regulator: mediatek-dvfsrc: Add
 MT6893 support
Message-ID: <174439250122.3591052.15241487083361117894.robh@kernel.org>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
 <20250410144019.475930-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144019.475930-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102823_717872_A2D2B173 
X-CRM114-Status: UNSURE (   9.18  )
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


On Thu, 10 Apr 2025 16:40:16 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
> regulators over DVFSRC.
> This SoC uses different values for the vsel, hence it is not
> compatible with the currently supported ones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


