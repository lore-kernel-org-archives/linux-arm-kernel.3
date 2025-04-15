Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB1FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwXoAPOSd7TPYyFwNb3wZwJZIOBKCyO+D+dc+pl8JG0=; b=2Zf90kD29qSVPiYNBUrMQIQF8I
	D1+xFufADSFDG9EDmV/7+g5SCR4DWadUrpuqgT+NFSGug2e9m5MNV5ZsPjJKCg+30z7R5JRDSCyjK
	4Tvu7Wrw5xwAA6w+FdBmdOeaSuqcAQP3iqH4ZWD8cDYsjio9Ku8kAFh/HwIZujkzuPQM7ONFb43LL
	gohQHgo5KYvaqFRMFSayq0yC2nOML6CTn4zs1YPeK9a6yMj27By4pD82OzUjo4jPo79DCIiZhTSfW
	TatMm2nc2b8W17Kvf5hnpBSaotkqWn/RKAxg67jA5S9lXa0GgrBO91SHnZg2AGnOaEKrKjGRdc7Iw
	ruC0Ce9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gOR-00000005v9c-01zF;
	Tue, 15 Apr 2025 13:32:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gDW-00000005tCZ-46n3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zwXoAPOSd7TPYyFwNb3wZwJZIOBKCyO+D+dc+pl8JG0=; b=xlH8rjaFC+RAnQBZCoJmZEEd0E
	D24kM63bpE+zT98wgG3mJZJIgEhEmxpiIVkYqIai0Gkuqv+z5hDasP9a7SmjGc5rNDr8V0jh5D81O
	wPKei3YG3MRZttrcOKTXxzyYFNbcxuljK4qjvy2NaKNqo/yDE1FouImJPkQRFRM0Ff5E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4gDE-009RsY-Ta; Tue, 15 Apr 2025 15:20:28 +0200
Date: Tue, 15 Apr 2025 15:20:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
Message-ID: <9d73f6ac-9fee-446b-b011-e664a7311eca@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062047_022539_49E0AA3A 
X-CRM114-Status: GOOD (  15.88  )
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

> +  **UNCOMMENTED_RGMII_MODE**
> +    Historially, the RGMII PHY modes specified in Device Trees have been
> +    used inconsistently, often referring to the usage of delays on the PHY
> +    side rather than describing the board.
> +
> +    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock
> +    signal to be delayed on the PCB; this unusual configuration should be
> +    described in a comment. If they are not (meaning that the delay is realized
> +    internally in the MAC or PHY), "rgmii-id" is the correct PHY mode.

It is unclear to me how much ctx_has_comment() will return. Maybe
include an example here of how it should look. I'm assuming:

/* RGMII delays added via PCB traces */
&enet2 {
    phy-mode = "rgmii";
    status = "okay";

fails, but

&enet2 {
    /* RGMII delays added via PCB traces */
    phy-mode = "rgmii";
    status = "okay";

passes?

>  
>  Commit message
>  --------------
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 784912f570e9d..57fcbd4b63ede 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3735,6 +3735,17 @@ sub process {
>  			}
>  		}
>  
> +# Check for RGMII phy-mode with delay on PCB
> +		if ($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*(phy-mode|phy-connection-type)\s*=\s*"/ &&

I don't grok perl. Is this only looking a dtsi files? .dts files
should also be checked.

Thanks for working on this, it will be very useful.

	Andrew

