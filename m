Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347A6CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIqOJLYRdV+MzZLicS2TDxnQpeZCtKLQ/MbxYjbovPs=; b=KWPlNbEZ1syhf3l9dcPC55Ni83
	F+eWFLRYlkUAOWjH4xHvvBmiR4jCqqxghFDsLmUiz64g7ojgtgbVHR98BXEBOtsJ2M1v02KNDXcoq
	uuPGE9u8ntVBpwQ+qm1wvdVYsaX+63afChCGnCs4MVf1MqY49jja13vgilBVs09u4MqkoN+01VwFn
	AyCmeNYIBRsxZm9gFmHJ5YlTvg9DRqY3Qb8rI6HobE/sYdG3ws1vrV0qHCk9ay6IU/ZHE79JJmfg/
	jqW+nchHkU0kWMe/Gu/3Uyl99VWZV0DE7e+zXpRjFgtewYfvqXZi8mqhUz1gKv/+nT4xTZqzS1raK
	sqX1i3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLH7-0000000BKS2-3dK5;
	Mon, 12 Oct 2026 19:01:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLH5-0000000BKRZ-3ssk;
	Mon, 12 Oct 2026 19:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2230B60142;
	Mon, 12 Oct 2026 19:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C2A1F0089B;
	Mon, 12 Oct 2026 19:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831686;
	bh=UIqOJLYRdV+MzZLicS2TDxnQpeZCtKLQ/MbxYjbovPs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RplrdsM/XL3+pKgGomBxpyHHtQHdDi2HSTfFFaUwOJ88H2YpW/nnYCrbI9nFwoymT
	 NG4UuOWMgv6G7QMGmvkQW35ynpuy/fMxpWRaX3/csTv8La3T7Dw6oDbz0xxHuQAhXR
	 sRmT771ipZm7pJdz0zA1vxGQn03FIwzmNs39ZwOIVLMHkzAZPTjI/EHjvAD4U42H1j
	 XH3W/yQyrXELrn7l93jyGp9L1gTfl3/45Pgg7LQqJPOqAbjCX3Quz3rrRVGtrxmlkW
	 Kulwfu4QceH+j66gMx8PAoLxl9gSb/Umb+kxofRg2WBdyGN2yl9yhUU4WK6tGrAISQ
	 3Wp/jr0qz+wCg==
Subject: Re: [PATCH net-next v11 1/6] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 david.wu@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 19:01:25 +0000
Message-ID: <179183168522.434549.14619345397319265452@kernel.org>
In-Reply-To: <20261008175225.3375274-2-coiaprant@gmail.com>
References: <20261008175225.3375274-2-coiaprant@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] xpcs_get_state_c37_sgmii() now does a non-atomic read -> act
  sequence.
- [Low] Concern: in xpcs_get_state_c37_sgmii() the ANCMPLT latch is
  cleared (pcs-xpcs.c:1112) before BMCR_ANRESTART is issued (pcs-…

--

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This patch sets BMCR_ANRESTART alongside BMCR_ANENABLE when configuring
C37 SGMII AN. It also clears DW_VR_MII_AN_INTR_STS before AN starts. In
xpcs_get_state_c37_sgmii(), when AN completion is seen with the link down,
it clears the ANCMPLT latch and restarts AN, so that parts such as RK3568
can recover the link.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index b415b93d77c15..6466e0ff2a98b 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c

[ ... ]

> @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
>  		return 0;
>  	}
>  
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> -		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Initiate the next round of AN */
> +		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +				  BMCR_ANRESTART);
> +		if (ret < 0)
> +			return ret;

[Severity: Medium]
Can two callers of .pcs_get_state() race here and restart a negotiation
that has just finished with the link up?

The read of DW_VR_MII_AN_INTR_STS at the top of the function and the
clear and restart here are not atomic. phylink calls .pcs_get_state()
from contexts that do not share a lock:

  phylink_resolve()                   holds pl->state_mutex, not RTNL
  phylink_ethtool_ksettings_get()     holds RTNL only (MLO_AN_INBAND,
                                      no phydev)
  phylink_mii_ioctl()->phylink_mii_read()   holds RTNL only

struct dw_xpcs has no lock of its own, and the MDIO bus lock only covers
each single access.

A possible interleaving:

CPU1 (ethtool get)                  CPU0 (phylink_resolve)
xpcs_read(INTR_STS)
  link=0, ANCMPLT=1
                                    xpcs_read(INTR_STS)
                                      link=0, ANCMPLT=1
                                    xpcs_write(INTR_STS, 0)
                                    xpcs_modify(BMCR, ANRESTART)
                                    ... AN completes, link up ...
xpcs_write(INTR_STS, 0)
xpcs_modify(BMCR, ANRESTART)

CPU1 acts on its stale sample. It clears the newly latched ANCMPLT and
restarts AN on a link that has just come up.

Before this patch, a concurrent caller could only clear the latch. The
extra restart is new. Unprivileged users can issue ethtool get link
settings.

The commit message's reason for clearing the latch before the restart
assumes that get_state calls are serialized. Does phylink actually
guarantee that for these callers?

[Severity: Low]
What retries the restart if the xpcs_write() of DW_VR_MII_AN_INTR_STS
succeeds and then this xpcs_modify() of MII_BMCR fails?

The latched ANCMPLT that triggers this path has already been cleared. No
restart is pending, and xpcs_get_state() only logs the error:

phylink_resolve()
  xpcs_get_state()
    xpcs_get_state_c37_sgmii()
      xpcs_write(DW_VR_MII_AN_INTR_STS, 0)    succeeds
      xpcs_modify(MII_BMCR, BMCR_ANRESTART)   fails
    dev_err(..., "xpcs_get_state_c37_sgmii", ...)

On parts that do not restart AN by themselves, the link would then stay
down until the interface is reconfigured.

The commit message covers this case:

  "If an MDIO access fails at this point, it indicates an unrecoverable
  hardware condition until reset."

On RK3568, the MMIO-based MDIO back end added later in the series seems
to fail only through pm_runtime_resume_and_get(). That failure is not
transient. On other XPCS platforms the databook says AN restarts on its
own. So the documented behaviour may be fine as it is.

> +	}
>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261008175225.3375274-1-coiaprant%40gmail.com

