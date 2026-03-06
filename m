Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F0FF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQUx2kRi+msetx10JY+kVrZGyBxSxx7bpzW8LMnX1A4=; b=RdmBouMnJ6fXkIekfc12bREkIV
	xvwaTcIfzZEP6j3Ox/greKNRQ1DH8LigaGVcvC9sS8uVUMgjaNyGBJJ5SqKWTSf4YqDipyx7Ey+Ro
	3GMpMBHEpZq4/N8YQpVmxbUkuJa84Zm8e/d2aSsEdfgLjfda+rsdGPopNYf8d+b/ZQ0RCzuSoWx7c
	LpGtb+cFrOQCjBFWp3sZXkUodw0DL2n8c5rNkVF9HQyMPIcyw+BpVXkKU9gcEiPu99FTk7ma5lrMK
	4D+UC/BMF+kPZCjGLDwBmi9oFQY82jOhYkcmQesJKLBtXtUKHZ2jvJHU93MMw7FvR3HvEl2tdpZ8N
	KacbERCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ3m-00000002mby-0KHF;
	Fri, 06 Mar 2026 00:28:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ3k-00000002mbp-1XCz;
	Fri, 06 Mar 2026 00:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D2F3600B0;
	Fri,  6 Mar 2026 00:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E4EC116C6;
	Fri,  6 Mar 2026 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756930;
	bh=EXIStN1B/izsA6vGyFCAGh+w3xMM+thmSuO0J4C0Xvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1fWMiSVv9ZBMUvKy4qYRdIOqJzOmk3HXhNYLX4RKFCXSipyjH8GD9CkxuqVaOYd3
	 t0ehgvplc3/7pGkWH/WKQVUtxj5l+8MkWdS8AnScmPCNhTJb8Lnrw2pa8IV8TVjKXM
	 WdN19c/dGxbKjTwtmtLdNOmaSa9igq5318juqOVuFvEfQ9lUa/pyx11nHRO3m90EpW
	 zFbvnnIAj8jJpkRDYodTJwgJrzcMzIqixXoUVCRSGBeASZqqAquFt8cjnndVjNEYIt
	 NTkA+HFiCEKxhzxqbX2bC+I/kSZisc0mD+NlPJEI6P1cGjKrE5vb4KgJUNcy3K2CvR
	 F2V0H94O8MlZQ==
Date: Thu, 5 Mar 2026 18:28:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Fabien Parent <parent.f@gmail.com>, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Val Packett <val@packett.cool>, Sen Chu <sen.chu@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 2/9] dt-bindings: regulator: add support for MT6392
Message-ID: <177275692938.853845.10496663055638089922.robh@kernel.org>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <b7664f4d9a7b038b0603b6bba79cfab4e18cbdd6.1771865015.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7664f4d9a7b038b0603b6bba79cfab4e18cbdd6.1771865015.git.l.scorcia@gmail.com>
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


On Mon, 23 Feb 2026 17:12:41 +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add binding documentation of the regulator for MT6392 SoCs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


