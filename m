Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dBi2n/O1a9/S7CGzEmtRnlAJVMGT/bP7wvzhvUN4aE=; b=t7bSIJ+Fh/dk+qNNLDL9guP2+0
	67d7u7emJCNbBrMG//Hy1XL3FhJqEg1FgqjBHZRIOLZ+WTBG1fBNE5++FhBaATlgQZ6wfOeLwqZ/Q
	de8Iccv/deX93I84Jz2hTLTwX2K8sVMGRySHGLKelyUEA6DTv3vx3xemoqP2zwemz09+yYpir++FQ
	jMAM5xC9V+C/hefl9HN4MpaikOxi11sf6gGfzas+64qORdf6U6xk8DapXwdeI3F+vVl2goXuGXxlS
	8ZI/mNezi8T7Ivd9kZxh97x9s2sQw7I9mKkG8e8xCNfRtFKlIfl2Y8XfI6P2R3YDgbl6Ln96t/x2G
	Wzvbf3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE3j-0000000AcIo-3ho1;
	Mon, 16 Dec 2024 16:35:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE0A-0000000AbSI-13ym
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96E665C5990;
	Mon, 16 Dec 2024 16:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00913C4CED4;
	Mon, 16 Dec 2024 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734366681;
	bh=XNJCjXv1TVDA4kT/hsYK3Sls7xWWCeKlDzSzV4FSBNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrF+QbPyo61zH2Mj2oUy7+0IvqLa3BFSOnqTkjsvgzsgvZfmQNA4xz2YUOnacbtYk
	 7/GcYrpUlZcd/CUXPFh5fOi2T5Hnil3FPABjyjgkUNCew4A0dwLEoLD0u6Lo72GX7f
	 UJALuNX607i3WEssVmD2TxwX6WF4Pc0mjX2rW99eS6O8jL7ggwcNKjSJZfYnyMyPMU
	 3kCYjw/wBLSak1pTiNNCXdlAfc7Zb/vXLoEQNzfA3sJCXHA/rrqk4jbn1mRFOBIepd
	 nSMW2pw5qe3bGRgNV42ZQ935tSHLFfrtNAvbVo6O/yZSAn9ucVxqy8ScTXL6VFuIOS
	 SKEi6rulnNTiQ==
Date: Mon, 16 Dec 2024 10:31:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Fabio Estevam <festevam@denx.de>, conor+dt@kernel.org,
	tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH RESEND 2/2] dt-bindings: timer: fsl,imxgpt: Document
 fsl,imx35-gpt
Message-ID: <173436664990.274185.16737357220255320262.robh@kernel.org>
References: <20241202132147.587799-1-festevam@gmail.com>
 <20241202132147.587799-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202132147.587799-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_083122_336123_2B7D9642 
X-CRM114-Status: GOOD (  11.06  )
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


On Mon, 02 Dec 2024 10:21:47 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The i.MX35 General Purpose Timer is compatible with i.MX31.
> 
> Document the fsl,imx35-gpt compatible.
> 
> This fixes the following dt-schema warning:
> 
> timer@53f90000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx35-gpt', 'fsl,imx31-gpt'] is too long
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx35-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx35-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> 	'fsl,imx35-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
> 	'fsl,imx6sx-gpt' was expected
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


