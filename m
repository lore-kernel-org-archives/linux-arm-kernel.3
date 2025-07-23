Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43215C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SvkMPTsFC5jUvrIm1G4AlMoKZYyaRcbtIbKwfr0i5M=; b=HCQn/xhxSV2G5K3hF1yPUMgvnd
	ifnmfmcr8vI8p1OJCRjUvftDSXpK1c5k1r87ZPG541kSDOgrreiXZBPU4Tk66YpmBZkGN2OxCLffr
	RMEevC5saQPWK0iX30hfP8q7yJ02awZy5GmLuTj3RDoxf6vabgdXDmi8NFIlQmmyl7fpJJMmyOSyk
	KtBKVzsMqeyAQ8J+2H64MGVy3qC/Bq8J6LGvjCq1i/e0acvtm9Jx9nmHru6BLe7uNLKQt9kLMiSAO
	RIEElPBCMX5QTT1CZCVBaOFYG/EF87zGcMhxceHVm0wjnJQUwozd6s3b7zs12XRc0jGK5Smc7JHLv
	5DZliGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTdq-00000004Ct6-3NQr;
	Wed, 23 Jul 2025 07:11:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTZh-00000004CUU-2KZo;
	Wed, 23 Jul 2025 07:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 410505C681B;
	Wed, 23 Jul 2025 07:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731F7C4CEF4;
	Wed, 23 Jul 2025 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753254455;
	bh=7E7mBKEkTZpJi6KBwS4H9/BtUGuLQUjDKjTNHfuzUB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLfi7z3IPD0Wgn9KrDIpoys0NFV6IQnUqVHOwOzN98FOENVX+6Y2ITCm5buayeC+A
	 tXf/fM8vwi/wDB+TDaSKEP9qEmLjej6g9Wifq+H+cdbID9P05XibOGEYsn+BVtXnJk
	 7f/OyaAjuU+MdYKcOAlWi/rgxaJYK5tB2mpUNAokmCUynLVWpGlai68gDeYky+Bmo4
	 750OfBuOe9EIg28Z2LJBPv70nrbl60M7sga86pqAJzMupUaDC5RkO4LJdfok4o6dPG
	 Ypjb/Vx2qK1ORmlN1pXZn4qyQGNvj7Luf7acSNCOdCNAA+/OJuyPB6A9h8ZR5E4c8A
	 E+kcaipV2LNQw==
Date: Wed, 23 Jul 2025 12:37:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	William Mcvicker <willmcvicker@google.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
Message-ID: <aICKM-ebp9SMAkZ_@vaman>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_000737_670449_F871CDC6 
X-CRM114-Status: GOOD (  23.72  )
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

On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
> On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> > Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> > given PM link state transition.
> > 
> > This is intended to be by phy drivers which need to do some runtime
> > configuration of parameters during the transition that can't be handled by
> > phy_calibrate() or phy_power_{on|off}().
> > 
> > The first usage of this API is in the Samsung UFS phy that needs to issue
> > some register writes when entering and exiting the hibernate link state.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> >  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> >  
> > +/**
> > + * phy_notify_pmstate() - phy link state notification
> 
> 'pmstate' doesn't correspond to 'link state'. So how about,
> phy_notify_link_state()?
> 
> s/phy/PHY (here and below)
> 
> > + * @phy: the phy returned by phy_get()
> > + * @state: the link state
> > + *
> > + * Notify the phy of some PM link state transition. Used to notify and
> 
> Link state change is common for the PHY. So remove 'PM'.

Is it really link or phy state?

> 
> > + * configure the phy accordingly.
> > + *
> > + * Returns: %0 if successful, a negative error code otherwise
> > + */
> > +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
> 
> I think you need to use 'int state' and let drivers pass their own link state
> values. You cannot have generic link states across all peripherals.

I would avoid that, people start overloading this if we let it keep
open! I would like to avoid the api -(ab)use

-- 
~Vinod

