Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC09AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFB15gTIJBDpeGlS/cv2ReAhXeiDDHLVaR68JGGc0xo=; b=X6XVG5Y7n6uLNYMQNGDWF67eSS
	BcNokZL+GNX0v1ZEIRvGODaBCAxeb8LR8BVgouKjFKgNeqK0sb+j87VwvcIYB16Sexi0uEnpAWwZn
	JaEjbhYdUJ88j7XWJb8dxNa2jRG9T+X5vKi4YoipCMISaGG4A3O6ZrxQuxEGXQfBR3oE/82w70Dq4
	kyHdPecBSMm1YFNHbsz3kvB/bm69KWNaaD+WMK9BASBQ5Y+n17uSFLrWUffLX33T6amzShNKFOnGt
	pmS+G8LuFxoqhJiZYwYaxsHs9OQhF58NEFqsKaqGA2KG5fayx3rPoTlnIBfBN6wju5Zr2Lq9a/yOi
	vnpJoTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4f1V-00000005ejR-36ho;
	Tue, 15 Apr 2025 12:04:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eGf-00000005UId-1xEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:15:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF13243A01;
	Tue, 15 Apr 2025 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744715751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFB15gTIJBDpeGlS/cv2ReAhXeiDDHLVaR68JGGc0xo=;
	b=D7ztH0mKUYnIvtU2sA00xwI+e+PY+KeBEYH0fBLkwBzMuDOYcFTMJwc3egCuVEFwdZk3BK
	N+54vsjLUHrm/IZ9xgAqtLsVE/oakR1DkGzTb+9Z/CQD2TmPR/55gVtJSWJvU3pfHzqFbx
	zrbyzzPN45ilYCymFE85YGem/1O/v+9x8eMd0yGGUR2rQ+0XUSz223J6nJEf9kEccUi4R3
	A2fA7+9G6nFBCimb11vj6r61kDBrQ1T/GnRIFNcCzrR4cQusfGBe8FouCuP55R7osd0zzR
	VYM8wJskqoCcBxRQpG7hBIMB1+I5EvXLBDrJdJAcX26yZlRDYvU4Grj6d2snqA==
Date: Tue, 15 Apr 2025 13:15:48 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Tero Kristo
 <kristo@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
Message-ID: <20250415131548.0ae3b66f@fedora.home>
In-Reply-To: <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	<16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeffeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudfgleelvddtffdvkeduieejudeuvedvveffheduhedvueduteehkeehiefgteehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedviedprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvhesl
 hhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_041553_826073_E6903198 
X-CRM114-Status: GOOD (  23.73  )
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

On Tue, 15 Apr 2025 12:18:04 +0200
Matthias Schiffer <matthias.schiffer@ew.tq-group.com> wrote:

> Historially, the RGMII PHY modes specified in Device Trees have been
  ^^^^^^^^^^^
  Historically
> used inconsistently, often referring to the usage of delays on the PHY
> side rather than describing the board; many drivers still implement this
> incorrectly.
> 
> Require a comment in Devices Trees using these modes (usually mentioning
> that the delay is relalized on the PCB), so we can avoid adding more
> incorrect uses (or will at least notice which drivers still need to be
> fixed).
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  Documentation/dev-tools/checkpatch.rst |  9 +++++++++
>  scripts/checkpatch.pl                  | 11 +++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index abb3ff6820766..8692d3bc155f1 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -513,6 +513,15 @@ Comments
>  
>      See: https://lore.kernel.org/lkml/20131006222342.GT19510@leaf/
>  
> +  **UNCOMMENTED_RGMII_MODE**
> +    Historially, the RGMII PHY modes specified in Device Trees have been
       ^^^^^^^^^^^
      	 Historically
> +    used inconsistently, often referring to the usage of delays on the PHY
> +    side rather than describing the board.
> +
> +    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock
> +    signal to be delayed on the PCB; this unusual configuration should be
> +    described in a comment. If they are not (meaning that the delay is realized
> +    internally in the MAC or PHY), "rgmii-id" is the correct PHY mode.
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
> +		    !ctx_has_comment($first_line, $linenr)) {
> +			my $prop = $1;
> +			my $mode = get_quoted_string($line, $rawline);
> +			if ($mode =~ /^"rgmii(?:|-rxid|-txid)"$/) {
> +				CHK("UNCOMMENTED_RGMII_MODE",
> +				    "$prop $mode without comment -- delays on the PCB should be described, otherwise use \"rgmii-id\"\n" . $herecurr);
> +			}
> +		}
> +

My Perl-fu isn't good enough for me to review this properly... I think
though that Andrew mentioned something along the lines of 'Comment
should include PCB somewhere', but I don't know if this is easily
doable with checkpatch though.

Maxime

