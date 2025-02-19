Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73C2C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJbX6Z7uQIorWyI39nmVld0ANFB2kx/i9TjyVVVqz3Y=; b=ek69CrjrKqayPxRo40i2ZuTzbd
	40fViziIdQuHUzpD2UxtgDzU7d1repV2tyJNuWShIjftB4Mur7IsMmUs6aEoR6NStPWgYA5zH3Ste
	BR9aO33CROgeVNufogEPF0rs8YkG7vRTynEKxOS7ShhnvR+idDr6QK2ylnYbKuvXidT7VuTN77sv2
	u+9d5r35ZvD8e73v19ih3XDeyr6E9wLR33hpvnLJQozANU+L0+mlffqiDOgINIYIBdkSKVW3qAx7i
	JHSLtwzRjRRXnKksLriApL2CESFr5je1RuEAt53ZghHEGyybKqnqjLQ3DeunSFZHkz4xPxNSs1+ju
	NATvbynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrYh-0000000FB4M-42Zm;
	Wed, 19 Feb 2025 21:24:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrLW-0000000F6fy-3Fas
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 21:11:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA6BA611BA;
	Wed, 19 Feb 2025 21:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A187EC4CED1;
	Wed, 19 Feb 2025 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999465;
	bh=Pmh6rAEMacy/e/5HPBume8GH8tnPNRsNtj0pphZEwDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmfpLdYYq+id4TUJRlfAgvMSVQ8iHCPMw99Cf5DU8MidCN+n7n9TAtAIgydd1rx1w
	 NauNcXWJZDsfAzQYlK7jVE4rJBpVtpHUrjoStYUqsdpgcwUSxRS/RKCkLJ+3Eb+oio
	 gsI8WSLOadOSdKdJT54ylvhyfhZhss7t/knHDqkk0FJR8/nCDBz8o8kly3WDn6zpl1
	 sMif8Yktg2FuQC3CMnq01dCDq61uqKEr7GV1s8DUyiLx2HvJR3U3gI+QSuUcX5/lZk
	 YVqRwBUZ9JN0WXrhFQp79VmlPfKWN2yK/3RgiXpkeOdDXhFfcIQNSzCq2LroCrHa4F
	 npkObABfEoxlA==
Date: Wed, 19 Feb 2025 15:11:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Chiras <robert.chiras@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 03/12] media: dt-bindings: Add binding doc for
 i.MX8QXP and i.MX8QM ISI
Message-ID: <173999946401.2961008.13720471519384232924.robh@kernel.org>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_131106_881122_BA964181 
X-CRM114-Status: GOOD (  12.48  )
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


On Mon, 10 Feb 2025 15:59:22 -0500, Frank Li wrote:
> Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
> power-domains, and ports differ significantly from the existing
> nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.
> 
> Add new file to MAINTAINERS.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - none
> change from v1 to v2
> - create new file for 8qm and 8qxp accroding rob's suggestion.
> ---
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  3 files changed, 221 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


