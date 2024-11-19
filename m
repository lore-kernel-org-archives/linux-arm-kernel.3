Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E54D60D0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrSZI+NPZ4tgITxEvMXBm8bIkUrQe0QQVbdP2vVsny0=; b=f8yzswAV/5OZLHAgswKmHoR92d
	mXUr6MedDpn2vA1g3Wa/1x+y8j/ux3Aj2ltA2wVkozOcOLAVJ54ViHrXLFyst79/Qc58l4PEemoUf
	R3fv6dne6v4s7rdwj7cnGqtTL/mCSn2PFu8Ouncl2G4esi8mc1VxwOAJ/dr1T0srErwzGg0DAE7Ds
	bHk2mgJUvbxtWXCOWLejXNPFORJgfsgflyBu/dAkM9gYwmhBHcy3wlNAajiHNpVoWMM6D70RELdFi
	a4/uj0N7tNUdPAnbKkKBfeZVptGxrM3MQcC51AznScieRvGjiIXZOp93qSNLIYod3N/RRUdjBM4v4
	UvzHklZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDDl-0000000B5Vk-0hr6;
	Tue, 19 Nov 2024 01:40:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDCo-0000000B5NC-2NkE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HrSZI+NPZ4tgITxEvMXBm8bIkUrQe0QQVbdP2vVsny0=; b=Ocu3JtOn0gbs7DoGvb8Ezc8PSr
	7QP7aDDZVFwJnShLpHesLDSZF4kSG+egSLu9B6MjO8SnMkE+6nLGA+X7m5ECUa9WUohe0I3DR2njB
	5MbPvh87Kc8OZzQqNZiAtLnHPqEgwyhsNyI0TMf+G6iBxcL3mnRL9i+XLW9jAAHoyv2o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDDCd-00DjRC-Qb; Tue, 19 Nov 2024 02:38:51 +0100
Date: Tue, 19 Nov 2024 02:38:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: xlnx,axi-ethernet: Add
 bindings for AXI 2.5G MAC
Message-ID: <ce534b32-7363-4433-8b1d-4e01c3d92084@lunn.ch>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-2-suraj.gupta2@amd.com>
 <20241118165451.6a8b53ed@fedora.home>
 <410bf89c-7218-463d-9edf-f43fc1047c89@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410bf89c-7218-463d-9edf-f43fc1047c89@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_173902_601570_BD8FA421 
X-CRM114-Status: GOOD (  22.77  )
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

On Mon, Nov 18, 2024 at 10:57:45AM -0500, Sean Anderson wrote:
> On 11/18/24 10:54, Maxime Chevallier wrote:
> > Hello,
> > 
> > On Mon, 18 Nov 2024 13:48:21 +0530
> > Suraj Gupta <suraj.gupta2@amd.com> wrote:
> > 
> >> AXI 1G/2.5G Ethernet subsystem supports 1G and 2.5G speeds. "max-speed"
> >> property is used to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> >> max-speed is made a required property, and it breaks DT ABI but driver
> >> implementation ensures backward compatibility and assumes 1G when this
> >> property is absent.
> >> Modify existing bindings description for 2.5G MAC.
> > 
> > That may be a silly question, but as this is another version of the IP
> > that behaves differently than the 1G version, could you use instead a
> > dedicated compatible string for the 2.5G variant ?
> > 
> > As the current one is :
> > 
> > compatible = "xlnx,axi-ethernet-1.00.a";
> > 
> > it seems to already contain some version information.
> > 
> > But I might also be missing something :)
> 
> As it happens, this is not another version of the same IP but a
> different configuration. It's just that no one has bothered to add 2.5G
> support yet.

Do you mean 2.5G is a synthesis option? Or are you saying it has
always been able to do 2.5G, but nobody has added the needed code?

This is a pretty unusual use of max-speed, so i would like to fully
understand why it is being used before allowing it.

	Andrew

