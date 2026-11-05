Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQzWETrG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVT/d5Ar
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E6BV30veFVp7vAa8zjNCmhugAJtv5Cf8HFJzEFbMAY4=; b=VQzWETrG5m0n1O
	CBLQwhjbT0oGjoCEz/b4OBw6LijdZMqMIIca6P3fyT5iPw00CpFXp3aVT2qlzdyMzQ6R6MDrYHKpL
	1/dMYbeG9+IM/hrs+95eadSAOtVGFZF6i3yuCHOJLeiCJF5D6ihRQJhWKd69YS2g3PMlrBsRMcwCR
	MogucakulcublHgfvW5VGh5R1NBqAeemC/ZozGupMDoVZpuClLiQ8t6B677NLdqKGacXVzhrf3DPm
	g5JQFSIy5cFylLtoHklSYQdE4fGGX1r0Mfh3NRo9XSKiJ++EsZiVjWVp68uYJiphhYJpAMegshLMN
	PD9mXazS+NNPAFiwu/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP100-00000009nyA-2bpf;
	Thu, 05 Nov 2026 17:11:40 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0xZ-00000009mfF-0f8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:09:31 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3982853eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898546; x=1794503346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6BV30veFVp7vAa8zjNCmhugAJtv5Cf8HFJzEFbMAY4=;
        b=fVT/d5ArBR0dSVikrRZZx6Zd+KzBqu7WjN+CaW+FFg7pA9llxwQp+QkgQWOPVqVq/L
         4Oc15eao+s280t+Zsmn+t0kgCGQ5fxjBRfSO6OlIv8bJR6PV88ZTkBneAS3ziDRZOS2S
         B1NeA0Z1HM4DgRXhZsyiTX4nutTQybuWkKZrfWU7FE6UMU+IrWCgQ2r0KOLlTbZJDgdE
         l3dvX0WGoZXsKy46JkIheUd4ummffZCG47YYVZYB2SDaBCq85a7E13a4SX4oLyy8ImfV
         pU50rlX8P6eFZAuZSDJ2phy+xJ5zBCUT3tE8GobQuyFk3kamNAVgIaF2u2JkH54Mq5N3
         O7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898546; x=1794503346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6BV30veFVp7vAa8zjNCmhugAJtv5Cf8HFJzEFbMAY4=;
        b=Im3scAvTbyjfVas965hERF3swe6Svu819S6Xa9O2KeW5eEfW+l2zuBQYvV+o4EfIkQ
         D6Nr8KWOv8EEIAJmXIwMAb9sCBq0PyCR/vuwE6+5T4pbTb0vd4aTb44BjcG1lTLpTSf0
         Udm9eXTLYRO/z0vz/+ljOgUmuDIdM5s0vrkoi4XI05/XDk5pz4jsoOw1sfU2fQsi/k/U
         7+YfXqE/ePht57fxGsu4wQGfukouYQy6IwBwqK/zcAoZh7QEv80SymzfivgHrnS8S6jt
         0iMm+n8vAKp227e3c2wPcpsEZy9utR/cnf49+Zin7IBXTw7z6wUeqesPBi+Vdsk7h7c0
         F/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcnwaDS1cnfXvx1gju6NbaG1oMTey/XMdhir19HlL3Rkg7I3WbmEd2mjRneFo5y0cqzlDprwbZXHb6IOLA4cGs@lists.infradead.org
X-Gm-Message-State: APuU4Z/OPL5FWjjp9vvSzly9fHU6QubqHpb22mjmziFWlWwXs/q/Nskx
	618RR/uGrM6tfD5Uuzlh+3hIMKZYmmvJ0IEo3MrIl/Bv9kdaGPpzsDxO
X-Gm-Gg: AYBFou2MLqsOeylQGt5zE6wk4WIeHsds9OgS9pu1SGqymq9CwgD9nIt5zSk1EscrmXs
	kR59V6sNAJTKJ7hqQm+Ek0UZ22DuL98buQP8ndhKQGKgiUU4P+SR10VjT4iqqsIwIuUw8XmPbAi
	+gI0v50EnWRkQkUeCd6Kudpp9QhXw5lqgTwQ2NcexUcNhdEg23+mLrunLAnp9DU6NdT4CW3JIKo
	IhvSU6E9UaTtw7JMoPe5pTUXqXEg21Ti2n3y3okNcDxnhXZ2joTQxOCQ8nwNrgpvgz/wDZY/Pmz
	gR+xUEc2dpTcfCKPsvqx2ONeGfVhLL07R32he1yzBAXTt7gwbIpkhShGDBxg6UbbCt1a4M8c0C5
	oMcoGTI7o0TgrqphJGKqViRW9o9P7xpLzcM4brAiLO8i3McCTzhF++N76hbktTnrGrykMmxrbrj
	N/R314OhrZEbTW7PjH3EuDzUAAslaX0Dfm9VjXjX6ooXTHbVQ7fY4Jbwpfdn/W7F07cngjnJuo4
	46bKAmclxbRgZzzUsKKeMJfS4Fpwg9pu4OOkE+3AAy2lEZDLRCvbK3of/eVZOgd6V+fHoxM7bJc
	teHpvBWSLJpwzCGoFU9Qc3mjomToNyN41r7qF6dMqEUMNfxhV/gMvXjf5CCZb5TiEg==
X-Received: by 2002:a05:7301:4306:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-36a42340c9bmr28415945eec.8.1793898545495;
        Thu, 05 Nov 2026 09:09:05 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21c8::1368? ([2620:10d:c090:400::5:f848])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm20589091eec.21.2026.11.05.09.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:09:05 -0800 (PST)
Message-ID: <619a4027-0709-4b13-9367-866a06d2cd02@gmail.com>
Date: Thu, 5 Nov 2026 09:09:03 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/5] net: sparx5: Add hardware programming for
 the port policer
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
 <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-4-b45a3a26bed5@microchip.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-4-b45a3a26bed5@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090909_378814_F5ADED23 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> +int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
> +			    struct netlink_ext_ack *extack)
> +{
> +	struct flow_action_police *police = &entry->port_policer.police;
> +	struct sparx5_port *port = entry->port;
> +	struct sparx5 *sparx5 = port->sparx5;
> +	struct sparx5_policer pol = { 0 };
> +	int idx, err;
> +
> +	if (!entry->ingress) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer is not supported on egress");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (entry->port->tc.ingress_block_shared) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer is not supported on shared ingress blocks");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->exceed.act_id != FLOW_ACTION_DROP) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->notexceed.act_id != FLOW_ACTION_PIPE &&
> +	    police->notexceed.act_id != FLOW_ACTION_ACCEPT) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->peakrate_bytes_ps || police->avrate ||
> +	    police->overhead) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->rate_pkt_ps) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}

Curious if we can have distinct messages for several unrelated checks 
sharing the extack "Policer parameters are not supported";

> +
> +	if (!police->rate_bytes_ps) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer requires a rate");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->burst > ANA_AC_POL_PORT_THRES_CFG_0_PORT_THRES0 *
> +			    SPX5_POLICER_BYTE_BURST_UNIT) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->rate_bytes_ps >
> +	    div_u64((u64)ANA_AC_POL_PORT_RATE_CFG_PORT_RATE *
> +		    SPX5_POLICER_RATE_UNIT, BITS_PER_BYTE)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	idx = sparx5_alloc_port_policer_idx(port, entry->cookie);
> +	if (idx < 0) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Only one port policer per port is supported");
> +		return idx;
> +	}
> +

Any reason why police->mtu isn't checked? In software, frames longer 
than the police MTU always take the exceed action. Is this intentionally 
skipped here?

> +	pol.type = SPX5_POL_PORT;
> +	pol.rate = police->rate_bytes_ps * BITS_PER_BYTE;
> +	pol.burst = police->burst;
> +	pol.idx = port->portno * SPX5_POLICERS_PER_PORT + idx;
> +
> +	sparx5_init_port_policer_stats(port, idx);
> +
> +	err = sparx5_policer_conf_set(sparx5, &pol);
> +	if (err)
> +		return err;
> +
> +	port->tc.port_policer[idx].policer = entry->cookie;
> +
> +	return 0;
> +}
> +


