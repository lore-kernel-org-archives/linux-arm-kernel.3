Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F841073CBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wblkre6NjkT6i+4xhKGhUp+Fd+gZKQiKgPiEMlBS0Og=; b=OBCBfLGyC1cWZciG0r9SrOHW50
	h5n50yO6/A8zNo9nAsbNbFZ51M4C3CXo8FDG2uXZ2dHOIntadOfqLtpPbf38TxHbBgbLzRYWR5ct1
	MvsMGEK6vTlFe0TXTAHhe4OqmXyrE1JmWWYM6c8C+jVdiMItlHGjEZHbsSDuoVYzRB1QTxNZK3r/z
	L0xVUa1HJJyV0/XTCSs5qKiFUXAV/kR75ARA77rNIHw0ZYmmgPm1dFxVNKs29fP06bQxnddNcOL5c
	sz124FlOeesGTt8lnzpHO55cR4QL89eND7EAtu4xjaxu0e876wVqbS1rR24v+6RSuvERqeAEh1Fro
	JI+lEpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAT9D-00000008vll-3xnf;
	Wed, 08 Apr 2026 13:40:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAT9B-00000008vlK-2OkY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79E0D6012A;
	Wed,  8 Apr 2026 13:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFAAC19421;
	Wed,  8 Apr 2026 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775655644;
	bh=+0oydsix3eqfdw2Aq3Jilu/jZTS1qQw8+lp0nii5wyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aohr4wmM+rkXMNtTgbWcQxOdPABsfIvSLaiIxSuvA/Fa8w9jq4e8zeL57njW4E/Zn
	 1WmGBU1a5jmW5+6caOUtHvg5bYtc+mflLu56N2stGp6vaOUTOzZRdMoI/mbpkHA1p5
	 nmJeRbq+sjtnoNIyAC1LPL99XGKtLIJoSrdODO68A6rM6UZjHROd3q0ujEOGRh0h7s
	 bA6TZb9Uoc6BJqyuwlIlc8juqpaH9G1nzEkHvzWujtWq2we0nAAfepTL22yIhKmUOc
	 /oeV9xf98fewJR0OCIknbua+MEcBDQSk8uoy215juMx8bqtDRxHtG74XC7kn2EPLUq
	 h943YSSVcZFIQ==
Date: Wed, 8 Apr 2026 08:40:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, kuba@kernel.org, andrew@lunn.ch,
	linux@armlinux.org.uk, davem@davemloft.net, frank.li@nxp.com,
	edumazet@google.com, imx@lists.linux.dev, pabeni@redhat.com,
	devicetree@vger.kernel.org, horms@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	andrew+netdev@lunn.ch, f.fainelli@gmail.com,
	linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
	krzk+dt@kernel.org, vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org, chleroy@kernel.org
Subject: Re: [PATCH v4 net-next 01/14] dt-bindings: net: dsa: update the
 description of 'dsa,member' property
Message-ID: <177565564199.1953964.14327421234664978113.robh@kernel.org>
References: <20260331113025.1566878-1-wei.fang@nxp.com>
 <20260331113025.1566878-2-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331113025.1566878-2-wei.fang@nxp.com>
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


On Tue, 31 Mar 2026 19:30:12 +0800, Wei Fang wrote:
> The current description indicates that the 'dsa,member' property cannot
> be set for a switch that is not part of any cluster. Vladimir thinks
> that this is a case where the actual technical limitation was poorly
> transposed into words when this restriction was first documented, in
> commit 8c5ad1d6179d ("net: dsa: Document new binding").
> 
> The true technical limitation is that many DSA tagging protocols are
> topology-unaware, and always call dsa_conduit_find_user() with a
> switch_id of 0. Specifying a custom "dsa,member" property with a
> non-zero switch_id would break them.
> 
> Therefore, for topology-aware switches, it is fine to specify this
> property for them, even if they are not part of any cluster. Our NETC
> switch is a good example which is topology-aware, the switch_id is
> carried in the switch tag, but the switch_id 0 is reserved for VEPA
> switch and cannot be used, so we need to use this property to assign
> a non-zero switch_id for it.
> 
> Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


