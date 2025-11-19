Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5CCCF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RdYG33iCZuDeD0/VFk7kVc03XXG12WMufrZ2hK5EvE=; b=tfdFpxHEkRngMi9qlLjhoFj1Nb
	SreQX4ALf+/Hu4F5V9l3DX1BJm2oavbg7d8qDniTXBHERugzUrNo/6VS+Z9oAfvkt4v3eZsd28HvW
	keV4znJkWhk7OMPRbJ8VsAMrCXfocaa/SjPcZhDvLMSNGcPduDOLwFUNV8WFT9GWBzMACMU5Ou6f0
	E87OMXC6Zh1APpc8rPc1+rGEL1+lskkkAMvJstHu+0OLyittMN2FXmfAD6BAGmg+dBjjgRFXm31IW
	kUjKd4EFRs4jUuEIOhWZjRa76dz1SH6ZbmiIyti57P99sM4e4tzv3augq61km9qNgp92CqOD/Kzvb
	dwLoDTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmem-00000004SU0-2K5O;
	Wed, 19 Nov 2025 18:11:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmek-00000004SRv-2nap
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F33160017;
	Wed, 19 Nov 2025 18:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58CBC4CEF5;
	Wed, 19 Nov 2025 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575909;
	bh=+RdYG33iCZuDeD0/VFk7kVc03XXG12WMufrZ2hK5EvE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IjzGAgNk/ikrJeyppei/IyDnZV/0Fi+ECywG0vlW+2TdT+pjtGcnWFbGAcTKokjwl
	 bqr3YTOta4hG6Fxvk/u8sgmb3ZrGkdQOn3bTUt98Ja2ZTMG0EGfpSmfqK/9Q95VA9H
	 9GaSZJfgYLPl7JfYD4YdF+nVLLcRwm7oIm+LlQP9tvmWlHdjJifUxq55PEPg//v1GB
	 3hk5ky7h/kUqzsLI1AVZIHD3ajsUCq8AA6aq6YWB0TJpn/Tn837RLKZXDbuNqsE5zq
	 VJLzF0j/eebMgj8+RZZNjmSXXrDpdGFe41EpBaYYVGK93KUpsmAkX1+awDCRRiuGRO
	 W0o17HSpfwo5Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251118074055.2523766-1-xu.yang_2@nxp.com>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx95: add PCIE and USB PHY clk
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Frank.Li@nxp.com, Xu Yang <xu.yang_2@nxp.com>, abelvesa@kernel.org, conor+dt@kernel.org, festevam@gmail.com, hongxing.zhu@nxp.com, kernel@pengutronix.de, krzk+dt@kernel.org, mturquette@baylibre.com, peng.fan@nxp.com, robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Date: Wed, 19 Nov 2025 10:11:47 -0800
Message-ID: <176357590754.11952.7874373646773229823@lazor>
User-Agent: alot/0.11
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

Quoting Xu Yang (2025-11-17 23:40:52)
> Add two clock definition in HSIOMIX.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Please send a cover letter next time that all the other patches are a
reply to.

