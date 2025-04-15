Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997C8C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APgoBf+Is3ZPqFyP/c5CPqLm6hwrC4T/1VCp5MTirk0=; b=KevDTj662e+ESVyOVG+DwaieCp
	YwHSfqwffi8Iups0+qMMop7Tcp6rU80lApSPAY0qVgvCG4YtHsxgbTsm0sl7JWQTgwujAOsNwjub9
	lzDMko7ov6N2Sh/sMTwu03feK3PH3w9iXTytV70qm1MEgRYk84f1tqQ6NM5tokqXgcFbZ0TinxF1o
	iQ8/zc2dfpkR/WceEm/7ZGHYYtFVpVhWb533qQ1qnvZUjRBbM6j8BwX8kW3kxTaG9Xseq9lYJXo7+
	fvVTOGY6+iVp2TPQNAYc6tx6EPW/Gmz3j13e4k9cSdkcI8p5whaUCUFqWROHPqk+BJ/BYgq8Fg/G3
	+aiLjTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jJC-00000006R6j-3EJz;
	Tue, 15 Apr 2025 16:38:50 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4isc-00000006N2o-23vF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:11:23 +0000
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id CE4651212FC;
	Tue, 15 Apr 2025 16:11:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id CDFE820025;
	Tue, 15 Apr 2025 16:11:11 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 09:11:11 -0700
From: Joe Perches <joe@perches.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
In-Reply-To: <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
Message-ID: <f3acd53796a44576408a2a14aa5baaed@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: jh3nqazk1jc3b5jt4mi3gt34yip7om1u
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: CDFE820025
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+5zct2ruo7E6hoPc/hJUfsW7XPRtFJmdg=
X-HE-Tag: 1744733471-828432
X-HE-Meta: U2FsdGVkX19tqmX0rgSBcUP9E/t3KWTRFktRBaWmUsQ4KGi9uYcqiGhovIVKP6pAI4rVekGl1QVJDA50D1+Lrtr9m/ZswlJxmFu8ADGYsLOSWJHP4VmV/ligfFokJ1G2C1VGar8DWuqzC5l6RupMwZjeQlU3t9oTvFZA88BL6AK9O5g9b+N5mFDLw/SNfqzOhfR0oYphVPMVzTQnzrgZ7ztXhxcgbg/RNsvX2AYTNFWIBIiUnkJznYkGtJioV5EJhg7adrhusTqKmPRPfoV34w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_091122_589478_C35CDA15 
X-CRM114-Status: GOOD (  12.26  )
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

On 2025-04-15 03:18, Matthias Schiffer wrote:
> Historially, the RGMII PHY modes specified in Device Trees have been
> used inconsistently, often referring to the usage of delays on the PHY
> side rather than describing the board; many drivers still implement 
> this
> incorrectly.
> 
> Require a comment in Devices Trees using these modes (usually 
> mentioning
> that the delay is relalized

realized

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 784912f570e9d..57fcbd4b63ede 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3735,6 +3735,17 @@ sub process {
>  			}
>  		}
> 
> +# Check for RGMII phy-mode with delay on PCB
> +		if ($realfile =~ /\.dtsi?$/ && $line =~ 
> /^\+\s*(phy-mode|phy-connection-type)\s*=\s*"/ &&
> +		    !ctx_has_comment($first_line, $linenr)) {

Not sure where $first_line comes from and unsure if this works on 
patches rather than complete files.

Does it?

