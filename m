Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A3EB48F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLQgcrGakBHEt/SLegPfkv0FGX7jJnt5jePqZJFpWrE=; b=UPNHlDRnYfEA/dZJdhMiIB4D0/
	nRVxq3LD6C4T1ixeWxmFl+tIYJKjR2oN4IFRdMlScaBjR0pTMFh/KJqVqgIPzi9tHNWW4viFjFApN
	YSyN+mloAOSOaj4PVwNDaioRUuOfH3yT3hHq3Xs8E7zDP/tKDHf23vssfKwfYnmtGV5RLLbPvHK51
	umUmlENvsD1bkCCHIf7ih7AHhRJmfXBu2/MB7UE+Ry9G0/frN3DfCWqjOrg7L/pb0BpxS5At+zDtp
	Cp3A1NX4OgRZcfFHOzcmuhU+29nZUErRuIpqkeuavqhaixUlXlJiWOEqQe+5bADbM/Mh/PgoB6d5S
	MlCzM++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV85-000000021K3-2ePz;
	Thu, 12 Feb 2026 11:45:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV84-000000021Jx-1ojV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C68C160018;
	Thu, 12 Feb 2026 11:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96AEC4CEF7;
	Thu, 12 Feb 2026 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896703;
	bh=GZslXHKhVABa//r0nZYc2MzLtfrMPSsOERvcnBRcLgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UMojFqL1M+MB8QERPV2uDjw4rnyyTSDyJ+3F246glTKqgw150Uy9lwYpZn0I+zvHL
	 6bjIk9bOonRGN08bRtBs5DkdvAE+EcdfsE9LQte5GTwDUtDMpiXyieMByUUlMv52sf
	 DPAZcqQ+m/QqgwDlNup96V4DmaU1yLPMx9qd1SjiDvd3BOwdAqOnEtOyR+UonxDYAv
	 wIVxgb0RhBi0bB0Tm2pKfCy7Efpj+sRNA2gU44eU5pm0/Nr3M2yT5vxkFKy4I3P0A7
	 GHqiGDPBhUSARiQZudTREwd2H17tmZO5RnYJEeak/6yA5sJMpp2URt5qyuutxuRA1g
	 PpeqkLMYX5N3A==
Date: Thu, 12 Feb 2026 12:45:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: imx35: add compatible string
 fsl,imx25-iomuxc
Message-ID: <20260212-cuscus-of-perpetual-brotherhood-516caf@quoll>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
 <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
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

On Wed, Feb 11, 2026 at 04:00:01PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-iomuxc.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


