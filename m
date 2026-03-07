Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50869F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr1MgmASJ9VQrpeXEeFl+uaV6sacPcWTUw4keSVrTXg=; b=XsnzV5gYVC6FwHJCsGPT4B78Vc
	VfpDo26FSv2yuVV6+jS43KCkKexefNrdsUH/UWHW4KIg5z1gNMo9OsHJBo6/wp0OcSkdJxvfR+9Sw
	sdNvGgcLulXkt+guRnvobx84OmpF3eJTOGQKo6e9IQF5OwLnEy6lbGPMdFy9QPmrctY5/x81KYWMh
	g4QOIFyxJFVl4dOlAePppdpR0cvF1sKK1iBLq4DafI3EzQIpVMN8zNJC+S6dQ7NeqKlkbmX958oYM
	FaEtCMWY4Xq6BWaCstnuPcD6zYCGDwfD14ERflsdL8wg98tGgca5kJ3vCpwX9ATWb2xxAQCYO3iX6
	gW65Us2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytBd-00000005HPK-0B7o;
	Sat, 07 Mar 2026 15:03:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytBb-00000005HP5-0gnF;
	Sat, 07 Mar 2026 15:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D17260145;
	Sat,  7 Mar 2026 15:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E006C19422;
	Sat,  7 Mar 2026 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772895801;
	bh=o64ZE1f3g+BnlE5R+s6CnrQ3G4jfhxqxgh+suF1/YdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoQ/qCK7pIefywFqN6Ir54AlsgukbbK6qLqq5tpz2OHPhnw0E6dWsZtgMOox0iccz
	 LLT8et5uTFK0yO5WIjUirUYPMUrMjD9cGKvMlJUbzVSBF43gRHxa4IVZYlpvR0VDiK
	 jTOXDusGwJ7LlSQZ6k7beLgk9ftpOVSgN9f3dK73q1dcnSOj+fGDyn9Es/stIMjtLK
	 CujWV9NWkhC5IFsQ2UKZisWhVpKwrCSF+CnqT29oMkgkBBF1y4032p2OLUq/c1qdaB
	 5RyhU+Sf07nJV1EfTTk3pnjtp2YFJW03kSd9kWsu2Gp8uqi/AIXPNtlGYrU472ZHId
	 6VpatgeOEYUlQ==
Date: Sat, 7 Mar 2026 16:03:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: regulator: add support for MT6392
Message-ID: <20260307-wandering-granite-petrel-719b7c@quoll>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
 <20260306120521.163654-3-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306120521.163654-3-l.scorcia@gmail.com>
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

On Fri, Mar 06, 2026 at 12:03:06PM +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add binding documentation of the regulator for MT6392 SoCs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
>  1 file changed, 1 insertion(+)

That's a mfd patch, so should be squashed to the patch changing mfd.
Alone is incomplete thus not really correct.

Best regards,
Krzysztof


