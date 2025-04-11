Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC690C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEMsmjIbGwEkPO3mB7/HaV7s48KLAJLiYNCFf2/Jp28=; b=UJasDjFgunhK7943A1W3wuGYTl
	HSpER+iT60+eKiooM8/FFv0F6+9HXbsR/gv4/9BlOjCJf5xQuyC35kpjq0Fy/432fT+gLFMCCjPO4
	semYiHwP2498F91N6Ay4ceoy98ir9oM+x9+Cu+FOaUOJDXS5C838R9Oxc5WCzjWpDh7YS7TyMD2vl
	oCUNmT/882updGhX3N7nJoL+Di5Al4z33YNz/e2IqcOqteEyoI03rXj4FyS+iyfkojNs1Q7BJwJAX
	KlGcAcdKJUmEOGRMs9ExndaTjHxqAWV5PEJRvawp0Q+IVGzF8q++FgH0FnVC7u+yxTJAL01Lj45AB
	O30rw1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IF9-0000000EXHk-21Ck;
	Fri, 11 Apr 2025 17:32:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IAS-0000000EWPh-3U5p;
	Fri, 11 Apr 2025 17:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A3C15C67F9;
	Fri, 11 Apr 2025 17:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49A3C4CEE2;
	Fri, 11 Apr 2025 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392471;
	bh=Rq89H9SMiq2yg4sKJ/QwztGczTxjXMGmssMWq0QWhQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isg9oMAIBFyxJZXnUR35Se1wo0788KwdF9b4xMOT+gOQVVgN2lN6lF/VBNdpJi0cW
	 OZRIfqVt2GELLslVNehFX2xaNdMGBTRPXz4AG72WEBeE757NwMuyZqhDpT+6iisp8B
	 QCXbNYlEBf1H7PAUkJ2I/6t7FMnDTkg+Jr+dFN/wz9HWXuuZ2UPFAUWoPOQ4WQAHre
	 kS8j/KK6cJTORxHqon7nHkU4bTNr1083efcqXMdD3aR6XgnSEUl6fwWhc1l31FV1zS
	 yFjDmlMpHmg8SYlSO6RbF0K+mUxfTebRHqzb0dDyD6pKvxOtvM6BedXFUlYCg+6zDN
	 BWzeBInOjwUOA==
Date: Fri, 11 Apr 2025 12:27:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, kernel@collabora.com, henryc.chen@mediatek.com,
	broonie@kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: mediatek: dvfsrc: Add support
 for MT6893
Message-ID: <174439246900.3585473.9168983781812319449.robh@kernel.org>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
 <20250410144019.475930-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144019.475930-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102752_907276_3D1C8F29 
X-CRM114-Status: GOOD (  10.17  )
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


On Thu, 10 Apr 2025 16:40:15 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
> DVFSRC hardware, introducing capability to communicate with it.
> 
> Even though this SoC uses the same basic version of the DVFSRC
> IP as MT8195, the vcore-vdram parameters are different, hence
> no fallback compatibility is possible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


