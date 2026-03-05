Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF34F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol4kaTea/yXUOYivROPlHxCW4joVr1FDWljuR7+1Kcc=; b=DnVPEZtgXR2dJdyPdnR9ahEQim
	2VtW9qRPfHZwIrISnrkfmUES1IgXcL22wBdcjCM0rcxDW5PaxnQkiNiEGodSbMajePppoBw6EbV7S
	/kHh3rPsNdArGTQoHcVJ4415mXSRtD6jAFcB0rCVyX9cRqqth5MSwZb6QR+jbWUoRf3PckQKICQ3S
	jOhSsuYuqPasrL29gLGsAltPB5Ej8HF1+7HVqoMI7ePGZH0m9ZwRwaqdwuxWN4D/1huPPWonNbcXS
	3PSEnYOPXzoA+XPb6CRmpEfsOwgHmTbMluxsZxPpExkG5rDC+LOGmNxImBTjJ3TLxFDI+WzIdafsx
	ONJT0xxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIM9-00000002jxi-460F;
	Thu, 05 Mar 2026 23:43:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIM8-00000002jxc-0WLt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A21560126;
	Thu,  5 Mar 2026 23:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9D5C116C6;
	Thu,  5 Mar 2026 23:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754226;
	bh=Cu+HuH+jRAq+lh68BIf/MeztQSSaSBd0C4RyJDRVkjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8MoaVYOrMPwLgvj0sqQIxxRwuksobMdykzX3xUuSPSgrTO7ZoD1AvQdNLN3+GZwv
	 6wsGVNXkav+jCThl5KXo3tW6/PvqWzxSaC1+2o+YQEt1Te35pl4OKO8lLmR4difH/f
	 2KwzAEu+EELPL2G2SUW1d7XyYUQVs39y7MCcq3p150NCq7aqO+BPIngmpj0iybTUly
	 C2DTwRv6bZw8BAmHWOIlrVs0EKQKiJIVcn48/10TvNGbUKuEyIlNfP58NrhFkzQ+qi
	 EXW00xrEvzZ5NAVpJSU+dfb7xt0IB39jQrBnRBkLLDqYS96rfin13CyV9gfhH1coRs
	 p9N46JTJ4PQJA==
Date: Thu, 5 Mar 2026 17:43:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: input: touchscreen: convert
 fsl-mx25-tcq.txt to yaml
Message-ID: <177275422508.795241.1267020381842485721.robh@kernel.org>
References: <20260211-yaml_mfd-v1-0-05cb48bc6f09@nxp.com>
 <20260211-yaml_mfd-v1-1-05cb48bc6f09@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-yaml_mfd-v1-1-05cb48bc6f09@nxp.com>
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


On Wed, 11 Feb 2026 16:41:04 -0500, Frank Li wrote:
> Convert fsl-mx25-tcq.txt to yaml.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/touchscreen/fsl,imx25-tcq.yaml  | 69 ++++++++++++++++++++++
>  .../bindings/input/touchscreen/fsl-mx25-tcq.txt    | 34 -----------
>  2 files changed, 69 insertions(+), 34 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


