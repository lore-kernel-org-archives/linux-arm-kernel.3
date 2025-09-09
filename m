Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313FCCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vhajTT45wNkyNzCYyusmmjssT/5BARsQdq76OLSHWQ=; b=zJT6lbhiMP6pgqbI0dW2vYx4F5
	SDyuasqE3bUt6AaOblp8Kcb9kbkNeCv59aVoL2Ib+TIqMlCdGuC/04rzfHdgw5arGpLQgZgQ4uljr
	JwmZ7l9GeErcxmXukNWAbnNs1l9qM+Tb2kSunk29YEvBNLasu+NkfvB+VR1oj1S4YncO7pDzJGE4G
	No4rqzV0uFUuvU3RIsTH6qhPRjgJvK+lXVNNrFEIKSjCuPFlI5N0hJsPJAHlbgha0IF4ui2es7OLn
	jDbtdZiBBhyUp9cm+JTqdVy/X+1jRnloeGCTL0hjAKM7DR9phlj5jkx17gLuUPs6zOpPTU7E+1C79
	vX4MTEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Tk-00000008CAK-0Qgb;
	Tue, 09 Sep 2025 15:41:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvC0-00000006E3b-3Jfy;
	Tue, 09 Sep 2025 10:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8vhajTT45wNkyNzCYyusmmjssT/5BARsQdq76OLSHWQ=; b=NCbrRRLoY/COyMKrhQiFAE2CdD
	566t92ZYCpg/7iKC4J3nzUV49E4RNum7ugUneYARt+UTuE2zUUnH2UA+bDHRjjkt1tpHkTZH0Clvj
	9ErmIm89ztTRRiSrME63Oj5PFbII22ttltZbyEsnCli9criLlK4fsgyX7ORptOixJyj3n8YAMnPHV
	jQ1BKO1YSDHNEofvZucRhN/D6pOExgqNKql3cqSpdnIO04RFavJmYrwC2Zja+laWE1QbZPQ0uo/w8
	63kY3OkUbY2Rvv9bLMGoEy+hFSZRxseRau0v6VG21GY+x76OhbQW8vqkAs3EEYXQ9/sAgtyiomdbb
	lVM6/03Q==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvBx-00000005HKr-1jur;
	Tue, 09 Sep 2025 10:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757412193; x=1788948193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=buaBwp5Yv75D60lIF0FzrJYG01n3Ms/EaLejxbELWnU=;
  b=n7VcYFA7t3A89UIKxp3NDOSVQ5DpoJKU6LE8bhuRs/S6qN/QBwufuMpH
   46+MwbKLWLUq2O7gqvIvtiAwqrxZhlJvQiAQHFl3K7VNrhzEiDPe5Ja23
   aaBL9Bv+IaOztH4dG5yG0fwMdJuT+Pmzm7SI0Mh4L+1IHkWPq6iyCYElm
   /JRZHlPRLushq03gtVgXOZcA1awvAHCakB1mJN9EY6Uwam8yRoZIxgt9t
   ox0hAPoVwhIcdXdO9M+HzdKeYS/H/qKYE7yTNs+/uT4R+4wsQxQDMesQn
   k8zRnduL+2G6npJP3jYLL6c46ASP9BKaBLzWcKE/RhiBdkwcyT0fKLFAH
   g==;
X-CSE-ConnectionGUID: TqoaHRCOQ+2BZ0osPxAtZw==
X-CSE-MsgGUID: FZepw6RLQZi8XpPtxvCymA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47264691"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="47264691"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:03:07 -0700
X-CSE-ConnectionGUID: CSYsodW6R+KHLu/MzD4Mog==
X-CSE-MsgGUID: vbDkhzclQ7+yM2+ZtHM31Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173837261"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 09 Sep 2025 03:03:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 09 Sep 2025 13:03:00 +0300
Date: Tue, 9 Sep 2025 13:03:00 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 14/22] usb: typec: tipd: Read data status in probe and
 cache its value
Message-ID: <aL_7VOraIKMKkPwe@kuha.fi.intel.com>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-14-52c348623ef6@kernel.org>
 <aL_7Hklraq2ff_YA@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL_7Hklraq2ff_YA@kuha.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110313_975120_AD79E0B3 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Sep 09, 2025 at 01:02:13PM +0300, Heikki Krogerus wrote:
> On Sat, Sep 06, 2025 at 03:43:27PM +0000, Sven Peter wrote:
> > From: Hector Martin <marcan@marcan.st>
> > 
> > Just like for power status we also need to keep track of data status to
> > be able to detect mode changes once we introduce de-bouncing for CD321x.
> > Read it during probe and keep a cached copy of its value.
> > 
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> > ---
> >  drivers/usb/typec/tipd/core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> > index e6e9730ee6dacd8c1271b1d52a02da49ff248d3e..b558fc5ecbc35a9dabbf33c444f38173740af7c3 100644
> > --- a/drivers/usb/typec/tipd/core.c
> > +++ b/drivers/usb/typec/tipd/core.c
> > @@ -176,6 +176,7 @@ struct tps6598x {
> >  
> >  	int wakeup;
> >  	u32 status; /* status reg */
> > +	u32 data_status;
> >  	u16 pwr_status;
> >  	struct delayed_work	wq_poll;
> >  
> > @@ -538,6 +539,7 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
> >  		dev_err(tps->dev, "failed to read data status: %d\n", ret);
> >  		return false;
> >  	}
> > +	tps->data_status = data_status;
> >  
> >  	if (tps->data->trace_data_status)
> >  		tps->data->trace_data_status(data_status);
> > @@ -1551,6 +1553,8 @@ static int tps6598x_probe(struct i2c_client *client)
> >  	if (status & TPS_STATUS_PLUG_PRESENT) {
> >  		if (!tps6598x_read_power_status(tps))
> >  			goto err_unregister_port;
> > +		if (!tps->data->read_data_status(tps))
> > +			goto err_unregister_port;
> >  		ret = tps6598x_connect(tps, status);
> >  		if (ret)
> >  			dev_err(&client->dev, "failed to register partner\n");
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> heikki

-- 
heikki

