Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B653C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvGrGQY6GrI5CIu+KGfqk3UB3L4We71OJCOlHdzEnqc=; b=whISfemzH+AxN4SJ+bBh/r2VNS
	R+PIad6pZvObTzWJCCv00D8k7Gw/tS9D/uV8WRrYcBpjLHDB+t+cB1Smg+XHQGcreJ1Ya06BdxieA
	VAuZ7D+v8LrHFvO859jzRD/xbbdCnyT83vnIGGbUmteaI8I2cpo58tHVXbAxfbZXqc/1+RXl2CdZQ
	nEXOdalHBsdeMK9sZ0h/0bQDZKBDvXXXBVaxNwRjKUvULjL9qpr0kg3gZNiFwn6kFjbY02L9G9nRn
	lgF9jzX6wHf6m/oIG8pXwQz4kVen5I0EId1yyFVTegoXO8xI6vNF3P8AmdxIbNZy2t5KVVicZLzMF
	5lcXtHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJgUw-00000009bA2-27wA;
	Mon, 26 May 2025 22:40:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJgSo-00000009b3p-1x0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 22:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=rvGrGQY6GrI5CIu+KGfqk3UB3L4We71OJCOlHdzEnqc=; b=Iu
	bjOqNGBqi7kZdOZUsIJmfdxJSh5dGZvTn81tqDWY+m5F8tpYrCLHOSNWmdRrhhWhYu18TI7T9Xa5Q
	dVCCViWCC272L+Bca8cL6c7py3tGDApC58mmSZPYX4HwK+Z+5p9dwK/hpweJHtk628kDuIYpX8sEZ
	eiCGgfQiQX6Zdbg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJgSV-00E1z3-K7; Tue, 27 May 2025 00:38:15 +0200
Date: Tue, 27 May 2025 00:38:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
Message-ID: <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com>
 <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
 <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_153834_511963_E8B218E0 
X-CRM114-Status: GOOD (  19.85  )
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

On Mon, May 26, 2025 at 03:32:03PM -0600, James Hilliard wrote:
> On Mon, May 26, 2025 at 1:36 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +        phy-mode = "rgmii";
> >
> > Does the PCB have extra long clock lines?
> 
> I'm not sure, it's a copackaged(maybe on-die is the wrong terminology)
> PHY I think so I assume the clock lines are internal, in the device specific
> dts we set something like this on the emac1 node:
> allwinner,rx-delay-ps = <3100>;
> allwinner,tx-delay-ps = <700>;

Those values are just weird. The RGMII delay should be 2000ps. 3100 is
way too big, and 700 is way too small.

I think phy-mode = "internal" would be better, and just hard code the
delays either in the MAC or PHY driver.

Thanks for the link to the old thread, which was 5 years
ago. Hopefully since then, a bit more has been learnt. Quickly reading
through that thread, i don't think an MFD is not the correct solution.
In the last 5 years we have had to deal with more chicken/egg problems
with PHYs. It has now become pretty much standard practice to put the
ID values in DT, to get the driver probed when the device does not
respond on the bus. The DT node can then use phandles to the reset and
clock controller to configure them as needed, the core will probably
do that. I2C is a bit messier, you probably want a phandle pointing to
the i2c_adapter, so you can use i2c_transfer() on it in the probe()
function.

	Andrew

