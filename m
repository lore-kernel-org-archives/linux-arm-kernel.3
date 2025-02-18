Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54687C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SR6bZ23Iqbr9gYinpkbLkkCfOXGYiitlLTZ/pTqB2k=; b=E1iECr0sTPcqYgKugv8ldaWWtX
	TZEfwoXtc5kVNoujCa2pSaq1C6nm+A5WpsRNFIlPdGHcaYztP5njLM3I0dtGEqFNF9faOgPt1Cixj
	EQ10vcIlduWgF3PD64lfiTBrW2WM6NZDsfNWxvNu6HfgV6iy9IoFiYYH4hsuIiNlQMpziWQ/byjzT
	U0IThCUFy8OGLTioz0iBhlCniIDlMi08QWKqLRHS51ivKFnxR8Y7j6OAkWDmMU+LiMl99gbKG5z+t
	j9wQlSo11uWxcqNYpy9bW8Tdu17h8t21No97bdunx4yZWXf4uIyWsaxb92w3Fn8QjHf1djofl74oa
	SS1Emq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPcw-00000008mGD-44fd;
	Tue, 18 Feb 2025 15:35:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPbT-00000008lvg-1qBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 15:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+SR6bZ23Iqbr9gYinpkbLkkCfOXGYiitlLTZ/pTqB2k=; b=2bQybeC3IMlugSflIXxflyUFQz
	ovuJU1pjz1QG/81pSg5ugxg5hB52YnTM9JviZUPcxWW+02PWxwtJG/2R39OAWS84C02ERiduOm2v/
	WnAjHF/KStEfYdvt4Uiq2cMlCCWvGzA7invLn7XTZUaqt6YqNpW6HooEoKkh5YgbQCgA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkPbD-00FKur-Pa; Tue, 18 Feb 2025 16:33:27 +0100
Date: Tue, 18 Feb 2025 16:33:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	'Pankaj	Dubey' <pankaj.dubey@samsung.com>, ravi.patel@samsung.com
Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <69d1b0fe-d35f-4242-bf80-6c024cf72dd1@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
 <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
 <011901db80fb$8e968f60$abc3ae20$@samsung.com>
 <18746e2f-4124-4f85-97d2-a040b78b4b34@lunn.ch>
 <015601db81b8$ee7237f0$cb56a7d0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015601db81b8$ee7237f0$cb56a7d0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_073343_481382_FA8B6BF8 
X-CRM114-Status: GOOD (  10.19  )
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

> Hi Andrew, 
> Thanks for the clarification.
> Will post v7 with the following updates:
> 
> 1. Changing phy-mode in dt-binding as shown below:
>   phy-mode:
>     enum:
>       - rgmii
>       - rgmii-id
>       - rgmii-rxid
>       - rgmii-txid
> 	  
> 2. Removing phy-mode from .dtsi and example given in dt-binding

The example can use phy-mode, since the example is the combination of
the .dtsi and the .dts parts of the device tree. And having the
example using 'rgmii-id' will hopefully prevent some people wrongly
using 'rgmii'

> 3. Add phy-mode to .dts file and specify 'rgmii-id' there.

Great. History shows if you get the example and the first user
correct, everybody blindly copies it and gets it right by accident. If
the first user is wrong, everybody blindly copies it, and get is wrong
by not sanity checking what they copy.

	Andrew

