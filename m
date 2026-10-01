Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAB6CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuJMB0R2fpyv246i5bflCVnaHCMCzlODoqds21wYmj4=; b=ZkAFpJsEVux9ySmex1iUn/KYRg
	XcawY8qYbMzzHqDBZcauusnG36VzCsItFTcOg+Yqz0rsvsRmmyaV01ySyh89kCYDsD4c+BYGneP1w
	rH4SVENlMp75GsQ+HJSZ2x1lYN/TtyMG1RAxEXMBfFH1puQnA/MvV4q7sUZTfCeOBRrHpeBceOXVm
	8doXzugeEjQ4iF082W5UV9VHswP01SV2lkYvYOlRyfX1KcHK8oXAKEKTWTqb2zLdELgNbTcW1rNM4
	/0NPmwusvJEM9Ha4LYNrN9rvd7lpFs+qafAvmgLuNcW9shdac6H086FIKJhlK+pcznttSAotDIvV4
	Ee3Fzw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCDk-00000008BG9-0paW;
	Thu, 01 Oct 2026 08:32:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCDi-00000008BFY-3ryj;
	Thu, 01 Oct 2026 08:32:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD99743A1D;
	Thu,  1 Oct 2026 08:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697381F00899;
	Thu,  1 Oct 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843570;
	bh=KuJMB0R2fpyv246i5bflCVnaHCMCzlODoqds21wYmj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ipWPd6VlKmPWzF1y4l5rakilJRkBnSbPuXbITRmkx5ZaNzK+TpSyElGbF0i71wDT4
	 Uta0D1qYFrFoc6Y/wQeyoyRPpsKaUYkvlLdI1nSBlA7m0guCT0I22WX8NXOcomsI9d
	 Ely/WhK/Had3ecTlQapdsJzMjkIc5f7FTK+TPmEkGA+7NawPJuGbCJTGW9ypqnyHSf
	 Z8C6LZcoD1zzCxPDm70XGwaKY/QOOYrp0LiB1bbL+Lgx2Hnhx3GcRXVCpI17xS3CqR
	 0nAHM4rTLFVy4+IqZa3+bTj+GV1DpMyzgKvOscL/Cfl8XYcbNHq/ISyc2GZYZEB8pl
	 qRtiNAMht4mJQ==
Date: Thu, 1 Oct 2026 10:32:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
Message-ID: <20261001-enigmatic-armadillo-of-finesse-2ec4a5@quoll>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
 <20260930-ok3568-c-v1-1-a0ffd55f5c95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930-ok3568-c-v1-1-a0ffd55f5c95@gmail.com>
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

On Wed, Sep 30, 2026 at 02:29:04PM +0500, Dmitry Yashin wrote:
> FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
> This SoM used by OK3568-C Board.
> 
> FET3568-C features:
> - Rockchip RK3568
> - DDR4 1/2/4/8 GB
> - eMMC 8/16/32/64 GB
> - RK809 PMIC
> 
> Add devicetree binding for Forlinx FET3568-C SoM.
> 
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


