Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C5AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGLtoYYi7K3ZWoABwS6z1lnN29PVOb3dMF2Cx2fBPlg=; b=FE3GRZit6Tv0Vt59SrIGHqLnEd
	uVDYsRTIqbkEG1cT7Uh3a/qo9TTwWAKxJrsl8zNtRaF8TZiZPloEfuX/QKVMnOBq/kEPA35adRM08
	HUDnaSs3rlWx/cbq6W4lrPhC9UvlwnH87KEZapUia+xxHdbS/gPrRwy1HstYeTJmXbFimJO4tA6ra
	3rzlZMVwIjcZw4On/EBzQSPjmpmK5T/RG3yKBfqrq1HubXir4jqgL+4q9CtFvVr8PgFeuWCJHIo4i
	7XWlap0qBr0VHE3GfG3eOubv+zSipFy6dqnqcGp8bFjlJkcxl88jjiP7+jC8NM9ZduUcwMDAc6jFA
	HJsF7JFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsox-00000004QeZ-1XfQ;
	Tue, 11 Feb 2025 16:09:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsnX-00000004QIf-1Vmb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6B415C2F30;
	Tue, 11 Feb 2025 16:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C712BC4CEDD;
	Tue, 11 Feb 2025 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739290062;
	bh=hmIgcJwcpukX+VwNpK4jLYcrMogwI4n2BOulAhzBeGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mE1hqjdhNQCEbju7Xb3AS5F0bbrJ/CGYyxo+qNF4CarzfZ7FBJLp5EPpyF57UmtkG
	 3xvbYQ9U8J0659+BB+P9SaEno8bSrAr2FGyGKwX8/gCQGX8vPX0SSJNncnfzmvSDLo
	 uKhBpJrwg17hsTTvHBKuKtoLLyBQqe9l9H/+Npho3AphOhKek9TCyxINp4q+qggSnT
	 ZpearuiH1hhvOiKoPM1QJbXFNFHJhOdDiOP1crwCxykV2MXGu07yhmOw48rsW99P35
	 OC47BbRjhVTqUTOr692sjH3DZ1dTgvmSfdhVvq7jMmRZZNaX0kb0XEyhvWmn44G/1X
	 XyBcZgeFm8F7g==
Date: Tue, 11 Feb 2025 10:07:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties
 are defined
Message-ID: <173929005644.349085.18272720642516386145.robh@kernel.org>
References: <20250203213027.8284-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203213027.8284-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080743_439065_5ECEB278 
X-CRM114-Status: GOOD (  10.61  )
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


On Mon, 03 Feb 2025 15:30:26 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> simple-bus.yaml which has the additional properties used, and fix this
> constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied, thanks!


