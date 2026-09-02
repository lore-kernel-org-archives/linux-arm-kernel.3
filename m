Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D072C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGitWDIlcZr9zvSU+hzEEYkqYzd83UWvS+OZwK2+CsI=; b=V5LzpI5XdxSTBo5SAPljRel2+/
	DNeI5ipsX68AFXfP22QPBk4c2MENKhGA5qgUVN7bQX5xcZa3sC2pPk/+zUsQ1uwPjRTtURKijd3fu
	K8VONa6ZHJB68eh2XPxsa676ugwcDmNYcFdqp/lZXs9VcABF3BfKhPFafMUBzrojmKIAsSTE7KZC+
	QE/laSUx1tGJqkYZnPeKUv3he7zS3NrSNNrAx/seOp6KGQOAR3GDXpV2EPi3jC8tuulnPy9ksmPqL
	ZxzhEXDv7Wki3BQqMBewfK47w1kTiasmYRyjK26Z0OzShx8FQcSrwXTwHFeTWi9lgp8S9eqyVxy8/
	3HF04WyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nAQ-0000000F8Ub-3rF5;
	Wed, 02 Sep 2026 15:46:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nAO-0000000F8U4-41TG;
	Wed, 02 Sep 2026 15:46:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B03D600C8;
	Wed,  2 Sep 2026 15:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B461F00A3A;
	Wed,  2 Sep 2026 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788363983;
	bh=eGitWDIlcZr9zvSU+hzEEYkqYzd83UWvS+OZwK2+CsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lBi2W2yzrvXVJzPMlfdStn4bFVddJWTcU1CGAX/PCOWtbs/dxRiGEBTDLppEkGwPo
	 mnHglfgSQ48apYe+/FiB94hboWLnfvkPiiX6Xc7QGSkTymnWcWLnLUAzxEmFNTDIOP
	 pjlLqEClBZ5lhswXBhsgo/i+TpNQfDPmAZPw9GIzH0rVC8+UfHYjDZ3jrKXEQa3F6O
	 x9F0qcCuSziOz+InMP8gQqtlqVGu3l6EM3wOX3rgh8rnH83UbbiL65FfwkmLh2BIpc
	 OnbJTg/rpBHLBD79ilKfEVw1MO+LrCkJL2zQMfVOJxTd7Rr6wqgljdQSyQ8ZQUKf+N
	 zCEsUuWG292qQ==
Date: Wed, 2 Sep 2026 16:46:16 +0100
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
Message-ID: <20260902154616.GA2133376@google.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
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

On Thu, 20 Aug 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

What Acks are you waiting on?

-- 
Lee Jones

