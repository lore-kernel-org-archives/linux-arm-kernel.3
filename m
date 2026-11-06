Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC800606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQZAkFmn;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=oApPi6zS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OH+KjGflK0pa9S6bl+aaJSvNp7JIv99InYmBasyu8aI=; b=eQZAkFmnDmJ+vfsXgbyr9aS74U
	wMkSvWkd1ZknN2yUE/HTgWxN++7t1NiuCgVdZJZ/PNxIW6ZTOBBHVLojDlgO/KepdDfieoaplUj0j
	cRhFWPPmEZ/DWwS0rOSfl9iRIteRhEUU4i6KUT5vjTMnw1rCeNwbPeJrm9d1/Q5haix2ElXsX0T+v
	Kd3hKGfhtaJBMqHHzsUr10KnAni7fXES8mSlfSwaUwXYp9QSPvieh/m2g7vB6+vKe5sosKDFeBMep
	V11BhMaXQNo6RYxkwQy656DgrvubP+k9axhOVOOQU/q64Z7JxnOpb5S6v/N0/rwzk8SzTWGXoJRn2
	T+6t9oNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEdO-0000000BUEV-2a66;
	Fri, 06 Nov 2026 07:45:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEdM-0000000BUDZ-0PeI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793951112; x=1825487112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0pNtQXJqJ7OmmWdT70946/9FrTP+QyhlDpspKue35AI=;
  b=oApPi6zSxO/f6R9cu2mCKbF0US/HrW5GRd3Z2mkxGYaz8xxm1+fVkJUm
   AkvRkPBlNWYmE4S3DY8ZgTnT/HKgIOxpYE31N+bZKWaWnEWxiPfgII6Tp
   Kv9EZyDw0Vd0GiEZdh+Aanrp37I6lSVHHuHl0zHdTo8IOp4cAhmo26fqH
   0v9W0QwYBGkCwpOzc1w1+DjbLOB4BnyFknE4af6v7aQULRg6AWSCKLN4j
   pQGPkSO99UQzqgeV8npGyH6SR1ESBJIVRZ+Ajpcfc2Jn0L93O3HsEvOGQ
   9PztkEmZoEk3idnEXjy00d1QxKf61fPoksO1n1JySWw8LhEzAM9W4rAAS
   A==;
X-CSE-ConnectionGUID: SV658n+RTHylF9Bkh4zsEg==
X-CSE-MsgGUID: nAJ1lYAOTJiyOicUXjomnA==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="66122530"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2026 00:45:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 6 Nov 2026 00:45:10 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 6 Nov 2026 00:45:08 -0700
Date: Fri, 6 Nov 2026 08:45:07 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 4/5] net: sparx5: Add hardware programming
 for the port policer
Message-ID: <20261106074507.desq4nbvpio3v3zr@DEN-DL-M70577>
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
 <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-4-b45a3a26bed5@microchip.com>
 <619a4027-0709-4b13-9367-866a06d2cd02@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <619a4027-0709-4b13-9367-866a06d2cd02@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_234512_369855_89E53C14 
X-CRM114-Status: GOOD (  18.61  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mohsin,

Thanks for reviewing.

> 
> 
> > +int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
> > +			    struct netlink_ext_ack *extack)
> > +{
> > +	struct flow_action_police *police = &entry->port_policer.police;
> > +	struct sparx5_port *port = entry->port;
> > +	struct sparx5 *sparx5 = port->sparx5;
> > +	struct sparx5_policer pol = { 0 };
> > +	int idx, err;
> > +
> > +	if (!entry->ingress) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer is not supported on egress");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (entry->port->tc.ingress_block_shared) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer is not supported on shared ingress blocks");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (police->exceed.act_id != FLOW_ACTION_DROP) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer parameters are not supported");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (police->notexceed.act_id != FLOW_ACTION_PIPE &&
> > +	    police->notexceed.act_id != FLOW_ACTION_ACCEPT) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer parameters are not supported");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (police->peakrate_bytes_ps || police->avrate ||
> > +	    police->overhead) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer parameters are not supported");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (police->rate_pkt_ps) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer parameters are not supported");
> > +		return -EOPNOTSUPP;
> > +	}
> 
> Curious if we can have distinct messages for several unrelated checks
> sharing the extack "Policer parameters are not supported";
> 

So the rationale here is that the checks with their own message are
about where the policer is attached (egress, shared block, another
port, a second policer), or a missing rate, while the shared message
covers police parameters the hardware cannot offload.

> > +
> > +	if (!police->rate_bytes_ps) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer requires a rate");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (police->burst > ANA_AC_POL_PORT_THRES_CFG_0_PORT_THRES0 *
> > +			    SPX5_POLICER_BYTE_BURST_UNIT) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer parameters are not supported");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (police->rate_bytes_ps >
> > +	    div_u64((u64)ANA_AC_POL_PORT_RATE_CFG_PORT_RATE *
> > +		    SPX5_POLICER_RATE_UNIT, BITS_PER_BYTE)) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Policer parameters are not supported");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	idx = sparx5_alloc_port_policer_idx(port, entry->cookie);
> > +	if (idx < 0) {
> > +		NL_SET_ERR_MSG_MOD(extack,
> > +				   "Only one port policer per port is supported");
> > +		return idx;
> > +	}
> > +
> 
> Any reason why police->mtu isn't checked? In software, frames longer than
> the police MTU always take the exceed action. Is this intentionally skipped
> here?

Yes, it is intentional. The port policer has no frame length limit of its own,
so it cannot enforce the mtu. It seems to be very common for other drivers to
ignore this too.

> 
> > +	pol.type = SPX5_POL_PORT;
> > +	pol.rate = police->rate_bytes_ps * BITS_PER_BYTE;
> > +	pol.burst = police->burst;
> > +	pol.idx = port->portno * SPX5_POLICERS_PER_PORT + idx;
> > +
> > +	sparx5_init_port_policer_stats(port, idx);
> > +
> > +	err = sparx5_policer_conf_set(sparx5, &pol);
> > +	if (err)
> > +		return err;
> > +
> > +	port->tc.port_policer[idx].policer = entry->cookie;
> > +
> > +	return 0;
> > +}
> > +
>

/Daniel

